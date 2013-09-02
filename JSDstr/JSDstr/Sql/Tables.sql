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
	DataId int null,
	ResultId int null,
	StatisticsId int null
)

create table [dbo].[Log]
(
	Id int identity(1,1) primary key,
	CreatedDate datetime default getdate(),
	ChangedDate datetime default getdate(),
	
	Message nvarchar(max) not null,
	UserName nvarchar(max) null,
	Type int not null
);