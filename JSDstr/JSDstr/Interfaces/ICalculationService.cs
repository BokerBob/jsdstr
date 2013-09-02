using JSDstr.Models;
using JSDstr.ViewObjects;

namespace JSDstr.Interfaces
{
    public interface ICalculationService
    {
        CalculationTaskViewObject GetTask(CalculationTaskViewObject calculationTask);
        CalculationTaskViewObject CompleteTask(CalculationTaskViewObject calculationTask);
        CalculationTaskViewObject CancelTask(CalculationTaskViewObject calculationTask);
    }
}