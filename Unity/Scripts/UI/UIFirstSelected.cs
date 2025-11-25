using UnityEngine;
using UnityEngine.EventSystems;

public class UIFirstSelected : MonoBehaviour
{
    private void OnEnable()
    {
        EventSystem.current.SetSelectedGameObject(gameObject);
    }
}
