using UnityEngine;

public class LevelLoader : MonoBehaviour
{
    [SerializeField] private string sceneName;
    [SerializeField] private bool blockCollision = false;
    
    private void OnTriggerEnter(Collider other)
    {
        if (!other.TryGetComponent(out Player player) || blockCollision) return;
        LoadLevel();
    }

    public void LoadLevel()
    {
        GameplayCore.instance.ChangeLevel(sceneName);
        Player.instance.PlayerFSM.ChangeState(PlayerStateType.Normal);
    }
}