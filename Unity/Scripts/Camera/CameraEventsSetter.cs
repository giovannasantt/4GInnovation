using System;
using Unity.Cinemachine;
using UnityEngine;

public class CameraEventsSetter : MonoBehaviour
{
    private CinemachineCameraEvents events;

    private void Awake()
    {
        if (!TryGetComponent<CinemachineCameraEvents>(out events))
        {
            events = gameObject.AddComponent<CinemachineCameraEvents>();
        }
    }

    private void OnEnable() => Player.instance?.PlayerCamera.SetCameraEvents(events);   
    private void OnDisable() => Player.instance?.PlayerCamera.RemoveCameraEvents();   
}
