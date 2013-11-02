using System;
using System.ComponentModel;
using System.Data.Linq.Mapping;

namespace JSDstr.Models
{
    // idle-started-completed
    //              |
    //              cancelled-started-completed
    public enum TaskState
    {
        Idle = 0,
        Started = 1,
        Completed = 2,
        Cancelled = 3,
        Current = 4
    }

    [Table]
    public class Task : BaseModel
    {
        [Column(IsPrimaryKey = true, IsDbGenerated = true, UpdateCheck = UpdateCheck.Never)]
        public override int Id { get; set; }

        [Column(UpdateCheck = UpdateCheck.Never)]
        public override DateTime CreatedDate { get; set; }

        [Column(UpdateCheck = UpdateCheck.Never)]
        public override DateTime ChangedDate { get; set; }

        [Column(UpdateCheck = UpdateCheck.Never)]
        public TaskState State { get; set; }

        [Column(UpdateCheck = UpdateCheck.Never)]
        public CalculationState Type { get; set; }

        [Column(UpdateCheck = UpdateCheck.Never)]
        public Guid? SessionGuid { get; set; }

        [Column(UpdateCheck = UpdateCheck.Never)]
        public int CalculationId { get; set; }

        [Column(UpdateCheck = UpdateCheck.Never)]
        public int Iteration { get; set; }

        [Column(UpdateCheck = UpdateCheck.Never)]
        public int SlotStart { get; set; }

        [Column(UpdateCheck = UpdateCheck.Never)]
        public int SlotCapacity { get; set; }
    }
}