using Unity.VisualScripting;
using UnityEngine;

[DefaultExecutionOrder(-20)]
public class PersistentSingleton<T> : MonoBehaviour where T : MonoBehaviour
{
    public static T instance {  get; private set; }
    public virtual void Awake()
    {
        if (instance != null && instance != this)
        {
            Destroy(gameObject);
        }
        instance = this as T;
        DontDestroyOnLoad(gameObject);
    }
}
