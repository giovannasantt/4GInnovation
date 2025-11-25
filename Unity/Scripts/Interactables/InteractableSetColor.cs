using System;
using UnityEngine;

public class InteractableSetColor : MonoBehaviour
{
    private readonly Color interactableColor = Color.yellow;
    private new Renderer renderer;
    private Color baseColor;
    void Awake()
    {
        renderer = GetComponent<Renderer>();
        baseColor = renderer.material.color;  
    }

    private void OnEnable()
    {
        PlayerInvestigatingState.OnPlayerInvestigating += SetInteractableColor;
        PlayerInvestigatingState.OnPlayerInvestigateLeave += SetBaseColor;
    }

    private void OnDisable()
    {
        PlayerInvestigatingState.OnPlayerInvestigating -= SetInteractableColor;
        PlayerInvestigatingState.OnPlayerInvestigateLeave -= SetBaseColor;
    }
    
    private void SetInteractableColor() => renderer.material.color = interactableColor;
    private void SetBaseColor() => renderer.material.color = baseColor;
}
