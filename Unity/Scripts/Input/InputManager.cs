using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using System;
using System.Linq;
using UnityEngine.InputSystem;
using UnityEngine.Serialization;

public class InputManager : Singleton<InputManager>
{
    private PlayerInput input;

    private GameObject lastSelectedGameObject;
    private GameObject currentSelectedGameObject;
    public override void Awake()
    {
        base.Awake();
        input = GetComponent<PlayerInput>();
        foreach (var action in input.actions.actionMaps.Where(action => action.name != "Gameplay"))
        {
            action.Disable();
        }
    }

    public void EnableAllInput(bool active)
    {
        foreach (var map in input.actions.actionMaps)
            switch (active)
            {
                case true:
                    map.Enable();
                    break;
                case false:
                    map.Disable();
                    break;
            }
    }
    
    public void EnableInput(bool enabled)
    {
        switch (enabled)
        {
            case true:
                input.currentActionMap.Enable();
                break;
            case false:
                input.currentActionMap.Disable();
                break;
        }
    } 

    public void ChangeMap(string mapName)
    {
        input.SwitchCurrentActionMap(mapName);
    }

    public Vector2 GetAxis(string axisName, bool normalized = false)
    {
        var value = input.actions[axisName].ReadValue<Vector2>();
        return normalized ? value.normalized : value;
    }

    public bool GetActionDown(string actionName)
    {
        return input.actions[actionName].WasPressedThisFrame();
    }

    public bool GetAction(string actionName)
    {
        return input.actions[actionName].IsPressed();
    }

    public bool GetActionUp(string actionName)
    {
        return input.actions[actionName].WasReleasedThisFrame();
    }

    public void CheckPointerExit()
    {
        if (EventSystem.current.currentSelectedGameObject == currentSelectedGameObject) return;
        
        lastSelectedGameObject = currentSelectedGameObject;
        currentSelectedGameObject = EventSystem.current.currentSelectedGameObject;
    }
}