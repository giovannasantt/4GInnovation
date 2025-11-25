using System;
using UnityEngine;
using Ink.Runtime;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using System.Linq;
using Unity.VisualScripting;
using UnityEngine.UI;

public class DialogueManager : Singleton<DialogueManager>
{
    private Story currentStory;

    [SerializeField] private GameObject dialogueUI; 
    [SerializeField] private TextMeshProUGUI dialogueText; 
    [SerializeField] private GameObject[] choicesUI;
    
    [SerializeField] private RawImage dialoguePortraitImage;

    [SerializeField] private Texture2D jessicaNeutral;
    [SerializeField] private Texture2D jessicaTalking;
    [SerializeField] private Texture2D jessicaHappy;

    private Dictionary<string, Texture2D> jessicaPortraits = new();
    public override void Awake()
    {
        base.Awake();
        for (int i = 0; i < choicesUI.Length; i++)
        {
            int index = i;
            choicesUI[i].GetComponentInChildren<Button>().onClick.AddListener(() => SetChoice(index));
        }
        jessicaPortraits.Add("Neutral", jessicaNeutral);
        jessicaPortraits.Add("Talking", jessicaTalking);
        jessicaPortraits.Add("Happy", jessicaHappy);
    }

    private void Update()
    {
        if (!currentStory) return;

        if (GameCore.instance.InputManager.GetActionDown("AdvanceDialogue"))
            ContinueDialogue();
        if (GameCore.instance.InputManager.GetActionDown("SkipDialogue"))
            EndDialogue();
    }

    public void StartDialogue(TextAsset inkJson, InteractableBase source = null)
    {
        StopAllCoroutines();
        currentStory = new Story(inkJson.text);
        dialogueUI.SetActive(true);
        dialogueText.text = string.Empty;

        BindExternalFunctions(source);

        InputManager.instance.ChangeMap("Dialogue");
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;
        
        Player.instance.PlayerCamera.EnableCameraInput(false);
        ContinueDialogue();
    }

    private void BindExternalFunctions(InteractableBase source)
    {
        currentStory.BindExternalFunction("GetItem", (string itemName) =>
        {
            InventoryItem item = GameplayCore.instance.InventoryManager.GetItemByName(itemName);
            GameplayCore.instance.InventoryManager.AddItem(item);
        });
        currentStory.BindExternalFunction("ShowEvidenceMenu", () =>
        {
            UIManager.instance.ShowEvidenceMenu(source as InteractableNPC);
        });
        currentStory.BindExternalFunction("GetMindset", (string mindsetName) =>
        {
            GameplayCore.instance.MindsetManager.GetMindsetByName(mindsetName);
        });
        currentStory.BindExternalFunction("ShowTalkMenu", () =>
        {
            EndDialogue();
            UIManager.instance.ShowTalkMenu(source);
        });
        currentStory.BindExternalFunction("StartLockPickPuzzle", () =>
        {
            EndDialogue();
            PuzzleManager.instance.StartPuzzle(PuzzleManager.PuzzleType.LockPick);
        });
        currentStory.BindExternalFunction("SetJessicaEmotion", (string emotion) =>
        {
            dialoguePortraitImage.texture = jessicaPortraits[emotion];
        });
        currentStory.BindExternalFunction("StartPasswordPuzzle", () =>
        {
            EndDialogue();
            PuzzleManager.instance.StartPuzzle(PuzzleManager.PuzzleType.ComputerPassword);
        });
    }

    private void ContinueDialogue()
    {
        if (dialogueText.text != currentStory.currentText)
        {
            StopAllCoroutines();
            dialogueText.text = currentStory.currentText;
            CheckChoiceCount();
            return;
        }

        if (CheckChoiceCount()) return;
        
        if (currentStory.canContinue)
            StartCoroutine(TypeText(currentStory.Continue()));
        else
            EndDialogue();
    }

    private void ShowChoices()
    {
        for (int i = 0; i < choicesUI.Length; i++)
        {
            if (i < currentStory.currentChoices.Count)
            {
                choicesUI[i].SetActive(true);
                choicesUI[i].GetComponentInChildren<TextMeshProUGUI>().text = currentStory.currentChoices[i].text;
            }
            else
            {
                choicesUI[i].SetActive(false);
            }
        }
    }

    private void DisableAllChoices()
    {
        foreach (var choice in choicesUI)
            choice.SetActive(false);
    }

    private void SetChoice(int index)
    {
        foreach (var choice in choicesUI)
        {
            choice.SetActive(false);
        }
        currentStory.ChooseChoiceIndex(index);
        ContinueDialogue();
    }

    private void EndDialogue()
    {
        StopAllCoroutines();
        currentStory = null;
        dialogueText.text = string.Empty;
        DisableAllChoices();
        dialogueUI.SetActive(false);
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
        Player.instance.PlayerCamera.EnableCameraInput(true);
        InputManager.instance.ChangeMap("Gameplay");
    }

    private IEnumerator TypeText(string text)
    {
        dialogueText.text = string.Empty;
        char[] chars = text.ToCharArray();
        for (int i = 0; i < chars.Length; i++)
        {
            dialogueText.text += chars[i];
            yield return new WaitForSeconds(0.15f);
        }
        dialogueText.text = text;
        CheckChoiceCount();
        yield return null;
    }

    private bool CheckChoiceCount()
    {
        if (!currentStory || currentStory.currentChoices.Count == 0) 
            return false;
        ShowChoices();
        return true;
    }
}
