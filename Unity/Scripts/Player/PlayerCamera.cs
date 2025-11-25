using System;
using System.Collections.Generic;
using JetBrains.Annotations;
using Unity.Cinemachine;
using UnityEngine;
using UnityEngine.Serialization;

public class PlayerCamera : MonoBehaviour
{
    public Dictionary<CameraType, CinemachineCamera> CameraCollection = new();
    
    [FormerlySerializedAs("cameraAtual")]
    public CameraType currentCameraType = CameraType.ThirdPerson;
    
    private CinemachineCameraEvents events;
    private void Awake()
    {
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
    }
    
    public CinemachineCamera GetCurrentCamera() => CameraCollection[currentCameraType];
    
    public void SetCameraEvents(CinemachineCameraEvents events)
    {
        this.events = events;
        events.BlendCreatedEvent.AddListener(BlockInputOnBlend);
        events.BlendFinishedEvent.AddListener(EnableInputOnBlendEnd);   
    }
    
    public void RemoveCameraEvents()
    {
        events.BlendCreatedEvent.RemoveListener(BlockInputOnBlend);
        events.BlendFinishedEvent.RemoveListener(EnableInputOnBlendEnd);
    }

    public void EnableCameraInput(bool isEnable)
    {
        var axisController = CameraCollection[currentCameraType].GetComponent<CinemachineInputAxisController>();
        foreach (var axis in axisController.Controllers)
        {
            axis.Enabled = isEnable;
        }
    }
    
    private void EnableInputOnBlendEnd(ICinemachineMixer mixer, ICinemachineCamera camera)
    {
        if (currentCameraType == CameraType.FirstPerson)
        {
            var axisController = CameraCollection[currentCameraType].GetComponent<CinemachineInputAxisController>();
            foreach (var axis in axisController.Controllers)
            {
                axis.Enabled = true;
            }
        }
    }

    private void BlockInputOnBlend(CinemachineCore.BlendEventParams blendEventParams)
    {
        if (currentCameraType == CameraType.FirstPerson)
        {
            var axisController = CameraCollection[currentCameraType].GetComponent<CinemachineInputAxisController>();
            foreach (var axis in axisController.Controllers)
            {
                axis.Enabled = false;
            }
        }
    }
    
    public void ChangePerspective(CameraType cameraType)
    {
        CameraCollection[currentCameraType].Priority.Value = 0;
        currentCameraType = cameraType;
        CameraCollection[currentCameraType].Priority.Value = 1;
    }
}
