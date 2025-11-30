using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Unity.VisualScripting;
using UnityEngine;

public class InventoryManager : Singleton<InventoryManager>, ISaveable
{
    private Dictionary<string, InventoryItem> inventoryItemCollection = new();
    [SerializeField] private List<InventoryItem> allItems;
    [SerializeField] private List<InventoryItem> defaultUnlockedItems;
    
    private List<InventoryItem> inventory = new();
    public override void Awake()
    {
        base.Awake();
        StoreAllItems();
        foreach (var item in defaultUnlockedItems)
        {
            inventory.Add(item);
        }
    }

    private void StoreAllItems()
    {
        foreach (var item in allItems)
        {
            inventoryItemCollection.Add(item.name, item);
        }
    }

    public bool HasItems(InventoryItem[] items)
    {
        for (int i = 0; i < items.Length; i++)
        {
            if (!inventory.Contains(items[i]))
            {
                return false;
            }
        }
        return true;
    }

    public void AddItem(InventoryItem item)
    {
        if (!inventory.Contains(item))
        {
            inventory.Add(item);
            UIManager.instance.ShowItemGainedUI((IUIDataSettable)item);
        }
    }

    public void RemoveItem(InventoryItem item)
    {
        if (inventory.Contains(item)) 
        {
            inventory.Remove(item);
        }    
    }
    
    public InventoryItem GetItemByName(string name) => inventoryItemCollection[name];
    
    public List<InventoryItem> GetInventory() => inventory;
    
    #region Saving
    public void Save()
    {
        List<string> items = new();
        foreach (var item in inventory)
        {
            items.Add(item.name);
        }

        SaveManager.instance.Inventory = items;
    }

    public void Load()
    {
        inventory.Clear();
        var savedInventory = JsonUtility.FromJson<List<string>>(File.ReadAllText(SaveManager.instance.SavePath));
        foreach (string item in savedInventory)
        {
            inventory.Add(GetItemByName(item));
        }
    }
    #endregion
}
