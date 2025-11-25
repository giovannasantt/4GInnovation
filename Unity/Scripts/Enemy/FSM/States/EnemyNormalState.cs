using System;
using UnityEngine;
using UnityEngine.UIElements;

public class EnemyNormalState : EnemyBaseState
{
    public override EnemyStateType GetStateType() => EnemyStateType.Normal;

    public override void EnterState()
    {
        base.EnterState();
        fsm.alertMeter = 0f;
        fsm.CanMoveByPatrol = true;
    }

    public override void UpdateState()
    {
        base.UpdateState();
        fsm.AlertedStateChecks();
    }
}