using UnityEngine;

namespace MicheliniDev.ScriptableStateMachine
{
    [RequireComponent(typeof(Animator))]
    public class FsmAnimationEvents : MonoBehaviour
    {
        [SerializeField] 
        [Tooltip("The StateMachineManager to send the animation events to")]
        private StateMachineManager manager;
        
        public void ChangeStateMachine(int index)
        {
            manager.ChangeStateMachine(index);
        }

        public void FireFsmTrigger(string trigger)
        {
            manager.FireTrigger(trigger);    
        }
        
        public void SendAnimationEvent(string eventName)
        {
            manager.OnFsmAnimationEvent(eventName);
        }
    }
}
