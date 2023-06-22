use AdventureWorks2017;

-- CTE (common table expression) récursif
-- Create an Employee table.
CREATE TABLE dbo.MyEmployees
(
EmployeeID SMALLINT NOT NULL,
FirstName NVARCHAR(30) NOT NULL,
LastName NVARCHAR(40) NOT NULL,
Title NVARCHAR(50) NOT NULL,
DeptID SMALLINT NOT NULL,
ManagerID SMALLINT NULL,
CONSTRAINT PK_EmployeeID PRIMARY KEY CLUSTERED (EmployeeID ASC),
CONSTRAINT FK_MyEmployees_ManagerID_EmployeeID FOREIGN KEY (ManagerID) REFERENCES dbo.MyEmployees (EmployeeID)
);
-- Populate the table with values.
INSERT INTO dbo.MyEmployees VALUES
(1, N'Ken', N'Sánchez', N'Chief Executive Officer',16, NULL)
,(273, N'Brian', N'Welcker', N'Vice President of Sales', 3, 1)
,(274, N'Stephen', N'Jiang', N'North American Sales Manager', 3, 273)
,(275, N'Michael', N'Blythe', N'Sales Representative', 3, 274)
,(276, N'Linda', N'Mitchell', N'Sales Representative', 3, 274)
,(285, N'Syed', N'Abbas', N'Pacific Sales Manager', 3, 273)
,(286, N'Lynn', N'Tsoflias', N'Sales Representative', 3, 285)
,(16, N'David', N'Bradley', N'Marketing Manager', 4, 273)
,(23, N'Mary', N'Gibson', N'Marketing Specialist', 4, 16);


Select EmployeeID, FirstName, 1 Niveau from MyEmployees where ManagerID is null
UNION ALL
Select EmployeeID, FirstName, 2 Niveau from MyEmployees where ManagerID in (1)
UNION ALL
Select EmployeeID, FirstName, 3 Niveau from MyEmployees where ManagerID in (273)
UNION ALL
Select EmployeeID, FirstName, 4 Niveau from MyEmployees where ManagerID in (16,274,285)


WITH temp(id, prenom, chef, niveau) AS
(
	Select EmployeeID, FirstName, ManagerID,  1 Niveau 
		from MyEmployees 
		where ManagerID is null
	UNION ALL
	Select EmployeeID, FirstName, ManagerID, temp.Niveau + 1 
		from MyEmployees inner join temp on temp.id = ManagerID
)
select * from temp

