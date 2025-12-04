using UnityEngine;

public class DialogueStarter : MonoBehaviour
{
    [SerializeField] private LocalizedDialogue localizedDialogue;
    
    public void StartDialogue()
    {
        DialogueManager.instance.StartDialogue(localizedDialogue.GetLocalizedDialogue());    
    } 
}