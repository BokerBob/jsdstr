using System;
using JSDstr.ViewObjects;

namespace JSDstr.Interfaces
{
    public interface IStatisticsService
    {
        StatisticsViewObject GetStatistics(Guid? sessionGuid);
    }
}