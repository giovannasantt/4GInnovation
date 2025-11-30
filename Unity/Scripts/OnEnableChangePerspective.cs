using System;
using UnityEngine;

public class OnEnableChangePerspective : MonoBehaviour
{
    [SerializeField] private CameraType type;

    private void OnEnable()
    {
        Player.instance?.PlayerCamera?.ChangePerspective(type);
    }
}