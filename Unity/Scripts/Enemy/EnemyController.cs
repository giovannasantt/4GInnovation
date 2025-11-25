using UnityEngine;
using UnityEngine.AI;

    [RequireComponent(typeof(NavMeshAgent))]
    public class EnemyController : MonoBehaviour
    {
        [Header("Sensors")]
        public Transform eyeTransform; 
        public LayerMask viewMask; 
        public float viewDistance = 15f;
        public float fieldOfView = 90f;

        [Header("Patrol Data")]
        public Transform[] patrolPoints;
        
        [HideInInspector] 
        public NavMeshAgent Agent;
        
        [HideInInspector] 
        public Transform TargetPlayer; 

        private void Awake()
        {
            Agent = GetComponent<NavMeshAgent>();
            TargetPlayer = Player.instance.transform;
        }
    }
