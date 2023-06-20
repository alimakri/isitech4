-- [AdventureWorks2017] : Nom, Prénom et ville des personnes
ALTER AUTHORIZATION on DATABASE::AdventureWorks2017 to [Pione\alima]

SELECT 
	p.BusinessEntityID, p.FirstName, p.LastName, a.City
FROM
	Person.Person p
	inner join Person.BusinessEntity be on p.BusinessEntityID = be.BusinessEntityID
	inner join Person.BusinessEntityAddress bea on bea.BusinessEntityID = be.BusinessEntityID
	inner join Person.Address a on a.AddressID = bea.AddressID
WHERE
	PersonType = 'EM' 

SELECT 
	Person.Person.BusinessEntityID, Person.Person.FirstName, Person.Person.LastName, Person.Address.City, Person.PersonType
FROM     
	Person.Address 
	INNER JOIN Person.BusinessEntityAddress ON Person.Address.AddressID = Person.BusinessEntityAddress.AddressID 
	INNER JOIN Person.BusinessEntity ON Person.BusinessEntityAddress.BusinessEntityID = Person.BusinessEntity.BusinessEntityID 
	INNER JOIN Person.Person ON Person.BusinessEntity.BusinessEntityID = Person.Person.BusinessEntityID
WHERE
	PersonType = 'EM' 

-- Sans jointures (avec Where)
SELECT 
	p.BusinessEntityID, p.FirstName, p.LastName, a.City
FROM
	Person.Person p, 
	Person.BusinessEntity be, 
	Person.BusinessEntityAddress bea,
	Person.Address a 
WHERE
	PersonType = 'EM' and
	p.BusinessEntityID = be.BusinessEntityID and
	bea.BusinessEntityID = be.BusinessEntityID and
	a.AddressID = bea.AddressID