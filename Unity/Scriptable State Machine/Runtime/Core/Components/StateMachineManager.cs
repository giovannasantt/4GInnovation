using System;
using System.Collections.Generic;
using UnityEngine;
using Object = System.Object;

namespace MicheliniDev.ScriptableStateMachine 
{
    public class StateMachineManager : MonoBehaviour
    {
        [SerializeField] 
        [Tooltip("The state machines for this entity")]
        private List<StateMachine> stateMachines;
        
        [SerializeField] 
        [Tooltip("The State Machine to start at")]
        private StateMachine startingFsm;
        
        /// <summary>
        /// A temporary data store for the current state.
        /// This is cleared every time the state changes.
        /// Use this to store any runtime data for Behaviors and Conditions.
        /// </summary>
        public Dictionary<string, object> StateData { get; private set; }
        
        /// <summary>
        /// An event invoked whenever the current state machine is changed. <br></br><br></br><br></br>
        /// Parameter 1: Previous State Machine.<br></br><br></br>
        /// Parameter 2: Current State Machine.
        /// </summary>
        public event Action<StateMachine, StateMachine> OnStateMachineChange;
        
        /// <summary>
        /// An event invoked whenever the current state is changed. <br></br><br></br><br></br>
        /// Parameter 1: Previous State.<br></br><br></br>
        /// Parameter 2: Current State.
        /// </summary>
        public event Action<State, State> OnStateChange;
        
        public StateMachine previousStateMachine;
        public StateMachine currentStateMachine;
        
        public State previousState;
        public State currentState;
        
        private HashSet<string> activeTriggers;
        
        private void Start()
        {
            StateData = new Dictionary<string, object>();
            activeTriggers = new HashSet<string>();
            ChangeStateMachine(startingFsm);
        }
    
        private void Update()
        {
            currentState?.OnStateUpdate(this);
        }

        private void FixedUpdate()
        {
            currentState?.OnStateFixedUpdate(this);
        }

        private void LateUpdate()
        {
            CheckTransitions();
        }
        
        private void CheckTransitions()
        {
            var newState = currentStateMachine?.CheckTransitions(this, currentState);
            if (!newState) return;
            ChangeState(newState);
        }

        public void OnFsmAnimationEvent(string eventName)
        {
            currentState.OnAnimationEvent(this, eventName);
        }

        public void FireTrigger(string triggerName)
        {
            if (!currentStateMachine.CheckTrigger(triggerName)) 
                return;
            activeTriggers.Add(triggerName);
        }

        public bool CheckAndConsumeTrigger(string triggerName)
        {
            if (!activeTriggers.Contains(triggerName)) 
                return false;
            activeTriggers.Remove(triggerName);
            return true;
        }

        private void ResetTriggers()
        {
            activeTriggers.Clear();
        }
        
        public void ChangeState(State newState)
        {
            if (currentState == newState) return;
            
            previousState = currentState;
            currentState?.OnStateExit(this);
            
            StateData.Clear();
            ResetTriggers();
            
            currentState = newState;
            currentState?.OnStateEnter(this);
            
            if (previousState)
                OnStateChange?.Invoke(previousState, currentState);
        }

        public void ChangeStateMachine(int index)
        {
            if (index >= stateMachines.Count)
            {
                Debug.LogError($"State Machine Index is out of bounds. Range is from 0 to {stateMachines.Count - 1}");
                return;
            }
            ChangeStateMachine(stateMachines[index]);
        }

        public void ChangeStateMachine(StateMachine newFsm)
        {
            if (!newFsm)
            {
                Debug.LogError($"State Machine is null");
                return;
            }
            
            previousStateMachine = currentStateMachine;
            currentStateMachine = newFsm;
            
            StateData.Clear();
            ResetTriggers();

            ChangeState(currentStateMachine.InitializeStartingState(this));
            
            if (previousStateMachine)
                OnStateMachineChange?.Invoke(previousStateMachine, currentStateMachine);
        }
        
        /// <summary>
        /// Searches the StateData for a key, and returns its value.
        /// </summary>
        public object GetStateData(string key)
        {
            StateData.TryGetValue(key, out var value);
            return value;
        }
        
        /// <summary>
        /// Gets a component by key. If the component is not already cached in StateData,
        /// it will search on the object and (optionally) in children, cache it, and return it.
        /// </summary>
        public T GetOrCacheComponent<T>(string key, bool searchInChildren = true) where T : Component
        {
            if (StateData.TryGetValue(key, out var cachedObj))
                return cachedObj as T;

            T comp = GetComponent<T>();

            if (!comp && searchInChildren)
                comp = GetComponentInChildren<T>(true);

            if (!comp)
            {
                Debug.LogWarning($"[StateMachineManager] No component of type {typeof(T).Name} found on {name} or its children.");
                return null;
            }

            StateData[key] = comp;
            return comp;
        }

        public void OnFsmCollisionEnter(Collision col) => currentStateMachine.CheckFsmCollisionEnter(this, col);
        public void OnFsmCollisionStay(Collision other) => currentStateMachine.CheckFsmCollisionStay(this, other);
        public void OnFsmCollisionExit(Collision other) => currentStateMachine.CheckFsmCollisionExit(this, other);

        public void OnFsmTriggerEnter(Collider other) => currentStateMachine.CheckFsmTriggerEnter(this, other);
        public void OnFsmTriggerStay(Collider other) => currentStateMachine.CheckFsmTriggerStay(this, other);
        public void OnFsmTriggerExit(Collider other) => currentStateMachine.CheckFsmTriggerExit(this, other);
        
        public void OnFsmCollisionEnter2D(Collision2D col) => currentStateMachine.CheckFsmCollisionEnter2D(this, col);
        public void OnFsmCollisionStay2D(Collision2D other) => currentStateMachine.CheckFsmCollisionStay2D(this, other);
        public void OnFsmCollisionExit2D(Collision2D other) => currentStateMachine.CheckFsmCollisionExit2D(this, other);

        public void OnFsmTriggerEnter2D(Collider2D other) => currentStateMachine.CheckFsmTriggerEnter2D(this, other);
        public void OnFsmTriggerStay2D(Collider2D other) => currentStateMachine.CheckFsmTriggerStay2D(this, other);
        public void OnFsmTriggerExit2D(Collider2D other) => currentStateMachine.CheckFsmTriggerExit2D(this, other);
    }
}