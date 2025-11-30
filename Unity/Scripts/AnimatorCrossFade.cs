using MicheliniDev.ScriptableStateMachine;
using UnityEngine;

namespace DefaultNamespace
{
    public class AnimatorCrossFade : OneShotBehavior
    {
        [SerializeField] private string animationName;
        public override void Execute(StateMachineManager manager)
        {
            manager.GetOrCacheComponent<Animator>("ANIMATOR").CrossFade(animationName, 0.15f);
        }
    }
}