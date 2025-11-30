using UnityEngine;

namespace MicheliniDev.ScriptableStateMachine
{
    [FsmDropdownItem("Collides With Tag", "Physics/Collision")]
    public class CollidedWithTag : CollisionConditionBase
    {
        [SerializeField] private string tag;

        protected override bool OnEvaluate(GameObject hitObject)
        {
            return hitObject.CompareTag(tag);
        }
    }
}