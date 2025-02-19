USE [master]
GO
/****** Object:  Database [GestEmp]    Script Date: 1/15/2017 5:41:27 PM ******/
CREATE DATABASE [GestEmp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GestEmp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\GestEmp.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GestEmp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\GestEmp_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [GestEmp] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GestEmp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GestEmp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GestEmp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GestEmp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GestEmp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GestEmp] SET ARITHABORT OFF 
GO
ALTER DATABASE [GestEmp] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [GestEmp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GestEmp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GestEmp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GestEmp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GestEmp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GestEmp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GestEmp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GestEmp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GestEmp] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GestEmp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GestEmp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GestEmp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GestEmp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GestEmp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GestEmp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GestEmp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GestEmp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GestEmp] SET  MULTI_USER 
GO
ALTER DATABASE [GestEmp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GestEmp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GestEmp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GestEmp] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [GestEmp] SET DELAYED_DURABILITY = DISABLED 
GO
USE [GestEmp]
GO
/****** Object:  User [u_zakaria]    Script Date: 1/15/2017 5:41:27 PM ******/
CREATE USER [u_zakaria] FOR LOGIN [L_Kasmi] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [u_Usef]    Script Date: 1/15/2017 5:41:27 PM ******/
CREATE USER [u_Usef] FOR LOGIN [L_Elmansari] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [u_zakaria]
GO
ALTER ROLE [db_owner] ADD MEMBER [u_Usef]
GO
/****** Object:  Table [dbo].[Compte]    Script Date: 1/15/2017 5:41:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Compte](
	[ID_COMPT] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](30) NULL,
	[password] [varchar](30) NULL,
 CONSTRAINT [PK_compte] PRIMARY KEY CLUSTERED 
(
	[ID_COMPT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Departement]    Script Date: 1/15/2017 5:41:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departement](
	[ID_DEPT] [int] IDENTITY(1,1) NOT NULL,
	[Dept_Nom] [varchar](20) NULL,
 CONSTRAINT [Pk_Departement] PRIMARY KEY CLUSTERED 
(
	[ID_DEPT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 1/15/2017 5:41:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[ID_EMP] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](20) NULL,
	[Prenom] [varchar](20) NULL,
	[Tel] [varchar](17) NULL,
	[Email] [varchar](100) NULL,
	[DateN] [date] NULL,
	[Date_Emb] [date] NULL,
	[sexe] [char](1) NULL,
	[Salaire] [money] NULL DEFAULT ((0)),
	[Adress] [varchar](100) NULL DEFAULT (NULL),
	[Id_pays] [int] NULL,
	[id_region] [int] NULL,
	[id_ville] [int] NULL,
	[id_dept] [int] NULL,
	[id_poste] [int] NULL,
	[Photo] [image] NULL,
	[Age] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[ID_EMP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pays]    Script Date: 1/15/2017 5:41:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pays](
	[ID_PAYS] [int] IDENTITY(1,1) NOT NULL,
	[Nom_pays] [nvarchar](50) NULL,
 CONSTRAINT [PK_Pays] PRIMARY KEY CLUSTERED 
(
	[ID_PAYS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Poste]    Script Date: 1/15/2017 5:41:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Poste](
	[ID_POSTE] [int] IDENTITY(1,1) NOT NULL,
	[Post_nom] [varchar](50) NULL,
	[id_dept] [int] NULL,
 CONSTRAINT [Pk_poste] PRIMARY KEY CLUSTERED 
(
	[ID_POSTE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Region]    Script Date: 1/15/2017 5:41:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[ID_Region] [int] IDENTITY(1,1) NOT NULL,
	[Nom_region] [nvarchar](50) NULL,
	[id_pays] [int] NULL,
 CONSTRAINT [PK_region] PRIMARY KEY CLUSTERED 
(
	[ID_Region] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ville]    Script Date: 1/15/2017 5:41:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ville](
	[ID_VILLE] [int] IDENTITY(1,1) NOT NULL,
	[Nom_ville] [varchar](50) NULL,
	[id_region] [int] NULL,
 CONSTRAINT [Pk_ville] PRIMARY KEY CLUSTERED 
(
	[ID_VILLE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Departement] ON 

INSERT [dbo].[Departement] ([ID_DEPT], [Dept_Nom]) VALUES (1, N'Comptabilité')
INSERT [dbo].[Departement] ([ID_DEPT], [Dept_Nom]) VALUES (2, N'Marketing')
INSERT [dbo].[Departement] ([ID_DEPT], [Dept_Nom]) VALUES (3, N'Communication')
INSERT [dbo].[Departement] ([ID_DEPT], [Dept_Nom]) VALUES (4, N'Commerce')
INSERT [dbo].[Departement] ([ID_DEPT], [Dept_Nom]) VALUES (5, N'Programmation')
SET IDENTITY_INSERT [dbo].[Departement] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([ID_EMP], [Nom], [Prenom], [Tel], [Email], [DateN], [Date_Emb], [sexe], [Salaire], [Adress], [Id_pays], [id_region], [id_ville], [id_dept], [id_poste], [Photo], [Age]) VALUES (2, N'Hamid', N'Jilali', N'0611', N'Hamid@hotmail.fr', CAST(N'2017-01-02' AS Date), CAST(N'2017-01-10' AS Date), N'M', 34444.0000, N'tanger ', 1, 3, 143, 1, 1, NULL, NULL)
INSERT [dbo].[Employee] ([ID_EMP], [Nom], [Prenom], [Tel], [Email], [DateN], [Date_Emb], [sexe], [Salaire], [Adress], [Id_pays], [id_region], [id_ville], [id_dept], [id_poste], [Photo], [Age]) VALUES (3, N'dddd', N'rrrrr', N'0622334455', N'Samir@hotmail.fr', CAST(N'2017-01-05' AS Date), CAST(N'2017-01-12' AS Date), N'M', 34444.0000, N'Nador', 1, 4, 152, 2, 5, NULL, NULL)
INSERT [dbo].[Employee] ([ID_EMP], [Nom], [Prenom], [Tel], [Email], [DateN], [Date_Emb], [sexe], [Salaire], [Adress], [Id_pays], [id_region], [id_ville], [id_dept], [id_poste], [Photo], [Age]) VALUES (4, N'Casey', N'Neistat', N'0655667722', N'Casey@hotmail.fr', CAST(N'2016-12-27' AS Date), CAST(N'2017-01-03' AS Date), N'M', 34444.0000, N'Feseeee', 3, 17, 354, 2, 5, NULL, NULL)
INSERT [dbo].[Employee] ([ID_EMP], [Nom], [Prenom], [Tel], [Email], [DateN], [Date_Emb], [sexe], [Salaire], [Adress], [Id_pays], [id_region], [id_ville], [id_dept], [id_poste], [Photo], [Age]) VALUES (5, N'Remy', N'Gaillard', N'09876', N'Remy@hotmail.fr', CAST(N'2017-01-18' AS Date), CAST(N'2017-01-17' AS Date), N'M', 34444.0000, N'ADIDAS', 1, 2, 129, 3, 10, NULL, NULL)
INSERT [dbo].[Employee] ([ID_EMP], [Nom], [Prenom], [Tel], [Email], [DateN], [Date_Emb], [sexe], [Salaire], [Adress], [Id_pays], [id_region], [id_ville], [id_dept], [id_poste], [Photo], [Age]) VALUES (6, N'mark', N'jack', N'1022030', N'mark@hotmail.com', CAST(N'2010-02-10' AS Date), CAST(N'2017-01-18' AS Date), N'M', 67000.0000, N'Rabat', 1, 4, 153, 1, 1, NULL, NULL)
INSERT [dbo].[Employee] ([ID_EMP], [Nom], [Prenom], [Tel], [Email], [DateN], [Date_Emb], [sexe], [Salaire], [Adress], [Id_pays], [id_region], [id_ville], [id_dept], [id_poste], [Photo], [Age]) VALUES (7, N'Roz', N'Dennis', N'123456', N'Dennis@hotmail.com', CAST(N'2010-02-03' AS Date), CAST(N'2017-01-18' AS Date), N'M', 3000.0000, N'Rabat', 3, 17, 353, 2, 7, NULL, NULL)
INSERT [dbo].[Employee] ([ID_EMP], [Nom], [Prenom], [Tel], [Email], [DateN], [Date_Emb], [sexe], [Salaire], [Adress], [Id_pays], [id_region], [id_ville], [id_dept], [id_poste], [Photo], [Age]) VALUES (8, N'roza', N'andy', N'000111', N'Roza@hotmail.com', CAST(N'2010-02-03' AS Date), CAST(N'2017-01-18' AS Date), N'F', 12000.0000, N'Tetouan rue 5903', 1, 4, 153, 2, 4, NULL, NULL)
INSERT [dbo].[Employee] ([ID_EMP], [Nom], [Prenom], [Tel], [Email], [DateN], [Date_Emb], [sexe], [Salaire], [Adress], [Id_pays], [id_region], [id_ville], [id_dept], [id_poste], [Photo], [Age]) VALUES (9, N'lisa', N'braun', N'0022334', N'Lisa@hotmail.com', CAST(N'2010-02-03' AS Date), CAST(N'2017-01-18' AS Date), N'F', 1500.0000, N'Lile BV 343', 3, 17, 353, 3, 11, NULL, NULL)
INSERT [dbo].[Employee] ([ID_EMP], [Nom], [Prenom], [Tel], [Email], [DateN], [Date_Emb], [sexe], [Salaire], [Adress], [Id_pays], [id_region], [id_ville], [id_dept], [id_poste], [Photo], [Age]) VALUES (10, N'Majid', N'Hamid', N'00123', N'Majjid@hotmail.com', CAST(N'2010-02-05' AS Date), CAST(N'2017-01-18' AS Date), N'M', 25000.0000, N'Meknes BV 347', 1, 6, 215, 4, 13, NULL, NULL)
INSERT [dbo].[Employee] ([ID_EMP], [Nom], [Prenom], [Tel], [Email], [DateN], [Date_Emb], [sexe], [Salaire], [Adress], [Id_pays], [id_region], [id_ville], [id_dept], [id_poste], [Photo], [Age]) VALUES (11, N'Amine', N'Jalal', N'001235', N'Jalal@hotmail.com', CAST(N'2010-02-05' AS Date), CAST(N'2017-01-18' AS Date), N'M', 255000.0000, N'FES BV 347', 1, 6, 220, 2, 7, NULL, NULL)
INSERT [dbo].[Employee] ([ID_EMP], [Nom], [Prenom], [Tel], [Email], [DateN], [Date_Emb], [sexe], [Salaire], [Adress], [Id_pays], [id_region], [id_ville], [id_dept], [id_poste], [Photo], [Age]) VALUES (12, N'khaldi', N'Aymen', N'0012351', N'Aymen@hotmail.com', CAST(N'2010-02-05' AS Date), CAST(N'2017-01-18' AS Date), N'M', 255000.0000, N'casa BV 506', 1, 9, 309, 1, 2, NULL, NULL)
INSERT [dbo].[Employee] ([ID_EMP], [Nom], [Prenom], [Tel], [Email], [DateN], [Date_Emb], [sexe], [Salaire], [Adress], [Id_pays], [id_region], [id_ville], [id_dept], [id_poste], [Photo], [Age]) VALUES (13, N'rajae', N'falla', N'05661', N'rajae@gmail.om', CAST(N'2017-01-11' AS Date), CAST(N'2017-01-11' AS Date), N'F', 400000.0000, N'oujda lazaret', 1, 8, 292, 5, 16, NULL, NULL)
INSERT [dbo].[Employee] ([ID_EMP], [Nom], [Prenom], [Tel], [Email], [DateN], [Date_Emb], [sexe], [Salaire], [Adress], [Id_pays], [id_region], [id_ville], [id_dept], [id_poste], [Photo], [Age]) VALUES (14, N'Kasmi', N'TTT', N'060101', N'Kasmi@hotmail.com', CAST(N'2017-01-12' AS Date), CAST(N'2017-01-12' AS Date), N'M', 600000.0000, N'najd fes', 1, 3, 145, 5, 16, NULL, NULL)
INSERT [dbo].[Employee] ([ID_EMP], [Nom], [Prenom], [Tel], [Email], [DateN], [Date_Emb], [sexe], [Salaire], [Adress], [Id_pays], [id_region], [id_ville], [id_dept], [id_poste], [Photo], [Age]) VALUES (47, N'AAAA', N'YYYY', N'0601013434', N'Kasmi@hotmail.com', CAST(N'2017-01-12' AS Date), CAST(N'2017-01-12' AS Date), N'M', 600000.0000, N'najd fes', 1, 3, 145, 5, 16, NULL, NULL)
INSERT [dbo].[Employee] ([ID_EMP], [Nom], [Prenom], [Tel], [Email], [DateN], [Date_Emb], [sexe], [Salaire], [Adress], [Id_pays], [id_region], [id_ville], [id_dept], [id_poste], [Photo], [Age]) VALUES (48, N'DDDDD', N'TTTT', N'060101424', N'Kasmi@hotmail.com', CAST(N'2017-01-12' AS Date), CAST(N'2017-01-12' AS Date), N'M', 600000.0000, N'najd fes', 1, 3, 145, 5, 16, NULL, NULL)
INSERT [dbo].[Employee] ([ID_EMP], [Nom], [Prenom], [Tel], [Email], [DateN], [Date_Emb], [sexe], [Salaire], [Adress], [Id_pays], [id_region], [id_ville], [id_dept], [id_poste], [Photo], [Age]) VALUES (49, N'FFFFF', N'RRR', N'06010136', N'Kasmi@hotmail.com', CAST(N'2017-01-12' AS Date), CAST(N'2017-01-12' AS Date), N'M', 600000.0000, N'najd fes', 1, 3, 145, 5, 16, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[Pays] ON 

INSERT [dbo].[Pays] ([ID_PAYS], [Nom_pays]) VALUES (1, N'Morroco')
INSERT [dbo].[Pays] ([ID_PAYS], [Nom_pays]) VALUES (3, N'france')
SET IDENTITY_INSERT [dbo].[Pays] OFF
SET IDENTITY_INSERT [dbo].[Poste] ON 

INSERT [dbo].[Poste] ([ID_POSTE], [Post_nom], [id_dept]) VALUES (1, N'Chef comptable', 1)
INSERT [dbo].[Poste] ([ID_POSTE], [Post_nom], [id_dept]) VALUES (2, N'Comptable unique', 1)
INSERT [dbo].[Poste] ([ID_POSTE], [Post_nom], [id_dept]) VALUES (3, N'Secrétaire comptable', 1)
INSERT [dbo].[Poste] ([ID_POSTE], [Post_nom], [id_dept]) VALUES (4, N'Assistant marketing', 2)
INSERT [dbo].[Poste] ([ID_POSTE], [Post_nom], [id_dept]) VALUES (5, N'Webmarketeur', 2)
INSERT [dbo].[Poste] ([ID_POSTE], [Post_nom], [id_dept]) VALUES (6, N'E-reputation manager', 2)
INSERT [dbo].[Poste] ([ID_POSTE], [Post_nom], [id_dept]) VALUES (7, N'Responsable merchandising', 2)
INSERT [dbo].[Poste] ([ID_POSTE], [Post_nom], [id_dept]) VALUES (8, N'Responsable promotion des ventes', 2)
INSERT [dbo].[Poste] ([ID_POSTE], [Post_nom], [id_dept]) VALUES (9, N'Traffic Manager', 2)
INSERT [dbo].[Poste] ([ID_POSTE], [Post_nom], [id_dept]) VALUES (10, N'Directeur De Communication', 3)
INSERT [dbo].[Poste] ([ID_POSTE], [Post_nom], [id_dept]) VALUES (11, N'Responsable communication en line', 3)
INSERT [dbo].[Poste] ([ID_POSTE], [Post_nom], [id_dept]) VALUES (12, N'Attaché Commercial', 4)
INSERT [dbo].[Poste] ([ID_POSTE], [Post_nom], [id_dept]) VALUES (13, N'CONSEILLER COMMERCIAL', 4)
INSERT [dbo].[Poste] ([ID_POSTE], [Post_nom], [id_dept]) VALUES (14, N'Chef commercial', 4)
INSERT [dbo].[Poste] ([ID_POSTE], [Post_nom], [id_dept]) VALUES (15, N'Web Designer', 5)
INSERT [dbo].[Poste] ([ID_POSTE], [Post_nom], [id_dept]) VALUES (16, N'Développeur web', 5)
INSERT [dbo].[Poste] ([ID_POSTE], [Post_nom], [id_dept]) VALUES (17, N'Développeur d’applications', 5)
INSERT [dbo].[Poste] ([ID_POSTE], [Post_nom], [id_dept]) VALUES (18, N'Ingénieur Web', 5)
SET IDENTITY_INSERT [dbo].[Poste] OFF
SET IDENTITY_INSERT [dbo].[Region] ON 

INSERT [dbo].[Region] ([ID_Region], [Nom_region], [id_pays]) VALUES (1, N'Oued Ed-Dahab - Lagouira', 1)
INSERT [dbo].[Region] ([ID_Region], [Nom_region], [id_pays]) VALUES (2, N'Laâyoune - Boujdour - Sakia El Hamra', 1)
INSERT [dbo].[Region] ([ID_Region], [Nom_region], [id_pays]) VALUES (3, N'Guelmim - Es-Semara', 1)
INSERT [dbo].[Region] ([ID_Region], [Nom_region], [id_pays]) VALUES (4, N'Souss - Massa - Daraa', 1)
INSERT [dbo].[Region] ([ID_Region], [Nom_region], [id_pays]) VALUES (5, N'Gharb - Chrarda - Béni Hssen', 1)
INSERT [dbo].[Region] ([ID_Region], [Nom_region], [id_pays]) VALUES (6, N'Chaouia - Ouardigha', 1)
INSERT [dbo].[Region] ([ID_Region], [Nom_region], [id_pays]) VALUES (7, N'Marrakech - Tensift - Al Haouz', 1)
INSERT [dbo].[Region] ([ID_Region], [Nom_region], [id_pays]) VALUES (8, N'Oriental', 1)
INSERT [dbo].[Region] ([ID_Region], [Nom_region], [id_pays]) VALUES (9, N'Grand Casablanca', 1)
INSERT [dbo].[Region] ([ID_Region], [Nom_region], [id_pays]) VALUES (10, N'Rabat - Salé - Zemmour - Zaer', 1)
INSERT [dbo].[Region] ([ID_Region], [Nom_region], [id_pays]) VALUES (11, N'Doukala - Abda', 1)
INSERT [dbo].[Region] ([ID_Region], [Nom_region], [id_pays]) VALUES (12, N'Tadla Azilal', 1)
INSERT [dbo].[Region] ([ID_Region], [Nom_region], [id_pays]) VALUES (13, N'Meknès - Tafilalet', 1)
INSERT [dbo].[Region] ([ID_Region], [Nom_region], [id_pays]) VALUES (14, N'Fès - Boulmane', 1)
INSERT [dbo].[Region] ([ID_Region], [Nom_region], [id_pays]) VALUES (15, N'Taza - Al Hoceima - Taounate', 1)
INSERT [dbo].[Region] ([ID_Region], [Nom_region], [id_pays]) VALUES (16, N'Tanger - Tétouan', 1)
INSERT [dbo].[Region] ([ID_Region], [Nom_region], [id_pays]) VALUES (17, N'region Lile', 3)
INSERT [dbo].[Region] ([ID_Region], [Nom_region], [id_pays]) VALUES (18, N'region nice', 3)
INSERT [dbo].[Region] ([ID_Region], [Nom_region], [id_pays]) VALUES (19, N'region Paris', 3)
SET IDENTITY_INSERT [dbo].[Region] OFF
SET IDENTITY_INSERT [dbo].[Ville] ON 

INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (1, N'Afourar ', 12)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (2, N'Aït Majden ', 12)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (3, N'Azilal ', 12)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (4, N'Beni Ayat ', 12)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (5, N'Béni Mellal ', 12)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (6, N'Bradia ', 12)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (7, N'Bzou ', 12)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (8, N'Dar Oulad Zidouh ', 12)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (9, N'Demnate ', 12)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (10, N'Dra a ', 12)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (11, N'El Ksiba ', 12)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (12, N'Foum Jemaâ ', 12)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (13, N'Ouaouizeght ', 12)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (14, N'Oulad Ayad ', 12)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (15, N'Oulad Yaïch ', 12)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (16, N'Ouled M barek ', 12)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (17, N'Sidi Jaber ', 12)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (18, N'Souk Sebt Oulad Nemma ', 12)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (19, N'Zaouïat Cheikh ', 12)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (20, N'Aghbalou  ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (21, N'Aghbalou  ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (22, N'Aïn Jemaa ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (23, N'Aïn Karma ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (24, N'Aïn Leuh ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (25, N'Ain Taoujdate ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (26, N'Aït Boubidmane ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (27, N'Aoufous ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (28, N'Arfoud ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (29, N'Azrou  ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (30, N'Boudnib ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (31, N'Boufakrane ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (32, N'Boumia  ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (33, N'Er-Rich ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (34, N'Errachidia ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (35, N'Gardmit ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (36, N'Goulmima ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (37, N'Gourrama ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (38, N'Had Bouhssoussen ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (39, N'Haj Kaddour ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (40, N'Ifrane ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (41, N'Itzer ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (42, N'Jorf  ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (43, N'Kehf Nsour ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (44, N'Kerrouchen ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (45, N'M haya ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (46, N'Midelt ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (47, N'Midelt ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (48, N'Oued Ifrane ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (49, N'Sabaâ Aïyoun ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (50, N'Sebt Jahjouh ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (51, N'Sidi Addi ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (52, N'Tichoute ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (53, N'Tighza ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (54, N'Timahdite ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (55, N'Tinejdad ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (56, N'Tizguite ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (57, N'Tounfite ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (58, N'Zaïda ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (59, N'Zaouia d Ifrane ', 13)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (60, N'Aderj ', 14)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (61, N'Aïn Cheggag ', 14)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (62, N'Bhalil ', 14)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (63, N'Boulemane ', 14)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (64, N'El Menzel ', 14)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (65, N'Guigou ', 14)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (66, N'Imouzzer Kandar ', 14)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (67, N'Imouzzer Marmoucha ', 14)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (68, N'Imouzzer Marmoucha ', 14)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (69, N'Moulay Yaâcoub ', 14)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (70, N'Ouled Tayeb ', 14)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (71, N'Outat El Haj ', 14)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (72, N'Ribate El Kheir ', 14)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (73, N'Séfrou ', 14)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (74, N'Sidi Youssef Ben Ahmed ', 14)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (75, N'Skhinate ', 14)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (76, N'Tafajight ', 14)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (77, N'Ajdir  ', 15)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (78, N'Aknoul ', 15)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (79, N'Al Hoceïma ', 15)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (80, N'Beni Bouayach ', 15)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (81, N'Bni Hadifa ', 15)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (82, N'Ghafsai ', 15)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (83, N'Guercif ', 15)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (84, N'Imzouren ', 15)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (85, N'Inahnahen ', 15)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (86, N'Karia ', 15)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (87, N'Karia Ba Mohamed ', 15)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (88, N'Oued Amlil ', 15)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (89, N'Oulad Zbaïr ', 15)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (90, N'Tahla ', 15)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (91, N'Taïnaste ', 15)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (92, N'Tala Tazegwaght ', 15)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (93, N'Tamassint ', 15)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (94, N'Targuist ', 15)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (95, N'Taza ', 15)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (96, N'Thar Es-Souk ', 15)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (97, N'Tissa ', 15)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (98, N'Tizi Ouasli ', 15)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (99, N'Zerarda ', 15)
GO
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (100, N'Akchour ', 16)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (101, N'Assilah ', 16)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (102, N'Bab Berred ', 16)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (103, N'Bab Taza ', 16)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (104, N'Brikcha ', 16)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (105, N'Chefchaouen ', 16)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (106, N'Dar Bni Karrich ', 16)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (107, N'Dar Chaoui ', 16)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (108, N'Fnideq ', 16)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (109, N'Gueznaia ', 16)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (110, N'Jebha ', 16)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (111, N'Karia  ', 16)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (112, N'Khémis Sahel ', 16)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (113, N'Ksar El Kébir ', 16)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (114, N'Larache ', 16)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (115, N'M diq ', 16)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (116, N'Martil ', 16)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (117, N'Mellousa ', 16)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (118, N'Mohamed ben Abdallah el-Raisuni ', 16)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (119, N'Moqrisset ', 16)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (120, N'Oued Laou ', 16)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (121, N'Oued Rmel ', 16)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (122, N'Ouezzane ', 16)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (123, N'Point Cires ', 16)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (124, N'Sidi Lyamani ', 16)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (125, N'Zinat ', 16)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (126, N'Aousserd', 1)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (127, N'oued Eddahab', 1)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (128, N'Boujdour', 2)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (129, N'lamssid', 2)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (130, N'Jraifia', 2)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (131, N'Gueltat Zemmour', 2)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (132, N'Laayoun', 2)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (133, N'Dcheira', 2)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (134, N'Boukrra', 2)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (135, N'foum el Oued', 2)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (136, N'El Hagounia', 2)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (137, N'Daoura', 2)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (138, N'Tah', 2)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (139, N'Tarfaya', 2)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (140, N'Akhfennir', 2)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (141, N'Akka', 3)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (142, N'Assa', 3)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (143, N'Fam El Hisn', 3)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (144, N'Foum Zguid', 3)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (145, N'El Ouatia', 3)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (146, N'Es-Semara', 3)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (147, N'Bouizakarne', 3)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (148, N'Guelmim', 3)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (149, N'Taghjijt', 3)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (150, N'Tan-Tan', 3)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (151, N'Zag', 3)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (152, N'Agni Izimmer', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (153, N'Aït Baha', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (154, N'Aït Hani', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (155, N'Aït Iaâza', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (156, N'Aït Melloul', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (157, N'Aït Yalla', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (158, N'Alnif', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (159, N'Anzi', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (160, N'Aoulouz', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (161, N'Aourir', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (162, N'Arazane', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (163, N'Bengammoud', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (164, N'Biougra', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (165, N'Boumalne-Dadès', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (166, N'Dcheira El Jihadia', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (167, N'Drargua', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (168, N'El Guerdane', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (169, N'Harte Lyamine', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (170, N'Ida Ougnidif', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (171, N'Ifri', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (172, N'Igdamen', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (173, N'Ighil nOumgoun', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (174, N'Inezgane', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (175, N'Irherm', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (176, N'Kelaat-M Gouna', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (177, N'Lakhsas', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (178, N'Lqliâa', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (179, N'M semrir', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (180, N'Megousse', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (181, N'Oulad Berhil', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (182, N'Oulad Teïma', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (183, N'Sidi Ifni', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (184, N'Tabounte', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (185, N'Tafraout', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (186, N'Taghzout', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (187, N'Taliouine', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (188, N'Tamegroute', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (189, N'Tamraght', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (190, N'Tanoumrite Nkob Zagora', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (191, N'Taourirt Ait Zaghar', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (192, N'Tifnit', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (193, N'Tinfou', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (194, N'Tinghir', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (195, N'Tisgdal', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (196, N'Tiznit', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (197, N'Toumliline', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (198, N'Zagora', 4)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (199, N'Aïn Dorij', 5)
GO
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (200, N'Dar Gueddari', 5)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (201, N'Had Kourt', 5)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (202, N'Jorf El Melha', 5)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (203, N'Khenichet ', 5)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (204, N'Mechra Bel Ksiri', 5)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (205, N'Mehdia', 5)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (206, N'Moulay Bousselham', 5)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (207, N'Sidi Allal Tazi', 5)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (208, N'Sidi Kacem', 5)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (209, N'Sidi Slimane', 5)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (210, N'Sidi Taïbi', 5)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (211, N'Sidi Yahya El Gharb', 5)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (212, N'Ben Ahmed', 6)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (213, N'Benslimane', 6)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (214, N'Berrechid', 6)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (215, N'Boujniba', 6)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (216, N'Boulanouare', 6)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (217, N'Bouznika', 6)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (218, N'Bouznika', 6)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (219, N'El Borouj', 6)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (220, N'El Gara', 6)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (221, N'El Gara', 6)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (222, N'Hattane', 6)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (223, N'Loulad', 6)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (224, N'Oued Zem', 6)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (225, N'Oulad Abbou', 6)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (226, N'Oulad H Riz Sahel', 6)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (227, N'Oulad M rah', 6)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (228, N'Oulad Saïd', 6)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (229, N'Oulad Sidi Ben Daoud', 6)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (230, N'Ras El Aïn', 6)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (231, N'Settat', 6)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (232, N'Sidi Hajjaj', 6)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (233, N'Sidi Rahhal Chataï', 6)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (234, N'Aït Ourir', 7)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (235, N'Amizmiz', 7)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (236, N'Assahrij', 7)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (237, N'Ben Guerir', 7)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (238, N'Bouchane', 7)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (239, N'Chichaoua', 7)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (240, N'El Hanchane', 7)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (241, N'El Kelaâ des Sraghna', 7)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (242, N'Essaouira', 7)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (243, N'Essaouira', 7)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (244, N'Ghmate ', 7)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (245, N'Ighounane', 7)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (246, N'Imintanoute', 7)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (247, N'Imintanoute', 7)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (248, N'Moulay Brahim', 7)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (249, N'Sid L Mokhtar', 7)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (250, N'Sidi Bou Othmane', 7)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (251, N'Sidi Rahhal', 7)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (252, N'Tahannaout', 7)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (253, N'Talmest', 7)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (254, N'Tamallalt', 7)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (255, N'Tamanar', 7)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (256, N'Tamansourt', 7)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (257, N'Tameslouht', 7)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (258, N'Ahfir', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (259, N'Aïn Beni Mathar', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (260, N'Aïn Chaïr', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (261, N'Aïn Erreggada', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (262, N'Aïn Erreggada', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (263, N'Al Aroui', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (264, N'Ben Taïeb', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (265, N'Beni Chiker', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (266, N'Beni Ensar', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (267, N'Berkane', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (268, N'Bni Drar', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (269, N'Bni Tadjite', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (270, N'Bni Tadjite', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (271, N'Bouarfa ', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (272, N'Bouarfa ', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (273, N'Dar El Kebdani', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (274, N'Debdou', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (275, N'Douar Kannine', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (276, N'Driouch', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (277, N'El Aïoun Sidi Mellouk', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (278, N'Farkhana', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (279, N'Figuig', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (280, N'Ihddaden', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (281, N'Jaâdar', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (282, N'Jerada', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (283, N'Kariat Arekmane', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (284, N'Kassita', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (285, N'Kerouna', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (286, N'Laâtamna ', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (287, N'Madagh ', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (288, N'Midar', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (289, N'Nador ', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (290, N'Naïma ', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (291, N'Oued Heimer', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (292, N'Oujda', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (293, N'Ras El Ma ', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (294, N'Saïdia', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (295, N'Selouane', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (296, N'Sidi Boubker', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (297, N'Sidi Lahsen', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (298, N'Sidi Slimane Echcharaa', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (299, N'Talsint', 8)
GO
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (300, N'Taourirt ', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (301, N'Tendrara', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (302, N'Tiztoutine', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (303, N'Touima', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (304, N'Touissit', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (305, N'Zaïo', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (306, N'Zeghanghane', 8)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (307, N'Aïn Harrouda', 9)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (308, N'Bni Yakhlef', 9)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (309, N'Bouskoura', 9)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (310, N'El Mansouria', 9)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (311, N'Médiouna ', 9)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (312, N'Nouaceur', 9)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (313, N'Tit Mellil', 9)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (314, N'Ain El Aouda', 10)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (315, N'Khémisset', 10)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (316, N'Oulmès', 10)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (317, N'Sala Al Jadida', 10)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (318, N'Sidi Allal El Bahraoui', 10)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (319, N'Sidi Bouknadel', 10)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (320, N'Skhirat', 10)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (321, N'Tamesna', 10)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (322, N'Tiddas', 10)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (323, N'Tiflet', 10)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (324, N'Azemmour', 11)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (325, N'Bir Jdid', 11)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (326, N'Bouguedra', 11)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (327, N'Echemmaia', 11)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (328, N'El Jadida', 11)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (329, N'Hrara', 11)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (330, N'Ighoud', 11)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (331, N'Jamâat Shaim', 11)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (332, N'Khemis Zemamra', 11)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (333, N'Laakarta', 11)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (334, N'Laâounate', 11)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (335, N'Oualidia', 11)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (336, N'Oulad Amrane', 11)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (337, N'Oulad Frej', 11)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (338, N'Oulad Ghadbane', 11)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (339, N'Ras El Ain ', 11)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (340, N'Safi ', 11)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (341, N'Sebt El Maârif', 11)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (342, N'Sebt Gzoula', 11)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (343, N'Sidi Ahmed', 11)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (344, N'Sidi Ali Ben Hamdouche', 11)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (345, N'Sidi Bennour', 11)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (346, N'Sidi Bouzid ', 11)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (347, N'Sidi Smaïl ', 11)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (348, N'Youssoufia  ', 11)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (349, N'Nica', 18)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (350, N'Nice', 18)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (351, N'eiffel', 19)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (352, N'Paris', 19)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (353, N'Lile', 17)
INSERT [dbo].[Ville] ([ID_VILLE], [Nom_ville], [id_region]) VALUES (354, N'Loula', 17)
SET IDENTITY_INSERT [dbo].[Ville] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Employee__C451FA8DFB0DCDA3]    Script Date: 1/15/2017 5:41:29 PM ******/
ALTER TABLE [dbo].[Employee] ADD UNIQUE NONCLUSTERED 
(
	[Tel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Dpt] FOREIGN KEY([id_dept])
REFERENCES [dbo].[Departement] ([ID_DEPT])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Dpt]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_pays] FOREIGN KEY([Id_pays])
REFERENCES [dbo].[Pays] ([ID_PAYS])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_pays]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_poste] FOREIGN KEY([id_poste])
REFERENCES [dbo].[Poste] ([ID_POSTE])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_poste]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Region] FOREIGN KEY([id_region])
REFERENCES [dbo].[Region] ([ID_Region])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Region]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Ville] FOREIGN KEY([id_ville])
REFERENCES [dbo].[Ville] ([ID_VILLE])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Ville]
GO
ALTER TABLE [dbo].[Poste]  WITH CHECK ADD  CONSTRAINT [id_dept_departement] FOREIGN KEY([id_dept])
REFERENCES [dbo].[Departement] ([ID_DEPT])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Poste] CHECK CONSTRAINT [id_dept_departement]
GO
ALTER TABLE [dbo].[Region]  WITH CHECK ADD  CONSTRAINT [FK_region] FOREIGN KEY([id_pays])
REFERENCES [dbo].[Pays] ([ID_PAYS])
GO
ALTER TABLE [dbo].[Region] CHECK CONSTRAINT [FK_region]
GO
ALTER TABLE [dbo].[Ville]  WITH CHECK ADD  CONSTRAINT [FK_ville] FOREIGN KEY([id_region])
REFERENCES [dbo].[Region] ([ID_Region])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ville] CHECK CONSTRAINT [FK_ville]
GO
ALTER TABLE [dbo].[Compte]  WITH CHECK ADD  CONSTRAINT [Ck_Password] CHECK  ((NOT [Password] like '%['']%' AND NOT [Password] like '%["]%'))
GO
ALTER TABLE [dbo].[Compte] CHECK CONSTRAINT [Ck_Password]
GO
ALTER TABLE [dbo].[Compte]  WITH CHECK ADD  CONSTRAINT [Ck_Username] CHECK  ((NOT [Username] like '%['']%' AND NOT [Username] like '%["]%'))
GO
ALTER TABLE [dbo].[Compte] CHECK CONSTRAINT [Ck_Username]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [ck_age_EMP] CHECK  (([Age]>(18)))
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [ck_age_EMP]
GO
USE [master]
GO
ALTER DATABASE [GestEmp] SET  READ_WRITE 
GO
