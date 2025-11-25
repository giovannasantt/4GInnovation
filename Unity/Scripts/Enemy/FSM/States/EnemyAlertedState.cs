using UnityEngine;

public class EnemyAlertedState : EnemyBaseState
{
    public override EnemyStateType GetStateType() => EnemyStateType.Alerted;

    public override void EnterState()
    {
        base.EnterState();
        fsm.alertMeter = 100f;
    }
}