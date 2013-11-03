using System;
using System.Configuration;
using System.Linq;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
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
        private const string MaxIterationsKey = "MaxIterations";
        private const string AssignmentsSlotCapacityKey = "AssignmentsSlotCapacity";
        private const string UpdateCentroidsSlotCapacityKey = "UpdateCentroidsSlotCapacity";

        private Settings CreateSettings(string key, string value)
        {
            var settings = new Settings
            {
                Key = key,
                Value = value
            };
            return _settingsRepository.Insert(settings);
        }

        private string GetValue(string key, string defValue = "", bool fromConfig = false)
        {
            if (fromConfig)
            {
                var value = ConfigurationManager.AppSettings[key];
                if (value == null)
                    return defValue;
                return value;
            }
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
            var settings = _settingsRepository.Entities.SingleOrDefault(x => x.Key == key);
            if (settings == null)
                CreateSettings(key, value);
            else
            {
                settings.Value = value;
                _settingsRepository.Save(settings);
            }
        }

        private int GetIntValue(string key, int defValue = 0, bool fromConfig = false)
        {
            try
            {
                var value = Convert.ToInt32(GetValue(key, defValue.ToString(), fromConfig));
                return value;
            }
            catch (Exception ex)
            {
                Log(ex);
                return defValue;
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
            get { return GetIntValue(KmeansKKey, 4, true); }
        }

        public int MaxIterations
        {
            get { return GetIntValue(MaxIterationsKey, 10, true); }
        }

        public int AssignmentsSlotCapacity
        {
            get { return GetIntValue(AssignmentsSlotCapacityKey, 200, true); }
        }

        public int UpdateCentroidsSlotCapacity
        {
            get { return GetIntValue(UpdateCentroidsSlotCapacityKey, 10, true); }
        }
    }
}