#if UNITY_EDITOR
using UnityEditor;
using UnityEngine;

    [CustomPropertyDrawer(typeof(SerializedDictionary<,>))]
    public class SerializedDictionaryDrawer : PropertyDrawer
    {
        private const float Spacing = 5f;
        private const float ButtonWidth = 20f; 
        private const float HeaderHeight = 20f;
        private const float AddButtonHeight = 20f;

        public override void OnGUI(Rect position, SerializedProperty property, GUIContent label)
        {
            EditorGUI.BeginProperty(position, label, property);

            var keysProp = property.FindPropertyRelative("keys");
            var valuesProp = property.FindPropertyRelative("values");

            Rect foldoutRect = new Rect(position.x + 12, position.y, position.width, HeaderHeight);
            
            string title = $"{label.text} ({keysProp.arraySize})";
            property.isExpanded = EditorGUI.Foldout(foldoutRect, property.isExpanded, title);

            if (property.isExpanded)
            {
                EditorGUI.indentLevel++;
                
                float currentY = position.y + HeaderHeight + Spacing;

                for (int i = 0; i < keysProp.arraySize; i++)
                {
                    if (i >= valuesProp.arraySize) valuesProp.arraySize = keysProp.arraySize;

                    SerializedProperty keyElement = keysProp.GetArrayElementAtIndex(i);
                    SerializedProperty valueElement = valuesProp.GetArrayElementAtIndex(i);

                    float keyH = EditorGUI.GetPropertyHeight(keyElement);
                    float valH = EditorGUI.GetPropertyHeight(valueElement);
                    float maxH = Mathf.Max(keyH, valH);

                    float availableWidth = position.width - ButtonWidth - Spacing; 
                    float keyWidth = availableWidth * 0.4f; 
                    float valueWidth = availableWidth * 0.6f - Spacing;

                    Rect keyRect = new Rect(position.x, currentY, keyWidth, maxH);
                    Rect valRect = new Rect(position.x + keyWidth + Spacing, currentY, valueWidth, maxH);
                    Rect removeRect = new Rect(position.x + availableWidth + Spacing, currentY, ButtonWidth, EditorGUIUtility.singleLineHeight);

                    EditorGUI.PropertyField(keyRect, keyElement, GUIContent.none);
                    EditorGUI.PropertyField(valRect, valueElement, GUIContent.none);

                    if (GUI.Button(removeRect, "-"))
                    {
                        keysProp.DeleteArrayElementAtIndex(i);
                        valuesProp.DeleteArrayElementAtIndex(i);
                        break; 
                    }

                    currentY += maxH + Spacing;
                }
                
                Rect addRect = new Rect(position.x + (position.width * 0.1f), currentY, position.width * 0.8f, AddButtonHeight);
                if (GUI.Button(addRect, "Add Entry"))
                {
                    keysProp.arraySize++;
                    valuesProp.arraySize++;
                }

                EditorGUI.indentLevel--;
            }

            EditorGUI.EndProperty();
        }

        public override float GetPropertyHeight(SerializedProperty property, GUIContent label)
        {
            if (!property.isExpanded) return HeaderHeight;

            var keysProp = property.FindPropertyRelative("keys");
            var valuesProp = property.FindPropertyRelative("values");
            
            float height = HeaderHeight + Spacing;

            for (int i = 0; i < keysProp.arraySize; i++)
            {
                if (i >= valuesProp.arraySize) break;

                float keyH = EditorGUI.GetPropertyHeight(keysProp.GetArrayElementAtIndex(i));
                float valH = EditorGUI.GetPropertyHeight(valuesProp.GetArrayElementAtIndex(i));
                
                height += Mathf.Max(keyH, valH) + Spacing;
            }

            height += AddButtonHeight + Spacing;

            return height;
        }
    }
#endif