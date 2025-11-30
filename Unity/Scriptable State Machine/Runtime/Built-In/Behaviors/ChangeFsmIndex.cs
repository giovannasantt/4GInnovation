using UnityEngine;

namespace MicheliniDev.ScriptableStateMachine
{
    [FsmDropdownItem("Change Fsm Index", "Fsm")]
    public class ChangeFsmIndex : OneShotBehavior
    {
        [SerializeField] private int index;
        public override void Execute(StateMachineManager manager)
        {
            manager.ChangeStateMachine(index);
        }
    }
}