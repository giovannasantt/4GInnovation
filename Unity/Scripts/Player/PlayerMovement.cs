using System;
using System.Collections.Generic;
using DG.Tweening;
using Unity.Cinemachine;
using UnityEngine;

public class PlayerMovement : MonoBehaviour
{
    [SerializeField] private float velocity;
    private Camera mainCamera => Camera.main;

    private Dictionary<MovementType, float> movementSpeedCollection;
    
    private Dictionary<MovementType, string> movementAnimations = new()
    {
        {MovementType.Normal, "Walk"},
        {MovementType.Crouched, "WalkCrouched"}
    };
    private Dictionary<MovementType, string> idleAnimations = new()
    {
        {MovementType.Normal, "Idle"},
        {MovementType.Crouched, "IdleCrouched"}
    };
    
    private Rigidbody rb;
    private Player player => Player.instance;
    private Vector2 moveAxis;
    private MovementType CurrentMovementType;
    private float currentSpeedType;
    
    public bool CanMove;
    void Awake()
    {
        rb = GetComponent<Rigidbody>();
        movementSpeedCollection = new Dictionary<MovementType, float>
        {
            {MovementType.Normal, velocity},
            {MovementType.Crouched, velocity / 2f}
        };
        CurrentMovementType = MovementType.Normal;
        currentSpeedType = movementSpeedCollection[CurrentMovementType];
    }

    void Update()
    {
        moveAxis = InputManager.instance.GetAxis("Move", true);
    }

    private void FixedUpdate()
    {
        DoMovement();
    }

    private void DoMovement()
    {
        if (!CanMove) return;
        Vector3 forward = mainCamera.transform.forward;
        forward.y = 0f;                 
        forward.Normalize();

        Vector3 right = mainCamera.transform.right;
        right.y = 0f;
        right.Normalize();

        Vector3 direction = forward * moveAxis.y + right * moveAxis.x;

        rb.linearVelocity = new Vector3(
            direction.x * currentSpeedType,
            rb.linearVelocity.y,
            direction.z * currentSpeedType
        );
        transform.rotation = Quaternion.Euler( 0, mainCamera.transform.eulerAngles.y, 0);
        CheckAnimation(direction);
    }

    private void CheckAnimation(Vector3 direction)
    {
        if (!player.Animator) return;
        
        player.Animator.SetBool("Walking", direction != Vector3.zero);
    }

    public void ChangeMovementType(MovementType type)
    {
        CurrentMovementType = type;
        currentSpeedType = movementSpeedCollection[CurrentMovementType];
    }

    public enum MovementType
    {
        Normal,
        Crouched
    }
}
