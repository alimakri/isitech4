-- Views
select * from 
(
SELECT 
	p.BusinessEntityID, p.FirstName, p.LastName, a.City
FROM
	Person.Person p
	inner join Person.BusinessEntity be on p.BusinessEntityID = be.BusinessEntityID
	inner join Person.BusinessEntityAddress bea on bea.BusinessEntityID = be.BusinessEntityID
	inner join Person.Address a on a.AddressID = bea.AddressID
WHERE
	PersonType = 'EM'
) t
where FirstName='Kim'