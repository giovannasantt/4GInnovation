using UnityEngine;

namespace MicheliniDev.ScriptableStateMachine
{
    public class ChaseBehavior : StateBehavior
    {
        [SerializeField] private float chaseSpeed = 6f;

        public override void OnEnter(StateMachineManager manager)
        {
            var controller = manager.GetOrCacheComponent<EnemyController>("EnemyController");
            if (controller)
            {
                controller.Agent.speed = chaseSpeed;
                controller.Agent.isStopped = false;
            }
        }

        public override void OnUpdate(StateMachineManager manager)
        {
            var controller = manager.GetOrCacheComponent<EnemyController>("EnemyController");
            if (controller && controller.TargetPlayer)
            {
                controller.Agent.SetDestination(controller.TargetPlayer.position);
            }
        }

        public override void OnFixedUpdate(StateMachineManager manager) { }
        public override void OnExit(StateMachineManager manager) { }
    }
}