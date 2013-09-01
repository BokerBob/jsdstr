using System.Collections.Generic;
using JSDstr.Models;

namespace JSDstr.Interfaces
{
    public interface IClusterizationService<TFirst, TSecond, TThird> 
        where TFirst : struct 
        where TSecond : struct 
        where TThird : struct
    {
         //IClusteredEntity<TFirst, TSecond, TThird>[] Data { get; set; }
    }
}