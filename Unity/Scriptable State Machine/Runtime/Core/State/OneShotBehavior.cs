namespace MicheliniDev.ScriptableStateMachine
{
    [System.Serializable]
    public abstract class OneShotBehavior 
    {
        public abstract void Execute(StateMachineManager manager);
    }
}