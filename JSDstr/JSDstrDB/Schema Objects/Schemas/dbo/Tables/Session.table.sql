CREATE TABLE [dbo].[Session] -- користувацька сесія обчислень
(
	Id int identity(1,1) primary key,
	CreatedDate datetime default getdate(),
	ChangedDate datetime default getdate(),
	
	UserName nvarchar(max) not null,
	State int not null,
	DateId int not null,
	ResultId int null,
	StatisticsId int not null
)