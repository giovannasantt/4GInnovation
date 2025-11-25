using System;
using Unity.Cinemachine;
using UnityEngine;

public class InteractableBase : MonoBehaviour, IInteractable
{
    public void Interact() => OnInteract();
    protected virtual void OnInteract() {}
}
