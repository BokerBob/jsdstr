CREATE TABLE [dbo].[Session] -- користувацька сесія обчислень
(
	Id int primary key,
	GeoDataIdStart int references GeoData (Id), -- діапазон даних для обробки
	GeoDataIdEnd int references GeoData (Id),
	UserId int null, -- ідентифікатор користувача
	CreatedDate datetime, -- час створення сесії
	StartDate datetime null, -- час запуску обчислень
	StoppedDate datetime null, -- час відміни обчислень (закриття вікна або кнопка стоп)
	CompletedDate datetime null, -- час завершення обчислень
	StatusId int not null, -- статус [created(1) started(2) stopped(3) completed(4)]
	DataClasterId int null references DataClaster (Id), -- сформований кластер
	CalculationSpeed int null, -- швидкість обчислень
	ProcessedDataVolume int null, -- об'Єм оброблених даних
	LastPingDate datetime null -- останній час пінгу (для перевірки чи сесія активна)
)
