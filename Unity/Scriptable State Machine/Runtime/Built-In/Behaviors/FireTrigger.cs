using UnityEngine;

namespace MicheliniDev.ScriptableStateMachine
{
    [FsmDropdownItem("Fire Trigger", "General")]
    public class FireTrigger : OneShotBehavior
    {
        [SerializeField] private string triggerName;
        public override void Execute(StateMachineManager manager)
        {
            manager.FireTrigger(triggerName);
        }
    }
}