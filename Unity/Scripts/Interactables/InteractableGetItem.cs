using System.Collections.Generic;
using UnityEngine;

public class InteractableGetItem : InteractableBase
{
    [SerializeField] private InventoryItem bindItem;
    [SerializeField] private LocalizedDialogue bindDialogue;

    protected override void OnInteract()
    {
        if (bindDialogue)
            GameplayCore.instance.DialogueManager.StartDialogue(bindDialogue.GetLocalizedDialogue(), this);
        else
            GameplayCore.instance.InventoryManager.AddItem(bindItem);
    }
}
