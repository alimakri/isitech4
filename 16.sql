-- XML
--DECLARE @data xml

--SET @data = '<personnes>
--				  <personne id="1">
--					  <nom>Dupont</nom>
--					  <prenom>Pierre</prenom>
--				  </personne>
--				  <personne id="2">
--					  <nom>Zola</nom>
--					  <prenom>Emile</prenom>
--				  </personne>
--			 </personnes>'
--SELECT  
--	T.N.value('@id[1]', 'int') id,  
--	T.N.value('nom[1]', 'nvarchar(MAX)') nom,  
--	T.N.value('prenom[1]', 'nvarchar(MAX)') prenom
--FROM   
--	@data.nodes('/personnes/personne') T(N)  


use AdventureWorks2017;
--select ProductID, ProductNumber, ProductSubcategoryID from Production.Product

GO
ALTER PROC GetProducts(@data xml)
AS
	DECLARE @couleur nvarchar(50)

	-- Transfomer xml en table temporaire
	SELECT  
		T.N.value('.', 'int') idSousCat,
		T.N.value('../@couleur', 'nvarchar(50)') couleur
	into #t
	FROM   
		@data.nodes('/produit/souscat') T(N)  
	-- Requête
	select top 1 @couleur = Couleur from #t
	select ProductID, ProductNumber, ProductSubcategoryID, Color from Production.Product
	where 
		ProductSubcategoryID in (select idsouscat from #t)
		and 
		(@couleur is null or  Color = @couleur)
GO

Exec GetProducts 
	'<produit couleur="Silver">
			<souscat>1</souscat>
	 </produit>'