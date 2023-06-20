use VenteBD;
CREATE TABLE [dbo].[Categorie]
(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Libelle] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categorie] PRIMARY KEY CLUSTERED (	[Id] ASC)
 )
GO
insert Categorie (Libelle) values 
	('Ecriture'),
	('Papeterie'),
	('Informatique')
select * from Categorie

ALTER TABLE PRODUIT ADD Categorie int NULL

select * from Produit
update Produit set Categorie=1 where id=1
update Produit set Categorie=1 where id=2
update Produit set Categorie=2 where id=3

select * from Produit
select * from Categorie

select 
	Produit.Libelle produit, Categorie.Libelle cat 
from Produit 
	 inner join Categorie on Produit.categorie=Categorie.Id

select 
	Produit.Libelle produit, Categorie.Libelle cat 
from  Categorie 
	 inner join Produit  on Produit.categorie=Categorie.Id

select 
	* 
from Categorie 
	left join Produit on Produit.Categorie = Categorie.Id 

select 
	* 
from Categorie 
	full join Produit on Produit.Categorie = Categorie.Id 

select 
	* 
from Categorie 
	cross join Produit 
select * from Produit


update Produit set Categorie=7 where id=1