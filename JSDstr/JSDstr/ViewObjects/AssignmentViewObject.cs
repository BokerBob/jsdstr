using JSDstr.Models;

namespace JSDstr.ViewObjects
{
    public class AssignmentViewObject : ViewObject<CentroidAssignment>
    {
        public AssignmentViewObject()
        {
        }

        public AssignmentViewObject(CentroidAssignment source) : base(source)
        {
            Id = source.Id;
            CentroidId = source.CentroidId;
            VectorId = source.Vectorid;
        }

        public int Id { get; set; }
        public int? CentroidId { get; set; }
        public int? VectorId { get; set; }
    }
}