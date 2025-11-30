using System;
using UnityEngine;
using UnityEngine.Events;

public class PuzzleEndInvoker : MonoBehaviour
{
    [SerializeField] private PuzzleManager.PuzzleType puzzleType;
    public UnityEvent Response;
    
    private void OnEnable() => PuzzleManager.OnPuzzleEnd += CheckPuzzle;
    private void OnDisable() => PuzzleManager.OnPuzzleEnd -= CheckPuzzle;

    private void CheckPuzzle(PuzzleManager.PuzzleType type)
    {
        if (puzzleType != type) return;
        Response?.Invoke();
    }
}