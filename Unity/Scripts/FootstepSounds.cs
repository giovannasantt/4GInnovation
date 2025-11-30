using UnityEngine;

public class FootstepSounds : MonoBehaviour
{
    [SerializeField] private AudioClip sfx;

    public void PlaySFX()
    {
        AudioManager.instance.PlaySFX(sfx, 1f, 1f);
    }
}