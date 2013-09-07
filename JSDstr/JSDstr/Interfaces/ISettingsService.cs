using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace JSDstr.Interfaces
{
    public interface ISettingsService
    {
        int GetAnonymUsersCount();
        void SetAnonymUsersCount(int count);
    }
}
