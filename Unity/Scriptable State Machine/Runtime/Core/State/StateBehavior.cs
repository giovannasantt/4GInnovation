namespace MicheliniDev.ScriptableStateMachine
{
    [System.Serializable] 
    public abstract class StateBehavior 
    {
        public abstract void OnEnter(StateMachineManager manager);
        public abstract void OnUpdate(StateMachineManager manager);
        public abstract void OnFixedUpdate(StateMachineManager manager);
        public abstract void OnExit(StateMachineManager manager);
    }
}