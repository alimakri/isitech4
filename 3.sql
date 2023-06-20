use VenteBD
select SUM(Quantite * PrixUnitaire) Total from LigneCommande
select * from LigneCommande

BEGIN TRAN t1
update LigneCommande set PrixUnitaire = PrixUnitaire / 2
select SUM(Quantite * PrixUnitaire) Total from LigneCommande
RollBack Tran t1
select SUM(Quantite * PrixUnitaire) Total from LigneCommande
COMMIT TRAN t1

BEGIN TRAN
update LigneCommande set PrixUnitaire = PrixUnitaire / 2
COMMIT TRAN
select SUM(Quantite * PrixUnitaire) Total from LigneCommande
