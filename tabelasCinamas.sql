USE [FilmesCinemasSessoes5]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 08/10/2017 17:15:10 ******/
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
/****** Object:  Table [dbo].[Cinemas]    Script Date: 08/10/2017 17:15:10 ******/
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
/****** Object:  Table [dbo].[Enderecoes]    Script Date: 08/10/2017 17:15:10 ******/
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
/****** Object:  Table [dbo].[Filmes]    Script Date: 08/10/2017 17:15:10 ******/
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
/****** Object:  Table [dbo].[Sessaos]    Script Date: 08/10/2017 17:15:10 ******/
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
