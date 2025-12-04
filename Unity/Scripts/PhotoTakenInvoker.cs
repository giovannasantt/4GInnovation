using System;
using UnityEngine;
using UnityEngine.Events;

public class PhotoTakenInvoker : MonoBehaviour
{
    public UnityEvent OnPhotoTaken;
    private void OnEnable()
    {
        PlayerTakingPhotoState.OnPhotoTaken += () => OnPhotoTaken?.Invoke();
    }
}