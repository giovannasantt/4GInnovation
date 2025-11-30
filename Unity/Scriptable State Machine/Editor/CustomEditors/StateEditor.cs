using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

namespace MicheliniDev.ScriptableStateMachine.Editor
{
    [CustomEditor(typeof(State))]
    public class StateEditor : UnityEditor.Editor
    {
        private SerializedProperty behaviors;
        private SerializedProperty oneShotBehaviors;
        private SerializedProperty animationEvents;
        private void OnEnable()
        {
            behaviors = serializedObject.FindProperty("behaviors");
            oneShotBehaviors = serializedObject.FindProperty("oneShotBehaviors");
            animationEvents = serializedObject.FindProperty("animationEvents");
        }
        
        public override void OnInspectorGUI()
        {
            serializedObject.Update();

            EditorGUILayout.Space(10);
            GUIStyle titleStyle = new GUIStyle(EditorStyles.boldLabel)
            {
                fontSize = 16, 
                alignment = TextAnchor.MiddleCenter,
                normal = { textColor = new Color(0.7f, 0.8f, 1f) } 
            };
            EditorGUILayout.LabelField(target.name.ToUpper(), titleStyle);
            EditorGUILayout.Space(8);

            DrawSectionHeader("Persistent Behaviors", new Color(0.4f, 1f, 0.4f));
            SerializationUtils.DrawList(behaviors, typeof(StateBehavior), Color.green, null);

            EditorGUILayout.Space(8);
            DrawSectionHeader("One-Shot Behaviors", new Color(1f, 0.8f, 0.4f));
            SerializationUtils.DrawList(oneShotBehaviors, typeof(OneShotBehavior), Color.green, null);

            EditorGUILayout.Space(8);
            DrawSectionHeader("Animation Events", new Color(1f, 0.4f, 0.4f));
            DrawAnimationEvents();

            serializedObject.ApplyModifiedProperties();
        }

        private void DrawAnimationEvents()
        {
            if (animationEvents.arraySize == 0)
            {
                EditorGUILayout.HelpBox("List is empty.", MessageType.None);
            }

            for (int i = 0; i < animationEvents.arraySize; i++)
            {
                SerializedProperty eventProp = animationEvents.GetArrayElementAtIndex(i);
                SerializedProperty nameProp = eventProp.FindPropertyRelative("eventName");
                SerializedProperty actionsProp = eventProp.FindPropertyRelative("actions");

                EditorGUILayout.BeginVertical(EditorStyles.helpBox);
                
                EditorGUILayout.BeginHorizontal();
                string label = string.IsNullOrEmpty(nameProp.stringValue) ? $"Event {i}" : nameProp.stringValue;
                
                eventProp.isExpanded = EditorGUILayout.Foldout(eventProp.isExpanded, label, true, EditorStyles.foldoutHeader);
                
                if (GUILayout.Button("X", GUILayout.Width(25)))
                {
                    animationEvents.DeleteArrayElementAtIndex(i);
                    break; 
                }
                EditorGUILayout.EndHorizontal();

                if (eventProp.isExpanded)
                {
                    EditorGUI.indentLevel++;
                    EditorGUILayout.Space(2);
                    
                    EditorGUILayout.PropertyField(nameProp, new GUIContent("Event Key"));
                    
                    SerializationUtils.DrawList(actionsProp, typeof(OneShotBehavior), new Color(0.7f, 0.8f, 1f), null);
                    
                    EditorGUI.indentLevel--;
                    EditorGUILayout.Space(5);
                }

                EditorGUILayout.EndVertical();
                EditorGUILayout.Space(5);
            }

            EditorGUILayout.Space(5);
            
            GUI.backgroundColor = Color.green; 
            if (GUILayout.Button("Add Animation Event", GUILayout.Height(20)))
            {
                animationEvents.arraySize++;
                SerializedProperty newElement = animationEvents.GetArrayElementAtIndex(animationEvents.arraySize - 1);
                
                newElement.FindPropertyRelative("eventName").stringValue = "";
                newElement.FindPropertyRelative("actions").arraySize = 0;
                newElement.isExpanded = true;
            }
            GUI.backgroundColor = Color.white;
        }

        private void DrawSectionHeader(string title, Color lineColor)
        {
            EditorGUILayout.Space(10f);
            Rect rect = EditorGUILayout.GetControlRect(false, 1);
            EditorGUI.DrawRect(rect, lineColor);
            
            GUIStyle headerStyle = new GUIStyle(EditorStyles.boldLabel)
            {
                alignment = TextAnchor.MiddleCenter,
                fontSize = 16,
                fontStyle = FontStyle.Bold,
                normal = { textColor = Color.white } 
            };
            
            EditorGUILayout.Space(5f);
            EditorGUILayout.LabelField(title, headerStyle);
            EditorGUILayout.Space(5f);
        }
    }
}