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

        int CurrentCalculationId { get; set; }

        int KmeansK { get; }
        int MaxIterations { get; }
        int AssignmentsSlotCapacity { get; }
        int UpdateCentroidsSlotCapacity { get; }
    }
}
