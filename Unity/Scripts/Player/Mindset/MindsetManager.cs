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

    [SerializeField] private SerializedDictionary<string, MindsetData> allMindsets = new();
    private Dictionary<MindsetData, MindsetObject> activeMindsets = new();
    
    public event Action<MindsetData> OnMindsetUnlocked;
    public static event Action OnMindsetUnlockFail;
    private void Start()
    {
        foreach (var so in startingMindsets)
        {
            SpawnMindset(so);
        }
    }

    public void TryConnect(MindsetData a, MindsetData b)
    {
        if (a.ObjectToLink == b)
        {
            Unlock(a.ObjectFormedUponConnection);
            Destroy(activeMindsets[a].gameObject);
            Destroy(activeMindsets[b].gameObject);
        }
        else if (b.ObjectToLink == a)
        {
            Unlock(b.ObjectFormedUponConnection);
            Destroy(activeMindsets[a].gameObject);
            Destroy(activeMindsets[b].gameObject);
        }
        else
            OnMindsetUnlockFail?.Invoke();
    }

    private void Unlock(MindsetData so)
    {
        if (!so || activeMindsets.ContainsKey(so)) return;
        SpawnMindset(so);
        OnMindsetUnlocked?.Invoke(so);
        UIManager.instance.ShowItemGainedUI((IUIDataSettable)so);
    }

    public void SpawnMindset(MindsetData data)
    { 
        var mobject = Factory.CreateMindset(data);
        activeMindsets.Add(data, mobject);
    }

    public bool HasMindset(string mindsetName)
    {
        return activeMindsets.ContainsKey(allMindsets[mindsetName]);
    }
    
    public void UnlockMindsetByName(string mindsetName)
    {
        Unlock(allMindsets[mindsetName]);
    }
    
    public Dictionary<MindsetData, MindsetObject> GetMindsets() => activeMindsets;
}
