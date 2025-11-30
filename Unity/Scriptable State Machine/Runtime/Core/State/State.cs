using System.Collections.Generic;
using System.Linq;
using UnityEngine;

namespace MicheliniDev.ScriptableStateMachine
{
    [CreateAssetMenu(menuName = "Scriptable State Machine/State", fileName = "New State")]
    public class State : ScriptableObject
    {
        [SerializeReference] public List<StateBehavior> behaviors = new List<StateBehavior>();
        
        [SerializeReference] public List<OneShotBehavior> oneShotBehaviors = new List<OneShotBehavior>();
        
        [SerializeField] private FsmAnimationEvent[] animationEvents;

        public void OnStateEnter(StateMachineManager manager)
        {
            RunOneShots(oneShotBehaviors.ToArray(), manager);
            
            foreach (var behavior in behaviors)
                behavior?.OnEnter(manager);
        }

        public void OnStateUpdate(StateMachineManager manager)
        {
            foreach (var behavior in behaviors)
            {
                behavior?.OnUpdate(manager);
            }
        }

        public void OnStateFixedUpdate(StateMachineManager manager)
        {
            foreach (var behavior in behaviors)
            {
                behavior?.OnFixedUpdate(manager);
            }
        }

        public void OnStateExit(StateMachineManager manager)
        {
            foreach (var behavior in behaviors)
            {
                behavior?.OnExit(manager);
            }
        }

        public void OnAnimationEvent(StateMachineManager manager, string eventName)
        {
            foreach (var animationEvent in animationEvents)
            {
                if (animationEvent.eventName != eventName) continue;
                RunOneShots(animationEvent.actions, manager);
                break;
            }
        }
        
        private void RunOneShots(OneShotBehavior[] actions, StateMachineManager manager)
        {
            foreach (var action in actions)
            {
                action?.Execute(manager);
            }
        }
    }
}