using System;
using System.Reflection;

namespace JSDstr.Helpers
{
    public class Singleton<T> where T : class
    {
        protected Singleton() { }

        private sealed class SingletonCreator<T> where T : class
        {
            private static readonly T instance = (T)typeof(T).GetConstructor(
                        BindingFlags.Instance | BindingFlags.NonPublic,
                        null,
                        new Type[0],
                        new ParameterModifier[0]).Invoke(null);

            public static T CreatorInstance
            {
                get { return instance; }
            }
        }

        public static T Instance
        {
            get { return SingletonCreator<T>.CreatorInstance; }
        }

    }
}