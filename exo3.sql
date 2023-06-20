-- Nbre de produits par cat et sous cat
select c.Name cat, sc.Name sousCat, COUNT(p.Name) NbreProduit
from Sales.SalesOrderDetail d
inner join Sales.SalesOrderHeader h on d.SalesOrderID= h.SalesOrderID
inner join Production.Product p on p.ProductID = d.ProductID
inner join Production.ProductSubcategory sc on p.ProductSubcategoryID = sc.ProductSubcategoryID
inner join Production.ProductCategory c on sc.ProductCategoryID = c.ProductCategoryID
group by sc.Name, c.Name
order by NbreProduit desc