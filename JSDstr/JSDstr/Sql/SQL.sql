

declare @id int;
select @id = Value from Settings
where [KEY] = 'CurrentCalculationId'
declare @type int;
select @type = State
from KmeansCalculation
where id = @id; 
--select * from Centroid
--where CalculationId = @id;
select * from KmeansCalculation
where ID = @id
select COUNT(*) from Task
where CalculationId = @id and Type = @type and State = 0;
select COUNT(*), SessionGuid from Task
where CalculationId = @id and Type = @type and State = 1
group by SessionGuid;
select COUNT(*), SessionGuid from Task
where CalculationId = @id and Type = @type and State = 2
group by SessionGuid;
select COUNT(*) from Task
where CalculationId = @id and Type = @type and State = 3;

select * from Session
where Guid = 'B6BD7B25-4802-466B-8832-107411D0AA33'

delete from KmeansCalculation
delete from Centroid
delete from CentroidAssignment
delete from Session

update Settings
set value = '0'
where [key] = 'CurrentCalculationId' 