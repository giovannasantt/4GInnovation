using UnityEngine;

namespace MicheliniDev.ScriptableStateMachine
{
    public class EnablePatrol : OneShotBehavior
    {
        [SerializeField] private bool canMove;
        public override void Execute(StateMachineManager manager)
        {
            manager.GetOrCacheComponent<NPCMovement>("MOVEMENT").CanMove = canMove;
        }
    }
}