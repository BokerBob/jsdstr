using JSDstr.Models;

namespace JSDstr.ViewObjects
{
    public class AssignmentViewObject : ViewObject<ClusterAssignment>
    {
        public AssignmentViewObject()
        {
        }

        public AssignmentViewObject(ClusterAssignment source) : base(source)
        {
            Id = source.Id;
            ClusterId = source.ClusterId;
            VectorId = source.Vectorid;
        }

        public int Id { get; set; }
        public int ClusterId { get; set; }
        public int VectorId { get; set; }
    }
}