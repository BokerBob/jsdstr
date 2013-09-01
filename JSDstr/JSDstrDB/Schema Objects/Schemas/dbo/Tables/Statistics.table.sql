CREATE TABLE [dbo].[Statistics] -- інформація про статистику у даний момент часу
(
	Id int primary key,
	CreatedDate datetime not null, -- час створення
	UsersCount int not null, -- к-ть користувачів
	OnlineUsersCount int not null, -- к-ть користувачів онлайн
	AnonymiusUsersCount int not null, -- к-ть анонімних користувачів онлайн
	SessionsCount int not null, -- загальна к-ть сесій
	DataProcessedAmount int not null, -- об'єм оброблених даних
	ProcessingTime int not null, -- сумарний час обробки
	Power int not null, -- сумарна потужність
)
