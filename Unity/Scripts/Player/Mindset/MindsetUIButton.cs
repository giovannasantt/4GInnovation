using UnityEngine;
using UnityEngine.EventSystems;

public class MindsetUIButton : MonoBehaviour, ISelectHandler
{
    private MindsetObject bindMindsetObject;
    private void Awake()
    {
        bindMindsetObject = GetComponentInParent<MindsetObject>();
    }
    
    public void OnSelect(BaseEventData eventData)
    {
        GameplayCore.instance.MindsetUIController.Select(bindMindsetObject);
    }
}
