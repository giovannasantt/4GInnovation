using System;
using System.Collections;
using DG.Tweening;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class EvidenceTrigger : MonoBehaviour, ISelectHandler, IDeselectHandler
{
    private Button button;
    private Color baseColor;
    private Image backgroundImage;
    private Tween colorChangeTween;
    public InventoryItem BindEvidence;
    public InteractableNPC Npc;

    private void Awake()
    {
        button = GetComponent<Button>();
        backgroundImage = transform.parent.GetComponentInChildren<Image>();
        baseColor = backgroundImage.color;
    }

    private void OnEnable()
    {
        button.onClick.AddListener(ShowEvidenceToNPC);
    }

    private void OnDisable()
    {
        button.onClick.RemoveListener(ShowEvidenceToNPC);
    }
    
    public void ShowEvidenceToNPC()
    {
        colorChangeTween.Kill(true);
        
        UIManager.instance.FadeOutAllUI();
        UIManager.instance.DestroyAllEvidenceIcons();
        
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
        
        Npc.PresentEvidence(BindEvidence);
    }
    
    public void OnSelect(BaseEventData eventData)
    {
        UIManager.instance.SetCurrentEvidence(BindEvidence);
        colorChangeTween?.Kill(true);
        colorChangeTween = backgroundImage.DOColor(Color.white, 0.3f);
    }

    public void OnDeselect(BaseEventData eventData)
    {
        colorChangeTween?.Kill(true);
        colorChangeTween = backgroundImage.DOColor(baseColor, 0.3f);
    }
}
