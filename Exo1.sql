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
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Libelle] [nvarchar](max) NOT NULL,
	Prix decimal(18,2) NOT NULL,
	CONSTRAINT [PK_Produit] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO
CREATE TABLE dbo.Commande
(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	NoCommande [nvarchar](max) NOT NULL,
	DateCommande DateTime NOT NULL,
	CONSTRAINT [PK_Commande] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO
USE [VenteBD]
GO

/****** Object:  Table [dbo].[LigneCommande]    Script Date: 19/06/2023 17:25:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LigneCommande](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Commande] [int] NOT NULL,
	[Produit] [int] NOT NULL,
	[Quantite] [int] NOT NULL,
	[PrixUnitaire] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_LigneCommande] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[LigneCommande]  WITH CHECK ADD  CONSTRAINT [FK_LigneCommande_Commande] FOREIGN KEY([Commande]) REFERENCES [dbo].[Commande] ([Id])
ALTER TABLE [dbo].[LigneCommande] CHECK CONSTRAINT [FK_LigneCommande_Commande]
GO

ALTER TABLE [dbo].[LigneCommande]  WITH CHECK ADD  CONSTRAINT [FK_LigneCommande_Produit] FOREIGN KEY([Produit]) REFERENCES [dbo].[Produit] ([Id])
ALTER TABLE [dbo].[LigneCommande] CHECK CONSTRAINT [FK_LigneCommande_Produit]
GO


