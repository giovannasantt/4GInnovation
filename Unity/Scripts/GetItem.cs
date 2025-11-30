using UnityEngine;
using UnityEngine.Events;

public class GetItem : MonoBehaviour
{
    [SerializeField] private InventoryItem item;
    public UnityEvent onGet;
    public void GetEvidence()
    {
        InventoryManager.instance.AddItem(item);
        onGet?.Invoke();
    }
}