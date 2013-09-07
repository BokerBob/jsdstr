CREATE TABLE [dbo].[Settings]
(
	Id int identity(1,1) primary key,
	CreatedDate datetime default getdate(),
	ChangedDate datetime default getdate(),
	
	[Key] nvarchar(max) not null,
	[Value] nvarchar(max) not null
)