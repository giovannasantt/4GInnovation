using System.Collections.Generic;
using System.Linq;
using UnityEngine;

namespace MicheliniDev.ScriptableStateMachine
{
    [CreateAssetMenu(menuName = "Scriptable State Machine/State Machine", fileName = "New State Machine")]
    public class StateMachine : ScriptableObject
    {
        [SerializeField]
        private List<State> states;
        
        [SerializeField] private List<FsmTransition> transitions;
        [SerializeField] private State startingState;
        
        [SerializeField]
        private List<string> triggers;
        
        public State CheckTransitions(StateMachineManager manager, State currentState)
        {
            if (transitions.Count == 0) return null; 
            foreach (var transition in transitions
                .Where(t => t.fromState == currentState && t.condition != null)) 
            {
                var conditionMet = transition.condition.Evaluate(manager);

                if (conditionMet)
                {
                    if (transition.conditionTrueState)
                        return transition.conditionTrueState;
                }
                else 
                {
                    if (transition.conditionFalseState)
                        return transition.conditionFalseState;
                }
            }
            return null; 
        }

        public State InitializeStartingState(StateMachineManager manager)
        {
            if (!startingState)
            {
                Debug.LogError($"State Machine {name} has no starting state");
                return null;
            }
            return startingState;
        }

        public bool CheckTrigger(string trigger)
        {
            return triggers != null && triggers.Contains(trigger);
        }

        private void HandleFsmCollision<T>(StateMachineManager manager, PhysicsCheckType checkType, T collision)
        {
            foreach (var transition in transitions)
            {
                var physicsBase = transition.condition as CollisionConditionBase;
                if (physicsBase == null) 
                    continue;
                
                if (physicsBase.CheckType == checkType || physicsBase.CheckType == PhysicsCheckType.Any)
                {
                    physicsBase.OnCollisionReceive(manager, collision);
                }
            }
        }

        public void CheckFsmCollisionEnter(StateMachineManager manager, Collision col) => HandleFsmCollision(manager, PhysicsCheckType.CollisionEnter3D, col);
        public void CheckFsmCollisionStay(StateMachineManager manager, Collision col) => HandleFsmCollision(manager, PhysicsCheckType.CollisionStay3D, col);
        public void CheckFsmCollisionExit(StateMachineManager manager, Collision col) => HandleFsmCollision(manager, PhysicsCheckType.CollisionExit3D, col);
        public void CheckFsmTriggerEnter(StateMachineManager manager, Collider other) => HandleFsmCollision(manager, PhysicsCheckType.TriggerEnter3D, other);
        public void CheckFsmTriggerStay(StateMachineManager manager, Collider other) => HandleFsmCollision(manager, PhysicsCheckType.TriggerStay3D, other);
        public void CheckFsmTriggerExit(StateMachineManager manager, Collider other) => HandleFsmCollision(manager, PhysicsCheckType.TriggerExit3D, other);
        public void CheckFsmCollisionEnter2D(StateMachineManager manager, Collision2D col) => HandleFsmCollision(manager, PhysicsCheckType.CollisionEnter2D, col);
        public void CheckFsmCollisionStay2D(StateMachineManager manager, Collision2D col) => HandleFsmCollision(manager, PhysicsCheckType.CollisionStay2D, col);
        public void CheckFsmCollisionExit2D(StateMachineManager manager, Collision2D col) => HandleFsmCollision(manager, PhysicsCheckType.CollisionExit2D, col);
        public void CheckFsmTriggerEnter2D(StateMachineManager manager, Collider2D other) => HandleFsmCollision(manager, PhysicsCheckType.TriggerEnter2D, other);
        public void CheckFsmTriggerStay2D(StateMachineManager manager, Collider2D other) => HandleFsmCollision(manager, PhysicsCheckType.TriggerStay2D, other);
        public void CheckFsmTriggerExit2D(StateMachineManager manager, Collider2D other) => HandleFsmCollision(manager, PhysicsCheckType.TriggerExit2D, other);
    }
}