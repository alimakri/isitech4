USE [master]
GO
CREATE LOGIN [pierre] WITH PASSWORD=N'P@ssw0rd', 
	DEFAULT_DATABASE=[Stock], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [pierre]
GO
use [master];
GO
USE [AdventureWorks2017]
GO
CREATE USER [pierre] FOR LOGIN [pierre]
GO
use [AdventureWorks2017];
GO
USE VenteBD
GO
CREATE USER [pierre] FOR LOGIN [pierre]
GO
ALTER ROLE [db_owner] ADD MEMBER [pierre]
GO


--USE [AdventureWorks2017];
--DROP USER [pierre];
--USE Stock;
--DROP USER [pierre];
--DROP LOGIN Pierre;

USE VenteBD
GO
CREATE SCHEMA [Compta]
GO
GRANT DELETE ON SCHEMA::[Compta] TO [pierre]
GO
GO
GRANT EXECUTE ON SCHEMA::[Compta] TO [pierre]
GO
CREATE TABLE Compta.Table1 (ID int)

