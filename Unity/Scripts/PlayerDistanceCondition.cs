using MicheliniDev.ScriptableStateMachine;
using UnityEngine;

public class PlayerDistanceCondition : FsmCondition
{
    [SerializeField] private float threshold;
    public override bool Evaluate(StateMachineManager manager)
    {
        return Mathf.Abs(Vector3.Distance(manager.transform.position, Player.instance.transform.position)) < threshold;
    }
}