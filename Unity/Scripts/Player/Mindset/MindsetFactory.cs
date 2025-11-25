using System.Collections.Generic;
using UnityEngine;
using Random = UnityEngine.Random;

public class MindsetFactory : MonoBehaviour
{
    [SerializeField] private MindsetObject mindsetPrefab;
    [SerializeField] private Transform mindsetParent;
    private List<Transform> spawnedObjects = new();
    public MindsetObject CreateMindset(MindsetData data)
    {
        var instance = Instantiate(mindsetPrefab, mindsetParent);
        instance.SetData(data);
        instance.transform.position = GetSafeRandomPosition(130f);
        spawnedObjects.Add(instance.transform);
        return instance;
    }
    
    private Vector2 GetSafeRandomPosition(float minDistance, int maxAttempts = 10)
    {
        Vector2 randomPos = Vector2.zero;
        RectTransform canvasRect = mindsetParent.GetComponentInParent<Canvas>().GetComponent<RectTransform>();
        Vector3[] corners = new Vector3[4];
        canvasRect.GetWorldCorners(corners);
        float minX = corners[0].x;
        float maxX = corners[2].x;
        float minY = corners[0].y;
        float maxY = corners[1].y; 
        for (int i = 0; i < maxAttempts; i++)
        {
            randomPos = GetRandomUIPosition();
            foreach (var corner in corners)
            {
                if (randomPos.x > maxX || randomPos.x < minX ||  randomPos.y > maxY || randomPos.y < minY)
                {
                    continue;
                }
            }
            bool tooClose = false;

            foreach (Transform objTransform in spawnedObjects)
            {
                if (Vector2.Distance(randomPos, objTransform.position) < minDistance)
                {
                    tooClose = true;
                    break; 
                }
            }
            if (!tooClose)
            {
                break; 
            }
        }
        return randomPos;
    }
    
    private Vector2 GetRandomUIPosition()
    {
        RectTransform canvasRect = mindsetParent.GetComponentInParent<Canvas>().GetComponent<RectTransform>();

        Vector3[] corners = new Vector3[4];
        canvasRect.GetWorldCorners(corners);

        float minX = corners[0].x;
        float maxX = corners[2].x;
        float minY = corners[0].y;
        float maxY = corners[1].y; 

        float paddingX = 50f;
        float paddingY = 50f;
        
        float randomX = Random.Range(minX + paddingX, maxX - paddingX);
        float randomY = Random.Range(minY + paddingY, maxY - paddingY);
        return new Vector2(randomX, randomY);
    }
}
