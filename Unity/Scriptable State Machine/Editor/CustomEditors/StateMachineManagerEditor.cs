using MicheliniDev.ScriptableStateMachine;
using UnityEditor;
using UnityEngine;

namespace ScriptableStateMachine.Editor
{
    [CustomEditor(typeof(StateMachineManager))]
    public class StateMachineManagerEditor : UnityEditor.Editor
    {
        private Color backgroundColor;
        private GUIStyle currentStateTextStyle;
        private GUIStyle labelStyle;
        private GUIStyle messageTextStyle;
        
        private SerializedProperty stateMachinesProp;
        private SerializedProperty startingFsmProperty;

        private void OnEnable()
        {
            backgroundColor = new Color(0, 0, 0, 0.2f);
            currentStateTextStyle = new GUIStyle()
            {
                richText = true,
            };
            messageTextStyle = new GUIStyle()
            {
                richText = true,
                wordWrap = true,
            };
            labelStyle = new GUIStyle()
            {
                richText = true,
                alignment = TextAnchor.MiddleRight 
            };
            
            stateMachinesProp = serializedObject.FindProperty("stateMachines");
            startingFsmProperty = serializedObject.FindProperty("startingFsm");
        }

       public override void OnInspectorGUI()
        {
            EditorGUILayout.Space();
            serializedObject.Update();
            
            EditorGUILayout.PropertyField(stateMachinesProp, true);
            
            if (stateMachinesProp.arraySize == 0)
            {
                if (startingFsmProperty.objectReferenceValue != null)
                {
                    stateMachinesProp.arraySize = 1;
                    
                    var newElement = stateMachinesProp.GetArrayElementAtIndex(0);
                    newElement.objectReferenceValue = startingFsmProperty.objectReferenceValue;
        
                    stateMachinesProp.serializedObject.ApplyModifiedProperties(); 
                }
                else
                {
                    EditorGUILayout.HelpBox(
                        "No State Machines assigned. Add at least one to run.",
                        MessageType.Warning
                    );

                    if (GUILayout.Button("Create and Assign New State Machine"))
                    {
                        CreateNewStateMachine();
                    }
                }
            }
            
            EditorGUILayout.Space();
            EditorGUILayout.PropertyField(startingFsmProperty);
            
            if (startingFsmProperty.objectReferenceValue == null)
            {
                EditorGUILayout.HelpBox(
                    $"No Starting State Machine. Add one to run.",
                    MessageType.Warning
                );
            }

            EditorGUILayout.Space();
            EditorGUILayout.Space();
            EditorGUILayout.Space();
            
            Rect headerRect = GUILayoutUtility.GetRect(0f, 30f, GUILayout.ExpandWidth(true));
            EditorGUI.DrawRect(headerRect, new Color(0.2f, 0.4f, 0.8f, 1f)); 

            GUIStyle headerStyle = new GUIStyle
            {
                alignment = TextAnchor.MiddleCenter,
                fontSize = 16,
                fontStyle = FontStyle.Bold,
                normal =
                {
                    textColor = Color.white
                }
            };
            
            EditorGUI.LabelField(headerRect, "State Machine Stats", headerStyle);
            
            Rect bgRect = EditorGUILayout.BeginHorizontal();
            EditorGUI.DrawRect(bgRect, backgroundColor);

            GUILayout.BeginVertical(EditorStyles.helpBox);
            GUILayout.Space(2);

            if (Application.isPlaying)
            {
                float labelColWidth = 85f; 
                float valueColWidth = 60f; 

                EditorGUILayout.BeginHorizontal();
                GUILayout.Space(5);
                
                GUILayout.Label(
                    "<color=white><b>Previous State: </b></color>", 
                    labelStyle, 
                    GUILayout.Width(labelColWidth) 
                );
                EditorGUILayout.LabelField(
                    GetPreviousStateName(),
                    messageTextStyle,
                    GUILayout.Width(valueColWidth) 
                );
                
                GUILayout.Label(
                    "<color=white><b>Current State: </b></color>", 
                    labelStyle, 
                    GUILayout.Width(labelColWidth)
                );
                EditorGUILayout.LabelField(
                    GetCurrentStateName(),
                    messageTextStyle 
                );
                
                EditorGUILayout.EndHorizontal();
                
                EditorGUILayout.BeginHorizontal();
                
                GUILayout.Space(-1f);
                GUILayout.Label(
                    "<color=white><b>Previous Fsm: </b></color>", 
                    labelStyle, 
                    GUILayout.Width(labelColWidth) 
                );
                EditorGUILayout.LabelField(
                    GetPreviousStateMachineName(),
                    messageTextStyle,
                    GUILayout.Width(valueColWidth)
                );
                
                GUILayout.Space(1f);
                GUILayout.Label(
                    "<color=white><b>Current Fsm: </b></color>",
                    labelStyle, 
                    GUILayout.Width(labelColWidth) 
                );
                EditorGUILayout.LabelField(
                    GetCurrentStateMachineName(),
                    messageTextStyle 
                );

                EditorGUILayout.EndHorizontal();
            }
            else
            {
                EditorGUILayout.LabelField(
                    "<color=cyan>Application not playing. Stats will appear here once you start the game</color>",
                    messageTextStyle
                );
            }
            
            GUILayout.EndVertical();
            EditorGUILayout.EndHorizontal();
            
            serializedObject.ApplyModifiedProperties();
        }
        
        private void CreateNewStateMachine()
        {
            StateMachine newFsm = ScriptableObject.CreateInstance<StateMachine>();

            string path = AssetDatabase.GenerateUniqueAssetPath("Assets/New State Machine.asset");

            AssetDatabase.CreateAsset(newFsm, path);
            AssetDatabase.SaveAssets();
            AssetDatabase.Refresh();

            stateMachinesProp.InsertArrayElementAtIndex(0);
            stateMachinesProp.GetArrayElementAtIndex(0).objectReferenceValue = newFsm;
            
            startingFsmProperty.objectReferenceValue = newFsm;

            EditorUtility.FocusProjectWindow();
            Selection.activeObject = newFsm;
        }

        private string GetCurrentStateName()
        {
            StateMachineManager manager = serializedObject.targetObject as StateMachineManager;
            return manager.currentState ? $"<color=green>{manager.currentState.name}</color>" : "<color=red>Null</color>";   
        }
        
        private string GetPreviousStateName()
        {
            StateMachineManager manager = serializedObject.targetObject as StateMachineManager;
            return manager.previousState ? $"<color=green>{manager.previousState.name}</color>" : "<color=red>Null</color>";   
        }
        
        private string GetCurrentStateMachineName()
        {
            StateMachineManager manager = serializedObject.targetObject as StateMachineManager;
            return manager.currentStateMachine ? $"<color=green>{manager.currentStateMachine.name}</color>" : "<color=red>Null</color>";   
        }
        
        private string GetPreviousStateMachineName()
        {
            StateMachineManager manager = serializedObject.targetObject as StateMachineManager;
            return manager.previousStateMachine ? $"<color=green>{manager.previousStateMachine.name}</color>" : "<color=red>Null</color>";   
        }
    }
}