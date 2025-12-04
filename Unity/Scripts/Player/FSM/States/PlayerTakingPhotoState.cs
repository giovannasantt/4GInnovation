using System;
using System.Collections;
using UnityEngine;

public class PlayerTakingPhotoState : PlayerBaseState
{
    [SerializeField] private AudioClip photoSound;
    
    private Coroutine captureCoroutine;
    private string screenshotPrefix = "Photo_";

    public static event Action OnPhotoTaken;
    
    public override PlayerStateType GetStateType() => PlayerStateType.TakingPhoto;

    public override void EnterState()
    {
        player.PlayerCamera.ChangePerspective(CameraType.FirstPerson);
        
        CanMove = false;
    }

    public override void ExitState()
    {
        player.PlayerCamera.ChangePerspective(CameraType.ThirdPerson);
        
        CanMove = true;
        
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
    }

    public override void UpdateState()
    {
        if (GameCore.instance.InputManager.GetActionDown("TogglePhoto"))
        {
            fsm.ChangeState(PlayerStateType.Normal);
            return;
        }

        if (GameCore.instance.InputManager.GetActionDown("MouseClick") && captureCoroutine == null)
        {
            captureCoroutine = StartCoroutine(CaptureAndSave());
        }
    }

    private IEnumerator CaptureAndSave()
    {
        yield return new WaitForEndOfFrame();

        string date = DateTime.Now.ToString("yyyy-MM-dd_HH-mm-ss");
        string filename = $"{screenshotPrefix}{date}.png";

        UIManager.instance.FlashScreen();
        AudioManager.instance.PlaySFX(photoSound, 0.95f, 1.05f);
        ScreenCapture.CaptureScreenshot(filename);
        
        OnPhotoTaken?.Invoke();
        captureCoroutine = null;
    }
}