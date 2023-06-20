use AdventureWorks2017;
-- t1 : table persistante non temporaire
select 
	BusinessEntityID, FirstName, LastName 
into t1
from 
	Person.Person where PersonType='EM'

-- #t1 est une table temporaire persistante (sur DD)
select 
	BusinessEntityID, FirstName, LastName 
into #t1
from 
	Person.Person where PersonType='EM'

-- ##t1 est une table temporaire persistante partagée
select 
	BusinessEntityID, FirstName, LastName 
into ##t1
from 
	Person.Person where PersonType='EM'

-- t1 est une table temporaire en mémoire (non persistante)
WITH t1(id, prenom, nom, typeDePersonne)
	as
	(
	select 
		BusinessEntityID, FirstName, LastName, PersonType 
	from 
		Person.Person 
	)
select * from t1 where typeDePersonne='EM'

-- select * from t1
-- DROP TABLE t1
select * from #t1
select * from ##t1
