using System;
using UnityEngine;

public class OnEnableChangeState : MonoBehaviour
{
    [SerializeField] private PlayerStateType state;
    private void OnEnable()
    {
        Player.instance.PlayerFSM.ChangeState(state);
    }
}