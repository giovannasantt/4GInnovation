using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Serialization;

[CreateAssetMenu(fileName = "MindsetData", menuName = "Scriptable Objects/MindsetData")]
public class MindsetData : ScriptableObject, IUIDataSettable
{
    [FormerlySerializedAs("Name")] 
    [SerializeField] private List<LocalizedString> mindsetName;
    [FormerlySerializedAs("Description")] 
    [SerializeField] private List<LocalizedString> mindsetDescription;
    
    public MindsetData ObjectToLink;
    public MindsetData ObjectFormedUponConnection;
    
    public List<LocalizedString> Name => mindsetName;
    public List<LocalizedString> Description => mindsetDescription;
}
