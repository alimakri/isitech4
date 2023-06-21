-- Ca pour les 3 catégories
use VenteBD;
--select * from Categorie
--select * from LigneCommande
--select * from Commande
--select * from Produit

SELECT 
	c.Libelle AS cat,
	ISNULL(SUM(l.Quantite * l.PrixUnitaire), 0) AS ca
FROM     
	Produit AS p 
	RIGHT OUTER JOIN Categorie AS c ON p.Categorie = c.Id 
	LEFT OUTER JOIN LigneCommande AS l ON p.Id = l.Produit
GROUP BY c.Libelle
order by ca desc