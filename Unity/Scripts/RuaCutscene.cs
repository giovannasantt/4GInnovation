using System;
using UnityEngine;

public class RuaCutscene : MonoBehaviour
{
    private void OnEnable()
    {
        GameCore.instance.SpawnGameplayCore();
        Invoke(nameof(LoadLevel), .25f);
    }
    
    private void LoadLevel() => GetComponent<LevelLoader>().LoadLevel();
}