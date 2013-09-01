CREATE TABLE [dbo].[GeoData] -- географічні дані про міста
(
	Id int primary key, -- ідентифікатор
	Name nvarchar(max) not null, -- назва
	Latitude decimal not null, -- широта
	Longitude decimal not null, -- довгота
	Population bigint not null -- населення
)
