using UnityEngine;

namespace MicheliniDev.ScriptableStateMachine
{
    [System.Serializable]
    public class PatrolBehavior : StateBehavior
    {
        public float moveSpeed = 3.5f;
        public float stopDistance = 1.0f;

        public override void OnEnter(StateMachineManager manager)
        {
            var controller = manager.GetOrCacheComponent<EnemyController>("EnemyController");
            if (!controller || controller.patrolPoints.Length == 0) return;

            controller.Agent.speed = moveSpeed;
            controller.Agent.isStopped = false;
            
            if (!manager.StateData.ContainsKey("PatrolIndex"))
            {
                manager.StateData["PatrolIndex"] = 0;
            }

            SetDestinationToCurrentIndex(controller, manager);
        }

        public override void OnUpdate(StateMachineManager manager)
        {
            var controller = manager.GetOrCacheComponent<EnemyController>("EnemyController");
            if (!controller || !controller.Agent.hasPath) return;

            if (controller.Agent.remainingDistance <= stopDistance)
            {
                int index = (int)manager.StateData["PatrolIndex"];
                index = (index + 1) % controller.patrolPoints.Length;
                manager.StateData["PatrolIndex"] = index;

                SetDestinationToCurrentIndex(controller, manager);
            }
        }

        private void SetDestinationToCurrentIndex(EnemyController controller, StateMachineManager manager)
        {
            int index = (int)manager.StateData["PatrolIndex"];
            controller.Agent.SetDestination(controller.patrolPoints[index].position);
        }

        public override void OnFixedUpdate(StateMachineManager manager) { }
        public override void OnExit(StateMachineManager manager) 
        {
             var controller = manager.GetOrCacheComponent<EnemyController>("EnemyController");
             if(controller) 
                 controller.Agent.isStopped = true;
        }
    }
}