using System.Collections.Generic;
using UnityEngine;

public class PlayerStateMachine : StateMachine<PlayerStateType, PlayerBaseState>
{
    public void InvestigateStateChecks()
    {
        if (InputManager.instance.GetActionDown("Investigate"))
        {
            ChangeState(PlayerStateType.Investigating);
        }
    }
    
    public void BrainstormStateChecks()
    {
        if (InputManager.instance.GetActionDown("EnterMindset"))
        {
            ChangeState(PlayerStateType.Brainstorm);
        }
    }

    public void ChangeToDeathState()
    {
        ChangeState(PlayerStateType.Dead);
    }
}
