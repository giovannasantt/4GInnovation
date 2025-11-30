public class EnemyAttackState : EnemyBaseState
{
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