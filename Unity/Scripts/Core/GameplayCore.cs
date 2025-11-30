using System;
using System.Collections;
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

    public GameLevel CurrentLevel = null;

    private IEnumerator Start()
    {
        yield return new WaitUntil(() => CurrentLevel != null);
        Player.transform.position = CurrentLevel.startPosition.position;
        Player.PlayerFSM.ChangeState(PlayerStateType.Investigating);
    }

    public void Die()
    {
        InputManager.instance.EnableInput(false);
        UIManager.FadeOutAllUI();
        GameCore.instance.FadeBlackScreen(1f, ResetLevel);
    }

    private void ResetLevel()
    {
        SceneManager.LoadSceneAsync(SceneManager.GetActiveScene().name);
        Player.transform.position = CurrentLevel.startPosition.position;
        Player.Health.GainHealth(999f);
        InputManager.instance.EnableInput(true);
        GameCore.instance.FadeBlackScreen(0f);
        Player.instance.PlayerFSM.ChangeState(PlayerStateType.Normal);
    }

    public void ChangeLevel(string sceneName)
    {
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
        CurrentLevel = null;
        UIManager.FadeOutAllUI();
        GameCore.instance.FadeBlackScreen(1f, () =>
        {
            SceneManager.LoadSceneAsync(sceneName).completed += operation =>
            {
                StartCoroutine(WaitForNextLevel());
            };
        });
    }

    private IEnumerator WaitForNextLevel()
    {
        yield return new WaitUntil(() => CurrentLevel);
        Player.transform.position = CurrentLevel.startPosition.position;
        GameCore.instance.FadeBlackScreen(0f);
    }
    
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
        AudioManager.instance.MuffleBGM(.5f);
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
        AudioManager.instance.UnmuffleBGM(.5f);
        Time.timeScale = 1f;
    }
}
