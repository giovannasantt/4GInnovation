using System;
using UnityEngine;

public class CaminhaoEvents : MonoBehaviour
{
    private void OnEnable()
    {
        DialogueManager.OnDialogueEnd += () =>
        {
            Player.instance.PlayerFSM.ChangeState(PlayerStateType.Investigating);
        };
    }
}