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
