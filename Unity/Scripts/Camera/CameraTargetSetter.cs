using System;
using Unity.Cinemachine;
using UnityEngine;

public class CameraTargetSetter : MonoBehaviour
{
    [SerializeField] private bool setToOrientation;
    private Transform target => setToOrientation ? Player.instance.Orientation : Player.instance.transform;
    
    private void OnEnable() => GetComponent<CinemachineCamera>().Target.TrackingTarget = target;
}
