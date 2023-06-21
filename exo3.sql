-- Nbre de produits par cat et sous cat

-- Etape 1
select * from Production.Product

-- Etape 2
select ProductID, ProductSubcategoryID from Production.Product

-- Etape 3
select 
	p.ProductID, souscat.ProductSubcategoryID, souscat.ProductCategoryID
from 
	Production.Product p
	inner join Production.ProductSubcategory souscat on p.ProductSubcategoryID = souscat.ProductSubcategoryID

-- Etape 4
select 
	p.ProductID, souscat.Name, cat.Name
from 
	Production.Product p
	inner join Production.ProductSubcategory souscat on p.ProductSubcategoryID = souscat.ProductSubcategoryID
	inner join Production.ProductCategory cat on cat.ProductCategoryID = souscat.ProductCategoryID

-- Etape 5
select 
	COUNT(p.ProductID) n, souscat.Name souscat, cat.Name cat
from 
	Production.Product p
	inner join Production.ProductSubcategory souscat on p.ProductSubcategoryID = souscat.ProductSubcategoryID
	inner join Production.ProductCategory cat on cat.ProductCategoryID = souscat.ProductCategoryID
GROUP BY
	souscat.Name, cat.Name








-- Nbre de produits par cat et sous cat
select c.Name cat, sc.Name sousCat, COUNT(p.Name) NbreProduit
from Sales.SalesOrderDetail d
inner join Sales.SalesOrderHeader h on d.SalesOrderID= h.SalesOrderID
inner join Production.Product p on p.ProductID = d.ProductID
inner join Production.ProductSubcategory sc on p.ProductSubcategoryID = sc.ProductSubcategoryID
inner join Production.ProductCategory c on sc.ProductCategoryID = c.ProductCategoryID
group by sc.Name, c.Name
order by cat, sousCat

