using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;

public class Health : MonoBehaviour
{
    [SerializeField] private float maxHealth;
    [SerializeField] private Slider healthBar;

    public float CurrentHealth;

    public UnityEvent OnDeath;
    public UnityEvent OnHealthLost;
    void Start()
    {
        SetHealth(maxHealth);
    }

    public void GainHealth(float amount)
    {
        CurrentHealth += amount;
        if (CurrentHealth >= maxHealth) CurrentHealth = maxHealth;
        if (healthBar) healthBar.value = CurrentHealth;
    }

    public void LoseHealth(float amount)
    {
        CurrentHealth -= amount;
        OnHealthLost?.Invoke();
        if (healthBar) healthBar.value = CurrentHealth;
        DeathCheck();
    }

    private void DeathCheck()
    {
        if (CurrentHealth <= 0)
        {
            OnDeath?.Invoke();
        }
    }

    public void Suicide() => LoseHealth(999999);

    private void SetHealth(float amount)
    {
        maxHealth = amount;
        CurrentHealth = maxHealth;
        if (healthBar)
        {
            healthBar.maxValue = maxHealth;
            healthBar.value = CurrentHealth;
        }
    }
}
