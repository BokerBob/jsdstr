using System;
using System.Linq;
using JSDstr.Interfaces;
using JSDstr.Models;
using JSDstr.Repositories;

namespace JSDstr.Services
{
    public class SettingsService : BaseService, ISettingsService
    {
        private readonly IRepository<Settings> _settingsRepository = new SqlRepository<Settings>();

        private const string AnonymUsersCountKey = "AnonymUsersCount";
        private const string CurrentCalculationIdKey = "CurrentCalculationId";
        private const string KmeansKKey = "KmeansK";

        private Settings CreateSettings(string key, string value)
        {
            var settings = new Settings
            {
                Key = key,
                Value = value
            };
            _settingsRepository.Insert(settings);
            return settings;
        }

        private string GetValue(string key, string defValue = "")
        {
            var settings = _settingsRepository.Entities.SingleOrDefault(x => x.Key == key);
            if (settings == null)
            {
                CreateSettings(key, defValue);
                return defValue;
            }
            return settings.Value;
        }

        private void SetValue(string key, string value)
        {
            var settings = _settingsRepository.Entities.SingleOrDefault(x => x.Key == AnonymUsersCountKey);
            if (settings == null)
                CreateSettings(key, value);
            else
            {
                settings.Value = value;
                _settingsRepository.Submit();
            }
        }

        public int GetAnonymUsersCount()
        {
            try
            {
                var value = Convert.ToInt32(GetValue(AnonymUsersCountKey, "0"));
                Log(string.Format("GetAnonymUsersCount: [{0}]", value));
                return value;
            }
            catch (Exception ex)
            {
                Log(ex);
                return 0;
            }
        }

        public void SetAnonymUsersCount(int count)
        {
            try
            {
                SetValue(AnonymUsersCountKey, count.ToString());
                Log(string.Format("SetAnonymUsersCount: [{0}]", count));
            }
            catch (Exception ex)
            {
                Log(ex);
            }
        }

        public int CurrentCalculationId
        {
            get
            {
                try
                {
                    var value = Convert.ToInt32(GetValue(CurrentCalculationIdKey, "0"));
                    Log(string.Format("get CurrentCalculationId: [{0}]", value));
                    return value;
                }
                catch (Exception ex)
                {
                    Log(ex);
                    return 0;
                }
            }
            set
            {
                try
                {
                    SetValue(CurrentCalculationIdKey, value.ToString());
                    Log(string.Format("set CurrentCalculationIdKey: [{0}]", value));
                }
                catch (Exception ex)
                {
                    Log(ex);
                }
            }
        }

        public int KmeansK
        {
            get
            {
                try
                {
                    var value = Convert.ToInt32(GetValue(KmeansKKey, "4"));
                    Log(string.Format("get KmeansK: [{0}]", value));
                    return value;
                }
                catch (Exception ex)
                {
                    Log(ex);
                    return 0;
                }
            }
            set
            {
                try
                {
                    SetValue(KmeansKKey, value.ToString());
                    Log(string.Format("set CurrentCalculationIdKey: [{0}]", value));
                }
                catch (Exception ex)
                {
                    Log(ex);
                }
            }
        }
    }
}