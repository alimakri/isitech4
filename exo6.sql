-- Créer une procédure stockée pour Ajouter un produit avec sa catégorie
CREATE PROC AjouterProduitCategorie(@nomProduit nvarchar(50), @nomCat nvarchar(50))
AS
  DECLARE @idCat int
  DECLARE @idProduit int

  IF NOT EXISTS(select Id from Produit where Libelle=@nomProduit)
	RETURN 0
  IF NOT EXISTS(select id from Categorie where Libelle=@nomCat)
    insert into Categorie(Libelle) values(@nomCat)
  select @idCat = id from Categorie where Libelle=@nomCat
  select @idProduit = id from Produit where Libelle=@nomProduit

  update Produit set Categorie= @idCat where id=@idProduit
GO

Exec AjouterProduitCategorie 'Cable USBc', 'Informatique'
select * from Produit
select * from Categorie
