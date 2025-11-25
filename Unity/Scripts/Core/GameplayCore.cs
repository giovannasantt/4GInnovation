using UnityEngine;
using DG.Tweening;
using UnityEngine.SceneManagement;

public class GameplayCore : PersistentSingleton<GameplayCore>
{
    public Player Player;
    public UIManager UIManager;
    public MindsetManager MindsetManager;
    public MindsetUIController MindsetUIController;
    public DialogueManager DialogueManager;
    public InventoryManager InventoryManager;

    public bool IsGamePaused = false;

    public void ShowSettings()
    {
        UIManager.ShowSettings();
    }
    
    public void Quit()
    {
        GameCore.instance.ReturnToMenu();
        InputManager.instance.EnableInput(false);
    }
    
    public void PauseGame()
    {
        IsGamePaused = true;
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;
        UIManager.ShowPauseUI();
        InputManager.instance.ChangeMap("UI");
        Time.timeScale = 0f;
    }
    
    public void ResumeGame()
    {
        IsGamePaused = false;
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
        UIManager.HidePauseUI();
        InputManager.instance.ChangeMap("Gameplay");
        Time.timeScale = 1f;
    }
}
