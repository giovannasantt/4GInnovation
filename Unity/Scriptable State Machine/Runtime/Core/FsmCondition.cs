namespace MicheliniDev.ScriptableStateMachine
{
    [System.Serializable]
    public abstract class FsmCondition 
    {
        public abstract bool Evaluate(StateMachineManager manager);
    }
}