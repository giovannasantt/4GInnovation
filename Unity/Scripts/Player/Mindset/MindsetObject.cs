using System;
using System.Collections.Generic;
using UnityEngine;

public class MindsetObject : MonoBehaviour
{
    public MindsetData Data;
    public void SetData(MindsetData data)
    {
        Data = data;
        foreach (var text in GetComponentsInChildren<TranslatedUIText>())
        {
            text.OverrideLocalizations(text.name.Contains("Name") ? data.Name : data.Description);
        }
    }
}
