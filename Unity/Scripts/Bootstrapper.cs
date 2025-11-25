using UnityEngine;

public class Bootstrapper 
{
    [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.BeforeSceneLoad)]
    public static void Execute() => Object.Instantiate(Resources.Load("Initilization/GameCore"));
}
