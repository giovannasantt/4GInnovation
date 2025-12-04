using System;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class PauseMenuPhotosController : MonoBehaviour
{
    [SerializeField] private List<Image> images;
    [SerializeField] private PauseImageData[] pauseImages;

    private void OnEnable()
    {
        SetImages();
    }

    private void SetImages()
    {
        PauseImageData currentData = new PauseImageData();
        
        foreach (var data in pauseImages)
        {
            if (!data.GetScene(SceneManager.GetActiveScene().name)) continue;
            
            Debug.Log($"Found data for {SceneManager.GetActiveScene().name} || {data.SceneName}");
            currentData = data;
            break;
        }
        
        for (int i = 0; i < images.Count; i++)
        {
            if (!images[i].gameObject.activeSelf)
                images[i].gameObject.SetActive(true);
            
            images[i].sprite = currentData.Sprites[i];
        }
    }

    [Serializable]
    public struct PauseImageData
    {
        public string SceneName;
        public Sprite[] Sprites;

        public bool GetScene(string currentScene)
        {
            return currentScene.Contains(SceneName);
        }
    }
}