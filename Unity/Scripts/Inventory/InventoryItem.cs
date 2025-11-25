using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Serialization;

[CreateAssetMenu(fileName = "InventoryItem", menuName = "Scriptable Objects/InventoryItem")]
public class InventoryItem : ScriptableObject, IUIDataSettable
{
    [FormerlySerializedAs("Name")] 
    [SerializeField] private List<LocalizedString> itemName;
    [FormerlySerializedAs("Description")] 
    [SerializeField] private List<LocalizedString> itemDescription;
    public Sprite Icon;

    public List<LocalizedString> Name => itemName;
    public List<LocalizedString> Description => itemDescription;
}