using System.Collections;
using UnityEngine;
using UnityEngine.UI;

public class AudioManager : Singleton<AudioManager>
{
    [Header("Audio Sources")]
    [SerializeField] private AudioSource ambienceSource;      
    [SerializeField] private AudioSource sfxSource;      
    [SerializeField] private AudioSource[] atmosphereSources;  
    
    [Header("Effects")]
    [SerializeField] private AudioLowPassFilter ambienceLowPass;

    [Header("Settings")]
    public float SFXVolume = 1f;
    public float AmbienceVolume = 1f;
    
    private LayeredMusic currentLayeredMusic; 
    
    #region SFX Logic
    public void PlaySFX(AudioClip clip, float minPitch, float maxPitch)
    {
        sfxSource.volume = SFXVolume;
        sfxSource.pitch = Random.Range(minPitch, maxPitch);
        sfxSource.PlayOneShot(clip);
    }
    
    public void PlayRandomSFX(AudioClip[] sfxArray, ref AudioSource source, float minPitch, float maxPitch)
    {
        if (sfxArray.Length == 0) return;

        var sound = sfxArray[Random.Range(0, sfxArray.Length)];
        source.volume = SFXVolume;
        source.clip = sound;
        source.pitch = Random.Range(minPitch, maxPitch);
        source.Play();
    }
    #endregion

    #region Muffling Logic (Low Pass)
    public void MuffleBGM(float muffleDuration)
    {
        if (ambienceSource.clip == null) return;
        StopCoroutine(nameof(SmoothMuffleBGM)); 
        StartCoroutine(SmoothMuffleBGM(muffleDuration));
    }

    public void UnmuffleBGM(float unmuffleduration)
    {
        if (ambienceSource.clip == null) return;
        StopCoroutine(nameof(SmoothUnmuffleBGM));
        StartCoroutine(SmoothUnmuffleBGM(unmuffleduration));
    }

    private IEnumerator SmoothMuffleBGM(float duration)
    {
        float startValue = ambienceLowPass.cutoffFrequency; 
        float targetValue = 400f;
        float elapsedTime = 0f;
        
        while (elapsedTime < duration)
        {
            elapsedTime += Time.unscaledDeltaTime;
            float lerpValue = elapsedTime / duration;
            ambienceLowPass.cutoffFrequency = Mathf.Lerp(startValue, targetValue, lerpValue);
            yield return null;
        }
        ambienceLowPass.cutoffFrequency = targetValue;
    }

    private IEnumerator SmoothUnmuffleBGM(float duration)
    {
        float startValue = ambienceLowPass.cutoffFrequency;
        float targetValue = 5000f;
        float elapsedTime = 0f;

        while (elapsedTime < duration)
        {
            elapsedTime += Time.unscaledDeltaTime;
            float lerpValue = elapsedTime / duration;
            ambienceLowPass.cutoffFrequency = Mathf.Lerp(startValue, targetValue, lerpValue);
            yield return null;
        }
        ambienceLowPass.cutoffFrequency = targetValue;
    }
    #endregion

    #region Ambience / Music Logic
    public void NotifyAmbience(AudioClip clip, float delayDuration)
    {
        currentLayeredMusic = null; 
        
        if (ambienceSource.clip == clip)
        {
            Debug.Log("Clip is already playing");
            return;
        }
        
        if (clip == null)
        {
            StartCoroutine(FadeOutAllAmbience(1f));
            return;
        }

        StartCoroutine(SwitchToSingleClip(clip, delayDuration));
    }

    public void NotifyAmbience(LayeredMusic musicSO, float delayDuration)
    {
        if (currentLayeredMusic == musicSO)
        {
            Debug.Log("Layered Music is already playing");
            return;
        }

        if (musicSO == null)
        {
            StartCoroutine(FadeOutAllAmbience(1f));
            currentLayeredMusic = null;
            return;
        }

        currentLayeredMusic = musicSO;
        StartCoroutine(SwitchToLayeredMusic(musicSO, delayDuration));
    }

    private IEnumerator FadeOutAllAmbience(float duration)
    {
        float startVolume = ambienceSource.volume;
        
        for (float t = 0f; t < duration; t += Time.deltaTime)
        {
            float newVol = Mathf.Lerp(startVolume, 0f, t / duration);
            
            ambienceSource.volume = newVol;
            foreach (var source in atmosphereSources)
            {
                if(source.isPlaying) source.volume = newVol;
            }
            yield return null;
        }

        ambienceSource.Stop();
        ambienceSource.clip = null;
        ambienceSource.volume = 0f;

        foreach (var source in atmosphereSources)
        {
            source.Stop();
            source.clip = null;
            source.volume = 0f;
        }
    }

    private IEnumerator SwitchToSingleClip(AudioClip clip, float duration)
    {
        yield return StartCoroutine(FadeOutAllAmbience(0.5f));

        ambienceSource.clip = clip;
        ambienceSource.volume = 0f;
        ambienceSource.Play();

        for (float t = 0f; t < duration; t += Time.deltaTime)
        {
            ambienceSource.volume = Mathf.Lerp(0f, AmbienceVolume, t / duration);
            yield return null;
        }
        ambienceSource.volume = AmbienceVolume;
    }

    private IEnumerator SwitchToLayeredMusic(LayeredMusic musicSO, float duration)
    {
        yield return StartCoroutine(FadeOutAllAmbience(0.5f));

        ambienceSource.clip = musicSO.music;
        ambienceSource.volume = 0f;
        ambienceSource.Play();

        int count = Mathf.Min(atmosphereSources.Length, musicSO.atmospheres.Length);

        for (int i = 0; i < count; i++)
        {
            atmosphereSources[i].clip = musicSO.atmospheres[i];
            atmosphereSources[i].volume = 0f;
            atmosphereSources[i].Play();
        }
        
        for (float t = 0f; t < duration; t += Time.deltaTime)
        {
            float newVol = Mathf.Lerp(0f, AmbienceVolume, t / duration);
            
            ambienceSource.volume = newVol;
            for (int i = 0; i < count; i++)
            {
                atmosphereSources[i].volume = newVol;
            }
            yield return null;
        }

        ambienceSource.volume = AmbienceVolume;
        for (int i = 0; i < count; i++)
        {
            atmosphereSources[i].volume = AmbienceVolume;
        }
    }
    #endregion

    #region Volume Control
    public void SetSoundVolume(Slider slider)
    {
        AmbienceVolume = slider.value;
        SFXVolume = slider.value; 
        
        if (ambienceSource.isPlaying)
            ambienceSource.volume = AmbienceVolume;

        foreach (var source in atmosphereSources)
        {
            if (source.isPlaying)
                source.volume = AmbienceVolume;
        }
    }
    #endregion
}