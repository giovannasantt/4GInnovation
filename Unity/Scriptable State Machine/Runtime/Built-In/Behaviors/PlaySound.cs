using UnityEngine;

namespace MicheliniDev.ScriptableStateMachine
{
    [FsmDropdownItem("Play Sound", "Sound")]
    public class PlaySound : OneShotBehavior
    {
        [SerializeField] private AudioClip clip;
        [SerializeField] private float minPitch = 1f;
        [SerializeField] private float maxPitch = 1f;
        public override void Execute(StateMachineManager manager)
        {
            var source = manager.GetOrCacheComponent<AudioSource>("AudioSource");
            source.clip = clip;
            source.pitch = Random.Range(minPitch, maxPitch);
            source.Play();
        }
    }
}