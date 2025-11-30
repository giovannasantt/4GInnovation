using UnityEngine;

public class InteractableStartPuzzle : InteractableBase
{
    [SerializeField] private PuzzleManager.PuzzleType puzzleType;
    protected override void OnInteract()
    {
        PuzzleManager.instance.StartPuzzle(puzzleType);
    }
}