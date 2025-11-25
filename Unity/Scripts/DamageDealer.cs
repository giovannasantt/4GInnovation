using System;
using UnityEngine;

[RequireComponent(typeof(Collider))]
public class DamageDealer : MonoBehaviour
{
    [SerializeField] private int damageAmount;
    private void OnTriggerEnter(Collider other)
    {
        if (other.TryGetComponent<Health>(out var receiver))
        {
            receiver?.LoseHealth(damageAmount);
        }
    }
}