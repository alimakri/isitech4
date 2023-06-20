-- Ca par magasin
-- Tables : Sales.SalesOrderDetail, Sales.SalesOrderHeader, Sales.SalesPerson, Sales.Store

select top 3 s.Name Mag, SUM(d.OrderQty * d.UnitPrice) ca
from Sales.SalesOrderDetail d 
	inner join Sales.SalesOrderHeader h on h.SalesOrderID = d.SalesOrderID
	inner join Sales.Store s on s.SalesPersonID = h.SalesPersonID
Group by s.Name
order by ca desc

select top 3 s.Name Mag, SUM(d.OrderQty * d.UnitPrice) ca
from Sales.SalesOrderDetail d 
	inner join Sales.SalesOrderHeader h on h.SalesOrderID = d.SalesOrderID
	inner join Sales.SalesPerson sp on sp.BusinessEntityID = h.SalesPersonID
	inner join Sales.Store s on s.SalesPersonID = sp.BusinessEntityID
Group by s.Name
order by ca desc