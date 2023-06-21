BACKUP DATABASE [VenteBD] TO  VenteStorage

GO
-- C

-- 12:12
insert Produit (Libelle, Prix) values('P_1212', 15)
select * from Produit
-- JT1

-- 12:13
insert Produit (Libelle, Prix) values('P_1213', 15)
select * from Produit
-- JT2

-- 12:14
insert Produit (Libelle, Prix) values('P_1214', 15)
select * from Produit
-- D
use master
use VenteBD




