using System.Collections.Generic;
using UnityEngine;

namespace MicheliniDev.ScriptableStateMachine
{
    [System.Serializable]
    public class FsmAnimationEvent
    {
        public string eventName;
        
        [SerializeReference] 
        public OneShotBehavior[] actions; 
    }
}