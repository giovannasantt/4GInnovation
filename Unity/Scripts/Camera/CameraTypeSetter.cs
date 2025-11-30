using System;
using Unity.Cinemachine;
using Unity.VisualScripting;
using UnityEngine;

[DefaultExecutionOrder(-10)]
public class CameraTypeSetter : MonoBehaviour
{
    [SerializeField] private CameraType cameraType;
    private CinemachineCamera cmCamera;
    private void OnEnable()
    {
        cmCamera = GetComponent<CinemachineCamera>();
        Player.instance.PlayerCamera.CameraCollection[cameraType] = cmCamera;
    }
}
