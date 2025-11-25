using System;
using System.Collections.Generic;
using System.Linq;
using TMPro;
using UnityEngine;

public class TranslatedUIText : MonoBehaviour
{
    [SerializeField] private List<LocalizedString> localizations;
    private TextMeshProUGUI bindText;
    
    private void Awake() => bindText = GetComponent<TextMeshProUGUI>();
    
    private void OnEnable()
    {
        GameCore.instance.LocalizationManager.OnLanguageChanged.AddListener(SetTranslatedText);
        SetTranslatedText();
    }
    
    private void OnDisable()
    {
        GameCore.instance.LocalizationManager.OnLanguageChanged.RemoveListener(SetTranslatedText);
    }
    
    private void SetTranslatedText()
    {
        if (localizations == null || localizations.Count == 0 || bindText == null) return;
        foreach (var localization in localizations.Where(localization => localization.language == LocalizationManager.instance.CurrentLanguageType))
        {
            bindText.text = localization.text;
            break;
        }
    }

    public void OverrideLocalizations(List<LocalizedString> newTranslations)
    {
        localizations = newTranslations;
        SetTranslatedText();
    }
    
    public List<LocalizedString> GetLocalizations() => localizations;
}
