using UnityEngine;

public class PlayerNormalState : PlayerBaseState
{
    public override void EnterState()
    {
        CanMove = true;
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
    }

    public override void UpdateState()
    {
        fsm.InvestigateStateChecks();
        fsm.BrainstormStateChecks();
        fsm.PhotoStateChecks();
    }

    public override void ExitState()
    {
    }
    public override PlayerStateType GetStateType() => PlayerStateType.Normal;
}
