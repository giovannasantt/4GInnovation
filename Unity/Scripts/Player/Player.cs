using System;
using Unity.Cinemachine;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.InputSystem;

public class Player : Singleton<Player>
{
    public PlayerMovement Movement;
    public Health Health;
    public PlayerCamera PlayerCamera;
    public PlayerStateMachine PlayerFSM;

    public LocalizedDialogue testDialogue;
    
    public GameObject View;
    public Transform Orientation;
    
    private void OnEnable() => MindsetManager.OnMindsetUnlockFail += () =>
    {
        Health.LoseHealth(0.3f);
    };

    private void Update()
    {
        if (InputManager.instance.GetActionDown("Pause") && !GameplayCore.instance.IsGamePaused)
        {
            GameplayCore.instance.PauseGame();
        }
        if (InputManager.instance.GetActionDown("Resume") && GameplayCore.instance.IsGamePaused)
        {
            GameplayCore.instance.ResumeGame();
        }
        
        if (Keyboard.current.vKey.isPressed)
            DialogueManager.instance.StartDialogue(testDialogue.GetLocalizedDialogue());
    }

    public void CheckInteraction()
    {
        if (!Physics.Raycast(Camera.main.ScreenPointToRay(new Vector3(Mouse.current.position.x.value, Mouse.current.position.y.value, 0f)), out RaycastHit hit)) return;
        if (!GameCore.instance.InputManager.GetActionDown("Click")) return;
        if (PlayerCamera.currentCameraType != CameraType.FirstPerson) return;
        
        GameObject hitObject = hit.collider.gameObject;
        if (hitObject.TryGetComponent<IInteractable>(out var interactable) && 
            hitObject.layer == LayerMask.NameToLayer("Interactable"))
        {
            interactable.Interact();
        }
    }
}
