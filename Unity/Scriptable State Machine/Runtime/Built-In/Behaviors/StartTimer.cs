using UnityEngine;

namespace MicheliniDev.ScriptableStateMachine
{
    [FsmDropdownItem("Start Timer", "General")]
    public class StartTimer : OneShotBehavior
    {
        public override void Execute(StateMachineManager manager)
        {
            manager.StateData["Timer"] = Time.time;
        }
    }
}