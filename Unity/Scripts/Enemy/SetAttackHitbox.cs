using UnityEngine;

namespace MicheliniDev.ScriptableStateMachine
{
    public class SetAttackHitbox : OneShotBehavior
    {
        [SerializeField] private bool active;
        public override void Execute(StateMachineManager manager)
        {
            manager.GetOrCacheComponent<DamageDealer>("DAMAGE_DEALER").gameObject.SetActive(active);
        }
    }
}