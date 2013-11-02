use [jsDSTR];
go;

create table [dbo].[Settings]
(
	Id int identity(1,1) primary key,
	CreatedDate datetime default getdate(),
	ChangedDate datetime default getdate(),
	
	[Key] nvarchar(max) not null,
	[Value] nvarchar(max) not null
)

create table dbo.Session
(
	Id int identity(1,1) primary key,
	CreatedDate datetime default getdate(),
	ChangedDate datetime default getdate(),
	
	Guid uniqueidentifier not null,
	UserName nvarchar(max) not null,
	State int not null,
	StateMessage nvarchar(max) null,
	CalculationTime int not null,

	CalculationId int not null
)

create table [dbo].[Log]
(
	Id int identity(1,1) primary key,
	CreatedDate datetime default getdate(),
	ChangedDate datetime default getdate(),
	
	Message nvarchar(max) not null,
	UserName nvarchar(max) null,
	Context nvarchar(max) null,
	Type int not null
);

create table [dbo].Earthquake
(
	Id int identity(1,1) primary key,
	CreatedDate datetime default getdate(),
	ChangedDate datetime default getdate(),

	CalculationId int default 0,

	I_D int not null,
	FLAG_TSUNAMI nvarchar(3) null,
	YEAR int null,
	MONTH int null,
	DAY int null,
	HOUR int null,
	MINUTE int null,
	SECOND decimal(3,1) null,

	FOCAL_DEPTH int null,
	EQ_MAG_MW decimal(3,1) null,
	EQ_MAG_MS decimal(3,1) null,
	EQ_MAG_MB decimal(3,1) null,
	EQ_MAG_ML decimal(3,1) null,
	EQ_MAG_MFA decimal(3,1) null,
	EQ_MAG_UNK decimal(3,1) null,
	INTENSITY int null,

	COUNTRY nvarchar(100) null,
	STATE nvarchar(10) null,
	LOCATION_NAME nvarchar(100) null,
	LATITUDE decimal(6,3) null,
	LONGITUDE decimal(6,3) null,
	REGION_CODE int null,

	DEATHS int null,
	DEATHS_DESCRIPTION int null,
	MISSING int null,
	MISSING_DESCRIPTION int null,
	INJURIES int null,
	INJURIES_DESCRIPTION int null,

	DAMAGE_MILLIONS_DOLLARS decimal(9,3) null,
	DAMAGE_DESCRIPTION int null,
	HOUSES_DESTROYED int null,
	HOUSES_DESTROYED_DESCRIPTION int null,
	HOUSES_DAMAGED int null,
	HOUSES_DAMAGED_DESCRIPTION int null,
	TOTAL_DEATHS int null,
	TOTAL_DEATHS_DESCRIPTION int null,
	TOTAL_MISSING int null,
	TOTAL_MISSING_DESCRIPTION int null,
	TOTAL_INJURIES int null,
	TOTAL_INJURIES_DESCRIPTION int null,
	TOTAL_DAMAGE_MILLIONS_DOLLARS decimal(9,3) null,
	TOTAL_DAMAGE_DESCRIPTION int null,
	TOTAL_HOUSES_DESTROYED int null,
	TOTAL_HOUSES_DESTROYED_DESCRIPTION int null,
	TOTAL_HOUSES_DAMAGED int null,
	TOTAL_HOUSES_DAMAGED_DESCRIPTION int null,
);

create table KmeansCalculation
(
	Id int identity(1,1) primary key,
	CreatedDate datetime default getdate(),
	ChangedDate datetime default getdate(),
	K int not null,
	Iteration int not null,
	MaxIterations int not null,
	State int not null,
	StateMessage nvarchar(max) null
);

create table Centroid
(
	Id int identity(1,1) primary key,
	CreatedDate datetime default getdate(),
	ChangedDate datetime default getdate(),
	V1 decimal(6,3) not null,
	V2 decimal(6,3) not null,
	V3 decimal(6,3) not null,
	CalculationId int not null,
	Iteration int not null,
	Committed bit not null
);

create table CentroidAssignment
(
	Id int identity(1,1) primary key,
	CreatedDate datetime default getdate(),
	ChangedDate datetime default getdate(),
	CentroidId int null,
	VectorId int null,
	CalculationId int not null,
	Iteration int not null,
);

create table Task
(
	Id int identity(1,1) primary key,
	CreatedDate datetime default getdate(),
	ChangedDate datetime default getdate(),

	State int not null,
	Type int not null,
	SessionGuid uniqueidentifier null,
	CalculationId int not null,
	Iteration int not null,
	SlotStart int not null,
	SlotCapacity int not null
);

select Id, YEAR, MONTH, DAY, LOCATION_NAME, LATITUDE, LONGITUDE, INTENSITY
from Earthquake
where INTENSITY is not null and LATITUDE is not null and LONGITUDE is not null
order by INTENSITY desc, Year 

declare @id int;
select @id = Value from Settings
where [KEY] = 'CurrentCalculationId'
declare @type int;
select @type = State
from KmeansCalculation
where id = @id;
declare @iteration int;
select @iteration = Iteration
from KmeansCalculation
where id = @id;
select * from KmeansCalculation
where ID = @id
select * from CentroidAssignment
where CalculationId = @id and Iteration = @iteration;
select * from Centroid
where CalculationId = @id and Iteration = @iteration;
select COUNT(*) as 'Idle' from Task
where CalculationId = @id and Type = @type and State = 0;
select SessionGuid as 'Started' from Task
where CalculationId = @id and Type = @type and State = 1
group by SessionGuid;
select SessionGuid as 'Completed' from Task
where CalculationId = @id and Type = @type and State = 2
group by SessionGuid;
select  COUNT(*) as 'Cancelled' from Task
where CalculationId = @id and Type = @type and State = 3;

select * from Session
where Guid = '0982114a-1c2e-409c-a6c8-ab4f51e1e299'
select * from Task
where CalculationId = 120 and Iteration = 0 and type = 2

delete from KmeansCalculation
delete from Centroid
delete from CentroidAssignment
delete from Session

drop table Centroid;
drop table CentroidAssignment;
drop table Earthquake;
drop table KmeansCalculation;
drop table Log;
drop table Session;
drop table Task;

update Settings
set value = '0'
where [key] = 'CurrentCalculationId' 