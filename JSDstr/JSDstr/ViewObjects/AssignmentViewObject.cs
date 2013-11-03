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
            C = source.CentroidId.Value;
            V = source.Vectorid.Value;
        }

        public int Id { get; set; }
        public int C { get; set; }
        public int V { get; set; }
    }
}