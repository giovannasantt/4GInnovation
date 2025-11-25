using MicheliniDev.ScriptableStateMachine;
using UnityEngine;

public class RaycastHitCondition : FsmCondition
{
    [SerializeField] private LayerMask layer;
    [SerializeField] private Vector3 direction;
    [SerializeField] private float maxDistance;
    [SerializeField] private bool drawRay;
    public override bool Evaluate(StateMachineManager manager)
    {
        var finalDirection = direction != Vector3.zero ? direction : Vector3.forward;
        if (drawRay)
            Debug.DrawRay(manager.transform.position, finalDirection * maxDistance, Color.red);
        return Physics.Raycast(manager.transform.position, finalDirection, maxDistance, layer);
    }
}