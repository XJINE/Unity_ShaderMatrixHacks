using UnityEngine;

public class ViewportPosition : MonoBehaviour
{
    private void Update()
    {
        if (transform.hasChanged)
        {
            Debug.Log(Camera.main.WorldToViewportPoint(transform.position));
            transform.hasChanged = false;
        }
    }
}