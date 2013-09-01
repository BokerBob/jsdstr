using System.EnterpriseServices;

namespace JSDstr.Interfaces
{
    public interface IClusteredEntity<TV1, TV2, TV3> 
        where TV1 : struct
        where TV2 : struct
        where TV3 : struct
    {
        TV1 V1 { get; set; }
        TV2 V2 { get; set; }
        TV3 V3 { get; set; }
    }
}