using UnityEngine;

public class PlayerBrainstormState : PlayerBaseState
{
    public override PlayerStateType GetStateType() => PlayerStateType.Brainstorm;
    public override void EnterState()
    {
        UIManager.instance.ShowMindsets(false);
        player.PlayerCamera.ChangePerspective(CameraType.FirstPerson);
        player.PlayerCamera.EnableCameraInput(false);
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;
        CanMove = false;
    }

    public override void UpdateState()
    {
        if (InputManager.instance.GetActionDown("EnterMindset"))
        {
            fsm.ChangeState(PlayerStateType.Normal);
        }
    }

    public override void ExitState()
    {
        UIManager.instance.ShowMindsets(true);
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
        player.PlayerCamera.EnableCameraInput(true);
        player.PlayerCamera.ChangePerspective(CameraType.ThirdPerson);
    }
}
