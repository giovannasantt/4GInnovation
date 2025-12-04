using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DG.Tweening;
using TMPro;
using UnityEditor;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.Serialization;
using UnityEngine.UI;

public class UIManager : Singleton<UIManager>
{
    private Canvas canvas;
    [SerializeField] private EvidenceDetailedController evidenceDetailedController;

    public InventoryItem CurrentEvidence;
    
    private Tween moveTween; 
    private Tween fadeTween; 
    
    [SerializeField] private GameObject crosshair;
    [SerializeField] private GameObject vignette;
    
    [SerializeField] private GameObject evidencePrefab;
    [SerializeField] private GameObject evidenceIconPrefab;
    
    [SerializeField] private CanvasGroup talkMenuGroup;
    [SerializeField] private CanvasGroup lockPickGroup;
    [SerializeField] private CanvasGroup passwordGroup;
    [SerializeField] private CanvasGroup mindsetBigWrapperGroup;
    [SerializeField] private CanvasGroup evidenceWrapperGroup;

    [SerializeField] private Button showEvidenceButton;
    
    [FormerlySerializedAs("mindsetUnlockRect")] 
    [SerializeField] private RectTransform itemUnlockedRect;
    
    [FormerlySerializedAs("evidenceMenu")] 
    [SerializeField] private GameObject evidenceIconGroupMenu;
    [SerializeField] private GameObject evidenceDetailed;
    
    [SerializeField] private Slider healthBar;
    [SerializeField] private Image whiteScreen;

    private Slider lockPickSlider;
    private Dictionary<Vector2Int, string> directionSprites = new()
    {
        {new Vector2Int(-1, 0), @"<sprite name=""kl"">"},
        {new Vector2Int(1, 0), @"<sprite name=""kr"">"},
        {new Vector2Int(0, 1), @"<sprite name=""ku"">"},
        {new Vector2Int(0, -1), @"<sprite name=""kd"">"},
    };
    
    [SerializeField] private TMP_InputField passwordInputField;

    public CanvasGroup PauseMenuGroup;
    public CanvasGroup SettingsGroup;
    public CanvasGroup PauseMenuButtonsGroup;
    public override void Awake()
    {
        base.Awake();
        canvas = GetComponentInChildren<Canvas>();
        passwordInputField.onSubmit.AddListener((text) => PuzzleManager.instance.CheckPassword(text));
    }

    private void OnEnable()
    {
        PlayerCamera.OnCameraChanged += (cameraType) =>
        {
            SetCrossHair(cameraType == CameraType.FirstPerson);
        };
    }
    
    public void SetVignette(bool active) => vignette.SetActive(active);
    public void SetCrossHair(bool active) => crosshair.SetActive(active);

    public void FlashScreen()
    {
        whiteScreen.gameObject.SetActive(true);
        vignette.SetActive(false);
        whiteScreen.DOFade(1f, .2f).OnComplete(() =>
        {
            whiteScreen.DOFade(0f, .4f).onComplete = () =>
            {
                whiteScreen.gameObject.SetActive(false);
                vignette.SetActive(false);
            };
        });
    }
    
    public void ShowSettings() 
    {
        FadeOutCanvasGroup(PauseMenuButtonsGroup, .5f, true);
        FadeInCanvasGroup(SettingsGroup, .25f, true);
    }
    
    public void HideSettings()
    {
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;
        FadeInCanvasGroup(PauseMenuButtonsGroup, .5f, true);
        FadeOutCanvasGroup(SettingsGroup, .25f, true);
    }

    public void ShowPasswordUI()
    {
        healthBar.gameObject.SetActive(true);
        FadeInCanvasGroup(passwordGroup, 0.5f);
        vignette.SetActive(false);
    }
    
    public void HidePasswordUI()
    {
        healthBar.gameObject.SetActive(false);
        FadeOutCanvasGroup(passwordGroup, 0.5f);
        Cursor.visible = false;
        Cursor.lockState = CursorLockMode.Locked;
        vignette.SetActive(true);
    }

    public void ShowPauseUI()
    {
        FadeInCanvasGroup(PauseMenuGroup, .25f, true);
    }
    
    public void HidePauseUI()
    {
        FadeOutCanvasGroup(PauseMenuGroup, .25f, true);
    }
    
    public void ShowLockPickUI(Vector2Int[] steps, float timer, float maxTimer)
    {
        healthBar.gameObject.SetActive(true);
        vignette.SetActive(false);
        FadeInCanvasGroup(lockPickGroup, 1f);
        InitializeLockPickTimer(timer, maxTimer);
        var text = lockPickGroup.GetComponentInChildren<TextMeshProUGUI>();
        text.text = "";
        foreach (var step in steps)
        {
            text.text += $" {directionSprites[step]}";
        }
    }

    private void InitializeLockPickTimer(float timer, float maxValue)
    {
        lockPickSlider = lockPickGroup.GetComponentInChildren<Slider>();
        lockPickSlider.maxValue = maxValue;
        UpdateLockPickTimer(timer);
    }

    public void UpdateLockPickTimer(float timer) => lockPickSlider.value = timer;

    public void HideLockPickUI()
    {
        healthBar.gameObject.SetActive(false);
        vignette.SetActive(true);
        FadeOutCanvasGroup(lockPickGroup, 0.5f); 
    }
    
    public void ShowMindsets(bool hide)
    {
        if (!hide)
        {
            FadeInCanvasGroup(mindsetBigWrapperGroup, 0.4f);
            healthBar.gameObject.SetActive(true);
            vignette.SetActive(false);
        }
        else
        {
            FadeOutCanvasGroup(mindsetBigWrapperGroup, 0.4f);
            healthBar.gameObject.SetActive(false);
            vignette.SetActive(true);
        }
    }

    public void ShowItemGainedUI(IUIDataSettable data)
    {
        if (!itemUnlockedRect.gameObject.activeSelf)
            itemUnlockedRect.gameObject.SetActive(true);
        itemUnlockedRect.GetComponent<ItemUnlockedUI>().SetData(data);
        itemUnlockedRect.DOLocalMoveX(572f, 1f).OnComplete(() =>
        {
            StartCoroutine(WaitUntilMoveItem());
        });
    }

    private IEnumerator WaitUntilMoveItem()
    {
        yield return new WaitForSeconds(1f);
        MoveObjectToScreenBound(itemUnlockedRect, 1);
    }
    
    public void SetCurrentEvidence(InventoryItem evidence)
    {
        CurrentEvidence = evidence;
        evidenceDetailedController.ChangeEvidence(CurrentEvidence);
    }
    
    public void ShowTalkMenu(InteractableBase source)
    {
        if (source is not InteractableNPC npc) return;
        
        FadeInCanvasGroup(talkMenuGroup, 1f);
        showEvidenceButton.onClick.AddListener(() => ShowEvidenceMenu(npc)); 
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;
        Player.instance.PlayerCamera.EnableCameraInput(false);
    }

    public void DestroyAllEvidenceIcons()
    {
        for (int i = 0; i < evidenceIconGroupMenu.transform.childCount; i++)
        {
            Destroy(evidenceIconGroupMenu.transform.GetChild(i).gameObject);
        }    
    }
    
    public void ShowEvidenceMenu(InteractableNPC npc)
    {
        FadeOutCanvasGroup(talkMenuGroup, 0.5f);
        
        var evidences = InventoryManager.instance.GetInventory();
        if (evidences.Count == 0) return;
        
        FadeInCanvasGroup(evidenceWrapperGroup, 1f);
        vignette.SetActive(false);
        Player.instance.PlayerCamera.EnableCameraInput(false);
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;
        
        for (var i = 0; i < evidences.Count; i++)
        {
            var evidenceObj = Instantiate(evidenceIconPrefab, evidenceIconGroupMenu.transform);
            var trigger = evidenceObj.GetComponentInChildren<EvidenceTrigger>();

            trigger.GetComponent<Image>().sprite = evidences[i].Icon;
            trigger.BindEvidence = evidences[i];
            if (npc) trigger.Npc = npc;

            if (i != 0) continue;
            EventSystem.current.SetSelectedGameObject(trigger.gameObject);
            SetCurrentEvidence(evidences[i]);
        }
    }
    
    public void FadeOutAllUI()
    {
        Debug.Log("UI Fading Out");
        FadeOutCanvasGroup(talkMenuGroup, 1f);    
        FadeOutCanvasGroup(mindsetBigWrapperGroup, 0.4f);
        FadeOutCanvasGroup(passwordGroup, 0.4f);
        FadeOutCanvasGroup(lockPickGroup, 0.4f);
        healthBar.gameObject.SetActive(false);
        evidenceWrapperGroup.alpha = 0f;
        evidenceWrapperGroup.gameObject.SetActive(false);
        SetCrossHair(false);
        vignette.SetActive(false);
    }

    private void MoveObjectToScreenBound(RectTransform rectTansform, int direction)
    {
        moveTween?.Kill(true);
        var canvasRect = canvas.GetComponent<RectTransform>();
        moveTween = rectTansform.DOLocalMoveX((
                canvas.transform.position.x + canvasRect.rect.width) * direction, 
            0.5f);
    }
    
    private void FadeInCanvasGroup(CanvasGroup canvasGroup, float duration, bool unscaledTime = false)
    {
        fadeTween?.Kill(true);
        canvasGroup.gameObject.SetActive(true);
        canvasGroup.alpha = 0f;
        fadeTween = canvasGroup.DOFade(1, duration);
        fadeTween.SetUpdate(unscaledTime);
    }

    public void SetSoundVolume(Slider slider)
    {
        AudioManager.instance.SetSoundVolume(slider);
    }
    
    private void FadeOutCanvasGroup(CanvasGroup canvasGroup, float duration, bool unscaledTime = false)
    {
        fadeTween?.Kill(true);
        fadeTween = canvasGroup.DOFade(0, duration).OnComplete(() =>
        {
            canvasGroup.gameObject.SetActive(false);
        });
        fadeTween.SetUpdate(unscaledTime);
    }
}