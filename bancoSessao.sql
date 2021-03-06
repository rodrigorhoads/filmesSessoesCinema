USE [master]
GO
/****** Object:  Database [FilmesCinemasSessoes5]    Script Date: 08/10/2017 17:11:22 ******/
CREATE DATABASE [FilmesCinemasSessoes5]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FilmesCinemasSessoes5', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FilmesCinemasSessoes5.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FilmesCinemasSessoes5_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FilmesCinemasSessoes5_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FilmesCinemasSessoes5] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FilmesCinemasSessoes5].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FilmesCinemasSessoes5] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FilmesCinemasSessoes5] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FilmesCinemasSessoes5] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FilmesCinemasSessoes5] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FilmesCinemasSessoes5] SET ARITHABORT OFF 
GO
ALTER DATABASE [FilmesCinemasSessoes5] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FilmesCinemasSessoes5] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FilmesCinemasSessoes5] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FilmesCinemasSessoes5] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FilmesCinemasSessoes5] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FilmesCinemasSessoes5] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FilmesCinemasSessoes5] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FilmesCinemasSessoes5] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FilmesCinemasSessoes5] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FilmesCinemasSessoes5] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FilmesCinemasSessoes5] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FilmesCinemasSessoes5] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FilmesCinemasSessoes5] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FilmesCinemasSessoes5] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FilmesCinemasSessoes5] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FilmesCinemasSessoes5] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [FilmesCinemasSessoes5] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FilmesCinemasSessoes5] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FilmesCinemasSessoes5] SET  MULTI_USER 
GO
ALTER DATABASE [FilmesCinemasSessoes5] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FilmesCinemasSessoes5] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FilmesCinemasSessoes5] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FilmesCinemasSessoes5] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FilmesCinemasSessoes5] SET DELAYED_DURABILITY = DISABLED 
GO
USE [FilmesCinemasSessoes5]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 08/10/2017 17:11:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cinemas]    Script Date: 08/10/2017 17:11:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cinemas](
	[CinemaID] [int] IDENTITY(1,1) NOT NULL,
	[SessaoID] [int] NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.Cinemas] PRIMARY KEY CLUSTERED 
(
	[CinemaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Enderecoes]    Script Date: 08/10/2017 17:11:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enderecoes](
	[CinemaID] [int] NOT NULL,
	[Rua] [nvarchar](50) NOT NULL,
	[Numero] [int] NOT NULL,
	[Complemento] [nvarchar](max) NULL,
	[CEP] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Enderecoes] PRIMARY KEY CLUSTERED 
(
	[CinemaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Filmes]    Script Date: 08/10/2017 17:11:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Filmes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
	[Genero] [nvarchar](50) NOT NULL,
	[ClassificacaoIndicativa] [nvarchar](max) NULL,
	[Duracao] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Filmes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sessaos]    Script Date: 08/10/2017 17:11:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sessaos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CinemaID] [int] NOT NULL,
	[FilmeID] [int] NOT NULL,
	[Horario] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Sessaos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [IX_CinemaID]    Script Date: 08/10/2017 17:11:22 ******/
CREATE NONCLUSTERED INDEX [IX_CinemaID] ON [dbo].[Enderecoes]
(
	[CinemaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CinemaID]    Script Date: 08/10/2017 17:11:22 ******/
CREATE NONCLUSTERED INDEX [IX_CinemaID] ON [dbo].[Sessaos]
(
	[CinemaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FilmeID]    Script Date: 08/10/2017 17:11:22 ******/
CREATE NONCLUSTERED INDEX [IX_FilmeID] ON [dbo].[Sessaos]
(
	[FilmeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Enderecoes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Enderecoes_dbo.Cinemas_CinemaID] FOREIGN KEY([CinemaID])
REFERENCES [dbo].[Cinemas] ([CinemaID])
GO
ALTER TABLE [dbo].[Enderecoes] CHECK CONSTRAINT [FK_dbo.Enderecoes_dbo.Cinemas_CinemaID]
GO
ALTER TABLE [dbo].[Sessaos]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Sessaos_dbo.Cinemas_CinemaID] FOREIGN KEY([CinemaID])
REFERENCES [dbo].[Cinemas] ([CinemaID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Sessaos] CHECK CONSTRAINT [FK_dbo.Sessaos_dbo.Cinemas_CinemaID]
GO
ALTER TABLE [dbo].[Sessaos]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Sessaos_dbo.Filmes_FilmeID] FOREIGN KEY([FilmeID])
REFERENCES [dbo].[Filmes] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Sessaos] CHECK CONSTRAINT [FK_dbo.Sessaos_dbo.Filmes_FilmeID]
GO
USE [master]
GO
ALTER DATABASE [FilmesCinemasSessoes5] SET  READ_WRITE 
GO
