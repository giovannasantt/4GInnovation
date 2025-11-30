using UnityEngine;

public class AmbienceHolder : MonoBehaviour
{
    [SerializeField] private LayeredMusic music;
    [SerializeField] private float playDelay;
    private void OnEnable()
    {
        AudioManager.instance.NotifyAmbience(music, playDelay);
    }
}
