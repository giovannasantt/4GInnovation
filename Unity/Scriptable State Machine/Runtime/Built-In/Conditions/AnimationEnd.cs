using UnityEngine;

namespace MicheliniDev.ScriptableStateMachine
{
    [FsmDropdownItem("Animation End", "Animation")]
    public class AnimationEnd : FsmCondition
    {
        public override bool Evaluate(StateMachineManager manager)
        {
            var anim = manager.GetOrCacheComponent<Animator>("Animator");
            return anim && anim.GetCurrentAnimatorStateInfo(0).normalizedTime >= 1f;
        }
    }   
}