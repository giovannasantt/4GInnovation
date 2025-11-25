using UnityEngine;

namespace MicheliniDev.ScriptableStateMachine
{
    public class CanSeePlayerCondition : FsmCondition
    {
        public override bool Evaluate(StateMachineManager manager)
        {
            var controller = manager.GetOrCacheComponent<EnemyController>("EnemyController");
            if (!controller || !controller.TargetPlayer) return false;

            Transform target = controller.TargetPlayer;
            Transform eyes = controller.eyeTransform ? controller.eyeTransform : manager.transform;

            Vector3 directionToTarget = (target.position - eyes.position);
            float distance = directionToTarget.magnitude;
            
            Color rayColor = Color.red; 

            if (distance > controller.viewDistance) 
            {
                Debug.DrawRay(eyes.position, directionToTarget.normalized * controller.viewDistance, Color.red);
                return false;
            }

            if (Vector3.Angle(eyes.forward, directionToTarget) > controller.fieldOfView / 2) 
            {
                Debug.DrawRay(eyes.position, directionToTarget.normalized * distance, Color.yellow);
                return false;
            }

            if (Physics.Raycast(eyes.position, directionToTarget.normalized, out RaycastHit hit, controller.viewDistance, controller.viewMask))
            {
                if (hit.transform != target)
                {
                    rayColor = Color.red; 
                    Debug.DrawRay(eyes.position, directionToTarget.normalized * hit.distance, rayColor);
                    return false; 
                }
                
                rayColor = Color.green; 
                Debug.DrawRay(eyes.position, directionToTarget, rayColor);
                return true; 
            }

            Debug.DrawRay(eyes.position, directionToTarget.normalized * controller.viewDistance, Color.magenta);
            return false; 
        }
    }
}