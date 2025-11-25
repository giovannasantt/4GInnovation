using UnityEngine;

public class AmbienceHolder : MonoBehaviour
{
    [SerializeField] private AudioClip ambience;
    [SerializeField] private float playDelay;
    private void OnEnable()
    {
        AudioManager.instance.NotifyAmbience(ambience, playDelay);
    }
}
