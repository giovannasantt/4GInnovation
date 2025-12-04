using UnityEngine;

[RequireComponent(typeof(AudioSource))]
public class SFXHolder : MonoBehaviour
{
    [SerializeField] private AudioClip[] sfxs;
    private AudioSource source;
    public float minPitch = 1f;
    public float maxPitch = 1f;

    public bool playOnEnable = true;
    private void Awake()
    {
        source = GetComponent<AudioSource>();
    }

    private void Reset()
    {
        GetComponent<AudioSource>().playOnAwake = false;
    }

    private void OnEnable()
    {
        if (playOnEnable)
            PlaySound();      
    }

    public void PlaySound()
    {
        AudioManager.instance.PlayRandomSFX(sfxs, ref source, minPitch, maxPitch);
    }
}