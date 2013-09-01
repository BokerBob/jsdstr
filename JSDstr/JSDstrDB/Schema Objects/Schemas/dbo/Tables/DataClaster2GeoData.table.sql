CREATE TABLE [dbo].[DataClaster2GeoData] -- для зв'язку DataClaster і GeoData багато-до-багатьох
(
	DataClasterId int references DataClaster (Id),
	GeoDataId int references GeoData (Id)
)
