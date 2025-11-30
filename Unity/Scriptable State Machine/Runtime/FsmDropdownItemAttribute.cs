using System;

namespace MicheliniDev.ScriptableStateMachine
{
    [AttributeUsage(AttributeTargets.Class)]
    public class FsmDropdownItemAttribute : Attribute
    {
        public string Name { get; private set; }
        public string Category { get; private set; }

        public FsmDropdownItemAttribute(string name, string category = "")
        {
            Name = name;
            Category = category;
        }
    }
}