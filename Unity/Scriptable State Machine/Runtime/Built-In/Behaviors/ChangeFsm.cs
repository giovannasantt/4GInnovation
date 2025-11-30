using UnityEngine;

namespace MicheliniDev.ScriptableStateMachine
{
    [FsmDropdownItem("Change Fsm", "Fsm")]
    public class ChangeFsm : OneShotBehavior
    {
        [SerializeField] private StateMachine fsm;
        public override void Execute(StateMachineManager manager)
        {
            manager.ChangeStateMachine(fsm);
        }
    }
}