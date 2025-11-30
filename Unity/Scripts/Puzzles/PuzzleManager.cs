using System;
using TMPro;
using UnityEngine;
using Random = UnityEngine.Random;

public class PuzzleManager : Singleton<PuzzleManager>
{
    private PuzzleType currentPuzzleType;

    private string password = "20052011";
    
    private Vector2Int[] lockPickSteps;
    private int currentLockPickIndex;
    [SerializeField, Range(0f, 3f)] 
    private float lockPickTimeLimit;
    private float lockPickTimer;
    private Vector2 lastLockPickInput;

    public static event Action<PuzzleType> OnPuzzleEnd;
    public override void Awake()
    {
        base.Awake();
        currentPuzzleType = PuzzleType.None;
    }

    private void Update()
    {
        UpdateCurrentPuzzle();
    }

    private void UpdateCurrentPuzzle()
    {
        if (currentPuzzleType == PuzzleType.None) return;

        if (currentPuzzleType == PuzzleType.LockPick)
        {
            DoLockPickChecks();
        }
    }

    public void StartPuzzle(PuzzleType type)
    {
        currentPuzzleType = type;
        OnPuzzleStart();
        switch (type)
        {
            case PuzzleType.LockPick:
                StartLockPick();
                break;
            case PuzzleType.ComputerPassword:
                StartPassword();
                break;
        }
    }
    
    private void OnPuzzleStart()
    {
        Player.instance.PlayerCamera.EnableCameraInput(false);
    }
    
    private void OnPuzzleExit()
    {
        currentPuzzleType = PuzzleType.None;
        InputManager.instance.ChangeMap("Gameplay");
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;
        Player.instance.PlayerCamera.EnableCameraInput(true);
    }
    
    #region Password
    private void StartPassword()
    {
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;
        UIManager.instance.ShowPasswordUI();
    }
    
    public void CheckPassword(string inputtedPassword)
    {
        if (inputtedPassword == password)
            OnFoundPassword();
        else
            Player.instance.Health.LoseHealth(0.3f);
    }

    private void OnFoundPassword()
    {
        OnPuzzleEnd?.Invoke(PuzzleType.ComputerPassword);
        OnPuzzleExit();
        UIManager.instance.HidePasswordUI();
    }
    #endregion
    
    #region LockPick
    private void StartLockPick()
    {
        InputManager.instance.ChangeMap("LockPick");
        lockPickSteps = GetRandomDirections();
        currentLockPickIndex = 0;
        lockPickTimer = lockPickTimeLimit;
        UIManager.instance.ShowLockPickUI(lockPickSteps, lockPickTimer, lockPickTimeLimit);
    }

    private Vector2Int[] GetRandomDirections()
    {
        int[] possibleValues = {-1, 0, 1};
        Vector2Int[] returnValue = {
            new(possibleValues[Random.Range(0, possibleValues.Length)], possibleValues[Random.Range(0, possibleValues.Length)]),
            new(possibleValues[Random.Range(0, possibleValues.Length)], possibleValues[Random.Range(0, possibleValues.Length)]),
            new(possibleValues[Random.Range(0, possibleValues.Length)], possibleValues[Random.Range(0, possibleValues.Length)]),
            new(possibleValues[Random.Range(0, possibleValues.Length)], possibleValues[Random.Range(0, possibleValues.Length)])
        };
        for (int i = 0; i < returnValue.Length; i++)
        {
            if (returnValue[i].y != 0)
                returnValue[i].x = 0;
            if (returnValue[i] == Vector2.zero)
                returnValue[i].x = 1;
        }
        return returnValue;
    }
    
    private void DoLockPickChecks()
    {
        lockPickTimer -= Time.deltaTime;
        UIManager.instance.UpdateLockPickTimer(lockPickTimer);

        if (lockPickTimer <= 0f)
        {
            Player.instance.Health.LoseHealth(.3f);
            OnPuzzleExit();
            UIManager.instance.HideLockPickUI();
            lastLockPickInput = Vector2.zero; 
            return;
        }

        var currentAxis = InputManager.instance.GetAxis("MoveLockPick", true);

        if (currentAxis != Vector2.zero && currentAxis != lastLockPickInput)
        {
            if (currentAxis == lockPickSteps[currentLockPickIndex])
            {
                if (currentLockPickIndex != lockPickSteps.Length - 1)
                {
                    currentLockPickIndex++;
                }
                else
                {
                    OnPuzzleEnd?.Invoke(PuzzleType.LockPick);
                    OnPuzzleExit();
                    UIManager.instance.HideLockPickUI();
                    lastLockPickInput = Vector2.zero; 
                }
            }
            else 
            {
                Player.instance.Health.LoseHealth(.15f);
                lockPickTimer -= .25f;
            }
        }
        lastLockPickInput = currentAxis;
    }
    #endregion
    
    public enum PuzzleType
    {
        LockPick,
        ComputerPassword,
        None,
    }
}
