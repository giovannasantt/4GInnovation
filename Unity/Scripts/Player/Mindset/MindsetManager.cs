using UnityEngine;
using System;
using System.Collections.Generic;
using UnityEngine.Serialization;

public class MindsetManager : MonoBehaviour
{
    [SerializeField] private List<MindsetData> startingMindsets;
    
    [FormerlySerializedAs("factory")] 
    public MindsetFactory Factory;
    public MindsetUIController MindsetUIController => GameplayCore.instance.MindsetUIController;

    private Dictionary<string, MindsetData> allMindsets = new();
    private Dictionary<MindsetData, MindsetObject> activeMindsets = new();
    
    public event Action<MindsetData> OnMindsetUnlocked;
    public static event Action OnMindsetUnlockFail;
    private void Start()
    {
        foreach (var mindset in Resources.FindObjectsOfTypeAll<MindsetData>())
        {
            allMindsets.Add(mindset.name, mindset);
        }
        
        foreach (var so in startingMindsets)
        {
            SpawnMindset(so);
        }
    }

    public void TryConnect(MindsetData a, MindsetData b)
    {
        if (a.ObjectToLink == b)
            Unlock(a.ObjectFormedUponConnection);
        else if (b.ObjectToLink == a)
            Unlock(b.ObjectFormedUponConnection);
        else
            OnMindsetUnlockFail?.Invoke();
    }

    private void Unlock(MindsetData so)
    {
        if (!so || activeMindsets.ContainsKey(so)) return;
        SpawnMindset(so);
        OnMindsetUnlocked?.Invoke(so);
    }

    public void SpawnMindset(MindsetData data)
    { 
        var mobject = Factory.CreateMindset(data);
        activeMindsets.Add(data, mobject);
    }

    public void GetMindsetByName(string mindsetName)
    {
        var mindset = allMindsets[mindsetName];
        SpawnMindset(mindset);
        UIManager.instance.ShowItemGainedUI((IUIDataSettable)mindset);
    }
    
    public Dictionary<MindsetData, MindsetObject> GetMindsets() => activeMindsets;
}
