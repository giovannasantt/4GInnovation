using Ink.Parsed;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using UnityEngine;
using UnityEngine.InputSystem;

public class SaveManager : Singleton<SaveManager>
{
    public string SavePath => Application.persistentDataPath + "/save.save";

    private ISaveable[] saveables;

    private GameSaveData saveData;

    public Vector3 PlayerPosition;
    public List<string> Inventory;
    private void Update()
    {
        if (Keyboard.current.xKey.isPressed)
            Save();
        if (Keyboard.current.zKey.isPressed)
            Load();
    }

    public void Save()
    {
        saveables = FindObjectsByType(typeof(MonoBehaviour), FindObjectsSortMode.None).OfType<ISaveable>().ToArray();
        foreach (var salve in saveables)
        {
            salve?.Save();
        }
        saveData.PlayerPosition = PlayerPosition;
        saveData.Inventory = Inventory.ToArray();
        Debug.Log(saveData.Inventory[0]);
        File.WriteAllText(SavePath, JsonUtility.ToJson(saveData, true));
    }

    public void Load()
    {
        foreach (var salve in saveables)
        {
            salve?.Load();
        }
    }

    private struct GameSaveData
    {
        public Vector3 PlayerPosition;
        public string[] Inventory;
    }
}