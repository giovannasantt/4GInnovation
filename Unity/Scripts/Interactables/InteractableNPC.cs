using System;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEngine.Serialization;

public class InteractableNPC : InteractableBase
{
    [FormerlySerializedAs("dialogue")] 
    [SerializeField] private LocalizedDialogue firstSpeakDialogue;
    [SerializeField] private LocalizedDialogue regularDialogue;
    
    [SerializeField] private List<NPCEvidenceResponseData> evidenceResponse;
    [SerializeField] private LocalizedDialogue evidenceFallbackDialogue;
    
    private bool isFirstTimeSpeak = true;

    protected override void OnInteract()
    {
        if (isFirstTimeSpeak)
        {
            DialogueManager.instance.StartDialogue(firstSpeakDialogue.GetLocalizedDialogue(), this);
            isFirstTimeSpeak = false;
            return;
        }
        //UIManager.instance.ShowTalkMenu(this); 
    }

    public void PresentEvidence(InventoryItem evidence)
    {
        var hasFoundResponse = false;
        foreach (var response in evidenceResponse.Where(response => response.Evidence == evidence))
        {
            DialogueManager.instance.StartDialogue(response.Response.GetLocalizedDialogue());
            hasFoundResponse = true;
        }

        if (!hasFoundResponse)
        {
            DialogueManager.instance.StartDialogue(evidenceFallbackDialogue.GetLocalizedDialogue());
        }
    }
    
    [Serializable]
    public struct NPCEvidenceResponseData
    {
        public InventoryItem Evidence;
        public LocalizedDialogue Response;
    }
}