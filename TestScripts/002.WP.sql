use [#dbname]
GO-- Create the tables and prepopulate some values

Create Table WorkProtectionType (
	ID int identity(1,1) not null Primary Key,
	Designation Nvarchar(10) not null,
	RequireNumber bit default(0) not null,
	RequireStatus bit default(0) not null,
	RequireHolder bit default(0) not null,
	RequireTempGrounds bit default(0) not null,	
	active bit default(1) not null

)

Insert into WorkProtectionType(designation)
Values ('PC10A'),('PC17B'),('PC17A'),('PC2 - WP'),('PC2 - SG')

Create Table LocationAuthority (
	ID int identity(1,1) not null Primary Key,
	Location nvarchar(200) not null,
	Active bit default(1) not null
)

Insert into LocationAuthority (Location)
Values ('Sault Ste Marie'), ('Thunderbay')

Create Table Category (
	ID int identity(1, 1) not null Primary Key,
	CategoryName nvarchar(200) not null,
	CategoryDescription nvarchar(Max) not null,
	Active bit default(1) not null
)

insert into Category (CategoryName, CategoryDescription)
Values ('Work Protection','Work Protection Category'),('Crappy', 'Crap Tacular crap n crap')	