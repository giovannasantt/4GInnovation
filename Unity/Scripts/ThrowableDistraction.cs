using System;
using Unity.VisualScripting;
using UnityEngine;

public class ThrowableDistraction : MonoBehaviour
{
    [SerializeField] private float radius = 2f;
    private void OnCollisionEnter(Collision other)
    {
        CheckEnemyOverlap();
    }

    private void CheckEnemyOverlap()
    {
        Collider[] colliders = Physics.OverlapSphere(transform.position, radius, 1 << LayerMask.NameToLayer("Enemies"));
        if (colliders.Length == 0) return;

        foreach (Collider col in colliders)
        {
            Vector3 closestPoint = col.ClosestPoint(transform.position);
            float distance = Vector3.Distance(transform.position, closestPoint);

            float alertLevel = 100 - distance;
            Mathf.Clamp(alertLevel, 0f, 99f);
            var fsm = col.GetComponent<EnemyStateMachine>();
            fsm.ChangeToQuestioningState(alertLevel, gameObject);
        }
    }

    private void OnDrawGizmosSelected()
    {
        Gizmos.color = Color.red;
        Gizmos.DrawWireSphere(transform.position, radius);
    }
}