using System;
using UnityEngine;

namespace MicheliniDev.ScriptableStateMachine
{
    [FsmDropdownItem("Raycast2D Hit", "Physics")]
    public class Raycast2DHit : FsmCondition
    {
        [SerializeField] 
        [Tooltip("The layers to include in the ray")]
        private LayerMask layerMask;

        [SerializeField] private float maxRayDistance;
        
        public override bool Evaluate(StateMachineManager manager)
        {
            Debug.DrawRay(manager.transform.position, Vector2.right * maxRayDistance * manager.transform.localScale.normalized, Color.red);
            return Physics2D.Raycast(manager.transform.position, Vector2.right * manager.transform.localScale.normalized, maxRayDistance, layerMask);
        }
    }
}