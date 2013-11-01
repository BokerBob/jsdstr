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
            CentroidId = source.CentroidId.Value;
            VectorId = source.Vectorid.Value;
        }

        public int Id { get; set; }
        public int CentroidId { get; set; }
        public int VectorId { get; set; }
    }
}