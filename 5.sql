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
	('Papeterie')
select * from Categorie

ALTER TABLE PRODUIT ADD Categorie int NULL

select * from Produit
update Produit set Categorie=1 where id=1
update Produit set Categorie=1 where id=2
update Produit set Categorie=2 where id=3

select * from Produit

select p.Libelle produit, c.Libelle cat from Produit p inner join Categorie c on p.categorie=c.Id
