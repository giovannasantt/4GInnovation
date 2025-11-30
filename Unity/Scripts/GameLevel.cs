using System;
using UnityEngine;

public class GameLevel : MonoBehaviour
{
    public Transform startPosition;

    private void Awake()
    {
        GameplayCore.instance.CurrentLevel = this;
    }
}