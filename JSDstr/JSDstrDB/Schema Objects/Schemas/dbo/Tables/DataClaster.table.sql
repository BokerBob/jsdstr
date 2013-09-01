CREATE TABLE [dbo].[DataClaster] -- зберігання даних про обчислені кластери
(
	Id int primary key, -- ідентифікатор
	CreatedDate datetime not null, -- дата створення
	Path nvarchar(100) not null -- повних шлях до кластеру в ієрархії, наприклад '1/12/267'
)
