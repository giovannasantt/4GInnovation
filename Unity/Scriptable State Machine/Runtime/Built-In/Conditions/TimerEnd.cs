using UnityEngine;

namespace MicheliniDev.ScriptableStateMachine
{
    [FsmDropdownItem("Timer End", "General")]
    public class TimerEnd : FsmCondition
    {
        [SerializeField]
        [Tooltip("How long to wait (in seconds) before this condition becomes true.")]
        private float duration = 1f;
        
        public override bool Evaluate(StateMachineManager manager)
        {
            if (!manager.StateData.TryGetValue("Timer", out object startTimeObj))
            {
                return false;
            }

            float startTime = (float)startTimeObj;
            return Time.time >= startTime + duration;
        }
    }
}