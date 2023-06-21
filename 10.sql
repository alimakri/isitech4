-- PROCEDURES STOCKEES
use VenteBD;
GO
ALTER PROC AjouterProduit(@libelle nvarchar(50), @prix decimal, @cat int)
AS
	Insert into Produit (Libelle, Prix, Categorie) values (@libelle, @prix, @cat)
GO

Exec AjouterProduit 'Ecran', 100.05, 3

Select * from Produit
select * from Categorie

GO
CREATE PROC AjouterCommande(@refCommande nvarchar(50), @nomProduit nvarchar(50), @qte int)
AS
  DECLARE @idCommande int
  DECLARE @idProduit int
  DECLARE @prixProduit int
  -- Créer la commande si elle n'existe pas
  IF NOT EXISTS(select Id from Commande where NoCommande = @refCommande)
	insert into Commande (NoCommande, DateCommande) values(@refCommande, GETDATE())
  -- Récupération de l'id commande
  select @idCommande = id from Commande where NoCommande = @refCommande
  -- Récupération de l'id produit
  select @idProduit = id from Produit where Libelle = @nomProduit
  -- Récupération du prix produit
  select @prixProduit = Prix from Produit where id = @idProduit

  insert into LigneCommande (Commande, Produit, Quantite, PrixUnitaire) values
	(@idCommande, @idProduit, @qte, @prixProduit)
GO

Exec AjouterCommande 'A3', 'Ecran', 2

select * from Commande
select * from LigneCommande
