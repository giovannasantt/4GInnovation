using System;
using System.Collections.Generic;
using UnityEngine;

public class CheckMutatedFiles : MonoBehaviour
{
    [SerializeField] private LocalizedDialogue escapeDialogue;
    private bool hasRanDialogue;
    private List<InventoryItem> items;
    
    private void Awake()
    {
        hasRanDialogue = false;
        items = new List<InventoryItem>()
        {
            InventoryManager.instance.GetItemByName("CachorroEvoluido"),
            InventoryManager.instance.GetItemByName("GatoEvoluido"),
            InventoryManager.instance.GetItemByName("LagartoEvoluido"),
            InventoryManager.instance.GetItemByName("PassaroEvoluido"),
        };
    }

    private void Update()
    {
        CheckFiles();
    }

    private void CheckFiles()
    {
        if (hasRanDialogue == true) return;
        if (!InventoryManager.instance.HasItems(items.ToArray())) return;
        
        DialogueManager.instance.StartDialogue(escapeDialogue.GetLocalizedDialogue());
        hasRanDialogue = true;
    }
}