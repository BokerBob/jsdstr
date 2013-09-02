using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using JSDstr.Interfaces;
using JSDstr.Models;
using JSDstr.Repositories;

namespace JSDstr.Services
{
    public class SettingsService : ISettingsService
    {
        private readonly IRepository<Settings> _settingsRepository = new SqlRepository<Settings>();

        private const string AnonymUsersCountKey = "AnonymUsersCount";

        private Settings CreateSettings(string key, string value)
        {
            var settings = new Settings
            {
                Key = key,
                Value = value
            };
            _settingsRepository.Insert(settings);
            _settingsRepository.Submit();
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
            var settings = _settingsRepository.Entities.Where(x => x.Key == AnonymUsersCountKey).SingleOrDefault();
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
            return Convert.ToInt32(GetValue(AnonymUsersCountKey, "0"));
        }

        public void SetAnonymUsersCount(int count)
        {
            SetValue(AnonymUsersCountKey, count.ToString());
        }
    }
}