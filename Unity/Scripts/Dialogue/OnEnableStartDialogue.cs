using System;
using UnityEngine;

public class OnEnableStartDialogue : MonoBehaviour
{
    [SerializeField] private LocalizedDialogue dialogue;

    private void OnEnable()
    {
        DialogueManager.instance.StartDialogue(dialogue.GetLocalizedDialogue());
    }
}