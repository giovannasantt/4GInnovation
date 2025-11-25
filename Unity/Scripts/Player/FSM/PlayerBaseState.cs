using UnityEngine;

public abstract class PlayerBaseState : State<PlayerStateType>
{
    protected PlayerStateMachine fsm => GameplayCore.instance.Player.PlayerFSM;
    protected Player player => GameplayCore.instance.Player;
    protected bool CanMove
    {
        get
        {
            return GameplayCore.instance.Player.Movement.CanMove;
        }
        set
        {
            GameplayCore.instance.Player.Movement.CanMove = value;
        }
    }
}
