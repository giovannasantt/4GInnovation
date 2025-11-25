using UnityEngine;

[System.Serializable]
public class LocalizedString
{
    public LanguageType language;
    [TextArea] public string text;
}