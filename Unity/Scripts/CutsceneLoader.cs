using UnityEngine;

public class CutsceneLoader : MonoBehaviour
{
    private void OnEnable()
    {
        Invoke(nameof(LoadLevel), .25f);
    }
    
    private void LoadLevel() => GetComponent<LevelLoader>().LoadLevel();
}