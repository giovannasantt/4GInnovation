using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class EvidenceDetailedController : MonoBehaviour
{
    [SerializeField] private TextMeshProUGUI nameText;
    [SerializeField] private TextMeshProUGUI descriptionText;
    [SerializeField] private Image sprite;
    
    public void ChangeEvidence(InventoryItem evidence)
    {
        nameText.text = LocalizationManager.instance.GetLocalizedString(evidence.Name);
        descriptionText.text = LocalizationManager.instance.GetLocalizedString(evidence.Description);
        sprite.sprite = evidence.Icon;
    }
}
