create database Account
go
use Account
go
create table [User]
(
	Id UNIQUEIDENTIFIER primary Key default NEWID(),
	Username nvarchar (50) unique not null,
	[Password] nvarchar (100) not null,
	[Name]nvarchar (50) not null,
	LastName nvarchar (50) not null,
	Email  nvarchar (100) unique not null
)
go
insert into [User] values (NEWID(), 'Apink', 'Chicken','Pink Chicken','Pink', 'APC@gmail.com')
insert into [User] values (NEWID(), 'something', 'something','something something','something', 'sth@gmai.com')
insert into [User] values (NEWID(), 'Jerker', '1234','J','aujuqjwsqiw', 'wwww@gmail.com')
go

select *from [User]