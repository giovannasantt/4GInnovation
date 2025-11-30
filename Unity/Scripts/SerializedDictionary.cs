using System.Collections.Generic;
using UnityEngine;

    [System.Serializable]
    public class SerializedDictionary<TKey, TValue>
    {
        [SerializeField] private List<TKey> keys = new();
        [SerializeField] private List<TValue> values = new();

        public TValue this[TKey key]
        {
            get
            {
                int index = keys.IndexOf(key);
                
                if (index < 0) 
                    throw new KeyNotFoundException($"Key '{key}' not found in SerializedDictionary.");
                
                return values[index];
            }
            set
            {
                int index = keys.IndexOf(key);
                
                if (index >= 0)
                {
                    values[index] = value;
                }
                else
                {
                    keys.Add(key);
                    values.Add(value);
                }
            }
        }
        
        public int Count => keys.Count;
        public List<TKey> Keys => keys;
        public List<TValue> Values => values;

        public void Add(TKey key, TValue value)
        {
            keys.Add(key);
            values.Add(value);
        }

        public void Clear()
        {
            keys.Clear();
            values.Clear();
        }
    }