CREATE TABLE [dbo].[Log]
(
	Id int identity(1,1) primary key,
	CreatedDate datetime default getdate(),
	ChangedDate datetime default getdate(),
	
	Message nvarchar(max) not null,
	UserName nvarchar(max) null,
	Type int not null
);

select * from Log