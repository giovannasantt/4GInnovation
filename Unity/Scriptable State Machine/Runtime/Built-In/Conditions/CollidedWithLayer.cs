using UnityEngine;

namespace MicheliniDev.ScriptableStateMachine
{
    [FsmDropdownItem("Collides With Layer", "Physics/Collision")]
    public class CollidedWithLayer : CollisionConditionBase
    {
        [SerializeField] private LayerMask layerMask;

        protected override bool OnEvaluate(GameObject hitObject)
        {
            return (layerMask.value & (1 << hitObject.layer)) > 0;
        }
    }
}