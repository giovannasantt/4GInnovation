using System;
using System.Collections.Generic;
using UnityEngine;

public class StateMachine<TStateType, TBaseState> : MonoBehaviour 
    where TStateType : Enum
    where TBaseState : State<TStateType>
{
    [SerializeField] private TStateType initState;
    
    private Dictionary<TStateType, TBaseState> stateCollection;
    public TBaseState CurrentState { get; private set; }
    public TStateType CurrentStateType { get; }
    
    public virtual void Start()
    {
        Initialize(initState);
    }

    private void Initialize(TStateType startingState)
    {
        stateCollection = new Dictionary<TStateType, TBaseState>();
        foreach (TBaseState state in GetComponentsInChildren<TBaseState>())
        {
            stateCollection.Add(state.GetStateType(), state);
        }
        CurrentState = stateCollection[startingState];
        CurrentState?.EnterState();
    }

    public virtual void ChangeState(TStateType state)
    {
        if (!stateCollection.ContainsKey(state)) return;
        
        CurrentState?.ExitState();
        CurrentState = stateCollection[state]; 
        CurrentState?.EnterState();
    }

    public virtual void Update()
    {
        CurrentState?.UpdateState();
    }

    public T GetState<T>(TStateType state) where T : TBaseState
    {
        return stateCollection[state] as T;
    }
}
