using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class LocalizationManager : Singleton<LocalizationManager>
{
    public LanguageType CurrentLanguageType;
    public UnityEvent OnLanguageChanged;

    public string GetLocalizedString(List<LocalizedString> localizedStrings)
    {
        foreach (var line in localizedStrings)
        {
            if (line.language == CurrentLanguageType)
                return line.text;
        }

        return "Localization Not Found";
    }
}
