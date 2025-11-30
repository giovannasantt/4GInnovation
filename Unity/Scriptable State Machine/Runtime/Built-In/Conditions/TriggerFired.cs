using UnityEngine;

namespace MicheliniDev.ScriptableStateMachine
{
    [FsmDropdownItem("Trigger Fired", "General")]
    [System.Serializable]
    public class TriggerFired : FsmCondition
    {
        [Tooltip("The trigger name to listen for.")]
        public string triggerName;

        public override bool Evaluate(StateMachineManager manager)
        {
            return manager.CheckAndConsumeTrigger(triggerName);
        }
    }
}