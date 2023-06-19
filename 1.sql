USE [master]
GO
CREATE DATABASE [VeloBD] ON PRIMARY
  ( 
  NAME = 'VeloBD', 
  FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\VeloBD.mdf' , 
  SIZE = 8192KB , 
  MAXSIZE = UNLIMITED, 
  FILEGROWTH = 65536KB 
  )
  LOG ON 
  ( 
	NAME = N'VeloBD_log', 
	FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\VeloBD_log.ldf' , 
	SIZE = 8192KB , 
	MAXSIZE = 2048GB , 
	FILEGROWTH = 65536KB 
  )
GO
USE [VeloBD]
GO
CREATE TABLE dbo.Adresse
(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Libelle] [nvarchar](max) NULL,
	[CodePostal] [varchar](10) NULL,
	[Ville] [nvarchar](max) NOT NULL,
	CONSTRAINT [PK_Adresse] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO
CREATE TABLE [dbo].[Personne]
(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [nvarchar](max) NOT NULL,
	[Prenom] [nvarchar](max) NOT NULL,
	[Adresse] [int] NULL,
	CONSTRAINT [PK_Personne] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO
ALTER TABLE [dbo].[Personne]  WITH CHECK ADD  CONSTRAINT [FK_Personne_Adresse1] FOREIGN KEY([Adresse]) REFERENCES [dbo].[Adresse] ([Id])
ALTER TABLE [dbo].[Personne] CHECK CONSTRAINT [FK_Personne_Adresse1]
GO
insert into Adresse (Ville) values
('Lyon'),
('Paris'),
('Marseille')
GO
insert into Personne (Nom, Prenom, Adresse) values
  ('Zola', 'Emile', 1),
  ('Hugo', 'Victor', 2),
  ('Dupont', 'Pierre', 3),
  ('Robespierre', 'Maximilien', 1),
  ('Valjean', 'Jean', NULL)

select * from Personne
select * from Adresse
