use [jsDSTR];

go

drop table dbo.Session;

go

create table dbo.Session -- користувацька сесія обчислень
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