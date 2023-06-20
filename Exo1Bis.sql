-- Créer une base de données Ventes contenant les tables suivantes :
-- Table Produit : id, Libelle, Prix
-- Table Commande : id, NoCommande, DateCommande
-- Table LigneCommande : id, Commande, Produit, Quantite, PrixUnitaire

-- 2 commandes pour aujourd'hui
-- commande 1 : 3 crayons (2.50 l'unité) et 2 stabilo (3.80 l'unité)
-- commande 2 : 2 cahiers (2.15 l'unité) et 1 agrapheuse (10.60 l'unité)
-- Total 30€

USE [master]
GO
ALTER DATABASE [VenteBD] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
DROP DATABASE [VenteBD]
GO
CREATE DATABASE [VenteBD] ON PRIMARY
  ( 
  NAME = 'VenteBD', 
  FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\VenteBD.mdf' , 
  SIZE = 8192KB , 
  MAXSIZE = UNLIMITED, 
  FILEGROWTH = 65536KB 
  )
  LOG ON 
  ( 
	NAME = N'VenteBD_log', 
	FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\VenteBD_log.ldf' , 
	SIZE = 8192KB , 
	MAXSIZE = 2048GB , 
	FILEGROWTH = 65536KB 
  )
GO
USE [VenteBD]
GO
CREATE TABLE dbo.Produit
(
	[Id] uniqueidentifier  NOT NULL,
	[Libelle] [nvarchar](max) NOT NULL,
	Prix decimal(18,2) NOT NULL,
	CONSTRAINT [PK_Produit] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO
CREATE TABLE dbo.Commande
(
	[Id] uniqueidentifier  NOT NULL,
	NoCommande [nvarchar](max) NOT NULL,
	DateCommande DateTime NOT NULL,
	CONSTRAINT [PK_Commande] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO
CREATE TABLE [dbo].[LigneCommande]
(
	[Id] uniqueidentifier NOT NULL,
	[Commande] uniqueidentifier NOT NULL,
	[Produit] uniqueidentifier NOT NULL,
	[Quantite] [int] NOT NULL,
	[PrixUnitaire] [decimal](18, 2) NOT NULL,
	CONSTRAINT [PK_LigneCommande] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

ALTER TABLE [dbo].[LigneCommande] WITH CHECK ADD  CONSTRAINT [FK_LigneCommande_Commande] FOREIGN KEY([Commande]) REFERENCES [dbo].[Commande] ([Id])
--ALTER TABLE [dbo].[LigneCommande] CHECK CONSTRAINT [FK_LigneCommande_Commande]
GO

ALTER TABLE [dbo].[LigneCommande]  WITH CHECK ADD  CONSTRAINT [FK_LigneCommande_Produit] FOREIGN KEY([Produit]) REFERENCES [dbo].[Produit] ([Id])
--ALTER TABLE [dbo].[LigneCommande] CHECK CONSTRAINT [FK_LigneCommande_Produit]
GO

-- commande 1 : 3 crayons (2.50 l'unité) et 2 stabilo (3.80 l'unité)
-- commande 2 : 2 cahiers (2.15 l'unité) et 1 agrapheuse (10.60 l'unité)

DECLARE @produit1 uniqueidentifier = NEWID()
DECLARE @produit2 uniqueidentifier = NEWID()
DECLARE @produit3 uniqueidentifier = NEWID()
DECLARE @produit4 uniqueidentifier = NEWID()
insert Produit (Id, Libelle, Prix) values  ( @produit1,'Crayon', 2.5)
insert Produit (Id, Libelle, Prix) values  ( @produit2,'Stabilo', 3.8)
insert Produit (Id, Libelle, Prix) values  ( @produit3,'Cahier', 2.15)
insert Produit (Id, Libelle, Prix) values  ( @produit4,'Agrapheuse', 10.60)

DECLARE @C1 uniqueidentifier = NEWID()
DECLARE @C2 uniqueidentifier = NEWID()

insert Commande (Id, NoCommande, DateCommande) values (@C1, 'A1', GETDATE())
insert Commande (Id, NoCommande, DateCommande) values (@C2, 'A2', GETDATE())

insert LigneCommande (Id, Commande, Produit, Quantite, PrixUnitaire) values 
  (NEWID(), @C1, @produit1, 3, 2.5),
  (NEWID(), @C1, @produit2, 2, 3.80),
  (NEWID(), @C2, @produit3, 2, 2.15),
  (NEWID(), @C2, @produit4, 1, 10.60)

select * from LigneCommande
select SUM(Quantite * PrixUnitaire) Total from LigneCommande
