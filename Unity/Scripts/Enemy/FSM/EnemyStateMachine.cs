using System;
using UnityEngine;

public class EnemyStateMachine : StateMachine<EnemyStateType, EnemyBaseState>
{
    private NPCMovement movement;
    private Health health;
    private PlayerSensor playerSensor;
    public Rigidbody rb;

    [Range(0f, 100f)] 
    public float alertMeter;

    public float QuestionStateSpeed = 2f;
    public bool CanMoveByPatrol
    {
        get => movement.CanMove;
        set => movement.CanMove = value;
    }

    private void Awake()
    {
        rb = GetComponent<Rigidbody>();
        movement = GetComponent<NPCMovement>();
        health = GetComponentInChildren<Health>();
        playerSensor = GetComponentInChildren<PlayerSensor>();
    }

    public void AlertedStateChecks()
    {
        if (playerSensor.PlayerInRange) 
            ChangeState(EnemyStateType.Alerted);
    }

    public void ChangeToQuestioningState(float alertLevel = 50f, GameObject gameObject = null)
    {
        alertMeter = alertLevel;
        var state = GetState<EnemyQuestioningState>(EnemyStateType.Questioning);
        state.lastDistraction = gameObject;
        ChangeState(EnemyStateType.Questioning);
    }
}
