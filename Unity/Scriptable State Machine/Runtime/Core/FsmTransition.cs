using UnityEngine;

namespace MicheliniDev.ScriptableStateMachine
{
    [System.Serializable]
    public struct FsmTransition
    {
        public State fromState;
    
        [SerializeReference] 
        public FsmCondition condition; 
    
        public State conditionTrueState;
        public State conditionFalseState;
    }
}