using System;
using UnityEngine;

public class MindsetSequence : MonoBehaviour
{
    [SerializeField] private MindsetData mindset;
    [SerializeField] private MindsetData triggerMindset;
    [SerializeField] private LocalizedDialogue dialogue;
    
    private void OnEnable()
    {
        GameplayCore.instance.MindsetManager.OnMindsetUnlocked += OnMindsetUnlocked;

        if (mindset)
            GameplayCore.instance.MindsetManager.UnlockMindsetByName(mindset.name);
    }

    private void OnDisable()
    {
        if (GameplayCore.instance != null && GameplayCore.instance.MindsetManager != null)
        {
            GameplayCore.instance.MindsetManager.OnMindsetUnlocked -= OnMindsetUnlocked;
        }
    }

    private void OnMindsetUnlocked(MindsetData newMindset)
    {
        if (triggerMindset && newMindset == triggerMindset)
        {
            Player.instance.PlayerFSM.ChangeState(PlayerStateType.Normal);
            DialogueManager.instance.StartDialogue(dialogue.GetLocalizedDialogue());
        }
    }
}