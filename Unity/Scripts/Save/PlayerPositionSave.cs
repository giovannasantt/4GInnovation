using UnityEngine;
using System.IO;

public class PlayerPositionSave : MonoBehaviour, ISaveable
{
    public void Save()
    {
        SaveManager.instance.PlayerPosition = Player.instance.transform.position;
    }

    public void Load()
    {
        Vector3 position = JsonUtility.FromJson<Vector3>(File.ReadAllText(GameCore.instance.SaveManager.SavePath));
        position.y += 1.1f;
        GameplayCore.instance.Player.transform.position = position;
    }
}