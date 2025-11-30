using UnityEngine;

namespace MicheliniDev.ScriptableStateMachine
{ 
    [FsmDropdownItem("Set Rigidbody2D Velocity", "Physics")]
    public class SetRb2DVelocity : StateBehavior
    {
        [SerializeField] private Vector2 velocity;
        [SerializeField] private bool resetOnExit;
        [SerializeField] 
        [Tooltip("If enabled, will check the current scale (-1 = left, 1 = right) and set the vel0city according to it")]
        private bool followFacing = true;
    
        public override void OnEnter(StateMachineManager manager)
        {
        }

        public override void OnUpdate(StateMachineManager manager)
        {
            var rb = manager.GetOrCacheComponent<Rigidbody2D>("Rigidbody2D");
            
            #if UNITY_6000_0_OR_NEWER
            rb.linearVelocity = followFacing ? velocity * manager.transform.localScale.x : velocity;
            #else
            rb.velocity = followFacing ? velocity * manager.transform.localScale.x : velocity;
            #endif
        }

        public override void OnFixedUpdate(StateMachineManager manager)
        {
        }

        public override void OnExit(StateMachineManager manager)
        {
            if (!resetOnExit) return;
            
            if (manager.StateData.TryGetValue("Rigidbody2D", out object data))
            {
                Rigidbody2D rb = data as Rigidbody2D;
                if (rb)
                {
                    #if UNITY_6000_0_OR_NEWER
                        rb.linearVelocity = Vector2.zero;
                    #else
                        rb.velocity = Vector2.zero;
                    #endif
                }
            }
        }
    }
}