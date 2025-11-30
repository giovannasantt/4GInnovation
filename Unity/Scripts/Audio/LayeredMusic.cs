using UnityEngine;

[CreateAssetMenu(fileName = "Layered Music", menuName = "Scriptable Objects/Layered Music")]
public class LayeredMusic : ScriptableObject
{
    public AudioClip music; 
    public AudioClip[] atmospheres;
}