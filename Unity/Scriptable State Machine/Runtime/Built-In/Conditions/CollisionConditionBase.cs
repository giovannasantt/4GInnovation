using System;
using System.Linq;
using UnityEngine;

namespace MicheliniDev.ScriptableStateMachine
{
    public abstract class CollisionConditionBase : FsmCondition
    {
        public PhysicsCheckType CheckType;

        protected abstract bool OnEvaluate(GameObject hitObject);

        public void OnCollisionReceive<T>(StateMachineManager manager, T collision)
        {
            GameObject hitObject = null;

            if (collision is Collision c)            hitObject = c.gameObject;
            else if (collision is Collider co)       hitObject = co.gameObject;
            else if (collision is Collision2D c2)    hitObject = c2.gameObject;
            else if (collision is Collider2D co2)    hitObject = co2.gameObject;

            if (!hitObject) 
                return;

            if (!OnEvaluate(hitObject)) 
                return;
            string key = GetKey();
            manager.StateData[key] = true;
        }
        
        public override bool Evaluate(StateMachineManager manager)
        {
            string key = GetKey();
            
            if (manager.StateData.ContainsKey(key))
            {
                manager.StateData.Remove(key); 
                return true;
            }
            
            return false;
        }

        private string GetKey()
        {
            return $"Condition_Hit_{GetHashCode()}";
        }
    }
}