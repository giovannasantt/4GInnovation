using UnityEngine;

namespace MicheliniDev.ScriptableStateMachine
{
    public class FsmCollisionRerouter : MonoBehaviour
    {
        [SerializeField] 
        [Tooltip("The StateMachineManager to send the collision events to")]
        private StateMachineManager manager;
    
        //3D PHYSICS CALLBACKS
        public void OnCollisionEnter(Collision col) => manager.OnFsmCollisionEnter(col);
        private void OnCollisionStay(Collision other) => manager.OnFsmCollisionStay(other);
        private void OnCollisionExit(Collision other) => manager.OnFsmCollisionExit(other);

        private void OnTriggerEnter(Collider other) => manager.OnFsmTriggerEnter(other);
        private void OnTriggerStay(Collider other) => manager.OnFsmTriggerStay(other);
        private void OnTriggerExit(Collider other) => manager.OnFsmTriggerExit(other);
        
        //2D PHYSICS CALLBACKS
        public void OnCollisionEnter2D(Collision2D col) => manager.OnFsmCollisionEnter2D(col);
        private void OnCollisionStay2D(Collision2D other) => manager.OnFsmCollisionStay2D(other);
        private void OnCollisionExit2D(Collision2D other) => manager.OnFsmCollisionExit2D(other);

        private void OnTriggerEnter2D(Collider2D other) => manager.OnFsmTriggerEnter2D(other);
        private void OnTriggerStay2D(Collider2D other) => manager.OnFsmTriggerStay2D(other);
        private void OnTriggerExit2D(Collider2D other) => manager.OnFsmTriggerExit2D(other);
    }
}