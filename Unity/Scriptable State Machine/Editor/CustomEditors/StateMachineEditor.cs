using System;
using UnityEngine;
using UnityEditor;
using System.Collections.Generic;
using System.Linq;

namespace MicheliniDev.ScriptableStateMachine.Editor
{
    [CustomEditor(typeof(StateMachine))]
    public class StateMachineEditor : UnityEditor.Editor
    {
        private SerializedProperty statesProperty;
        private SerializedProperty startingStateProperty;
        private SerializedProperty transitionsProperty;
        private SerializedProperty triggersProperty;

        private List<State> availableStates = new List<State>();
        private string[] stateNames = Array.Empty<string>();

        private string[] availableTriggers = Array.Empty<string>();
        
        private Dictionary<State, List<int>> groupedTransitionIndices = new Dictionary<State, List<int>>();
        private List<int> unassignedTransitionIndices = new List<int>();
        private int indexToDelete = -1;

        private void OnEnable()
        {
            statesProperty = serializedObject.FindProperty("states");
            startingStateProperty = serializedObject.FindProperty("startingState");
            transitionsProperty = serializedObject.FindProperty("transitions");
            triggersProperty = serializedObject.FindProperty("triggers");
        }

        public override void OnInspectorGUI()
        {
            serializedObject.Update();
            indexToDelete = -1;

            EditorGUILayout.Space(10);
            DrawTitle(target.name);
            EditorGUILayout.Space(8);

            DrawSectionHeader("State Configuration"); 
            
            EditorGUILayout.BeginVertical(EditorStyles.helpBox);
            EditorGUILayout.PropertyField(statesProperty, true);
            EditorGUILayout.Space(2);
            
            EditorGUILayout.PropertyField(triggersProperty, true);
            EditorGUILayout.Space(2);
            EditorGUILayout.EndVertical();

            UpdateAvailableStates();
            UpdateAvailableTriggers();
            
            EditorGUILayout.Space(5);
            DrawSectionHeader("Entry Point"); 
            DrawStartingStateDropdown();
            
            EditorGUILayout.Space(10f);
            DrawSectionHeader("Transitions"); 

            GroupTransitions();
            DrawGroupedTransitions();

            EditorGUILayout.Space(10);

            GUI.backgroundColor = Color.green;
            if (GUILayout.Button("Add New Transition", GUILayout.Height(30)))
            {
                transitionsProperty.arraySize++;
                SerializedProperty newTransition = transitionsProperty.GetArrayElementAtIndex(transitionsProperty.arraySize - 1);
    
                newTransition.FindPropertyRelative("condition").managedReferenceValue = null;
                newTransition.FindPropertyRelative("fromState").objectReferenceValue = null;
                newTransition.FindPropertyRelative("conditionTrueState").objectReferenceValue = null;
                newTransition.FindPropertyRelative("conditionFalseState").objectReferenceValue = null;
            }
            GUI.backgroundColor = Color.white;
            
            if (indexToDelete != -1)
            {
                transitionsProperty.DeleteArrayElementAtIndex(indexToDelete);
                GroupTransitions();
            }

            serializedObject.ApplyModifiedProperties();
        }
        
        private void UpdateAvailableTriggers()
        {
            if (triggersProperty == null) return;
            
            List<string> triggers = new List<string>();
            for (int i = 0; i < triggersProperty.arraySize; i++)
            {
                triggers.Add(triggersProperty.GetArrayElementAtIndex(i).stringValue);
            }
            availableTriggers = triggers.ToArray();
        }
        
        private void DrawTitle(string title)
        {
            GUIStyle titleStyle = new GUIStyle(EditorStyles.boldLabel)
            {
                fontSize = 16, 
                alignment = TextAnchor.MiddleCenter,
                normal = { textColor = new Color(0.7f, 0.8f, 1f) } 
            };
            EditorGUILayout.LabelField(title.ToUpper(), titleStyle);
        }

        private void DrawSectionHeader(string title)
        {
            EditorGUILayout.Space(10f);
            
            GUIStyle headerStyle = new GUIStyle(EditorStyles.boldLabel)
            {
                alignment = TextAnchor.MiddleCenter,
                fontSize = 14,
                fontStyle = FontStyle.Bold,
                normal = { textColor = Color.white } 
            };
            
            EditorGUILayout.Space(2f);
            EditorGUILayout.LabelField(title, headerStyle);
            EditorGUILayout.Space(5f);
        }
        
        private void UpdateAvailableStates()
        {
            availableStates.Clear();
            for (int i = 0; i < statesProperty.arraySize; i++)
            {
                State state = statesProperty.GetArrayElementAtIndex(i).objectReferenceValue as State;
                if (state) availableStates.Add(state);
            }
            stateNames = new[] { "None (null)" }.Concat(availableStates.Select(s => s.name)).ToArray();
        }
        
        private void DrawStartingStateDropdown()
        {
            EditorGUILayout.BeginVertical(EditorStyles.helpBox);
            State currentState = startingStateProperty.objectReferenceValue as State;
            int currentIndex = 0; 

            if (currentState)
            {
                currentIndex = availableStates.IndexOf(currentState) + 1; 
                if (currentIndex == 0) 
                    EditorGUILayout.HelpBox("Starting State is not in the 'States' list above!", MessageType.Warning);
            }
            else
            {
                EditorGUILayout.HelpBox(
                    "No Starting State assigned. Select one from the States List in order to run.",
                    MessageType.Error
                );
            }
        
            int newIndex = EditorGUILayout.Popup("Starting State", currentIndex, stateNames);

            if (newIndex != currentIndex)
            {
                startingStateProperty.objectReferenceValue = (newIndex == 0) ? null : availableStates[newIndex - 1];
            }
            EditorGUILayout.EndVertical();
        }

        private void DrawStateDropdown(SerializedProperty property, string label)
        {
            State currentState = property.objectReferenceValue as State;
            int currentIndex = 0; 

            if (currentState) currentIndex = availableStates.IndexOf(currentState) + 1;
        
            int newIndex = EditorGUILayout.Popup(label, currentIndex, stateNames);
        
            if (newIndex != currentIndex)
                property.objectReferenceValue = (newIndex == 0) ? null : availableStates[newIndex - 1];
        }

        private void GroupTransitions()
        {
            groupedTransitionIndices.Clear();
            unassignedTransitionIndices.Clear();

            for (int i = 0; i < transitionsProperty.arraySize; i++)
            {
                SerializedProperty transitionProp = transitionsProperty.GetArrayElementAtIndex(i);
                SerializedProperty fromStateProp = transitionProp.FindPropertyRelative("fromState");
                State fromState = fromStateProp.objectReferenceValue as State;

                if (!fromState) unassignedTransitionIndices.Add(i);
                else
                {
                    if (!groupedTransitionIndices.ContainsKey(fromState))
                        groupedTransitionIndices[fromState] = new List<int>();
                    groupedTransitionIndices[fromState].Add(i);
                }
            }
        }

        private void DrawGroupedTransitions()
        {
            foreach (var group in groupedTransitionIndices.OrderBy(g => availableStates.IndexOf(g.Key)))
            {
                EditorGUILayout.Space(5);
                Rect labelRect = EditorGUILayout.GetControlRect();
                EditorGUI.DrawRect(labelRect, new Color(0.25f, 0.25f, 0.25f, 0.5f)); 
                EditorGUI.LabelField(labelRect, $"  FROM: {group.Key.name.ToUpper()}", EditorStyles.boldLabel);
                
                foreach (int index in group.Value)
                {
                    SerializedProperty prop = transitionsProperty.GetArrayElementAtIndex(index);
                    DrawTransitionProperty(prop, index);
                }
            }

            if (unassignedTransitionIndices.Count > 0)
            {
                EditorGUILayout.Space(5);
                Rect labelRect = EditorGUILayout.GetControlRect();
                EditorGUI.DrawRect(labelRect, new Color(0.5f, 0.2f, 0.2f, 0.5f)); 
                EditorGUI.LabelField(labelRect, "  [ UNASSIGNED / NEW ]", EditorStyles.boldLabel);

                foreach (int index in unassignedTransitionIndices)
                {
                    SerializedProperty prop = transitionsProperty.GetArrayElementAtIndex(index);
                    DrawTransitionProperty(prop, index);
                }
            }
        }

        private void DrawTransitionProperty(SerializedProperty transitionProp, int index)
        {
            SerializedProperty fromStateProp = transitionProp.FindPropertyRelative("fromState");
            SerializedProperty conditionProp = transitionProp.FindPropertyRelative("condition");
            SerializedProperty trueStateProp = transitionProp.FindPropertyRelative("conditionTrueState");
            SerializedProperty falseStateProp = transitionProp.FindPropertyRelative("conditionFalseState");

            EditorGUILayout.BeginVertical(EditorStyles.helpBox);
            
            EditorGUILayout.Space(2);
            DrawStateDropdown(fromStateProp, "Origin State");
            
            EditorGUILayout.Space(2);
            
            SerializationUtils.DrawField(conditionProp, typeof(FsmCondition), "Condition Check", availableTriggers);
            
            EditorGUILayout.Space(2);

            EditorGUI.indentLevel++;
            DrawStateDropdown(trueStateProp, "If True");
            DrawStateDropdown(falseStateProp, "If False");
            EditorGUI.indentLevel--;

            EditorGUILayout.Space(6); 

            GUI.backgroundColor = new Color(1f, 0.6f, 0.6f); 
            if (GUILayout.Button("Remove Transition"))
            {
                indexToDelete = index; 
            }
            GUI.backgroundColor = Color.white;

            EditorGUILayout.Space(2);
            EditorGUILayout.EndVertical();
        }
    }
}