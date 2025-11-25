using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class ItemUnlockedUI : MonoBehaviour
{
    private List<TranslatedUIText> texts;
    private readonly Dictionary<string, TranslatedUIText> textLookup = new();
    private void Awake()
    {
        texts = GetComponentsInChildren<TranslatedUIText>(true).ToList();
        foreach (var text in texts)
        {
            textLookup.Add(text.name, text);
        }
    }

    public void SetData(IUIDataSettable data)
    {
        textLookup["Title"].OverrideLocalizations(data.Name);
        textLookup["Description"].OverrideLocalizations(data.Description);
    }
}
