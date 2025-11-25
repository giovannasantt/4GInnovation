using UnityEngine;

[RequireComponent(typeof(AudioSource))]
public class SFXHolder : MonoBehaviour
{
    [SerializeField] private AudioClip[] sfxs;
    private AudioSource source;
    public float minPitch = 1f;
    public float maxPitch = 1f;
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
        AudioManager.instance.PlayRandomSFX(sfxs, ref source, minPitch, maxPitch);
    }
}