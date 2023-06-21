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

-- Etape 1
select OrderQty * UnitPrice ca from Sales.SalesOrderDetail

-- Etape 2 (d'après dessin)
select * 
from Sales.SalesOrderDetail d
inner join Sales.SalesOrderHeader h on d.SalesOrderID = h.SalesOrderID
inner join Sales.Store s on s.SalesPersonID = h.SalesPersonID

-- Etape 3
select s.Name Magasin, d.OrderQty * d.UnitPrice ca
from Sales.SalesOrderDetail d
inner join Sales.SalesOrderHeader h on d.SalesOrderID = h.SalesOrderID
inner join Sales.Store s on s.SalesPersonID = h.SalesPersonID
order by s.Name

-- Etape 4
select s.Name Magasin, SUM(d.OrderQty * d.UnitPrice) ca
from Sales.SalesOrderDetail d
inner join Sales.SalesOrderHeader h on d.SalesOrderID = h.SalesOrderID
inner join Sales.Store s on s.SalesPersonID = h.SalesPersonID
Group by s.Name
order by ca desc