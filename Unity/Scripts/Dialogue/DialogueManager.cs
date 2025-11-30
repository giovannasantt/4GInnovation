using System;
using UnityEngine;
using Ink.Runtime;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using TMPro;
using UnityEngine.UI;

public class DialogueManager : Singleton<DialogueManager>
{
    private Story currentStory;
    private bool isPlayingDialogue;

    [SerializeField] private GameObject dialogueUI; 
    [SerializeField] private TextMeshProUGUI dialogueText; 
    [SerializeField] private GameObject[] choicesUI;
    
    [SerializeField] private RawImage dialoguePortraitImage;
    [SerializeField] private RawImage npcPortraitImage;

    [SerializeField] private SerializedDictionary<string, Texture2D> jessicaPortraits = new();
    [SerializeField] private SerializedDictionary<string, Texture2D> npcPortraits = new();    
    [SerializeField] private SerializedDictionary<string, AudioClip> dialogueSounds = new();    

    private InteractableNPC currentNPC;

    [SerializeField] private LocalizedDialogue petshopEndDialogue;

    public static event Action OnDialogueEnd;

    [SerializeField] private AudioClip blipSound;
    public override void Awake()
    {
        base.Awake();
        for (int i = 0; i < choicesUI.Length; i++)
        {
            int index = i;
            choicesUI[i].GetComponentInChildren<Button>().onClick.AddListener(() => SetChoice(index));
        }
    }

    private void Update()
    {
        if (!currentStory) return;

        if (GameCore.instance.InputManager.GetActionDown("AdvanceDialogue"))
            ContinueDialogue();
    }

    public void StartDialogue(TextAsset inkJson, InteractableBase source = null)
    {
        if (isPlayingDialogue) return;
        
        StopAllCoroutines();
        isPlayingDialogue = true;
        if (source is InteractableNPC)
            currentNPC = source as InteractableNPC;
        currentStory = new Story(inkJson.text);
        dialogueUI.SetActive(true);
        dialogueText.text = string.Empty;
        dialogueText.fontStyle = FontStyles.Normal;

        dialoguePortraitImage.gameObject.SetActive(false);
        npcPortraitImage.gameObject.SetActive(false);
        
        BindExternalFunctions(source);

        InputManager.instance.ChangeMap("Dialogue");
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
        
        Player.instance.PlayerCamera.EnableCameraInput(false);
        ContinueDialogue();
    }

    private void BindExternalFunctions(InteractableBase source)
    {
        currentStory.BindExternalFunction("PlaySound", (string soundName) =>
        {
            AudioManager.instance.PlaySFX(dialogueSounds[soundName], 0.95f, 1.05f);
        });
        currentStory.BindExternalFunction("GetItem", (string itemName) =>
        {
            InventoryItem item = GameplayCore.instance.InventoryManager.GetItemByName(itemName);
            GameplayCore.instance.InventoryManager.AddItem(item);
        });
        currentStory.BindExternalFunction("ShowEvidenceMenu", () =>
        {
            EndDialogue();
            UIManager.instance.ShowEvidenceMenu(currentNPC);
        });
        currentStory.BindExternalFunction("SetItalic", (bool italic) =>
        {
            dialogueText.fontStyle = italic switch
            {
                true => FontStyles.Italic,
                false => FontStyles.Normal
            };
        });
        currentStory.BindExternalFunction("GetMindset", (string mindsetName) =>
        {
            GameplayCore.instance.MindsetManager.UnlockMindsetByName(mindsetName);
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
            dialoguePortraitImage.gameObject.SetActive(true);
            npcPortraitImage.gameObject.SetActive(false);
            dialoguePortraitImage.texture = jessicaPortraits[emotion];
        });
        currentStory.BindExternalFunction("SetNpcPortrait", (string npc) =>
        {
            dialoguePortraitImage.gameObject.SetActive(false);
            npcPortraitImage.gameObject.SetActive(true);
            npcPortraitImage.texture = npcPortraits[npc];
        });
        currentStory.BindExternalFunction("StartPasswordPuzzle", () =>
        {
            EndDialogue();
            PuzzleManager.instance.StartPuzzle(PuzzleManager.PuzzleType.ComputerPassword);
        });
        currentStory.BindExternalFunction("FadeBlackScreen", (bool fadeIn) =>
        {
            GameCore.instance.FadeBlackScreen(fadeIn ? 1f : 0f);
        });
        currentStory.BindExternalFunction("LoadLevel", (string level) =>
        {
            EndDialogue();
            GameplayCore.instance.ChangeLevel(level);
        });
        currentStory.BindExternalFunction("ChangePerspective", (string perspective) =>
        {
            switch (perspective.ToUpper())
            {
                case "THIRD":
                    Player.instance.PlayerCamera.ChangePerspective(CameraType.ThirdPerson);
                    break;
                case "FIRST":
                    Player.instance.PlayerCamera.ChangePerspective(CameraType.FirstPerson);
                    break;
            }
        });
        currentStory.BindExternalFunction("Quit", () =>
        {
            Application.Quit();
            WindowsMessageBox.Show("A Lenda de Bigsmall\n\nDizem que, antes de haver medida, antes de existir grande ou pequeno, o mundo era um vazio uniforme, onde nada se destacava de nada. Nesse espaço sem contrastes vivia apenas o Aprimetrón, um ser que buscava dar forma ao caos criando diferenças. Ele moldou montanhas e vales, mares e rochedos… até perceber que nada teria sentido se tudo fosse igual em importância.\n\nEntão, em uma tentativa de criar o primeiro contraste, o Aprimetrón concentrou toda a sua energia em um único ponto e proclamou:\n\n“Que surja o maior dos grandes!”\n\nO ponto explodiu em luz, dando origem ao colosso: Big, um titã de proporções inimagináveis. Cada passo seu criava continentes; sua sombra, sozinha, era suficiente para ocultar estrelas inteiras.\n\nMas o equilíbrio ainda faltava. O mundo pendeu, a escala se quebrou. Então o Aprimetrón soprou a última parcela de sua energia no outro extremo do vazio e anunciou:\n\n“Que exista o menor dos pequenos!”\n\nDa poeira cósmica nasceu Small, minúsculo a ponto de conseguir nadar entre partículas de luz, mas tão poderoso quanto Big, pois era capaz de alterar tudo o que tocava em nível microscópico — do interior de um átomo ao coração de um ser vivo.\n\nPor eras, Big e Small vagaram separados, moldando o universo de maneiras opostas:\nBig criava galáxias; Small criava as leis que regiam cada uma delas.\n\nAté que um dia se encontraram.\n\nQuando o Maior e o Menor compartilharam o mesmo espaço, houve um choque que não destruiu o universo — ao contrário, deu-lhe equilíbrio. Da união de suas energias surgiu um novo ser, singular e paradoxal:\n\nBigsmall\n\nUm guardião capaz de alternar entre o vasto e o minúsculo, entre a força esmagadora e a delicadeza absoluta. O primeiro ser verdadeiramente consciente da importância de ambos os extremos.\n\nBigsmall jurou preservar o equilíbrio do cosmos:\n– Se uma criatura cresce poder demais, Bigsmall encolhe sua influência.\n– Se algo pequeno demais se perde na insignificância, Bigsmall amplia sua existência.\n\nPor isso, culturas antigas o representam metade gigante, metade minúsculo, e dizem que ele aparece sempre que o mundo inclina para um dos extremos.\n\nE assim, Bigsmall foi criado — não como um deus, mas como o próprio conceito de equilíbrio encarnado.");
        });
        currentStory.BindExternalFunction("CheckMindsetUnlocked", (string mindset) =>
        {
            currentStory.variablesState["hasMindset"] = GameplayCore.instance.MindsetManager.HasMindset(mindset);
        });
        currentStory.BindExternalFunction("CheckPetshopEvidences", () =>
        {
            var items = new List<InventoryItem>()
            {
                InventoryManager.instance.GetItemByName("CachorroIdeal"),
                InventoryManager.instance.GetItemByName("PomboIndesejavel"),
                InventoryManager.instance.GetItemByName("FotoEmbarque"),
                InventoryManager.instance.GetItemByName("DepoimentoFuncionario"),
                InventoryManager.instance.GetItemByName("DepoimentoFuncionario2"),
            };
            if (!InventoryManager.instance.HasItems(items.ToArray())) return;
            
            EndDialogue();
            StartDialogue(petshopEndDialogue.GetLocalizedDialogue());
        });
        currentStory.BindExternalFunction("EndGame", () =>
        {
            GameCore.instance.ReturnToMenu();
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
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
        ContinueDialogue();
    }

    private void EndDialogue()
    {
        InputManager.instance.ChangeMap("Gameplay");
        isPlayingDialogue = false;
        StopAllCoroutines();
        currentStory = null;
        dialogueText.text = string.Empty;
        DisableAllChoices();
        dialogueUI.SetActive(false);
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
        Player.instance.PlayerCamera.EnableCameraInput(true);
        OnDialogueEnd?.Invoke();
    }

    private IEnumerator TypeText(string text)
    {
        dialogueText.text = string.Empty;
        char[] chars = text.ToCharArray();
        for (int i = 0; i < chars.Length; i++)
        {
            dialogueText.text += chars[i];
            AudioManager.instance.PlaySFX(blipSound, 0.95f, 1.05f);
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
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;
        ShowChoices();
        return true;
    }
}

public static class WindowsMessageBox
{
    [DllImport("user32.dll", CharSet = CharSet.Unicode)]
    private static extern int MessageBox(IntPtr hWnd, string text, string caption, uint type);

    // type reference:
    // 0x00000001 = OK/Cancel
    // 0x00000004 = Yes/No
    // 0x00000030 = Icon Question
    // combine with | (OR)
    public static int Show(string text, string caption = "Message")
    {
        return MessageBox(IntPtr.Zero, text, caption, 0x00000030); //0x00000001 | 0x00000030
    }
}