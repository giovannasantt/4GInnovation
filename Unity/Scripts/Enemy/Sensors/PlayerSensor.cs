using UnityEngine;

public class PlayerSensor : MonoBehaviour
{
    public bool PlayerInRange { get; private set; }
    public void OnTriggerEnter(Collider other)
    {
        PlayerInRange = true;
    }
    
    public void OnTriggerExit(Collider other)
    {
        PlayerInRange = false;
    }
}
