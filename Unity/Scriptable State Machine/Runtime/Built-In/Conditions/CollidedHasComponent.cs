using UnityEngine;

namespace MicheliniDev.ScriptableStateMachine
{
    [FsmDropdownItem("Collides With Component", "Physics/Collision")]
    public class CollidedHasComponent : CollisionConditionBase
    {
        [Tooltip("The name of the component class, e.g., 'PlayerHealth'")]
        [SerializeField] private string componentName;

        protected override bool OnEvaluate(GameObject hitObject)
        {
            return hitObject.GetComponent(componentName);
        }
    }
}