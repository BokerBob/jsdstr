using System;
using System.Data;
using JSDstr.Models;

namespace JSDstr.ViewObjects
{
    public class CalculationTaskViewObject : ViewObject<KmeansCalculation>
    {
        public CalculationTaskViewObject(){}

        public CalculationTaskViewObject(KmeansCalculation source) : base(source)
        {
            State = source.State;
            StateMessage = source.StateMessage;
            K = source.K;
            CalculationId = source.Id;
        }

        public Guid SessionGuid { get; set; }

        public CalculationState State { get; set; }
        public string StateMessage { get; set; }

        public VectorViewObject[] Vectors { get; set; }
        public VectorViewObject[] Centroids { get; set; }
        public AssignmentViewObject[] Assignments { get; set; }

        public bool VectorsCached { get; set; }
        public int SlotStart { get; set; }
        public int SlotCapacity { get; set; }

        public int K { get; set; }
        public int CalculationId { get; set; }
    }
}