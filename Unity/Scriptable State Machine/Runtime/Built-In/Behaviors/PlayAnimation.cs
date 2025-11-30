using System;
using UnityEngine;

namespace MicheliniDev.ScriptableStateMachine
{
    [FsmDropdownItem("Play Animation", "Animation")]
    public class PlayAnimation : OneShotBehavior
    {
        [SerializeField] private string animationName;
        [SerializeField] private int animatorLayerNumber = 0;
        [SerializeField] private float normalizedTime = 0f;
        public override void Execute(StateMachineManager manager)
        {
            var anim = manager.GetOrCacheComponent<Animator>("Animator");
            anim.Play(animationName, animatorLayerNumber, normalizedTime);
        }
    }
}