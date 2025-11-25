using System;
using Unity.Cinemachine;
using UnityEngine;

public class NPCMovement : MonoBehaviour
{
    public Transform[] walkPoints;
    [SerializeField] private float speed = 2f;
    private Rigidbody rb;
    private Vector3[] playTimePoints;
    private Vector3 currentDestination;
    private int currentIndex;
    
    public bool CanMove = true;
    void Awake()
    {
        rb = GetComponent<Rigidbody>();

        playTimePoints = new Vector3[walkPoints.Length + 1];
        for (int i = 0; i < walkPoints.Length; i++)
        {
            playTimePoints[i] = walkPoints[i].transform.position;
        }

        playTimePoints[^1] = transform.position;
        ChoosePatrolPoint();
    }

    private void FixedUpdate()
    {
        if (!CanMove || playTimePoints.Length == 0) return;
        
        Vector3 direction = (currentDestination - transform.position).normalized;
        rb.linearVelocity = speed * direction;
        
        if (CheckDestinationReached())
            ChoosePatrolPoint();
    }

    private void ChoosePatrolPoint()
    {
        currentDestination = playTimePoints[currentIndex];
        if (currentIndex == playTimePoints.Length - 1)
        {
            currentIndex = 0;
            return;
        }
        currentIndex++;
    }

    private bool CheckDestinationReached()
    {
        return Vector3.Distance(transform.position, currentDestination) < 0.05f;
    }
}
