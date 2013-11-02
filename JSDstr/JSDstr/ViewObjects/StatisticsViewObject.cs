using System;
using System.Collections.Generic;
using JSDstr.Models;

namespace JSDstr.ViewObjects
{
    public class StatisticsViewObject : ViewObject<KmeansCalculation>
    {
        public StatisticsViewObject(KmeansCalculation source) : base(source)
        {
            CalculationId = Source.Id;
            CalculationCreatedDate = Source.CreatedDate;
            CalculationChangedDate = Source.ChangedDate;
            K = Source.K;
            Iteration = Source.Iteration;
            MaxIterations = Source.MaxIterations;
            CalculationState = Source.State;
        }

        public bool UserSignedIn { get; set; }
        public DateTime? UserFirstSessionDate { get; set; }
        public DateTime? UserLastSessionDate { get; set; }
        public int UserTotalSessionCount { get; set; }
        public int UserTodaySessionCount { get; set; }
        public int UserTotalDataProcessed { get; set; }
        public int UserTodayDataProcessed { get; set; }
        public int UserAverageProcessingSpeed { get; set; }
        public int UserMaxProcessingSpeed { get; set; }

        public KeyValuePair<DateTime, int>[] OnlineUsersCount { get; set; }
        public int TotalUsersCount { get; set; }
        public int TodayOnlineUsersCount { get; set; }
        public KeyValuePair<DateTime, int>[] SessionsCount { get; set; }
        public int TotalSessionsCount { get; set; }
        public int TodaySessionsCount { get; set; }
        public KeyValuePair<DateTime, int>[] Productivity { get; set; }

        public TaskState[] TaskPlan { get; set; }

        public int CalculationId { get; set; }
        public DateTime CalculationCreatedDate { get; set; }
        public DateTime CalculationChangedDate { get; set; }
        public int K { get; set; }
        public int N { get; set; }
        public int Iteration { get; set; }
        public int MaxIterations { get; set; }
        public CalculationState CalculationState { get; set; }
    }
}