using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class MindsetUIController : MonoBehaviour
{
    [SerializeField] private List<MindsetObject> uiMindsets = new();
    private MindsetManager manager => GameplayCore.instance.MindsetManager;

    private MindsetObject firstSelection;
    
    public void Select(MindsetObject selected)
    {
        if (!firstSelection)    
        {
            firstSelection = selected;
            return;
        }

        manager.TryConnect(firstSelection.Data, selected.Data);
        firstSelection = null;
    }
    
    private void OnEnable()
    {
        manager.OnMindsetUnlocked += OnUnlocked;
    }

    private void OnDisable()
    {
        manager.OnMindsetUnlocked -= OnUnlocked;
    }

    private void OnUnlocked(MindsetData data)
    {
        var ui = uiMindsets.FirstOrDefault(m => m.Data == data);
        if (ui) 
            ui.gameObject.SetActive(true);
    }
}
