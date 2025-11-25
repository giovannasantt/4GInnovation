using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "LocalizedDialogue", menuName = "Scriptable Objects/LocalizedDialogue")]
public class LocalizedDialogue : ScriptableObject
{
    public List<LocalizedDialogueData> Dialogues;
    
    public TextAsset GetLocalizedDialogue()
    {
        foreach (var dialogue in Dialogues)
        {
            if (dialogue.Language == GameCore.instance.LocalizationManager.CurrentLanguageType)
                return dialogue.InkFile;
        }
        return null;
    }
    
    [System.Serializable]
    public struct LocalizedDialogueData
    {
        public LanguageType Language;
        public TextAsset InkFile;
    }
}
