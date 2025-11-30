using System;
using DG.Tweening;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class GameCore : PersistentSingleton<GameCore>
{
    [SerializeField] private GameObject MenuUI;
    [SerializeField] private CanvasGroup MainMenuGroup;
    [SerializeField] private GameObject menuBackground;
    [SerializeField] private Image blackScreen;

    public CanvasGroup SettingsGroup;
    
    public InputManager InputManager;
    public SaveManager SaveManager;
    public LocalizationManager LocalizationManager;
    public GameplayCore GameplayCore;
    public AudioManager AudioManager;
    
    [SerializeField] private string initScene;

    public void FadeBlackScreen(float finalValue, TweenCallback onComplete = null)
    {
        blackScreen.DOFade(finalValue, .5f).OnComplete(onComplete);
    }
    
    public void PlayGame()
    {
        blackScreen.DOColor(Color.black, 0.3f).OnComplete(() =>
        {
            MainMenuGroup.alpha = 0f;
            MainMenuGroup.gameObject.SetActive(false);
            menuBackground.gameObject.SetActive(false);
            InputManager.ChangeMap("Gameplay");
            InputManager.instance.EnableInput(true);
            AsyncOperation sceneLoad = SceneManager.LoadSceneAsync(initScene);
            sceneLoad.completed += operation =>
            {
                blackScreen.DOFade(0f, 0.3f);
            };
        });
    }

    public void ShowSettingsMainMenu(bool active)
    {
        SettingsGroup.gameObject.SetActive(active);
        MainMenuGroup.gameObject.SetActive(!active);
        ShowSettings(active);
    }

    public void ShowSettings(bool active)
    {
        if (!SettingsGroup.gameObject.activeSelf && active)
            SettingsGroup.gameObject.SetActive(true);
        SettingsGroup.DOFade(active ? 1f : 0f, .5f).OnComplete(() =>
        {
            if (!active)
                SettingsGroup.gameObject.SetActive(false);
        });
    }

    public void QuitGame()
    {
        blackScreen.DOFade(1f, .5f).OnComplete(Application.Quit);
    }

    public void ReturnToMenu()
    {
        Time.timeScale = 1f;
        Destroy(GameplayCore.gameObject);
        blackScreen.DOColor(Color.black, 0.5f).OnComplete(() =>
            {
                var menuLoad = SceneManager.LoadSceneAsync("Menu");
                menuLoad.completed += operation =>
                {
                    menuBackground.gameObject.SetActive(true);
                    blackScreen.DOFade(0f, 0.5f);
                    MainMenuGroup.gameObject.SetActive(true);
                    MainMenuGroup.DOFade(1f, 0.5f);
                    InputManager.instance.EnableInput(true);
                };
            }
        );
    }

    public void SpawnGameplayCore()
    {
        GameplayCore = Instantiate(Resources.Load<GameObject>("Initilization/GameplayCore")).GetComponent<GameplayCore>();
    }
}