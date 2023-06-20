select ProductSubcategoryID, Count(Name) n
from Production.Product
where ProductSubcategoryID IS NOT NULL
group by  ProductSubcategoryID

DECLARE @i int = NULL
IF @i is NULL PRINT 'Oui' ELSE PRINT 'NON'

-- Select LastName from Person.Person where LastName like '%h_n%' order by LastName desc

select SalesOrderID, SUM(OrderQty* UnitPrice) as ca from Sales.SalesOrderDetail
group by SalesOrderID

select YEAR(OrderDate) as annee, SUM(OrderQty* UnitPrice) as ca
from 
	Sales.SalesOrderDetail as d 
	inner join Sales.SalesOrderHeader as h on d.SalesOrderID = h.SalesOrderID
Group by
	YEAR(OrderDate)
having
	YEAR(OrderDate) = 2013 
