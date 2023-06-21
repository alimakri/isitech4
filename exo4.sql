 -- Quantité de produits vendus par les 3 meilleurs vendeurs

 -- Etape 1 : Quantité de produits vendus : n, Nom du vendeur
 select p.LastName, p.BusinessEntityID, SUM(d.OrderQty) n 
 from Sales.SalesOrderDetail d 
 inner join Sales.SalesOrderHeader h on d.SalesOrderID = h.SalesOrderID
 inner join Person.Person p on h.SalesPersonID = p.BusinessEntityID
 Group by 
	p.LastName, p.BusinessEntityID
 Having p.BusinessEntityID in 
 (
	 select TOP 3 h.SalesPersonID 
	 from Sales.SalesOrderDetail d 
	 inner join Sales.SalesOrderHeader h on d.SalesOrderID = h.SalesOrderID
	 inner join Person.Person p on h.SalesPersonID = p.BusinessEntityID
	 group by h.SalesPersonID
	 order by SUM(d.OrderQty * d.UnitPrice)	
 )
 order by n desc

