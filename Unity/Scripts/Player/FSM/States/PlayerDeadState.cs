using UnityEngine;

public class PlayerDeadState : PlayerBaseState
{
    public override PlayerStateType GetStateType()
    {
        return PlayerStateType.Dead;
    }
    
    public override void EnterState()
    {
        transform.parent.GetComponentInChildren<MeshRenderer>().material.color = Color.black;
        GameplayCore.instance.Die();
    }

    public override void UpdateState()
    {
        
    }
    public override void ExitState()
    {
    }
}
