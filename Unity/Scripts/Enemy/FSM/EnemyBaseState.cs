using UnityEngine;

public class EnemyBaseState : State<EnemyStateType>
{
    protected EnemyStateMachine fsm => GetComponentInParent<EnemyStateMachine>();
    public override void EnterState()
    {
    }

    public override void UpdateState()
    {
       
    }

    public override void ExitState()
    {
    }

    public override EnemyStateType GetStateType()
    {
        return EnemyStateType.Normal;
    }
}
