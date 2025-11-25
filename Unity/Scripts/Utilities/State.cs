using UnityEngine;

public abstract class State<TStateType> : MonoBehaviour
{
    public abstract void EnterState();
    public abstract void UpdateState();
    public abstract void ExitState();
    public abstract TStateType GetStateType();
}