using System;
using UnityEngine;
using Cursor = UnityEngine.Cursor;

public class PlayerInvestigatingState : PlayerBaseState
{
    public static event Action OnPlayerInvestigating;
    public static event Action OnPlayerInvestigateLeave;
    public override void EnterState()
    {
        OnPlayerInvestigating?.Invoke();
        player.PlayerCamera.ChangePerspective(CameraType.FirstPerson);
        player.PlayerCamera.EnableCameraInput(false);
        CanMove = false;
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;
    }

    public override void ExitState()
    {
        player.PlayerCamera.ChangePerspective(CameraType.ThirdPerson);
        player.PlayerCamera.EnableCameraInput(true);
    }

    public override void UpdateState()
    {
        player.CheckInteraction();
        fsm.BrainstormStateChecks();
        LeaveStateChecks();
    }

    private void LeaveStateChecks()
    {
        if (GameCore.instance.InputManager.GetActionDown("Investigate"))
        {
            fsm.ChangeState(PlayerStateType.Normal);
            OnPlayerInvestigateLeave?.Invoke();
        }
    }

    public override PlayerStateType GetStateType() => PlayerStateType.Investigating;
}