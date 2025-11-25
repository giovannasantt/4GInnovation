using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class LanguageDropdown : MonoBehaviour
{
    private TMP_Dropdown dropdown;
    private LanguageType currentLanguageType
    {
        get => LocalizationManager.instance.CurrentLanguageType;
        set => LocalizationManager.instance.CurrentLanguageType = value;
    }

    void Start()
    {
        dropdown = GetComponent<TMP_Dropdown>();
        dropdown.ClearOptions();

        var options = new List<string>();
        foreach (var lang in System.Enum.GetValues(typeof(LanguageType)))
        {
            options.Add(lang.ToString());
        }
        dropdown.AddOptions(options);

        dropdown.value = (int)currentLanguageType;
        dropdown.RefreshShownValue();

        dropdown.onValueChanged.AddListener(OnLanguageChanged);
    }

    private void OnLanguageChanged(int index)
    {
        currentLanguageType = (LanguageType)index;
        LocalizationManager.instance.OnLanguageChanged?.Invoke();
    }
}