using System.Web.Configuration;

namespace JSDstr.Helpers
{
    public static class ConfigurationHelper
    {
        public const string ConnectionStringName = "ApplicationServices";

        public static string ConnectionString
        {
            get
            {
                var connectionString = WebConfigurationManager.ConnectionStrings[ConnectionStringName];
                return connectionString != null ? connectionString.ConnectionString : null;
            }
        }
    }
}