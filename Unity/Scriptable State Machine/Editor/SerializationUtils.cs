using System;
using System.Linq;
using System.Reflection;
using UnityEditor;
using UnityEngine;

namespace MicheliniDev.ScriptableStateMachine.Editor
{
    public static class SerializationUtils
    {
        public static void DrawField(SerializedProperty property, Type baseType, string label, string[] popupOptions = null)
        {
            EditorGUILayout.BeginVertical(EditorStyles.helpBox);
            Rect rect = EditorGUILayout.GetControlRect();
            Rect labelRect = new Rect(rect.x, rect.y, EditorGUIUtility.labelWidth, rect.height);
            Rect buttonRect = new Rect(rect.x + EditorGUIUtility.labelWidth, rect.y, rect.width - EditorGUIUtility.labelWidth, rect.height);

            EditorGUI.LabelField(labelRect, label);

            string typeName = GetManagedReferenceTypeName(property);
            bool isNull = string.IsNullOrEmpty(property.managedReferenceFullTypename);

            GUIStyle buttonStyle = EditorStyles.miniButton;
            
            if (isNull) 
                buttonStyle = new GUIStyle(GUI.skin.button)
                {
                    normal = { textColor = Color.yellow }
                };

            if (GUI.Button(buttonRect, typeName, buttonStyle))
            {
                ShowTypeMenu(baseType, (type) =>
                {
                    property.serializedObject.Update();
                    property.managedReferenceValue = type == null ? null : Activator.CreateInstance(type);
                    property.serializedObject.ApplyModifiedProperties();
                });
            }

            if (!isNull)
            {
                EditorGUI.indentLevel++;
                SerializedProperty prop = property.Copy();
                SerializedProperty endProp = property.GetEndProperty();
                bool enterChildren = true;
                while (prop.NextVisible(enterChildren))
                {
                    enterChildren = false; 
                    if (SerializedProperty.EqualContents(prop, endProp)) break;

                    if (popupOptions != null && prop.name == "triggerName" && prop.propertyType == SerializedPropertyType.String)
                    {
                        int index = -1;
                        for (int i = 0; i < popupOptions.Length; i++)
                        {
                            if (popupOptions[i] == prop.stringValue)
                            {
                                index = i;
                                break;
                            }
                        }

                        int newIndex = EditorGUILayout.Popup(prop.displayName, index, popupOptions);

                        if (newIndex >= 0 && newIndex < popupOptions.Length)
                        {
                            prop.stringValue = popupOptions[newIndex];
                        }
                    }
                    else
                    {
                        EditorGUILayout.PropertyField(prop, true);
                    }
                }
                EditorGUI.indentLevel--;
            }
            EditorGUILayout.EndVertical();
        }

        public static void DrawList(SerializedProperty listProperty, Type baseType, Color backgroundColor, string label = null)
        {
            EditorGUILayout.Space(5);
            
            if (!string.IsNullOrEmpty(label))
            {
                EditorGUILayout.LabelField(label, EditorStyles.boldLabel);
            }

            if (listProperty.arraySize == 0)
            {
                EditorGUILayout.HelpBox("List is empty.", MessageType.None);
            }

            for (int i = 0; i < listProperty.arraySize; i++)
            {
                SerializedProperty element = listProperty.GetArrayElementAtIndex(i);
                
                EditorGUILayout.BeginVertical(EditorStyles.helpBox);
                
                EditorGUILayout.BeginHorizontal();
                
                string elementName = GetManagedReferenceTypeName(element);
                bool isNull = string.IsNullOrEmpty(element.managedReferenceFullTypename);

                EditorGUILayout.LabelField(elementName, EditorStyles.boldLabel);
                
                if (GUILayout.Button("X", GUILayout.Width(25))) 
                {
                    listProperty.DeleteArrayElementAtIndex(i);
                    break; 
                }
                EditorGUILayout.EndHorizontal();

                if (!isNull)
                {
                    EditorGUI.indentLevel++;
                    SerializedProperty prop = element.Copy();
                    SerializedProperty endProp = element.GetEndProperty();

                    bool enterChildren = true;
                    while (prop.NextVisible(enterChildren))
                    {
                        enterChildren = false; 
                        if (SerializedProperty.EqualContents(prop, endProp)) break;
                        EditorGUILayout.PropertyField(prop, true);
                    }
                    EditorGUI.indentLevel--;
                }
                
                EditorGUILayout.EndVertical();
            }

            EditorGUILayout.Space(2);
            
            GUI.backgroundColor = backgroundColor;
            if (GUILayout.Button($"Add {baseType.Name}"))
            {
                ShowTypeMenu(baseType, (type) =>
                {
                    listProperty.serializedObject.Update();
                    listProperty.arraySize++;
                    var newElement = listProperty.GetArrayElementAtIndex(listProperty.arraySize - 1);
                    newElement.managedReferenceValue = Activator.CreateInstance(type);
                    listProperty.serializedObject.ApplyModifiedProperties();
                });
            }
            GUI.backgroundColor = Color.white;
            EditorGUILayout.Space(10);
        }

        private static string GetManagedReferenceTypeName(SerializedProperty property)
        {
            string fullTypeName = property.managedReferenceFullTypename;
            
            if (string.IsNullOrEmpty(fullTypeName))
            {
                return "None";
            }

            string[] parts = fullTypeName.Split(' ');
            if (parts.Length > 1)
            {
                string classNameWithNamespace = parts[1];
                int lastDotIndex = classNameWithNamespace.LastIndexOf('.');
                if (lastDotIndex >= 0)
                {
                    return classNameWithNamespace.Substring(lastDotIndex + 1);
                }
                return classNameWithNamespace;
            }
            return fullTypeName;
        }

        private static void ShowTypeMenu(Type baseType, Action<Type> onSelection)
        {
            GenericMenu menu = new GenericMenu();
            var types = TypeCache.GetTypesDerivedFrom(baseType)
                .Where(t => !t.IsAbstract && !t.IsInterface)
                .OrderBy(t => t.Name); 
            
            menu.AddItem(new GUIContent("None"), false, () => onSelection(null));

            foreach (var type in types)
            {
                string menuLabel = type.Name;
                var attr = type.GetCustomAttribute<FsmDropdownItemAttribute>();
        
                if (attr != null)
                {
                    if (!string.IsNullOrEmpty(attr.Category))
                    {
                        menuLabel = $"{attr.Category}/{attr.Name}";
                    }
                    else
                    {
                        menuLabel = attr.Name;
                    }
                }
                else
                {
                    menuLabel = ObjectNames.NicifyVariableName(menuLabel);
                }

                menu.AddItem(new GUIContent(menuLabel), false, () => onSelection(type));
            }
            menu.ShowAsContext();
        }
    }
}

/*using System;
using System.Linq;
using System.Reflection;
using UnityEditor;
using UnityEngine;

namespace MicheliniDev.ScriptableStateMachine.Editor
{
    public static class SerializationUtils
    {
        public static void DrawField(SerializedProperty property, Type baseType, string label, string[] popupOptions = null)
        {
            EditorGUILayout.BeginVertical(EditorStyles.helpBox);
            Rect rect = EditorGUILayout.GetControlRect();
            Rect labelRect = new Rect(rect.x, rect.y, EditorGUIUtility.labelWidth, rect.height);
            Rect buttonRect = new Rect(rect.x + EditorGUIUtility.labelWidth, rect.y, rect.width - EditorGUIUtility.labelWidth, rect.height);

            EditorGUI.LabelField(labelRect, label);

            string typeName = "None";
            if (property.managedReferenceValue != null)
                typeName = property.managedReferenceValue.GetType().Name;
            
            GUIStyle buttonStyle = EditorStyles.miniButton;
            
            if (property.managedReferenceValue == null) 
                buttonStyle = new GUIStyle(GUI.skin.button)
                {
                    normal =
                    {
                        textColor = Color.yellow
                    }
                };

            if (GUI.Button(buttonRect, typeName, buttonStyle))
            {
                ShowTypeMenu(baseType, (type) =>
                {
                    property.serializedObject.Update();
                    property.managedReferenceValue = type == null ? null : Activator.CreateInstance(type);
                    property.serializedObject.ApplyModifiedProperties();
                });
            }

            if (property.managedReferenceValue != null)
            {
                EditorGUI.indentLevel++;
                SerializedProperty prop = property.Copy();
                SerializedProperty endProp = property.GetEndProperty();
                bool enterChildren = true;
                while (prop.NextVisible(enterChildren))
                {
                    enterChildren = false; 
                    if (SerializedProperty.EqualContents(prop, endProp)) break;

                    if (popupOptions != null && prop.name == "triggerName" && prop.propertyType == SerializedPropertyType.String)
                    {
                        int index = -1;
                        for (int i = 0; i < popupOptions.Length; i++)
                        {
                            if (popupOptions[i] == prop.stringValue)
                            {
                                index = i;
                                break;
                            }
                        }

                        int newIndex = EditorGUILayout.Popup(prop.displayName, index, popupOptions);

                        if (newIndex >= 0 && newIndex < popupOptions.Length)
                        {
                            prop.stringValue = popupOptions[newIndex];
                        }
                    }
                    else
                    {
                        EditorGUILayout.PropertyField(prop, true);
                    }
                }
                EditorGUI.indentLevel--;
            }
            EditorGUILayout.EndVertical();
        }

        public static void DrawList(SerializedProperty listProperty, Type baseType, Color backgroundColor, string label = null)
        {
            EditorGUILayout.Space(5);
            
            if (!string.IsNullOrEmpty(label))
            {
                EditorGUILayout.LabelField(label, EditorStyles.boldLabel);
            }

            if (listProperty.arraySize == 0)
            {
                EditorGUILayout.HelpBox("List is empty.", MessageType.None);
            }

            for (int i = 0; i < listProperty.arraySize; i++)
            {
                SerializedProperty element = listProperty.GetArrayElementAtIndex(i);
                
                EditorGUILayout.BeginVertical(EditorStyles.helpBox);
                
                EditorGUILayout.BeginHorizontal();
                string elementName = element.managedReferenceValue != null ? element.managedReferenceValue.GetType().Name : "Null";
                EditorGUILayout.LabelField(elementName, EditorStyles.boldLabel);
                
                if (GUILayout.Button("X", GUILayout.Width(25))) 
                {
                    listProperty.DeleteArrayElementAtIndex(i);
                    break; 
                }
                EditorGUILayout.EndHorizontal();

                if (element.managedReferenceValue != null)
                {
                    EditorGUI.indentLevel++;
                    SerializedProperty prop = element.Copy();
                    SerializedProperty endProp = element.GetEndProperty();

                    bool enterChildren = true;
                    while (prop.NextVisible(enterChildren))
                    {
                        enterChildren = false; 
                        if (SerializedProperty.EqualContents(prop, endProp)) break;
                        EditorGUILayout.PropertyField(prop, true);
                    }
                    EditorGUI.indentLevel--;
                }
                
                EditorGUILayout.EndVertical();
            }

            EditorGUILayout.Space(2);
            
            GUI.backgroundColor = backgroundColor;
            if (GUILayout.Button($"Add {baseType.Name}"))
            {
                ShowTypeMenu(baseType, (type) =>
                {
                    listProperty.serializedObject.Update();
                    listProperty.arraySize++;
                    var newElement = listProperty.GetArrayElementAtIndex(listProperty.arraySize - 1);
                    newElement.managedReferenceValue = Activator.CreateInstance(type);
                    listProperty.serializedObject.ApplyModifiedProperties();
                });
            }
            GUI.backgroundColor = Color.white;
            EditorGUILayout.Space(10);
        }

        private static void ShowTypeMenu(Type baseType, Action<Type> onSelection)
        {
            GenericMenu menu = new GenericMenu();
            
#if UNITY_2020_1_OR_NEWER
            var types = TypeCache.GetTypesDerivedFrom(baseType)
                .Where(t => !t.IsAbstract && !t.IsInterface)
                .OrderBy(t => t.Name);
#else
    var types = AppDomain.CurrentDomain.GetAssemblies()
        .SelectMany(a =>
        {
            try { return a.GetTypes(); }
            catch { return new Type[0]; }
        })
        .Where(t => baseType.IsAssignableFrom(t) && !t.IsAbstract && !t.IsInterface)
        .OrderBy(t => t.Name);
#endif
            
            menu.AddItem(new GUIContent("None"), false, () => onSelection(null));

            foreach (var type in types)
            {
                string menuLabel = type.Name;
                var attr = type.GetCustomAttribute<FsmDropdownItemAttribute>();
        
                if (attr != null)
                {
                    if (!string.IsNullOrEmpty(attr.Category))
                    {
                        menuLabel = $"{attr.Category}/{attr.Name}";
                    }
                    else
                    {
                        menuLabel = attr.Name;
                    }
                }
                else
                {
                    menuLabel = ObjectNames.NicifyVariableName(menuLabel);
                }

                menu.AddItem(new GUIContent(menuLabel), false, () => onSelection(type));
            }
            menu.ShowAsContext();
        }
    }
}*/