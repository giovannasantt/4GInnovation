using System.Collections;
using UnityEngine;

public class EnemyQuestioningState : EnemyBaseState
{
    public override EnemyStateType GetStateType() => EnemyStateType.Questioning;

    private bool canReduceAlert;
    private float alertReduceModifier = 20f;
    public GameObject lastDistraction;
    public override void EnterState()
    {
        fsm.CanMoveByPatrol = false;
        canReduceAlert = false;
        StartCoroutine(WaitBeforeReducingAlert(3f));
    }

    // ReSharper disable Unity.PerformanceAnalysis
    public override void UpdateState()
    {
        ReduceAlertChecks();
        CheckDistraction();
    }

    private void CheckDistraction()
    {
        if (!lastDistraction) return;
        Vector3 distance = lastDistraction.transform.position - fsm.transform.position;
        Vector3 direction = distance.normalized;
        if (distance.magnitude > 1f)
        {
            fsm.rb.linearVelocity = fsm.QuestionStateSpeed * direction;
            fsm.transform.rotation = Quaternion.LookRotation(fsm.rb.linearVelocity);
        }
    }
    
    public override void ExitState()
    {
        canReduceAlert = false;
    }

    private void ReduceAlertChecks()
    {
        if (!canReduceAlert) return;
        fsm.alertMeter -= Time.deltaTime * alertReduceModifier;
        if (fsm.alertMeter <= 0f)
        {
            fsm.ChangeState(EnemyStateType.Normal);
        }
    }

    private IEnumerator WaitBeforeReducingAlert(float seconds)
    {
        yield return new WaitForSeconds(seconds);
        canReduceAlert = true;
    }
}