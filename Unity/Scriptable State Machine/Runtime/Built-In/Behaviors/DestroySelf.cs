namespace MicheliniDev.ScriptableStateMachine
{
    [FsmDropdownItem("Destroy Self", "General")]
    public class DestroySelf : OneShotBehavior
    {
        public override void Execute(StateMachineManager manager)
        {
            UnityEngine.Object.Destroy(manager.gameObject);
        }
    }
}