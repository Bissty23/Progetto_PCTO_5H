USE [master]
GO
/****** Object:  Database [PCTO]    Script Date: 11/05/2022 19:41:35 ******/
CREATE DATABASE [PCTO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PCTO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PCTO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PCTO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PCTO_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PCTO] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PCTO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PCTO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PCTO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PCTO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PCTO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PCTO] SET ARITHABORT OFF 
GO
ALTER DATABASE [PCTO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PCTO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PCTO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PCTO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PCTO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PCTO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PCTO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PCTO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PCTO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PCTO] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PCTO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PCTO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PCTO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PCTO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PCTO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PCTO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PCTO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PCTO] SET RECOVERY FULL 
GO
ALTER DATABASE [PCTO] SET  MULTI_USER 
GO
ALTER DATABASE [PCTO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PCTO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PCTO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PCTO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PCTO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PCTO] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PCTO] SET QUERY_STORE = OFF
GO
USE [PCTO]
GO
/****** Object:  Table [dbo].[Abilitazione]    Script Date: 11/05/2022 19:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abilitazione](
	[Account] [nchar](30) NOT NULL,
	[Sede] [int] NOT NULL,
 CONSTRAINT [PK_Abilitazione] PRIMARY KEY CLUSTERED 
(
	[Account] ASC,
	[Sede] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/05/2022 19:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [nchar](30) NOT NULL,
	[Password] [nchar](128) NOT NULL,
	[NumeroDiTelefono] [int] NOT NULL,
	[Ruolo] [nchar](20) NULL,
	[Email] [nchar](50) NULL,
	[Classe] [nchar](2) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 11/05/2022 19:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Codice] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nchar](20) NOT NULL,
	[Cognome] [nchar](20) NOT NULL,
	[TipoCliente] [nchar](10) NOT NULL,
	[Classe] [nchar](2) NULL,
	[Sede] [int] NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Codice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompostoDa]    Script Date: 11/05/2022 19:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompostoDa](
	[Prodotto] [int] NOT NULL,
	[Menu] [int] NOT NULL,
 CONSTRAINT [PK_CompostoDa] PRIMARY KEY CLUSTERED 
(
	[Prodotto] ASC,
	[Menu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Effettua]    Script Date: 11/05/2022 19:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Effettua](
	[Prenotazione] [int] NOT NULL,
	[Menu] [int] NOT NULL,
 CONSTRAINT [PK_Effettua] PRIMARY KEY CLUSTERED 
(
	[Prenotazione] ASC,
	[Menu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Giacenza]    Script Date: 11/05/2022 19:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Giacenza](
	[Data] [datetime] NOT NULL,
	[Numero] [int] IDENTITY(1,1) NOT NULL,
	[Sede] [int] NOT NULL,
	[Offerta] [int] NOT NULL,
	[PrezzoOfferta] [float] NOT NULL,
	[Menu] [int] NOT NULL,
 CONSTRAINT [PK_Giacenza] PRIMARY KEY CLUSTERED 
(
	[Data] ASC,
	[Numero] ASC,
	[Sede] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListaUtentiScolastici]    Script Date: 11/05/2022 19:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListaUtentiScolastici](
	[Nome] [nchar](50) NOT NULL,
	[Cognome] [nchar](50) NOT NULL,
	[Email] [nchar](100) NOT NULL,
	[Classe] [nchar](4) NULL,
	[Tipo] [nchar](1) NOT NULL,
 CONSTRAINT [PK_ListaStudenti] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 11/05/2022 19:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Codice] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nchar](20) NOT NULL,
	[Descrizione] [nchar](50) NULL,
	[Note] [nchar](50) NULL,
	[Prezzo] [float] NOT NULL,
	[Sede] [int] NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Codice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prenotazione]    Script Date: 11/05/2022 19:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prenotazione](
	[Codice] [int] IDENTITY(1,1) NOT NULL,
	[DataOraInvio] [datetime] NOT NULL,
	[Stato] [nchar](15) NOT NULL,
	[Account] [nchar](30) NOT NULL,
	[SedeRitiro] [int] NOT NULL,
	[DTORitiro] [datetime] NOT NULL,
 CONSTRAINT [PK_Prenotazione] PRIMARY KEY CLUSTERED 
(
	[Codice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prodotto]    Script Date: 11/05/2022 19:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prodotto](
	[Codce] [int] NOT NULL,
	[Nome] [nchar](40) NOT NULL,
	[Descrizione] [nchar](250) NULL,
	[Note] [nchar](50) NULL,
	[Prezzo] [float] NOT NULL,
	[TipologiaProdotto] [int] NOT NULL,
 CONSTRAINT [PK_Prodotto] PRIMARY KEY CLUSTERED 
(
	[Codce] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registrazione]    Script Date: 11/05/2022 19:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registrazione](
	[Cliente] [int] NOT NULL,
	[Account] [nchar](30) NOT NULL,
 CONSTRAINT [PK_Registrazione] PRIMARY KEY CLUSTERED 
(
	[Cliente] ASC,
	[Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ritiro]    Script Date: 11/05/2022 19:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ritiro](
	[DataOraRitiro] [datetime] NOT NULL,
	[Sede] [int] NOT NULL,
	[DataOraLimiteInvio] [datetime] NOT NULL,
	[Note] [nchar](50) NULL,
 CONSTRAINT [PK_Ritiro] PRIMARY KEY CLUSTERED 
(
	[DataOraRitiro] ASC,
	[Sede] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sede]    Script Date: 11/05/2022 19:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sede](
	[Codice] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [nchar](10) NULL,
	[Descrizione] [nchar](30) NULL,
	[Indirizzo] [nchar](30) NOT NULL,
	[Nome] [nchar](20) NOT NULL,
	[Telefono] [int] NOT NULL,
 CONSTRAINT [PK_Sede] PRIMARY KEY CLUSTERED 
(
	[Codice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipologiaProdotto]    Script Date: 11/05/2022 19:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipologiaProdotto](
	[Codice] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nchar](20) NOT NULL,
	[Descrizione] [nchar](50) NULL,
 CONSTRAINT [PK_TipologiaProdotto] PRIMARY KEY CLUSTERED 
(
	[Codice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([Username], [Password], [NumeroDiTelefono], [Ruolo], [Email], [Classe]) VALUES (N'BlueberryPie                  ', N'45a227d9cc92151e0fd91ed8b91607ea25ed80c205b856717c53288925904f796ec73d832f8515c69e361d72b2c44e6cf2c5525c9dd8dca1c47672d472254273', 33, N'Easter-Egg          ', N'Elisa.bald@gmail.com                              ', NULL)
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'abd el hadi                                       ', N'fajraoui                                          ', N'abdelhadi.fajraoui.stud@ispascalcomandini.it                                                        ', N'2M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'abdelhak                                          ', N'djerboua                                          ', N'abdelhak.djerboua.stud@ispascalcomandini.it                                                         ', N'1C-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'abdeljabbar                                       ', N'ballouk                                           ', N'abdeljabbar.ballouk.stud@ispascalcomandini.it                                                       ', N'4A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'abdeljabbar                                       ', N'laaroussi                                         ', N'abdeljabbar.laaroussi.stud@ispascalcomandini.it                                                     ', N'3E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'abdelkhaliq                                       ', N'ballouk                                           ', N'abdelkhaliq.ballouk.stud@ispascalcomandini.it                                                       ', N'3B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'abderazak                                         ', N'erraknaoui                                        ', N'abderazak.erraknaoui.stud@ispascalcomandini.it                                                      ', N'4I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'abde rrahim                                       ', N'zitouni                                           ', N'abderrahim.zitouni.stud@ispascalcomandini.it                                                        ', N'1A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'abdou                                             ', N'compaore                                          ', N'abdou.compaore.stud@ispascalcomandini.it                                                            ', N'2A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'abdou                                             ', N'thiam                                             ', N'abdou.thiam.stud@ispascalcomandini.it                                                               ', N'2G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'abdou karim                                       ', N'ka                                                ', N'abdoukarim.ka.stud@ispascalcomandini.it                                                             ', N'3G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'abdou khadre                                      ', N'dia                                               ', N'abdoukhadre.dia.stud@ispascalcomandini.it                                                           ', N'1A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'abdoul bayanne                                    ', N'yabre                                             ', N'abdoulbayanne.yabre.stud@ispascalcomandini.it                                                       ', N'4B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'achille                                           ', N'biondi                                            ', N'achille.biondi.stud@ispascalcomandini.it                                                            ', N'4B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'achille                                           ', N'casadei                                           ', N'achille.casadei.stud@ispascalcomandini.it                                                           ', N'1M-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'achille                                           ', N'gardini                                           ', N'achille.gardini.stud@ispascalcomandini.it                                                           ', N'1B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'achraf                                            ', N'saadane                                           ', N'achraf.saadane.stud@ispascalcomandini.it                                                            ', N'5L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'adam                                              ', N'ben reguigue                                      ', N'adam.benreguigue.stud@ispascalcomandini.it                                                          ', N'1A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'adam                                              ', N'elmansoury                                        ', N'adam.elmansoury.stud@ispascalcomandini.it                                                           ', N'1B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'adam                                              ', N'en nahi                                           ', N'adam.ennahi.stud@ispascalcomandini.it                                                               ', N'1E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'adele                                             ', N'civinelli                                         ', N'adele.civinelli.stud@ispascalcomandini.it                                                           ', N'4M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'adolfo                                            ', N'turco                                             ', N'adolfo.turco@ispascalcomandini.it                                                                   ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'adrian                                            ', N'adames abreu                                      ', N'adrian.adamesabreu.stud@ispascalcomandini.it                                                        ', N'3A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'adriano                                           ', N'kasa                                              ', N'adriano.kasa.stud@ispascalcomandini.it                                                              ', N'3B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ahmed                                             ', N'dakir                                             ', N'ahmed.dakir.stud@ispascalcomandini.it                                                               ', N'1I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ahmed                                             ', N'gasmi                                             ', N'ahmed.gasmi.stud@ispascalcomandini.it                                                               ', N'3E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ahmed                                             ', N'tarhouni                                          ', N'ahmed.tarhouni.stud@ispascalcomandini.it                                                            ', N'2E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'aida                                              ', N'diop                                              ', N'aida.diop.stud@ispascalcomandini.it                                                                 ', N'4M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'aiman                                             ', N'labid                                             ', N'aiman.labid.stud@ispascalcomandini.it                                                               ', N'4E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'aimen alessandro                                  ', N'salandra                                          ', N'aimenalessandro.salandra.stud@ispascalcomandini.it                                                  ', N'5B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alan                                              ', N'agostini                                          ', N'alan.agostini.stud@ispascalcomandini.it                                                             ', N'1H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alan                                              ', N'barzanti                                          ', N'alan.barzanti.stud@ispascalcomandini.it                                                             ', N'4L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alan                                              ', N'hoxha                                             ', N'alan.hoxha.stud@ispascalcomandini.it                                                                ', N'3A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alan                                              ', N'mariani                                           ', N'alan.mariani.stud@ispascalcomandini.it                                                              ', N'5G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alan                                              ', N'montanari                                         ', N'alan.montanari.stud@ispascalcomandini.it                                                            ', N'3G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'serra                                             ', N'alan                                              ', N'alan.serra.stud@ispascalcomandini.it                                                                ', N'2E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alan                                              ', N'soldati                                           ', N'alan.soldati.stud@ispascalcomandini.it                                                              ', N'1F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alan davide                                       ', N'bovo                                              ', N'alandavide.bovo.stud@ispascalcomandini.it                                                           ', N'1H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alarico                                           ', N'barbagallo                                        ', N'alarico.barbagallo@ispascalcomandini.it                                                             ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alberto                                           ', N'febbraio                                          ', N'alberto.febbraio.stud@ispascalcomandini.it                                                          ', N'4L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alberto                                           ', N'laurenzi                                          ', N'alberto.laurenzi@ispascalcomandini.it                                                               ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alberto                                           ', N'poggiaspalla                                      ', N'alberto.poggiaspalla.stud@ispascalcomandini.it                                                      ', N'2H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alberto                                           ', N'scirpoli                                          ', N'alberto.scirpoli.stud@ispascalcomandini.it                                                          ', N'3A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alberto                                           ', N'tonelli                                           ', N'alberto.tonelli@ispascalcomandini.it                                                                ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'vincenzi                                          ', N'alberto                                           ', N'alberto.vincenzi.stud@ispascalcomandini.it                                                          ', N'3E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alberto                                           ', N'zappi                                             ', N'alberto.zappi@ispascalcomandini.it                                                                  ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'albi                                              ', N'koci                                              ', N'albi.koci.stud@ispascalcomandini.it                                                                 ', N'2I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'aleandro joshwa                                   ', N'la rosa                                           ', N'aleandrojoshwa.larosa.stud@ispascalcomandini.it                                                     ', N'5E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'aleksandar stanev                                 ', N'aleksandrov                                       ', N'aleksandarstanev.aleksandrov.stud@ispascalcomandini.it                                              ', N'5G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'aleksanderjan                                     ', N'stasiaczek                                        ', N'aleksanderjan.stasiaczek.stud@ispascalcomandini.it                                                  ', N'4B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alesjo                                            ', N'bobja                                             ', N'alesjo.bobja.stud@ispascalcomandini.it                                                              ', N'1N-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandra                                        ', N'migliori                                          ', N'alessandra.migliori@ispascalcomandini.it                                                            ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandra                                        ', N'volta                                             ', N'alessandra.volta@ispascalcomandini.it                                                               ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'allegra                                           ', N'alessandro.allegra.stud@ispascalcomandini.it                                                        ', N'2A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'amaducci                                          ', N'alessandro.amaducci.stud@ispascalcomandini.it                                                       ', N'4L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'arpino                                            ', N'alessandro.arpino.stud@ispascalcomandini.it                                                         ', N'2A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'battistini                                        ', N'alessandro.battistini.stud@ispascalcomandini.it                                                     ', N'2F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'benci                                             ', N'alessandro.benci.stud@ispascalcomandini.it                                                          ', N'1I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'benini                                            ', N'alessandro.benini.stud@ispascalcomandini.it                                                         ', N'3C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'bertozzi                                          ', N'alessandro.bertozzi.stud@ispascalcomandini.it                                                       ', N'2A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'biguzzi                                           ', N'alessandro.biguzzi.stud@ispascalcomandini.it                                                        ', N'3B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'biguzzi                                           ', N'alessandro.biguzzi1.stud@ispascalcomandini.it                                                       ', N'1B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'bugnoli                                           ', N'alessandro.bugnoli.stud@ispascalcomandini.it                                                        ', N'5B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'buono                                             ', N'alessandro.buono.stud@ispascalcomandini.it                                                          ', N'5H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'calbucci                                          ', N'alessandro.calbucci.stud@ispascalcomandini.it                                                       ', N'4I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'campedelli                                        ', N'alessandro.campedelli.stud@ispascalcomandini.it                                                     ', N'5E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'cangini                                           ', N'alessandro                                        ', N'alessandro.cangini.stud@ispascalcomandini.it                                                        ', N'3G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'cedioli                                           ', N'alessandro.cedioli.stud@ispascalcomandini.it                                                        ', N'1B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'crepaldi                                          ', N'alessandro.crepaldi.stud@ispascalcomandini.it                                                       ', N'1E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'crociani                                          ', N'alessandro.crociani.stud@ispascalcomandini.it                                                       ', N'1B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'dal fiume                                         ', N'alessandro.dalfiume.stud@ispascalcomandini.it                                                       ', N'4B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'danesi                                            ', N'alessandro.danesi.stud@ispascalcomandini.it                                                         ', N'2A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'dellamore                                         ', N'alessandro.dellamore.stud@ispascalcomandini.it                                                      ', N'2A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'della volpe                                       ', N'alessandro.dellavolpe.stud@ispascalcomandini.it                                                     ', N'1B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'diego                                             ', N'alessandro.diego.stud@ispascalcomandini.it                                                          ', N'5G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'di stefano                                        ', N'alessandro.distefano.stud@ispascalcomandini.it                                                      ', N'4F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'dominici                                          ', N'alessandro.dominici.stud@ispascalcomandini.it                                                       ', N'4F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'ferro                                             ', N'alessandro.ferro.stud@ispascalcomandini.it                                                          ', N'1C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'forti                                             ', N'alessandro                                        ', N'alessandro.forti.stud@ispascalcomandini.it                                                          ', N'2A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'ghinea                                            ', N'alessandro.ghinea.stud@ispascalcomandini.it                                                         ', N'1L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'girelli                                           ', N'alessandro.girelli.stud@ispascalcomandini.it                                                        ', N'2C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'lippi                                             ', N'alessandro.lippi.stud@ispascalcomandini.it                                                          ', N'4H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'lucchi                                            ', N'alessandro.lucchi.stud@ispascalcomandini.it                                                         ', N'3G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'marchetti                                         ', N'alessandro.marchetti.stud@ispascalcomandini.it                                                      ', N'1N-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'martella                                          ', N'alessandro.martella.stud@ispascalcomandini.it                                                       ', N'1M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'martucci                                          ', N'alessandro.martucci.stud@ispascalcomandini.it                                                       ', N'5G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'moretti                                           ', N'alessandro.moretti.stud@ispascalcomandini.it                                                        ', N'5C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'nanni                                             ', N'alessandro.nanni.stud@ispascalcomandini.it                                                          ', N'5C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'neri                                              ', N'alessandro.neri.stud@ispascalcomandini.it                                                           ', N'4E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'pastorelli                                        ', N'alessandro.pastorelli.stud@ispascalcomandini.it                                                     ', N'3G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'pieri                                             ', N'alessandro.pieri.stud@ispascalcomandini.it                                                          ', N'4H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'piferi                                            ', N'alessandro.piferi.stud@ispascalcomandini.it                                                         ', N'5G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'pippi                                             ', N'alessandro.pippi.stud@ispascalcomandini.it                                                          ', N'4D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'pollice                                           ', N'alessandro.pollice.stud@ispascalcomandini.it                                                        ', N'4H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'pracucci                                          ', N'alessandro.pracucci.stud@ispascalcomandini.it                                                       ', N'4F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'pugliese                                          ', N'alessandro                                        ', N'alessandro.pugliese.stud@ispascalcomandini.it                                                       ', N'2G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'righi                                             ', N'alessandro.righi.stud@ispascalcomandini.it                                                          ', N'1G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'rossi                                             ', N'alessandro.rossi.stud@ispascalcomandini.it                                                          ', N'1F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'rupil                                             ', N'alessandro.rupil.stud@ispascalcomandini.it                                                          ', N'3E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'stoppa                                            ', N'alessandro.stoppa.stud@ispascalcomandini.it                                                         ', N'3E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'tome''                                             ', N'alessandro                                        ', N'alessandro.tome.stud@ispascalcomandini.it                                                           ', N'3E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'torchiani                                         ', N'alessandro.torchiani.stud@ispascalcomandini.it                                                      ', N'5G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'vaccari                                           ', N'alessandro.vaccari.stud@ispascalcomandini.it                                                        ', N'1A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'venzi                                             ', N'alessandro.venzi.stud@ispascalcomandini.it                                                          ', N'1B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'zanotti                                           ', N'alessandro.zanotti1.stud@ispascalcomandini.it                                                       ', N'1B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessandro                                        ', N'zoboli                                            ', N'alessandro.zoboli.stud@ispascalcomandini.it                                                         ', N'1M-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessia                                           ', N'andreoli                                          ', N'alessia.andreoli.stud@ispascalcomandini.it                                                          ', N'1M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessia                                           ', N'armenise                                          ', N'alessia.armenise.stud@ispascalcomandini.it                                                          ', N'1M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessia                                           ', N'baronio                                           ', N'alessia.baronio.stud@ispascalcomandini.it                                                           ', N'5A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessia                                           ', N'canali                                            ', N'alessia.canali.stud@ispascalcomandini.it                                                            ', N'4M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessia                                           ', N'lleshi                                            ', N'alessia.lleshi.stud@ispascalcomandini.it                                                            ', N'1E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessio                                           ', N'balsamo                                           ', N'alessio.balsamo.stud@ispascalcomandini.it                                                           ', N'1I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessio                                           ', N'cala''                                             ', N'alessio.cala.stud@ispascalcomandini.it                                                              ', N'1A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'colombo                                           ', N'alessio                                           ', N'alessio.colombo.stud@ispascalcomandini.it                                                           ', N'2H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lo pinto                                          ', N'alessio                                           ', N'alessio.lopinto.stud@ispascalcomandini.it                                                           ', N'3G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'magnani                                           ', N'alessio                                           ', N'alessio.magnani.stud@ispascalcomandini.it                                                           ', N'3H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessio                                           ', N'mazzotti                                          ', N'alessio.mazzotti.stud@ispascalcomandini.it                                                          ', N'1L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessio                                           ', N'paoletti                                          ', N'alessio.paoletti.stud@ispascalcomandini.it                                                          ', N'4H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessio                                           ', N'paolucci                                          ', N'alessio.paolucci.stud@ispascalcomandini.it                                                          ', N'3A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessio                                           ', N'piersanti                                         ', N'alessio.piersanti.stud@ispascalcomandini.it                                                         ', N'4G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessio                                           ', N'ricci                                             ', N'alessio.ricci.stud@ispascalcomandini.it                                                             ', N'2E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessio                                           ', N'stefio                                            ', N'alessio.stefio.stud@ispascalcomandini.it                                                            ', N'1E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alessio                                           ', N'tucci                                             ', N'alessio.tucci.stud@ispascalcomandini.it                                                             ', N'2E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alex                                              ', N'balbi                                             ', N'alex.balbi.stud@ispascalcomandini.it                                                                ', N'5B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alex                                              ', N'biondi                                            ', N'alex.biondi.stud@ispascalcomandini.it                                                               ', N'5C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alex                                              ', N'bisacchi                                          ', N'alex.bisacchi.stud@ispascalcomandini.it                                                             ', N'1H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alex                                              ', N'bonoli                                            ', N'alex.bonoli.stud@ispascalcomandini.it                                                               ', N'1N-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alex                                              ', N'della chiesa                                      ', N'alex.dellachiesa.stud@ispascalcomandini.it                                                          ', N'4M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alex                                              ', N'dellapasqua                                       ', N'alex.dellapasqua.stud@ispascalcomandini.it                                                          ', N'4E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alex                                              ', N'donati                                            ', N'alex.donati.stud@ispascalcomandini.it                                                               ', N'3A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'grotti                                            ', N'alex                                              ', N'alex.grotti.stud@ispascalcomandini.it                                                               ', N'3G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alex                                              ', N'lambertini                                        ', N'alex.lambertini.stud@ispascalcomandini.it                                                           ', N'2E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alex                                              ', N'morigi                                            ', N'alex.morigi.stud@ispascalcomandini.it                                                               ', N'1C-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alex                                              ', N'plachesi                                          ', N'alex.plachesi.stud@ispascalcomandini.it                                                             ', N'2G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alex                                              ', N'raggi                                             ', N'alex.raggi.stud@ispascalcomandini.it                                                                ', N'3A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alex                                              ', N'rigoni                                            ', N'alex.rigoni.stud@ispascalcomandini.it                                                               ', N'1E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alex                                              ', N'romagnoli                                         ', N'alex.romagnoli.stud@ispascalcomandini.it                                                            ', N'5E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alex                                              ', N'vincenzi                                          ', N'alex.vincenzi.stud@ispascalcomandini.it                                                             ', N'4C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alex                                              ', N'zanelli                                           ', N'alex.zanelli.stud@ispascalcomandini.it                                                              ', N'4F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alexandro                                         ', N'muharremi                                         ', N'alexandro.muharremi.stud@ispascalcomandini.it                                                       ', N'1E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alexia                                            ', N'saliani                                           ', N'alexia.saliani.stud@ispascalcomandini.it                                                            ', N'2E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alice                                             ', N'caminati                                          ', N'alice.caminati.stud@ispascalcomandini.it                                                            ', N'4M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'alin alexandru                                    ', N'moraru                                            ', N'alinalexandru.moraru.stud@ispascalcomandini.it                                                      ', N'5A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'almas                                             ', N'uddin                                             ', N'almas.uddin.stud@ispascalcomandini.it                                                               ', N'3I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'amadou                                            ', N'toure                                             ', N'amadou.toure.stud@ispascalcomandini.it                                                              ', N'5A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'amandeep                                          ', N'singh                                             ', N'amandeep.singh.stud@ispascalcomandini.it                                                            ', N'4E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ambra                                             ', N'angioli                                           ', N'ambra.angioli@ispascalcomandini.it                                                                  ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'boudlale                                          ', N'amin                                              ', N'amin.boudlale.stud@ispascalcomandini.it                                                             ', N'3G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'amin                                              ', N'sejdi                                             ', N'amin.sejdi.stud@ispascalcomandini.it                                                                ', N'1A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'amna                                              ', N'ben reguigne                                      ', N'amna.benreguigne.stud@ispascalcomandini.it                                                          ', N'3M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'anas                                              ', N'fadel                                             ', N'anas.fadel.stud@ispascalcomandini.it                                                                ', N'1A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'anas                                              ', N'saadouni                                          ', N'anas.saadouni.stud@ispascalcomandini.it                                                             ', N'2H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'anastasia                                         ', N'moskovenko                                        ', N'anastasia.moskovenko.stud@ispascalcomandini.it                                                      ', N'4M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'anastasiia                                        ', N'maksymova                                         ', N'anastasiia.maksymova.stud@ispascalcomandini.it                                                      ', N'2M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'ahmeti                                            ', N'andrea.ahmeti.stud@ispascalcomandini.it                                                             ', N'1E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'amaducci                                          ', N'andrea.amaducci.stud@ispascalcomandini.it                                                           ', N'2C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'baldassari                                        ', N'andrea.baldassari.stud@ispascalcomandini.it                                                         ', N'5H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'baldini                                           ', N'andrea.baldini.stud@ispascalcomandini.it                                                            ', N'2I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'baravelli                                         ', N'andrea                                            ', N'andrea.baravelli.stud@ispascalcomandini.it                                                          ', N'3E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'barbozzi                                          ', N'andrea.barbozzi.stud@ispascalcomandini.it                                                           ', N'1N-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'barducci                                          ', N'andrea.barducci.stud@ispascalcomandini.it                                                           ', N'3E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'boschi                                            ', N'andrea.boschi1.stud@ispascalcomandini.it                                                            ', N'3G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'buonaparte                                        ', N'andrea.buonaparte.stud@ispascalcomandini.it                                                         ', N'1A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'casadei                                           ', N'andrea.casadei.stud@ispascalcomandini.it                                                            ', N'4L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'casanova                                          ', N'andrea.casanova.stud@ispascalcomandini.it                                                           ', N'3B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'casotti                                           ', N'andrea.casotti.stud@ispascalcomandini.it                                                            ', N'1G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'ceccaroli                                         ', N'andrea.ceccaroli.stud@ispascalcomandini.it                                                          ', N'4L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'delvecchio                                        ', N'andrea.delvecchio.stud@ispascalcomandini.it                                                         ', N'1C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'di nanno                                          ', N'andrea.dinanno.stud@ispascalcomandini.it                                                            ', N'3A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'd''intino                                          ', N'andrea.dintino.stud@ispascalcomandini.it                                                            ', N'5C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'faetanini                                         ', N'andrea.faetanini.stud@ispascalcomandini.it                                                          ', N'1M-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'franco                                            ', N'andrea.franco.stud@ispascalcomandini.it                                                             ', N'1E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'galbucci                                          ', N'andrea                                            ', N'andrea.galbucci.stud@ispascalcomandini.it                                                           ', N'2G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'gattei                                            ', N'andrea.gattei.stud@ispascalcomandini.it                                                             ', N'2C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'giorgi                                            ', N'andrea.giorgi.stud@ispascalcomandini.it                                                             ', N'3B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'giovannetti                                       ', N'andrea.giovannetti.stud@ispascalcomandini.it                                                        ', N'2E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'giunchi                                           ', N'andrea.giunchi.stud@ispascalcomandini.it                                                            ', N'1N-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'gori                                              ', N'andrea.gori.stud@ispascalcomandini.it                                                               ', N'1C-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'magni                                             ', N'andrea.magni.stud@ispascalcomandini.it                                                              ', N'4H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'mambelli                                          ', N'andrea.mambelli.stud@ispascalcomandini.it                                                           ', N'4G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'marini                                            ', N'andrea.marini.stud@ispascalcomandini.it                                                             ', N'4I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'marzulli                                          ', N'andrea.marzulli.stud@ispascalcomandini.it                                                           ', N'4E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'migliozzi                                         ', N'andrea.migliozzi.stud@ispascalcomandini.it                                                          ', N'3C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'minguzzi                                          ', N'andrea                                            ', N'andrea.minguzzi.stud@ispascalcomandini.it                                                           ', N'2E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'orlandi                                           ', N'andrea.orlandi.stud@ispascalcomandini.it                                                            ', N'2C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'pavirani                                          ', N'andrea.pavirani.stud@ispascalcomandini.it                                                           ', N'2H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'perifano                                          ', N'andrea.perifano.stud@ispascalcomandini.it                                                           ', N'5D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'petrini                                           ', N'andrea.petrini.stud@ispascalcomandini.it                                                            ', N'5E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'petrino                                           ', N'andrea.petrino.stud@ispascalcomandini.it                                                            ', N'2F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'piscaglia                                         ', N'andrea                                            ', N'andrea.piscaglia.stud@ispascalcomandini.it                                                          ', N'3G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ricci                                             ', N'andrea                                            ', N'andrea.ricci.stud@ispascalcomandini.it                                                              ', N'3E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'righi                                             ', N'andrea.righi.stud@ispascalcomandini.it                                                              ', N'2A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'rinaldini                                         ', N'andrea.rinaldini.stud@ispascalcomandini.it                                                          ', N'2I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'ronchi                                            ', N'andrea.ronchi.stud@ispascalcomandini.it                                                             ', N'5G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'roncucci                                          ', N'andrea.roncucci.stud@ispascalcomandini.it                                                           ', N'4G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'rusticali                                         ', N'andrea.rusticali.stud@ispascalcomandini.it                                                          ', N'5D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'scarpellino                                       ', N'andrea.scarpellino.stud@ispascalcomandini.it                                                        ', N'3E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'severi                                            ', N'andrea.severi.stud@ispascalcomandini.it                                                             ', N'1M-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'siboni                                            ', N'andrea.siboni.stud@ispascalcomandini.it                                                             ', N'5L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'spinelli                                          ', N'andrea.spinelli.stud@ispascalcomandini.it                                                           ', N'4B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'stacchini                                         ', N'andrea                                            ', N'andrea.stacchini.stud@ispascalcomandini.it                                                          ', N'2A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'Andrea                                            ', N'Vaccari                                           ', N'andrea.vaccari@ispascalcomandini.it                                                                 ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea                                            ', N'valbonesi                                         ', N'andrea.valbonesi.stud@ispascalcomandini.it                                                          ', N'2G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea antonio                                    ', N'civitavecchia                                     ', N'andreaantonio.civitavecchia.stud@ispascalcomandini.it                                               ', N'3E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea marco                                      ', N'rossiello                                         ', N'andreamarco.rossiello.stud@ispascalcomandini.it                                                     ', N'3A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrea maria                                      ', N'castronovo                                        ', N'andreamaria.castronovo.stud@ispascalcomandini.it                                                    ', N'3I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andrei                                            ', N'dumitru                                           ', N'andrei.dumitru.stud@ispascalcomandini.it                                                            ', N'2B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andres                                            ', N'panara                                            ', N'andres.panara.stud@ispascalcomandini.it                                                             ', N'3A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'andres                                            ', N'zanotti                                           ', N'andres.zanotti.stud@ispascalcomandini.it                                                            ', N'3B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'angelo ioan                                       ', N'gurgu                                             ', N'angeloioan.gurgu.stud@ispascalcomandini.it                                                          ', N'1C-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'anna                                              ', N'giuliano                                          ', N'anna.giuliano.stud@ispascalcomandini.it                                                             ', N'2M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'astorri                                           ', N'annalisa                                          ', N'annalisa.astorri.stud@ispascalcomandini.it                                                          ', N'3I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'annalisa                                          ', N'baraghini                                         ', N'annalisa.baraghini@ispascalcomandini.it                                                             ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'annamaria                                         ', N'faberi                                            ', N'annamaria.faberi@ispascalcomandini.it                                                               ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'anthony                                           ', N'stringara                                         ', N'anthony.stringara.stud@ispascalcomandini.it                                                         ', N'1B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'anton                                             ', N'abramov                                           ', N'anton.abramov.stud@ispascalcomandini.it                                                             ', N'4G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'antonella                                         ', N'bisacchi                                          ', N'antonella.bisacchi@ispascalcomandini.it                                                             ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'antonella                                         ', N'messina                                           ', N'antonella.messina@ispascalcomandini.it                                                              ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'antonietta                                        ', N'angelini                                          ', N'antonietta.angelini@ispascalcomandini.it                                                            ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'antonino                                          ', N'daidone                                           ', N'antonino.daidone.stud@ispascalcomandini.it                                                          ', N'4G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'antonino                                          ', N'porcino                                           ', N'antonino.porcino.stud@ispascalcomandini.it                                                          ', N'3I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'antonio                                           ', N'bartolone                                         ', N'antonio.bartolone.stud@ispascalcomandini.it                                                         ', N'1B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'antonio                                           ', N'ciaburri                                          ', N'antonio.ciaburri.stud@ispascalcomandini.it                                                          ', N'2E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'antonio                                           ', N'danesi                                            ', N'antonio.danesi@ispascalcomandini.it                                                                 ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'antonio                                           ', N'de rosa                                           ', N'antonio.derosa.stud@ispascalcomandini.it                                                            ', N'2H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'antonio                                           ', N'falcocchio                                        ', N'antonio.falcocchio.stud@ispascalcomandini.it                                                        ', N'3G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'antonio                                           ', N'matteucci                                         ', N'antonio.matteucci.stud@ispascalcomandini.it                                                         ', N'1A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'antonio                                           ', N'paciolla                                          ', N'antonio.paciolla.stud@ispascalcomandini.it                                                          ', N'4G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'zangla                                            ', N'antonio                                           ', N'antonio.zangla.stud@ispascalcomandini.it                                                            ', N'3G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'antonio federico                                  ', N'de falco                                          ', N'antoniofederico.defalco.stud@ispascalcomandini.it                                                   ', N'2H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'antonio giuseppe                                  ', N'chimienti                                         ', N'antoniogiuseppe.chimienti.stud@ispascalcomandini.it                                                 ', N'1B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'antonio michele                                   ', N'notaro                                            ', N'antoniomichele.notaro.stud@ispascalcomandini.it                                                     ', N'3B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'antony                                            ', N'florio                                            ', N'antony.florio.stud@ispascalcomandini.it                                                             ', N'2I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'anxhela                                           ', N'qoli                                              ', N'anxhela.qoli.stud@ispascalcomandini.it                                                              ', N'5A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'bedei                                             ', N'arianna                                           ', N'arianna.bedei.stud@ispascalcomandini.it                                                             ', N'3E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'arianna                                           ', N'lucchi                                            ', N'arianna.lucchi@ispascalcomandini.it                                                                 ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'arnis                                             ', N'hamiti                                            ', N'arnis.hamiti.stud@ispascalcomandini.it                                                              ', N'1B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'elezi                                             ', N'arvael                                            ', N'arvael.elezi.stud@ispascalcomandini.it                                                              ', N'2H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'asia                                              ', N'castorri                                          ', N'asia.castorri.stud@ispascalcomandini.it                                                             ', N'3M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'asia                                              ', N'graffiedi                                         ', N'asia.graffiedi.stud@ispascalcomandini.it                                                            ', N'4M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'asia                                              ', N'iadaresta                                         ', N'asia.iadaresta.stud@ispascalcomandini.it                                                            ', N'1M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'asia                                              ', N'quadalti                                          ', N'asia.quadalti.stud@ispascalcomandini.it                                                             ', N'4M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'zullo                                             ', N'asia                                              ', N'asia.zullo.stud@ispascalcomandini.it                                                                ', N'2B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'asmir                                             ', N'durmis                                            ', N'asmir.durmis.stud@ispascalcomandini.it                                                              ', N'2A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'aurora                                            ', N'camillini                                         ', N'aurora.camillini.stud@ispascalcomandini.it                                                          ', N'5B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'aurora                                            ', N'castagnoli                                        ', N'aurora.castagnoli.stud@ispascalcomandini.it                                                         ', N'4M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ayoub                                             ', N'merakna                                           ', N'ayoub.merakna.stud@ispascalcomandini.it                                                             ', N'1A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'azzurra                                           ', N'chincarini                                        ', N'azzurra.chincarini.stud@ispascalcomandini.it                                                        ', N'1M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'barbara                                           ', N'baronio                                           ', N'barbara.baronio@ispascalcomandini.it                                                                ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'barbara                                           ', N'benini                                            ', N'barbara.benini@ispascalcomandini.it                                                                 ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'barbara                                           ', N'caccavale                                         ', N'barbara.caccavale.stud@ispascalcomandini.it                                                         ', N'2A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'bartosz krzysztof                                 ', N'malinowski                                        ', N'bartoszkrzysztof.malinowski.stud@ispascalcomandini.it                                               ', N'3B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'beatrice                                          ', N'bocci                                             ', N'beatrice.bocci.stud@ispascalcomandini.it                                                            ', N'1M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'fabbri                                            ', N'beatrice                                          ', N'beatrice.fabbri.stud@ispascalcomandini.it                                                           ', N'3E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'beatrice                                          ', N'oriani                                            ', N'beatrice.oriani.stud@ispascalcomandini.it                                                           ', N'5E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'beatriz alexandra                                 ', N'de oliveira murillo                               ', N'beatrizalexandra.deoliveiramurillo.stud@ispascalcomandini.it                                        ', N'1M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'bendaoud                                          ', N'sraidi                                            ', N'bendaoud.sraidi.stud@ispascalcomandini.it                                                           ', N'2G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'pistocchi                                         ', N'benjamin                                          ', N'benjamin.pistocchi.stud@ispascalcomandini.it                                                        ', N'3H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'berkant                                           ', N'redjepi                                           ', N'berkant.redjepi.stud@ispascalcomandini.it                                                           ', N'1B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'bernardo                                          ', N'mancini                                           ', N'bernardo.mancini@ispascalcomandini.it                                                               ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'biagio                                            ', N'cipolletta                                        ', N'biagio.cipolletta@ispascalcomandini.it                                                              ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'billal                                            ', N'haddad                                            ', N'billal.haddad.stud@ispascalcomandini.it                                                             ', N'4I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'brajan                                            ', N'hysolakoj                                         ', N'brajan.hysolakoj.stud@ispascalcomandini.it                                                          ', N'5C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'brian                                             ', N'bacchi                                            ', N'brian.bacchi.stud@ispascalcomandini.it                                                              ', N'1B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'brian                                             ', N'banzola                                           ', N'brian.banzola.stud@ispascalcomandini.it                                                             ', N'4B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'brian                                             ', N'barbieri                                          ', N'brian.barbieri.stud@ispascalcomandini.it                                                            ', N'1C-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'brian                                             ', N'leardini                                          ', N'brian.leardini.stud@ispascalcomandini.it                                                            ', N'5A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'brian                                             ', N'magnani                                           ', N'brian.magnani.stud@ispascalcomandini.it                                                             ', N'2F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'brunella                                          ', N'tombetti                                          ', N'brunella.tombetti@ispascalcomandini.it                                                              ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'bryan                                             ', N'sacchini                                          ', N'bryan.sacchini.stud@ispascalcomandini.it                                                            ', N'1A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'bryce                                             ', N'panara                                            ', N'bryce.panara.stud@ispascalcomandini.it                                                              ', N'4B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'carlo                                             ', N'biondi                                            ', N'carlo.biondi@ispascalcomandini.it                                                                   ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'carlos.sebastian                                  ', N'soto.castaneda                                    ', N'carlossebastian.sotocastaneda.stud@ispascalcomandini.it                                             ', N'4I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'carlotta                                          ', N'stecchini                                         ', N'carlotta.stecchini.stud@ispascalcomandini.it                                                        ', N'2M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'carmelo                                           ', N'crasci                                            ', N'carmelo.crasci@ispascalcomandini.it                                                                 ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'carmine                                           ', N'cerrato                                           ', N'carmine.cerrato@ispascalcomandini.it                                                                ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'carmine                                           ', N'primitivi                                         ', N'carmine.primitivi.stud@ispascalcomandini.it                                                         ', N'3B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'carolina                                          ', N'bertozzi                                          ', N'carolina.bertozzi@ispascalcomandini.it                                                              ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'carol luca                                        ', N'nicolae                                           ', N'carolluca.nicolae.stud@ispascalcomandini.it                                                         ', N'3A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'catia                                             ', N'mingozzi                                          ', N'catia.mingozzi@ispascalcomandini.it                                                                 ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'cesare                                            ', N'furia                                             ', N'cesare.furia.stud@ispascalcomandini.it                                                              ', N'4B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'aftene                                            ', N'cezar alexandru                                   ', N'cezaralexandru.aftene.stud@ispascalcomandini.it                                                     ', N'3I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'chadia                                            ', N'bamaarouf                                         ', N'chadia.bamaarouf.stud@ispascalcomandini.it                                                          ', N'4L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'chen                                              ', N'liu                                               ', N'chen.liu.stud@ispascalcomandini.it                                                                  ', N'1B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'chen bin                                          ', N'ni                                                ', N'chenbin.ni.stud@ispascalcomandini.it                                                                ', N'1E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'liu                                               ', N'chen yi                                           ', N'chenyi.liu.stud@ispascalcomandini.it                                                                ', N'3H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'chiara                                            ', N'bernacci                                          ', N'chiara.bernacci.stud@ispascalcomandini.it                                                           ', N'1M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'chiara                                            ', N'ferrari                                           ', N'chiara.ferrari@ispascalcomandini.it                                                                 ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'Chiara                                            ', N'Fusaroli                                          ', N'chiara.fusaroli@ispascalcomandini.it                                                                ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'chiara                                            ', N'mazza                                             ', N'chiara.mazza@ispascalcomandini.it                                                                   ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'christian                                         ', N'bagnolini                                         ', N'christian.bagnolini.stud@ispascalcomandini.it                                                       ', N'5G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'capobianco                                        ', N'christian                                         ', N'christian.capobianco.stud@ispascalcomandini.it                                                      ', N'3H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'christian                                         ', N'carpino                                           ', N'christian.carpino.stud@ispascalcomandini.it                                                         ', N'5E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'christian                                         ', N'castagnoli                                        ', N'christian.castagnoli.stud@ispascalcomandini.it                                                      ', N'5G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'christian                                         ', N'faeti                                             ', N'christian.faeti.stud@ispascalcomandini.it                                                           ', N'2E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'christian                                         ', N'murante                                           ', N'christian.murante.stud@ispascalcomandini.it                                                         ', N'1H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'christian                                         ', N'pastori                                           ', N'christian.pastori.stud@ispascalcomandini.it                                                         ', N'2E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'christian                                         ', N'piccoli                                           ', N'christian.piccoli.stud@ispascalcomandini.it                                                         ', N'1G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'christian                                         ', N'rubboli                                           ', N'christian.rubboli.stud@ispascalcomandini.it                                                         ', N'1N-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'christian alexander                               ', N'arizza                                            ', N'christianalexander.arizza.stud@ispascalcomandini.it                                                 ', N'3C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'christian wichita                                 ', N'forti                                             ', N'christianwichita.forti.stud@ispascalcomandini.it                                                    ', N'2C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'cinzia                                            ', N'lumini                                            ', N'cinzia.lumini@ispascalcomandini.it                                                                  ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ciprian.mihai                                     ', N'spinu                                             ', N'ciprianmihai.spinu.stud@ispascalcomandini.it                                                        ', N'5H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'clarissa                                          ', N'bala                                              ', N'clarissa.bala.stud@ispascalcomandini.it                                                             ', N'1E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'claudia                                           ', N'placuzzi                                          ', N'claudia.placuzzi@ispascalcomandini.it                                                               ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'claudia ivanova                                   ', N'ivanova                                           ', N'claudiaivanova.ivanova.stud@ispascalcomandini.it                                                    ', N'3M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'claudio                                           ', N'senni                                             ', N'claudio.senni.stud@ispascalcomandini.it                                                             ', N'3E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'claudio                                           ', N'traschitti                                        ', N'claudio.traschitti.stud@ispascalcomandini.it                                                        ', N'2A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'claudiu                                           ', N'manole savin                                      ', N'claudiu.manolesavin.stud@ispascalcomandini.it                                                       ', N'3B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'corrado                                           ', N'bruno                                             ', N'corrado.bruno.stud@ispascalcomandini.it                                                             ', N'1A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'cristian                                          ', N'di donato                                         ', N'cristian.didonato.stud@ispascalcomandini.it                                                         ', N'4H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'cristian                                          ', N'fabbri                                            ', N'cristian.fabbri.stud@ispascalcomandini.it                                                           ', N'1I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'cristian                                          ', N'galli                                             ', N'cristian.galli.stud@ispascalcomandini.it                                                            ', N'4E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'cristian                                          ', N'melandri                                          ', N'cristian.melandri.stud@ispascalcomandini.it                                                         ', N'1E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'cristian                                          ', N'ottaviani                                         ', N'cristian.ottaviani.stud@ispascalcomandini.it                                                        ', N'1G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'cristian                                          ', N'picchetti                                         ', N'cristian.picchetti.stud@ispascalcomandini.it                                                        ', N'1C-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'cristian                                          ', N'strollo                                           ', N'cristian.strollo.stud@ispascalcomandini.it                                                          ', N'4A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'cristofer.mattia                                  ', N'napolitano                                        ', N'cristofermattia.napolitano.stud@ispascalcomandini.it                                                ', N'4F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'daniel                                            ', N'bertoni                                           ', N'daniel.bertoni.stud@ispascalcomandini.it                                                            ', N'3H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'daniel                                            ', N'locapo                                            ', N'daniel.locapo.stud@ispascalcomandini.it                                                             ', N'1G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'daniel                                            ', N'matteini                                          ', N'daniel.matteini.stud@ispascalcomandini.it                                                           ', N'1B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'daniel                                            ', N'orsini                                            ', N'daniel.orsini.stud@ispascalcomandini.it                                                             ', N'5H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'daniel                                            ', N'ruscelli                                          ', N'daniel.ruscelli.stud@ispascalcomandini.it                                                           ', N'4C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'daniele                                           ', N'balzani                                           ', N'daniele.balzani.stud@ispascalcomandini.it                                                           ', N'3B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'daniele                                           ', N'broccoli                                          ', N'daniele.broccoli.stud@ispascalcomandini.it                                                          ', N'1H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'daniele                                           ', N'carli                                             ', N'daniele.carli.stud@ispascalcomandini.it                                                             ', N'1A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'daniele                                           ', N'giovanardi                                        ', N'daniele.giovanardi.stud@ispascalcomandini.it                                                        ', N'5C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'daniele                                           ', N'hu                                                ', N'daniele.hu.stud@ispascalcomandini.it                                                                ', N'2E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'daniele                                           ', N'marchese                                          ', N'daniele.marchese.stud@ispascalcomandini.it                                                          ', N'3B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'daniele                                           ', N'pacchioni                                         ', N'daniele.pacchioni@ispascalcomandini.it                                                              ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'daniele                                           ', N'pieri                                             ', N'daniele.pieri.stud@ispascalcomandini.it                                                             ', N'2E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'daniele                                           ', N'rasa                                              ', N'daniele.rasa.stud@ispascalcomandini.it                                                              ', N'3G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'daniele                                           ', N'sbrighi                                           ', N'daniele.sbrighi.stud@ispascalcomandini.it                                                           ', N'1E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'daniele andrea                                    ', N'cracchiolo                                        ', N'danieleandrea.cracchiolo.stud@ispascalcomandini.it                                                  ', N'5B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'cotirla                                           ', N'daniel massimo                                    ', N'danielmassimo.cotirla.stud@ispascalcomandini.it                                                     ', N'3H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'danilo                                            ', N'tinti                                             ', N'danilo.tinti.stud@ispascalcomandini.it                                                              ', N'1B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'danjel                                            ', N'plaka                                             ', N'danjel.plaka.stud@ispascalcomandini.it                                                              ', N'1E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'dario                                             ', N'riguzzi                                           ', N'dario.riguzzi.stud@ispascalcomandini.it                                                             ', N'4G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'darshpreet singh                                  ', N'saini                                             ', N'darshpreetsingh.saini.stud@ispascalcomandini.it                                                     ', N'1A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'david                                             ', N'veneti                                            ', N'david.veneti@ispascalcomandini.it                                                                   ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'davide                                            ', N'andreotti                                         ', N'davide.andreotti.stud@ispascalcomandini.it                                                          ', N'5D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'busoni                                            ', N'davide                                            ', N'davide.busoni.stud@ispascalcomandini.it                                                             ', N'3H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'davide                                            ', N'cavalluzzo                                        ', N'davide.cavalluzzo.stud@ispascalcomandini.it                                                         ', N'1H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'davide                                            ', N'cucchi                                            ', N'davide.cucchi.stud@ispascalcomandini.it                                                             ', N'2C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'davide                                            ', N'facciani                                          ', N'davide.facciani.stud@ispascalcomandini.it                                                           ', N'4D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'davide                                            ', N'ferrari                                           ', N'davide.ferrari.stud@ispascalcomandini.it                                                            ', N'2E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'davide                                            ', N'giannessi                                         ', N'davide.giannessi.stud@ispascalcomandini.it                                                          ', N'2I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'davide                                            ', N'lancini                                           ', N'davide.lancini.stud@ispascalcomandini.it                                                            ', N'5A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'davide                                            ', N'leonelli                                          ', N'davide.leonelli.stud@ispascalcomandini.it                                                           ', N'2E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'davide                                            ', N'martorana                                         ', N'davide.martorana.stud@ispascalcomandini.it                                                          ', N'1I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'davide                                            ', N'nicoletti                                         ', N'davide.nicoletti.stud@ispascalcomandini.it                                                          ', N'5E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'davide                                            ', N'pesaresi                                          ', N'davide.pesaresi.stud@ispascalcomandini.it                                                           ', N'4F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'davide                                            ', N'rizzo                                             ', N'davide.rizzo.stud@ispascalcomandini.it                                                              ', N'1L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'davide                                            ', N'rossi                                             ', N'davide.rossi.stud@ispascalcomandini.it                                                              ', N'4I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'davide                                            ', N'rossi                                             ', N'davide.rossi1.stud@ispascalcomandini.it                                                             ', N'2C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'davide                                            ', N'turroni                                           ', N'davide.turroni.stud@ispascalcomandini.it                                                            ', N'1B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'davide                                            ', N'zammarchi                                         ', N'davide.zammarchi.stud@ispascalcomandini.it                                                          ', N'2C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'davide marco                                      ', N'ferar tofan                                       ', N'davidemarco.ferartofan.stud@ispascalcomandini.it                                                    ', N'1E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'davide simone                                     ', N'di muro                                           ', N'davidesimone.dimuro.stud@ispascalcomandini.it                                                       ', N'1C-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'david mario                                       ', N'novello                                           ', N'davidmario.novello.stud@ispascalcomandini.it                                                        ', N'3M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'deniel                                            ', N'dogana                                            ', N'deniel.dogana.stud@ispascalcomandini.it                                                             ', N'4G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'deniel                                            ', N'paolucci                                          ', N'deniel.paolucci.stud@ispascalcomandini.it                                                           ', N'1L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'denis                                             ', N'casadei                                           ', N'denis.casadei.stud@ispascalcomandini.it                                                             ', N'2H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'denis                                             ', N'gennari                                           ', N'denis.gennari.stud@ispascalcomandini.it                                                             ', N'3A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'denis                                             ', N'iudica                                            ', N'denis.iudica.stud@ispascalcomandini.it                                                              ', N'2C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'denis                                             ', N'kadiu                                             ', N'denis.kadiu.stud@ispascalcomandini.it                                                               ', N'3B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'denis                                             ', N'trasca                                            ', N'denis.trasca.stud@ispascalcomandini.it                                                              ', N'3B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'verstivschii                                      ', N'deniz                                             ', N'deniz.verstivschii.stud@ispascalcomandini.it                                                        ', N'3E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'dennis                                            ', N'boschi                                            ', N'dennis.boschi.stud@ispascalcomandini.it                                                             ', N'1A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'dennis                                            ', N'comandini                                         ', N'dennis.comandini.stud@ispascalcomandini.it                                                          ', N'4H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'dennis                                            ', N'forlesi                                           ', N'dennis.forlesi.stud@ispascalcomandini.it                                                            ', N'5L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'desire''                                           ', N'graffiedi                                         ', N'desire.graffiedi.stud@ispascalcomandini.it                                                          ', N'5A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'diego                                             ', N'adames                                            ', N'diego.adames.stud@ispascalcomandini.it                                                              ', N'4A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'diego                                             ', N'battistini                                        ', N'diego.battistini.stud@ispascalcomandini.it                                                          ', N'3G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'bernabini                                         ', N'diego                                             ', N'diego.bernabini.stud@ispascalcomandini.it                                                           ', N'3E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'diego                                             ', N'cantoni                                           ', N'diego.cantoni.stud@ispascalcomandini.it                                                             ', N'2H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'diego                                             ', N'casadei                                           ', N'diego.casadei.stud@ispascalcomandini.it                                                             ', N'4E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'diego                                             ', N'cicognani                                         ', N'diego.cicognani.stud@ispascalcomandini.it                                                           ', N'3A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'diego                                             ', N'dall''ara                                          ', N'diego.dallara.stud@ispascalcomandini.it                                                             ', N'1C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'diego                                             ', N'ducci                                             ', N'diego.ducci.stud@ispascalcomandini.it                                                               ', N'2E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'diego                                             ', N'favaloro                                          ', N'diego.favaloro.stud@ispascalcomandini.it                                                            ', N'1C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'diego                                             ', N'giangrandi                                        ', N'diego.giangrandi.stud@ispascalcomandini.it                                                          ', N'2F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'diego                                             ', N'giovannini                                        ', N'diego.giovannini.stud@ispascalcomandini.it                                                          ', N'2F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'diego                                             ', N'magnani                                           ', N'diego.magnani.stud@ispascalcomandini.it                                                             ', N'2G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'diego                                             ', N'martucci                                          ', N'diego.martucci.stud@ispascalcomandini.it                                                            ', N'4B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'diego                                             ', N'ricci                                             ', N'diego.ricci.stud@ispascalcomandini.it                                                               ', N'3B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'diego                                             ', N'salandra                                          ', N'diego.salandra.stud@ispascalcomandini.it                                                            ', N'3A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'diego                                             ', N'satta                                             ', N'diego.satta.stud@ispascalcomandini.it                                                               ', N'5H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'diego                                             ', N'serri                                             ', N'diego.serri.stud@ispascalcomandini.it                                                               ', N'1G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'diego                                             ', N'severino                                          ', N'diego.severino.stud@ispascalcomandini.it                                                            ', N'1C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'diego                                             ', N'vagnini                                           ', N'diego.vagnini.stud@ispascalcomandini.it                                                             ', N'2F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'diego                                             ', N'zandoli                                           ', N'diego.zandoli.stud@ispascalcomandini.it                                                             ', N'1E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'bolognesi                                         ', N'diego elias                                       ', N'diegoelias.bolognesi.stud@ispascalcomandini.it                                                      ', N'2E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'diego.marcos                                      ', N'poli                                              ', N'diegomarcos.poli.stud@ispascalcomandini.it                                                          ', N'5G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'dilson                                            ', N'lusha                                             ', N'dilson.lusha.stud@ispascalcomandini.it                                                              ', N'1A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'Francesco                                         ', N'Postiglione                                       ', N'dirigenza@ispascalcomandini.it                                                                      ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'domenico                                          ', N'di maggio                                         ', N'domenico.dimaggio.stud@ispascalcomandini.it                                                         ', N'2B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'domi                                              ', N'klajdi                                            ', N'domi.klajdi.stud@ispascalcomandini.it                                                               ', N'1A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'dominik                                           ', N'balducci                                          ', N'dominik.balducci.stud@ispascalcomandini.it                                                          ', N'1F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'dominik                                           ', N'jaszczyszyn                                       ', N'dominik.jaszczyszyn.stud@ispascalcomandini.it                                                       ', N'1F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'dylan                                             ', N'boffa                                             ', N'dylan.boffa.stud@ispascalcomandini.it                                                               ', N'5A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'dylan                                             ', N'lombardini                                        ', N'dylan.lombardini.stud@ispascalcomandini.it                                                          ', N'3E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'edoardo                                           ', N'allegrezza                                        ', N'edoardo.allegrezza.stud@ispascalcomandini.it                                                        ', N'5E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'edoardo                                           ', N'dal ben                                           ', N'edoardo.dalben.stud@ispascalcomandini.it                                                            ', N'3E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'edoardo                                           ', N'di lecce                                          ', N'edoardo.dilecce.stud@ispascalcomandini.it                                                           ', N'4D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'edoardo                                           ', N'di salvo                                          ', N'edoardo.disalvo.stud@ispascalcomandini.it                                                           ', N'1C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'edoardo                                           ', N'grigoriu                                          ', N'edoardo.grigoriu.stud@ispascalcomandini.it                                                          ', N'3A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'edoardo                                           ', N'nini                                              ', N'edoardo.nini.stud@ispascalcomandini.it                                                              ', N'4L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'edoardo                                           ', N'righi                                             ', N'edoardo.righi.stud@ispascalcomandini.it                                                             ', N'1G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'edoardo                                           ', N'silighini                                         ', N'edoardo.silighini.stud@ispascalcomandini.it                                                         ', N'1A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'edoardo                                           ', N'zamagni                                           ', N'edoardo.zamagni.stud@ispascalcomandini.it                                                           ', N'1N-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'eduard cosmin                                     ', N'gai                                               ', N'eduardcosmin.gai.stud@ispascalcomandini.it                                                          ', N'1B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ciobotaru chiparus                                ', N'eduardo                                           ', N'eduardo.ciobotaruchiparus.stud@ispascalcomandini.it                                                 ', N'3G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'egzon                                             ', N'niceri                                            ', N'egzon.niceri.stud@ispascalcomandini.it                                                              ', N'1L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'eldison                                           ', N'toka                                              ', N'eldison.toka.stud@ispascalcomandini.it                                                              ', N'1B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'eleas                                             ', N'zahir                                             ', N'eleas.zahir.stud@ispascalcomandini.it                                                               ', N'3A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'Elena                                             ', N'Brandolini                                        ', N'elena.brandolini@ispascalcomandini.it                                                               ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'elena                                             ', N'casadei                                           ', N'elena.casadei@ispascalcomandini.it                                                                  ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'elena                                             ', N'pasini                                            ', N'elena.pasini.stud@ispascalcomandini.it                                                              ', N'4D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'elena                                             ', N'piraccini                                         ', N'elena.piraccini@ispascalcomandini.it                                                                ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'elena                                             ', N'zavoli                                            ', N'elena.zavoli.stud@ispascalcomandini.it                                                              ', N'1F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'Eleonora                                          ', N'Gagliardi                                         ', N'eleonora.gagliardi@ispascalcomandini.it                                                             ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'elia                                              ', N'antoniacci                                        ', N'elia.antoniacci.stud@ispascalcomandini.it                                                           ', N'3A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'elia                                              ', N'bagnolini                                         ', N'elia.bagnolini.stud@ispascalcomandini.it                                                            ', N'5D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'elia                                              ', N'caprelli                                          ', N'elia.caprelli.stud@ispascalcomandini.it                                                             ', N'3A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'elia                                              ', N'casalboni                                         ', N'elia.casalboni.stud@ispascalcomandini.it                                                            ', N'5H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'elia                                              ', N'elleri                                            ', N'elia.elleri.stud@ispascalcomandini.it                                                               ', N'4G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'elia                                              ', N'fusconi                                           ', N'elia.fusconi.stud@ispascalcomandini.it                                                              ', N'5C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'elia                                              ', N'lanzoni                                           ', N'elia.lanzoni.stud@ispascalcomandini.it                                                              ', N'1M-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'elia                                              ', N'mami                                              ', N'elia.mami.stud@ispascalcomandini.it                                                                 ', N'4I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'elia                                              ', N'mazzotti                                          ', N'elia.mazzotti.stud@ispascalcomandini.it                                                             ', N'1A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'soldati                                           ', N'elia                                              ', N'elia.soldati.stud@ispascalcomandini.it                                                              ', N'3G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'zanotti                                           ', N'elia                                              ', N'elia.zanotti.stud@ispascalcomandini.it                                                              ', N'3G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'elisa                                             ', N'forti                                             ', N'elisa.forti@ispascalcomandini.it                                                                    ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'elisa                                             ', N'mengozzi                                          ', N'elisa.mengozzi.stud@ispascalcomandini.it                                                            ', N'1M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'elisa                                             ', N'venturi                                           ', N'elisa.venturi@ispascalcomandini.it                                                                  ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'elsi                                              ', N'pepa                                              ', N'elsi.pepa.stud@ispascalcomandini.it                                                                 ', N'2E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'elyes                                             ', N'nejimi                                            ', N'elyes.nejimi.stud@ispascalcomandini.it                                                              ', N'2M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'emanuel                                           ', N'binjakaj                                          ', N'emanuel.binjakaj.stud@ispascalcomandini.it                                                          ', N'3E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'emanuel dumitru                                   ', N'militaru                                          ', N'emanueldumitru.militaru.stud@ispascalcomandini.it                                                   ', N'1H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'emanuele                                          ', N'conti                                             ', N'emanuele.conti.stud@ispascalcomandini.it                                                            ', N'1G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'emanuele                                          ', N'ercolani                                          ', N'emanuele.ercolani.stud@ispascalcomandini.it                                                         ', N'5C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'emanuele                                          ', N'gattamorta                                        ', N'emanuele.gattamorta.stud@ispascalcomandini.it                                                       ', N'5H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'emanuele                                          ', N'gaza                                              ', N'emanuele.gaza.stud@ispascalcomandini.it                                                             ', N'5L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'emanuele                                          ', N'iasi                                              ', N'emanuele.iasi.stud@ispascalcomandini.it                                                             ', N'1E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marzaro                                           ', N'emanuele                                          ', N'emanuele.marzaro.stud@ispascalcomandini.it                                                          ', N'2I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nuti                                              ', N'emanuele                                          ', N'emanuele.nuti.stud@ispascalcomandini.it                                                             ', N'3H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'emanuele                                          ', N'parini                                            ', N'emanuele.parini@ispascalcomandini.it                                                                ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'emanuele                                          ', N'passaro                                           ', N'emanuele.passaro.stud@ispascalcomandini.it                                                          ', N'2A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'emanuele luca                                     ', N'de tullio                                         ', N'emanueleluca.detullio.stud@ispascalcomandini.it                                                     ', N'4B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'emanuel enrico                                    ', N'alpini                                            ', N'emanuelenrico.alpini.stud@ispascalcomandini.it                                                      ', N'4H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'emiliano                                          ', N'xhafa                                             ', N'emiliano.xhafa.stud@ispascalcomandini.it                                                            ', N'1C-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'emilov                                            ', N'vasilev teodor                                    ', N'emilov.vasilevteodor.stud@ispascalcomandini.it                                                      ', N'3M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'emily                                             ', N'arpino                                            ', N'emily.arpino.stud@ispascalcomandini.it                                                              ', N'2M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'emma                                              ', N'marchetti                                         ', N'emma.marchetti.stud@ispascalcomandini.it                                                            ', N'3M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'emma                                              ', N'zoffoli                                           ', N'emma.zoffoli.stud@ispascalcomandini.it                                                              ', N'2M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'endi                                              ', N'dyrmyshi                                          ', N'endi.dyrmyshi.stud@ispascalcomandini.it                                                             ', N'5G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'enea                                              ', N'abbondanza                                        ', N'enea.abbondanza.stud@ispascalcomandini.it                                                           ', N'2A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'enea                                              ', N'milantoni                                         ', N'enea.milantoni.stud@ispascalcomandini.it                                                            ', N'3A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'enea                                              ', N'plaka                                             ', N'enea.plaka.stud@ispascalcomandini.it                                                                ', N'1E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'enea                                              ', N'sagias                                            ', N'enea.sagias.stud@ispascalcomandini.it                                                               ', N'1I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'enrico                                            ', N'ancarani                                          ', N'enrico.ancarani.stud@ispascalcomandini.it                                                           ', N'4I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'enrico                                            ', N'boschetti                                         ', N'enrico.boschetti.stud@ispascalcomandini.it                                                          ', N'4C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'enrico                                            ', N'd''aleo                                            ', N'enrico.daleo.stud@ispascalcomandini.it                                                              ', N'2A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'enrico                                            ', N'dellomo                                           ', N'enrico.dellomo.stud@ispascalcomandini.it                                                            ', N'5E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'enrico                                            ', N'forti                                             ', N'enrico.forti.stud@ispascalcomandini.it                                                              ', N'5G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'enrico                                            ', N'giunchi                                           ', N'enrico.giunchi.stud@ispascalcomandini.it                                                            ', N'2B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'enrico                                            ', N'gozzi                                             ', N'enrico.gozzi.stud@ispascalcomandini.it                                                              ', N'5H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'enrico                                            ', N'hu                                                ', N'enrico.hu.stud@ispascalcomandini.it                                                                 ', N'1M-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'enrico                                            ', N'pasini                                            ', N'enrico.pasini.stud@ispascalcomandini.it                                                             ', N'5B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'enrico                                            ', N'pazzaglia                                         ', N'enrico.pazzaglia.stud@ispascalcomandini.it                                                          ', N'5D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'enrico                                            ', N'rossi                                             ', N'enrico.rossi.stud@ispascalcomandini.it                                                              ', N'4L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'rotondo                                           ', N'enrico                                            ', N'enrico.rotondo.stud@ispascalcomandini.it                                                            ', N'3G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'enrico                                            ', N'sartini                                           ', N'enrico.sartini.stud@ispascalcomandini.it                                                            ', N'2A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'enrico                                            ', N'valenti                                           ', N'enrico.valenti@ispascalcomandini.it                                                                 ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'enrico                                            ', N'ventrucci                                         ', N'enrico.ventrucci.stud@ispascalcomandini.it                                                          ', N'2E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'enrico antonio                                    ', N'signore                                           ', N'enricoantonio.signore.stud@ispascalcomandini.it                                                     ', N'4I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'sela                                              ', N'ensi                                              ', N'ensi.sela.stud@ispascalcomandini.it                                                                 ', N'3E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'petrini                                           ', N'enzo                                              ', N'enzo.petrini.stud@ispascalcomandini.it                                                              ', N'2I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'enzo                                              ', N'sulaj                                             ', N'enzo.sulaj.stud@ispascalcomandini.it                                                                ', N'4E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'eric                                              ', N'aquilotti                                         ', N'eric.aquilotti.stud@ispascalcomandini.it                                                            ', N'4I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'erik                                              ', N'magalotti                                         ', N'erik.magalotti.stud@ispascalcomandini.it                                                            ', N'2A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'erin                                              ', N'francesconi                                       ', N'erin.francesconi.stud@ispascalcomandini.it                                                          ', N'5B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'erminia                                           ', N'alecci                                            ', N'erminia.alecci@ispascalcomandini.it                                                                 ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'erminia                                           ', N'sica                                              ', N'erminia.sica@ispascalcomandini.it                                                                   ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'eros                                              ', N'soldati                                           ', N'eros.soldati.stud@ispascalcomandini.it                                                              ', N'1F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ethan                                             ', N'angeli                                            ', N'ethan.angeli.stud@ispascalcomandini.it                                                              ', N'1G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ettore                                            ', N'crapanzano                                        ', N'ettore.crapanzano.stud@ispascalcomandini.it                                                         ', N'1F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ettore                                            ', N'toma                                              ', N'ettore.toma.stud@ispascalcomandini.it                                                               ', N'1L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'eugenio                                           ', N'bosco                                             ', N'eugenio.bosco.stud@ispascalcomandini.it                                                             ', N'4A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'eva                                               ', N'paciotti                                          ', N'eva.paciotti.stud@ispascalcomandini.it                                                              ', N'2A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'evan                                              ', N'zamboni                                           ', N'evan.zamboni.stud@ispascalcomandini.it                                                              ', N'1G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'fabio                                             ', N'bazzocchi                                         ', N'fabio.bazzocchi.stud@ispascalcomandini.it                                                           ', N'3C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'fabio                                             ', N'borgini                                           ', N'fabio.borgini.stud@ispascalcomandini.it                                                             ', N'4D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'fabio                                             ', N'cobaj                                             ', N'fabio.cobaj.stud@ispascalcomandini.it                                                               ', N'3B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'fabio                                             ', N'di serio                                          ', N'fabio.diserio.stud@ispascalcomandini.it                                                             ', N'4C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'fabio                                             ', N'fantini                                           ', N'fabio.fantini.stud@ispascalcomandini.it                                                             ', N'1H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'fabio                                             ', N'fattori                                           ', N'fabio.fattori.stud@ispascalcomandini.it                                                             ', N'5G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'fabio                                             ', N'forlivesi                                         ', N'fabio.forlivesi.stud@ispascalcomandini.it                                                           ', N'5C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'malucelli                                         ', N'fabio                                             ', N'fabio.malucelli.stud@ispascalcomandini.it                                                           ', N'3G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'fabio                                             ', N'musta                                             ', N'fabio.musta.stud@ispascalcomandini.it                                                               ', N'1E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'fabio                                             ', N'pieri                                             ', N'fabio.pieri.stud@ispascalcomandini.it                                                               ', N'2M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'fabio                                             ', N'reggiani                                          ', N'fabio.reggiani.stud@ispascalcomandini.it                                                            ', N'1F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'fabio                                             ', N'valzania                                          ', N'fabio.valzania.stud@ispascalcomandini.it                                                            ', N'4B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'fabio                                             ', N'venturi                                           ', N'fabio.venturi.stud@ispascalcomandini.it                                                             ', N'2H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'fabio                                             ', N'venzi                                             ', N'fabio.venzi.stud@ispascalcomandini.it                                                               ', N'5C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'fabrizio                                          ', N'clementi                                          ', N'fabrizio.clementi.stud@ispascalcomandini.it                                                         ', N'2A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'fadal                                             ', N'amar                                              ', N'fadal.amar.stud@ispascalcomandini.it                                                                ', N'3E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'fahd                                              ', N'hajjaoui                                          ', N'fahd.hajjaoui.stud@ispascalcomandini.it                                                             ', N'3G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'farouk                                            ', N'djerboua                                          ', N'farouk.djerboua.stud@ispascalcomandini.it                                                           ', N'1A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'favour.osaretin                                   ', N'emuwahen                                          ', N'favourosaretin.emuwahen.stud@ispascalcomandini.it                                                   ', N'3E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'Federica                                          ', N'Fabbri                                            ', N'federica.fabbri@ispascalcomandini.it                                                                ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'federica                                          ', N'mallozzi                                          ', N'federica.mallozzi.stud@ispascalcomandini.it                                                         ', N'1L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'federica                                          ', N'montanari                                         ', N'federica.montanari@ispascalcomandini.it                                                             ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'federica                                          ', N'pieri                                             ', N'federica.pieri@ispascalcomandini.it                                                                 ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'federica                                          ', N'zani                                              ', N'federica.zani.stud@ispascalcomandini.it                                                             ', N'5G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'federico                                          ', N'armanni                                           ', N'federico.armanni.stud@ispascalcomandini.it                                                          ', N'4E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'federico                                          ', N'balestra                                          ', N'federico.balestra.stud@ispascalcomandini.it                                                         ', N'5D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'federico                                          ', N'becci                                             ', N'federico.becci.stud@ispascalcomandini.it                                                            ', N'1M-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'federico                                          ', N'berti                                             ', N'federico.berti.stud@ispascalcomandini.it                                                            ', N'2E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'federico                                          ', N'dolci                                             ', N'federico.dolci.stud@ispascalcomandini.it                                                            ', N'1N-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'federico                                          ', N'faggi                                             ', N'federico.faggi.stud@ispascalcomandini.it                                                            ', N'4B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'federico                                          ', N'ferretti                                          ', N'federico.ferretti.stud@ispascalcomandini.it                                                         ', N'1A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'federico                                          ', N'freschi                                           ', N'federico.freschi.stud@ispascalcomandini.it                                                          ', N'5A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'federico                                          ', N'golinucci                                         ', N'federico.golinucci.stud@ispascalcomandini.it                                                        ', N'1G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'federico                                          ', N'iannotti                                          ', N'federico.iannotti.stud@ispascalcomandini.it                                                         ', N'3M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'federico                                          ', N'lega                                              ', N'federico.lega.stud@ispascalcomandini.it                                                             ', N'1M-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'federico                                          ', N'mariani                                           ', N'federico.mariani.stud@ispascalcomandini.it                                                          ', N'4L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'federico                                          ', N'medri                                             ', N'federico.medri.stud@ispascalcomandini.it                                                            ', N'3C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'federico                                          ', N'minguzzi                                          ', N'federico.minguzzi.stud@ispascalcomandini.it                                                         ', N'2G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'federico                                          ', N'molara                                            ', N'federico.molara@ispascalcomandini.it                                                                ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'monti                                             ', N'federico                                          ', N'federico.monti.stud@ispascalcomandini.it                                                            ', N'3G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'federico                                          ', N'morigi                                            ', N'federico.morigi.stud@ispascalcomandini.it                                                           ', N'3B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'federico                                          ', N'palmiotto                                         ', N'federico.palmiotto.stud@ispascalcomandini.it                                                        ', N'1H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'federico                                          ', N'para                                              ', N'federico.para.stud@ispascalcomandini.it                                                             ', N'1L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'federico                                          ', N'posillipo                                         ', N'federico.posillipo@ispascalcomandini.it                                                             ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'federico                                          ', N'prati                                             ', N'federico.prati.stud@ispascalcomandini.it                                                            ', N'1M-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'federico                                          ', N'ricci                                             ', N'federico.ricci.stud@ispascalcomandini.it                                                            ', N'4L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'federico                                          ', N'rizzo                                             ', N'federico.rizzo.stud@ispascalcomandini.it                                                            ', N'5B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'rossi                                             ', N'federico                                          ', N'federico.rossi.stud@ispascalcomandini.it                                                            ', N'2A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'federico                                          ', N'teodorani                                         ', N'federico.teodorani@ispascalcomandini.it                                                             ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'filippo                                           ', N'alvisi                                            ', N'filippo.alvisi1.stud@ispascalcomandini.it                                                           ', N'2E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'filippo                                           ', N'bertaccini                                        ', N'filippo.bertaccini.stud@ispascalcomandini.it                                                        ', N'1N-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'filippo                                           ', N'bertozzi                                          ', N'filippo.bertozzi.stud@ispascalcomandini.it                                                          ', N'5C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'filippo                                           ', N'biguzzi                                           ', N'filippo.biguzzi.stud@ispascalcomandini.it                                                           ', N'2G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'filippo                                           ', N'bisulli                                           ', N'filippo.bisulli.stud@ispascalcomandini.it                                                           ', N'5L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'filippo                                           ', N'bucci                                             ', N'filippo.bucci.stud@ispascalcomandini.it                                                             ', N'5D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'filippo                                           ', N'bucella                                           ', N'filippo.bucella.stud@ispascalcomandini.it                                                           ', N'1A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'filippo                                           ', N'buda                                              ', N'filippo.buda.stud@ispascalcomandini.it                                                              ', N'1I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'castellucci                                       ', N'filippo                                           ', N'filippo.castellucci.stud@ispascalcomandini.it                                                       ', N'3H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'filippo                                           ', N'cenni                                             ', N'filippo.cenni.stud@ispascalcomandini.it                                                             ', N'4A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'filippo                                           ', N'dall''ara                                          ', N'filippo.dallara.stud@ispascalcomandini.it                                                           ', N'2B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'filippo                                           ', N'fabbri                                            ', N'filippo.fabbri.stud@ispascalcomandini.it                                                            ', N'1C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'filippo                                           ', N'francalanci                                       ', N'filippo.francalanci.stud@ispascalcomandini.it                                                       ', N'5H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'filippo                                           ', N'giannini                                          ', N'filippo.giannini.stud@ispascalcomandini.it                                                          ', N'1C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'filippo                                           ', N'giovannini                                        ', N'filippo.giovannini.stud@ispascalcomandini.it                                                        ', N'4A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'filippo                                           ', N'maldini                                           ', N'filippo.maldini.stud@ispascalcomandini.it                                                           ', N'2B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'filippo                                           ', N'mariani d''altri                                   ', N'filippo.marianidaltri.stud@ispascalcomandini.it                                                     ', N'4H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'filippo                                           ', N'marinelli                                         ', N'filippo.marinelli.stud@ispascalcomandini.it                                                         ', N'1F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'filippo                                           ', N'merlini                                           ', N'filippo.merlini.stud@ispascalcomandini.it                                                           ', N'4F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'filippo                                           ', N'montalti                                          ', N'filippo.montalti.stud@ispascalcomandini.it                                                          ', N'5E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'filippo                                           ', N'omicini                                           ', N'filippo.omicini.stud@ispascalcomandini.it                                                           ', N'5G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'filippo                                           ', N'patruno                                           ', N'filippo.patruno.stud@ispascalcomandini.it                                                           ', N'5G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'filippo                                           ', N'piraccini                                         ', N'filippo.piraccini.stud@ispascalcomandini.it                                                         ', N'1C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'filippo                                           ', N'praconi                                           ', N'filippo.praconi.stud@ispascalcomandini.it                                                           ', N'3C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'filippo                                           ', N'ricci                                             ', N'filippo.ricci.stud@ispascalcomandini.it                                                             ', N'4H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'righi                                             ', N'filippo                                           ', N'filippo.righi.stud@ispascalcomandini.it                                                             ', N'2I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'filippo                                           ', N'spignoli                                          ', N'filippo.spignoli.stud@ispascalcomandini.it                                                          ', N'3A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'filippo                                           ', N'spirito                                           ', N'filippo.spirito@ispascalcomandini.it                                                                ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'filippo                                           ', N'tappi                                             ', N'filippo.tappi.stud@ispascalcomandini.it                                                             ', N'4C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'filippo                                           ', N'zani                                              ', N'filippo.zani.stud@ispascalcomandini.it                                                              ', N'5G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'filomena                                          ', N'perfetto                                          ', N'filomena.perfetto@ispascalcomandini.it                                                              ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'flavio                                            ', N'bartolini                                         ', N'flavio.bartolini.stud@ispascalcomandini.it                                                          ', N'4B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'flavio                                            ', N'milani                                            ', N'flavio.milani.stud@ispascalcomandini.it                                                             ', N'3E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'flavio                                            ', N'qepi                                              ', N'flavio.qepi.stud@ispascalcomandini.it                                                               ', N'3B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'fortunata                                         ', N'macri''                                            ', N'fortunata.macri@ispascalcomandini.it                                                                ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesca                                         ', N'piraccini                                         ', N'francesca.piraccini@ispascalcomandini.it                                                            ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesca                                         ', N'righi                                             ', N'francesca.righi.stud@ispascalcomandini.it                                                           ', N'1A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'amaduzzi                                          ', N'francesco.amaduzzi.stud@ispascalcomandini.it                                                        ', N'2B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'bacchiocca                                        ', N'francesco.bacchiocca.stud@ispascalcomandini.it                                                      ', N'1C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'beccanti                                          ', N'francesco.beccanti.stud@ispascalcomandini.it                                                        ', N'1I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'bocchini                                          ', N'francesco.bocchini.stud@ispascalcomandini.it                                                        ', N'5B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'brighi                                            ', N'francesco.brighi.stud@ispascalcomandini.it                                                          ', N'1L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'cangini                                           ', N'francesco.cangini.stud@ispascalcomandini.it                                                         ', N'1F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'caravita                                          ', N'francesco                                         ', N'francesco.caravita.stud@ispascalcomandini.it                                                        ', N'3I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'casadei                                           ', N'francesco.casadei.stud@ispascalcomandini.it                                                         ', N'1B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'casalboni                                         ', N'francesco.casalboni.stud@ispascalcomandini.it                                                       ', N'3A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'corona                                            ', N'francesco.corona.stud@ispascalcomandini.it                                                          ', N'3B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'dama                                              ', N'francesco.dama.stud@ispascalcomandini.it                                                            ', N'3C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'dell''emilia                                       ', N'francesco.dellemilia.stud@ispascalcomandini.it                                                      ', N'4C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'fabbretti                                         ', N'francesco.fabbretti@ispascalcomandini.it                                                            ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'fantini                                           ', N'francesco.fantini.stud@ispascalcomandini.it                                                         ', N'4B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'filomena                                          ', N'francesco.filomena@ispascalcomandini.it                                                             ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'floram                                            ', N'francesco.floram.stud@ispascalcomandini.it                                                          ', N'5E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'foschi                                            ', N'francesco.foschi.stud@ispascalcomandini.it                                                          ', N'5L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'foschi                                            ', N'francesco.foschi1.stud@ispascalcomandini.it                                                         ', N'1E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'gattei                                            ', N'francesco.gattei.stud@ispascalcomandini.it                                                          ', N'4D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'gridelli                                          ', N'francesco.gridelli.stud@ispascalcomandini.it                                                        ', N'1A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'grippo                                            ', N'francesco.grippo.stud@ispascalcomandini.it                                                          ', N'2C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'guarino                                           ', N'francesco.guarino.stud@ispascalcomandini.it                                                         ', N'3B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'incelli                                           ', N'francesco.incelli.stud@ispascalcomandini.it                                                         ', N'5D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'lisi                                              ', N'francesco.lisi.stud@ispascalcomandini.it                                                            ', N'2G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'macrelli                                          ', N'francesco.macrelli.stud@ispascalcomandini.it                                                        ', N'2I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'manuzzi                                           ', N'francesco.manuzzi.stud@ispascalcomandini.it                                                         ', N'2G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'marchesini                                        ', N'francesco.marchesini.stud@ispascalcomandini.it                                                      ', N'3B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'meloni                                            ', N'francesco.meloni.stud@ispascalcomandini.it                                                          ', N'4I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'mema                                              ', N'francesco.mema.stud@ispascalcomandini.it                                                            ', N'1F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'monti                                             ', N'francesco.monti.stud@ispascalcomandini.it                                                           ', N'2E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'moretti                                           ', N'francesco                                         ', N'francesco.moretti.stud@ispascalcomandini.it                                                         ', N'3G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'oddo                                              ', N'francesco.oddo.stud@ispascalcomandini.it                                                            ', N'1E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'pazzaglia                                         ', N'francesco.pazzaglia.stud@ispascalcomandini.it                                                       ', N'5H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'piacenti                                          ', N'francesco.piacenti.stud@ispascalcomandini.it                                                        ', N'1M-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'prugnoli                                          ', N'francesco.prugnoli.stud@ispascalcomandini.it                                                        ', N'4D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'repole                                            ', N'francesco.repole.stud@ispascalcomandini.it                                                          ', N'2G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'righi                                             ', N'francesco.righi.stud@ispascalcomandini.it                                                           ', N'1E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'scollo                                            ', N'francesco.scollo.stud@ispascalcomandini.it                                                          ', N'4D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'serrani                                           ', N'francesco                                         ', N'francesco.serrani.stud@ispascalcomandini.it                                                         ', N'3G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'stortini                                          ', N'francesco.stortini.stud@ispascalcomandini.it                                                        ', N'4H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'suzzi                                             ', N'francesco.suzzi.stud@ispascalcomandini.it                                                           ', N'1H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'Francesco                                         ', N'Tappi                                             ', N'francesco.tappi@ispascalcomandini.it                                                                ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'tisselli                                          ', N'francesco.tisselli.stud@ispascalcomandini.it                                                        ', N'2H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'tonelli                                           ', N'francesco.tonelli.stud@ispascalcomandini.it                                                         ', N'5G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'venturi                                           ', N'francesco.venturi@ispascalcomandini.it                                                              ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'venzi                                             ', N'francesco.venzi.stud@ispascalcomandini.it                                                           ', N'1B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco                                         ', N'xhango                                            ', N'francesco.xhango.stud@ispascalcomandini.it                                                          ', N'1N-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco pio                                     ', N'de luca                                           ', N'francescopio.deluca.stud@ispascalcomandini.it                                                       ', N'2A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'francesco pio                                     ', N'lupoli                                            ', N'francescopio.lupoli.stud@ispascalcomandini.it                                                       ', N'2E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'freskida                                          ', N'sylja                                             ', N'freskida.sylja.stud@ispascalcomandini.it                                                            ', N'5A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gabriel                                           ', N'bianchi                                           ', N'gabriel.bianchi.stud@ispascalcomandini.it                                                           ', N'1G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gabriel                                           ', N'gjopepaj                                          ', N'gabriel.gjopepaj.stud@ispascalcomandini.it                                                          ', N'1I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gabriele                                          ', N'bagnolini                                         ', N'gabriele.bagnolini.stud@ispascalcomandini.it                                                        ', N'2F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gabriele                                          ', N'bardi                                             ', N'gabriele.bardi.stud@ispascalcomandini.it                                                            ', N'3A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gabriele                                          ', N'boschi                                            ', N'gabriele.boschi.stud@ispascalcomandini.it                                                           ', N'4A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gabriele                                          ', N'monti                                             ', N'gabriele.monti@ispascalcomandini.it                                                                 ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gabriele                                          ', N'rinaldi                                           ', N'gabriele.rinaldi.stud@ispascalcomandini.it                                                          ', N'1G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gabriele                                          ', N'squadrani                                         ', N'gabriele.squadrani.stud@ispascalcomandini.it                                                        ', N'1H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gabriele                                          ', N'tagarelli                                         ', N'gabriele.tagarelli.stud@ispascalcomandini.it                                                        ', N'2G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gabriele                                          ', N'teodorani                                         ', N'gabriele.teodorani.stud@ispascalcomandini.it                                                        ', N'3B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gabriele                                          ', N'ventura                                           ', N'gabriele.ventura.stud@ispascalcomandini.it                                                          ', N'1I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gabriele                                          ', N'vincenzi                                          ', N'gabriele.vincenzi.stud@ispascalcomandini.it                                                         ', N'4G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gabriella                                         ', N'benedettini                                       ', N'gabriella.benedettini@ispascalcomandini.it                                                          ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gabriel nicolo''                                   ', N'maraldi                                           ', N'gabrielnicolo.maraldi.stud@ispascalcomandini.it                                                     ', N'4L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gaetano                                           ', N'paudice                                           ', N'gaetano.paudice@ispascalcomandini.it                                                                ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gaetano                                           ', N'toscano                                           ', N'gaetano.toscano.stud@ispascalcomandini.it                                                           ', N'3E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gaia                                              ', N'malesci                                           ', N'gaia.malesci.stud@ispascalcomandini.it                                                              ', N'1M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'georgiana florentina                              ', N'olan                                              ', N'georgianaflorentina.olan.stud@ispascalcomandini.it                                                  ', N'5A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gerardo                                           ', N'mariotti                                          ', N'gerardo.mariotti@ispascalcomandini.it                                                               ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ghait                                             ', N'zairi                                             ', N'ghait.zairi.stud@ispascalcomandini.it                                                               ', N'1A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gherghina vasileva                                ', N'ivanova                                           ', N'gherghinavasileva.ivanova.stud@ispascalcomandini.it                                                 ', N'2M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giacomo                                           ', N'bortoluzzi                                        ', N'giacomo.bortoluzzi@ispascalcomandini.it                                                             ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giacomo                                           ', N'boschi                                            ', N'giacomo.boschi.stud@ispascalcomandini.it                                                            ', N'5E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giacomo                                           ', N'brigliadori                                       ', N'giacomo.brigliadori.stud@ispascalcomandini.it                                                       ', N'3H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giacomo                                           ', N'carloni                                           ', N'giacomo.carloni.stud@ispascalcomandini.it                                                           ', N'5C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giacomo                                           ', N'casadei                                           ', N'giacomo.casadei.stud@ispascalcomandini.it                                                           ', N'5D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giacomo                                           ', N'cervellati                                        ', N'giacomo.cervellati.stud@ispascalcomandini.it                                                        ', N'1B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giacomo                                           ', N'comandini                                         ', N'giacomo.comandini.stud@ispascalcomandini.it                                                         ', N'1A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giacomo                                           ', N'ferrari                                           ', N'giacomo.ferrari.stud@ispascalcomandini.it                                                           ', N'1H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giacomo                                           ', N'gattei                                            ', N'giacomo.gattei.stud@ispascalcomandini.it                                                            ', N'1F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giacomo                                           ', N'gazza                                             ', N'giacomo.gazza.stud@ispascalcomandini.it                                                             ', N'1M-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giacomo                                           ', N'lazzari                                           ', N'giacomo.lazzari.stud@ispascalcomandini.it                                                           ', N'5G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giacomo                                           ', N'mingozzi                                          ', N'giacomo.mingozzi.stud@ispascalcomandini.it                                                          ', N'3A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giacomo                                           ', N'minotti                                           ', N'giacomo.minotti.stud@ispascalcomandini.it                                                           ', N'3B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giacomo                                           ', N'monticelli                                        ', N'giacomo.monticelli.stud@ispascalcomandini.it                                                        ', N'2I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mughetti maraldi                                  ', N'giacomo                                           ', N'giacomo.mughettimaraldi.stud@ispascalcomandini.it                                                   ', N'3E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giacomo                                           ', N'pagliarani                                        ', N'giacomo.pagliarani.stud@ispascalcomandini.it                                                        ', N'1L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giacomo                                           ', N'pasini                                            ', N'giacomo.pasini.stud@ispascalcomandini.it                                                            ', N'5C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giacomo                                           ', N'pullini                                           ', N'giacomo.pullini.stud@ispascalcomandini.it                                                           ', N'5L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giacomo                                           ', N'rossi                                             ', N'giacomo.rossi.stud@ispascalcomandini.it                                                             ', N'4B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giacomo                                           ', N'rubboli                                           ', N'giacomo.rubboli.stud@ispascalcomandini.it                                                           ', N'4I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giacomo                                           ', N'ruscelli                                          ', N'giacomo.ruscelli.stud@ispascalcomandini.it                                                          ', N'5L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giacomo                                           ', N'severi                                            ', N'giacomo.severi.stud@ispascalcomandini.it                                                            ', N'3G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giacomo                                           ', N'sintoni                                           ', N'giacomo.sintoni.stud@ispascalcomandini.it                                                           ', N'1B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giacomo                                           ', N'stanghellini                                      ', N'giacomo.stanghellini.stud@ispascalcomandini.it                                                      ', N'1B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giacomo                                           ', N'tagarelli                                         ', N'giacomo.tagarelli@ispascalcomandini.it                                                              ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giacomo                                           ', N'torelli                                           ', N'giacomo.torelli@ispascalcomandini.it                                                                ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giacomo                                           ', N'venturi                                           ', N'giacomo.venturi.stud@ispascalcomandini.it                                                           ', N'3G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giacomo                                           ', N'vignali                                           ', N'giacomo.vignali.stud@ispascalcomandini.it                                                           ', N'4I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giacomo                                           ', N'zarri                                             ', N'giacomo.zarri.stud@ispascalcomandini.it                                                             ', N'1M-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giacomo                                           ', N'zavalloni                                         ', N'giacomo.zavalloni.stud@ispascalcomandini.it                                                         ', N'2B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giacomo                                           ', N'zoffoli                                           ', N'giacomo.zoffoli.stud@ispascalcomandini.it                                                           ', N'2H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'acquaviva                                         ', N'giada                                             ', N'giada.acquaviva.stud@ispascalcomandini.it                                                           ', N'3I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giada                                             ', N'de crescenzo                                      ', N'giada.decrescenzo.stud@ispascalcomandini.it                                                         ', N'2I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giada                                             ', N'gondolini                                         ', N'giada.gondolini.stud@ispascalcomandini.it                                                           ', N'1A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giampiero                                         ', N'giorgini                                          ', N'giampiero.giorgini@ispascalcomandini.it                                                             ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gianluca                                          ', N'delorenzi                                         ', N'gianluca.delorenzi.stud@ispascalcomandini.it                                                        ', N'1C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gianluca                                          ', N'monaco                                            ', N'gianluca.monaco.stud@ispascalcomandini.it                                                           ', N'3B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gianmarco                                         ', N'leone                                             ', N'gianmarco.leone.stud@ispascalcomandini.it                                                           ', N'4D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gianmarco                                         ', N'torsani                                           ', N'gianmarco.torsani.stud@ispascalcomandini.it                                                         ', N'2H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gianmarco                                         ', N'venturini                                         ', N'gianmarco.venturini.stud@ispascalcomandini.it                                                       ', N'4I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gianmarco                                         ', N'zoffoli                                           ', N'gianmarco.zoffoli.stud@ispascalcomandini.it                                                         ', N'3G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gilberto                                          ', N'gradari                                           ', N'gilberto.gradari.stud@ispascalcomandini.it                                                          ', N'2F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gioele                                            ', N'd''amico                                           ', N'gioele.damico.stud@ispascalcomandini.it                                                             ', N'4G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gioele                                            ', N'foschi                                            ', N'gioele.foschi.stud@ispascalcomandini.it                                                             ', N'4H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gioele                                            ', N'pagliarani                                        ', N'gioele.pagliarani.stud@ispascalcomandini.it                                                         ', N'4B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gioele                                            ', N'valdinocci                                        ', N'gioele.valdinocci.stud@ispascalcomandini.it                                                         ', N'2C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gioia                                             ', N'zheng                                             ', N'gioia.zheng.stud@ispascalcomandini.it                                                               ', N'5E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giordano                                          ', N'lonzardi                                          ', N'giordano.lonzardi.stud@ispascalcomandini.it                                                         ', N'4L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giorgia                                           ', N'bucci                                             ', N'giorgia.bucci.stud@ispascalcomandini.it                                                             ', N'2E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giorgia                                           ', N'gramellini                                        ', N'giorgia.gramellini.stud@ispascalcomandini.it                                                        ', N'2I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giorgia                                           ', N'lacchini                                          ', N'giorgia.lacchini.stud@ispascalcomandini.it                                                          ', N'5A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giorgia                                           ', N'pignatiello                                       ', N'giorgia.pignatiello.stud@ispascalcomandini.it                                                       ', N'1M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giorgia                                           ', N'santi                                             ', N'giorgia.santi.stud@ispascalcomandini.it                                                             ', N'1I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giorgia                                           ', N'severi                                            ', N'giorgia.severi.stud@ispascalcomandini.it                                                            ', N'1E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giorgio                                           ', N'pantaleoni                                        ', N'giorgio.pantaleoni.stud@ispascalcomandini.it                                                        ', N'1F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giorgio                                           ', N'radicchi                                          ', N'giorgio.radicchi.stud@ispascalcomandini.it                                                          ', N'3A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giorgio vasilev                                   ', N'todorov                                           ', N'giorgiovasilev.todorov.stud@ispascalcomandini.it                                                    ', N'1B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giosue''                                           ', N'bolognesi                                         ', N'giosue.bolognesi.stud@ispascalcomandini.it                                                          ', N'5A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giovanni                                          ', N'casalboni                                         ', N'giovanni.casalboni.stud@ispascalcomandini.it                                                        ', N'2C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giovanni                                          ', N'de franco                                         ', N'giovanni.defranco.stud@ispascalcomandini.it                                                         ', N'1M-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giovanni                                          ', N'maggio                                            ', N'giovanni.maggio.stud@ispascalcomandini.it                                                           ', N'1B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mattioli                                          ', N'giovanni                                          ', N'giovanni.mattioli.stud@ispascalcomandini.it                                                         ', N'2H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giovanni                                          ', N'montalti                                          ', N'giovanni.montalti.stud@ispascalcomandini.it                                                         ', N'3C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giovanni                                          ', N'montalti                                          ', N'giovanni.montalti@ispascalcomandini.it                                                              ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giovanni                                          ', N'perrucci                                          ', N'giovanni.perrucci.stud@ispascalcomandini.it                                                         ', N'4B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giovanni                                          ', N'tentoni                                           ', N'giovanni.tentoni.stud@ispascalcomandini.it                                                          ', N'1C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giovanni battista                                 ', N'checchia                                          ', N'giovannibattista.checchia@ispascalcomandini.it                                                      ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giovanni paolo                                    ', N'zangla                                            ', N'giovannipaolo.zangla.stud@ispascalcomandini.it                                                      ', N'1G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giulia                                            ', N'astefanoaei                                       ', N'giulia.astefanoaei.stud@ispascalcomandini.it                                                        ', N'2F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giulia                                            ', N'cocka                                             ', N'giulia.cocka.stud@ispascalcomandini.it                                                              ', N'1I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giulia                                            ', N'laudonio                                          ', N'giulia.laudonio.stud@ispascalcomandini.it                                                           ', N'3M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giulia                                            ', N'malagoli                                          ', N'giulia.malagoli.stud@ispascalcomandini.it                                                           ', N'2A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giulia                                            ', N'montalti                                          ', N'giulia.montalti.stud@ispascalcomandini.it                                                           ', N'1E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giulia                                            ', N'mosconi                                           ', N'giulia.mosconi.stud@ispascalcomandini.it                                                            ', N'2M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giuliana                                          ', N'sirotti                                           ', N'giuliana.sirotti@ispascalcomandini.it                                                               ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'manzi                                             ', N'giuliano                                          ', N'giuliano.manzi.stud@ispascalcomandini.it                                                            ', N'3I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giulio                                            ', N'pasini                                            ', N'giulio.pasini.stud@ispascalcomandini.it                                                             ', N'1N-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giulio                                            ', N'zanelli                                           ', N'giulio.zanelli.stud@ispascalcomandini.it                                                            ', N'5C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giulio                                            ', N'zangheri                                          ', N'giulio.zangheri.stud@ispascalcomandini.it                                                           ', N'2H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giuseppe                                          ', N'calce                                             ', N'giuseppe.calce.stud@ispascalcomandini.it                                                            ', N'2G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giuseppe                                          ', N'comunale                                          ', N'giuseppe.comunale.stud@ispascalcomandini.it                                                         ', N'1M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giuseppe                                          ', N'fusco                                             ', N'giuseppe.fusco.stud@ispascalcomandini.it                                                            ', N'4I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'giuseppe                                          ', N'inverso                                           ', N'giuseppe.inverso.stud@ispascalcomandini.it                                                          ', N'2B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gloria                                            ', N'di leonforte                                      ', N'gloria.dileonforte.stud@ispascalcomandini.it                                                        ', N'5A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gloria angelica                                   ', N'gullotta                                          ', N'gloriaangelica.gullotta.stud@ispascalcomandini.it                                                   ', N'2M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'grazia                                            ', N'guadagno                                          ', N'grazia.guadagno@ispascalcomandini.it                                                                ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'grazia                                            ', N'silvestri                                         ', N'grazia.silvestri@ispascalcomandini.it                                                               ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'graziano luigi                                    ', N'la porta                                          ', N'grazianoluigi.laporta.stud@ispascalcomandini.it                                                     ', N'5G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'graziella                                         ', N'ferraro                                           ', N'graziella.ferraro@ispascalcomandini.it                                                              ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'graziella                                         ', N'serra                                             ', N'graziella.serra@ispascalcomandini.it                                                                ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'graziella                                         ', N'succi                                             ', N'graziella.succi@ispascalcomandini.it                                                                ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gregorio                                          ', N'garavini                                          ', N'gregorio.garavini.stud@ispascalcomandini.it                                                         ', N'1I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'greta                                             ', N'paciotti                                          ', N'greta.paciotti.stud@ispascalcomandini.it                                                            ', N'1A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'greta                                             ', N'passerini                                         ', N'greta.passerini.stud@ispascalcomandini.it                                                           ', N'2M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'hamdi                                             ', N'tarhouni                                          ', N'hamdi.tarhouni.stud@ispascalcomandini.it                                                            ', N'2A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'hamza                                             ', N'belfar                                            ', N'hamza.belfar.stud@ispascalcomandini.it                                                              ', N'4B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'hamza                                             ', N'dargui                                            ', N'hamza.dargui.stud@ispascalcomandini.it                                                              ', N'5L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'hamza                                             ', N'mohammadi                                         ', N'hamza.mohammadi.stud@ispascalcomandini.it                                                           ', N'4B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'liu                                               ', N'hao                                               ', N'hao.liu.stud@ispascalcomandini.it                                                                   ', N'2F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'haojie                                            ', N'liu                                               ', N'haojie.liu.stud@ispascalcomandini.it                                                                ', N'3G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'harouna                                           ', N'compaore                                          ', N'harouna.compaore.stud@ispascalcomandini.it                                                          ', N'1M-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'henri                                             ', N'murataj                                           ', N'henri.murataj.stud@ispascalcomandini.it                                                             ', N'1L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'hadine                                            ', N'hiba                                              ', N'hiba.hadine.stud@ispascalcomandini.it                                                               ', N'3I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'hiba                                              ', N'sejdi                                             ', N'hiba.sejdi.stud@ispascalcomandini.it                                                                ', N'1M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'hina                                              ', N'nadeem                                            ', N'hina.nadeem.stud@ispascalcomandini.it                                                               ', N'2H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'hind                                              ', N'harroud                                           ', N'hind.harroud.stud@ispascalcomandini.it                                                              ', N'2M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'horia paul                                        ', N'liuta                                             ', N'horiapaul.liuta.stud@ispascalcomandini.it                                                           ', N'2I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ian                                               ', N'loli                                              ', N'ian.loli.stud@ispascalcomandini.it                                                                  ', N'3A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ibrahim lassina                                   ', N'toure                                             ', N'ibrahimlassina.toure.stud@ispascalcomandini.it                                                      ', N'5E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'igor                                              ', N'baldarelli                                        ', N'igor.baldarelli.stud@ispascalcomandini.it                                                           ', N'1N-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'igor                                              ', N'foschi                                            ', N'igor.foschi.stud@ispascalcomandini.it                                                               ', N'1C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'igor                                              ', N'vicol                                             ', N'igor.vicol.stud@ispascalcomandini.it                                                                ', N'3C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'igor                                              ', N'zanotti                                           ', N'igor.zanotti.stud@ispascalcomandini.it                                                              ', N'4B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ilaria                                            ', N'ciccarelli                                        ', N'ilaria.ciccarelli@ispascalcomandini.it                                                              ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ilaria                                            ', N'fabbri                                            ', N'ilaria.fabbri.stud@ispascalcomandini.it                                                             ', N'3B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ilary                                             ', N'ragazzo                                           ', N'ilary.ragazzo@ispascalcomandini.it                                                                  ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ilenia                                            ', N'buono                                             ', N'ilenia.buono.stud@ispascalcomandini.it                                                              ', N'2M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ilenia                                            ', N'gravagna                                          ', N'ilenia.gravagna.stud@ispascalcomandini.it                                                           ', N'1M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'hoxha                                             ', N'ilir                                              ', N'ilir.hoxha.stud@ispascalcomandini.it                                                                ', N'2E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'imad                                              ', N'echabraoui                                        ', N'imad.echabraoui.stud@ispascalcomandini.it                                                           ', N'3A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'iosua beniamin                                    ', N'oita                                              ', N'iosuabeniamin.oita.stud@ispascalcomandini.it                                                        ', N'1E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ismahela                                          ', N'ka                                                ', N'ismahela.ka.stud@ispascalcomandini.it                                                               ', N'4E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ismail                                            ', N'radif                                             ', N'ismail.radif.stud@ispascalcomandini.it                                                              ', N'5B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ivan                                              ', N'angelini                                          ', N'ivan.angelini.stud@ispascalcomandini.it                                                             ', N'1B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ivan                                              ', N'crimaldi                                          ', N'ivan.crimaldi.stud@ispascalcomandini.it                                                             ', N'4L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ivan vasilev                                      ', N'stanev                                            ', N'ivanvasilev.stanev.stud@ispascalcomandini.it                                                        ', N'1E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'jacopo                                            ', N'brighi                                            ', N'jacopo.brighi.stud@ispascalcomandini.it                                                             ', N'1A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'jacopo                                            ', N'buccelli                                          ', N'jacopo.buccelli.stud@ispascalcomandini.it                                                           ', N'3G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'jacopo                                            ', N'bucci                                             ', N'jacopo.bucci.stud@ispascalcomandini.it                                                              ', N'4L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'jacopo                                            ', N'caporali                                          ', N'jacopo.caporali.stud@ispascalcomandini.it                                                           ', N'4L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'jacopo                                            ', N'caprili                                           ', N'jacopo.caprili.stud@ispascalcomandini.it                                                            ', N'2E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'jacopo                                            ', N'casamenti                                         ', N'jacopo.casamenti.stud@ispascalcomandini.it                                                          ', N'4G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'jacopo                                            ', N'casanova                                          ', N'jacopo.casanova.stud@ispascalcomandini.it                                                           ', N'4I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'jacopo                                            ', N'collesi                                           ', N'jacopo.collesi.stud@ispascalcomandini.it                                                            ', N'3C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'jacopo                                            ', N'dall’ara                                          ', N'jacopo.dallara@ispascalcomandini.it                                                                 ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'foschi                                            ', N'jacopo                                            ', N'jacopo.foschi.stud@ispascalcomandini.it                                                             ', N'3H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'jacopo                                            ', N'foschi                                            ', N'jacopo.foschi1.stud@ispascalcomandini.it                                                            ', N'4E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'jacopo                                            ', N'pasini                                            ', N'jacopo.pasini.stud@ispascalcomandini.it                                                             ', N'1L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'scanu                                             ', N'jacopo                                            ', N'jacopo.scanu.stud@ispascalcomandini.it                                                              ', N'3H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'jacopo                                            ', N'zoffoli                                           ', N'jacopo.zoffoli.stud@ispascalcomandini.it                                                            ', N'1C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'jakub jan                                         ', N'kanty                                             ', N'jakubjan.kanty.stud@ispascalcomandini.it                                                            ', N'1H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'janith angelo                                     ', N'hiththatiyage                                     ', N'janith.hiththatiyage.stud@ispascalcomandini.it                                                      ', N'1L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'jaskaran                                          ', N'singh                                             ', N'jaskaran.singh.stud@ispascalcomandini.it                                                            ', N'4B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'jessica                                           ', N'castorri                                          ', N'jessica.castorri.stud@ispascalcomandini.it                                                          ', N'1L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'jeton                                             ', N'azemi                                             ', N'jeton.azemi.stud@ispascalcomandini.it                                                               ', N'4G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'jiasheng                                          ', N'feng                                              ', N'jiasheng.feng.stud@ispascalcomandini.it                                                             ', N'1G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'jolanda                                           ', N'galassi                                           ', N'jolanda.galassi.stud@ispascalcomandini.it                                                           ', N'3M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'avarello                                          ', N'jonathan                                          ', N'jonathan.avarello.stud@ispascalcomandini.it                                                         ', N'2A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'jonathan                                          ', N'celli                                             ', N'jonathan.celli.stud@ispascalcomandini.it                                                            ', N'5B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'joy                                               ', N'beshiri                                           ', N'joy.beshiri.stud@ispascalcomandini.it                                                               ', N'4I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'julian                                            ', N'granieri                                          ', N'julian.granieri.stud@ispascalcomandini.it                                                           ', N'5C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'julian                                            ', N'ricci                                             ', N'julian.ricci.stud@ispascalcomandini.it                                                              ', N'1G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'kacper                                            ', N'jarosz                                            ', N'kacper.jarosz.stud@ispascalcomandini.it                                                             ', N'1I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'kacper dawid                                      ', N'owsiak                                            ', N'kacperdawid.owsiak.stud@ispascalcomandini.it                                                        ', N'4C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'kadri                                             ', N'baha                                              ', N'kadri.baha.stud@ispascalcomandini.it                                                                ', N'4E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'kaloyan                                           ', N'bozhinov                                          ', N'kaloyan.bozhinov.stud@ispascalcomandini.it                                                          ', N'2E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'kamal                                             ', N'moukhlisse                                        ', N'kamal.moukhlisse.stud@ispascalcomandini.it                                                          ', N'1F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'karim                                             ', N'montanari                                         ', N'karim.montanari.stud@ispascalcomandini.it                                                           ', N'3B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'kevin                                             ', N'bardhi                                            ', N'kevin.bardhi.stud@ispascalcomandini.it                                                              ', N'1G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'kevin                                             ', N'camani                                            ', N'kevin.camani.stud@ispascalcomandini.it                                                              ', N'3G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'kevin                                             ', N'campidelli                                        ', N'kevin.campidelli.stud@ispascalcomandini.it                                                          ', N'4F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'kevin                                             ', N'comandini                                         ', N'kevin.comandini.stud@ispascalcomandini.it                                                           ', N'3B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'kevin                                             ', N'ferraresi                                         ', N'kevin.ferraresi.stud@ispascalcomandini.it                                                           ', N'1G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'kevin                                             ', N'fiumana                                           ', N'kevin.fiumana.stud@ispascalcomandini.it                                                             ', N'2G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'kevin                                             ', N'hysa                                              ', N'kevin.hysa.stud@ispascalcomandini.it                                                                ', N'3C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'kevin                                             ', N'placucci                                          ', N'kevin.placucci.stud@ispascalcomandini.it                                                            ', N'2G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'kevin                                             ', N'romano                                            ', N'kevin.romano.stud@ispascalcomandini.it                                                              ', N'2I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'kevin                                             ', N'velasquez                                         ', N'kevin.velasquez.stud@ispascalcomandini.it                                                           ', N'4C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'kevin claudio                                     ', N'mangiagli                                         ', N'kevinclaudio.mangiagli.stud@ispascalcomandini.it                                                    ', N'2E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'kevin henry                                       ', N'velasquez cachiguango                             ', N'kevinhenry.velasquezcachiguango.stud@ispascalcomandini.it                                           ', N'3C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lin                                               ', N'kexin                                             ', N'kexin.lin.stud@ispascalcomandini.it                                                                 ', N'3E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'khadija                                           ', N'daraji                                            ', N'khadija.daraji.stud@ispascalcomandini.it                                                            ', N'1F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'klajdi                                            ', N'metolli                                           ', N'klajdi.metolli.stud@ispascalcomandini.it                                                            ', N'2E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'klaudio                                           ', N'gjylsheni                                         ', N'klaudio.gjylsheni.stud@ispascalcomandini.it                                                         ', N'4C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'klejdi                                            ', N'mamani                                            ', N'klejdi.mamani.stud@ispascalcomandini.it                                                             ', N'3G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'klejdi                                            ', N'memushaj                                          ', N'klejdi.memushaj.stud@ispascalcomandini.it                                                           ', N'2A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'klevis                                            ', N'bicaku                                            ', N'klevis.bicaku.stud@ispascalcomandini.it                                                             ', N'1A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'kousai                                            ', N'mathlouthi                                        ', N'kousai.mathlouthi.stud@ispascalcomandini.it                                                         ', N'1A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'kpombogan onezime                                 ', N'sagbohan                                          ', N'kpomboganonezime.sagbohan.stud@ispascalcomandini.it                                                 ', N'1G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'kristian                                          ', N'biondini                                          ', N'kristian.biondini.stud@ispascalcomandini.it                                                         ', N'1B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'kristian                                          ', N'cepeli                                            ', N'kristian.cepeli.stud@ispascalcomandini.it                                                           ', N'1G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'kristian                                          ', N'dedja                                             ', N'kristian.dedja.stud@ispascalcomandini.it                                                            ', N'1G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'kristian                                          ', N'oshafi                                            ', N'kristian.oshafi.stud@ispascalcomandini.it                                                           ', N'1F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'kristiyan panchev                                 ', N'todorov                                           ', N'kristiyanpanchev.todorov.stud@ispascalcomandini.it                                                  ', N'3E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'kristoff                                          ', N'graziano                                          ', N'kristoff.graziano.stud@ispascalcomandini.it                                                         ', N'4C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lasse joi                                         ', N'werpers                                           ', N'lassejoi.werpers.stud@ispascalcomandini.it                                                          ', N'5D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'laura                                             ', N'bartolini                                         ', N'laura.bartolini.stud@ispascalcomandini.it                                                           ', N'2A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'laura                                             ', N'vendraminetto                                     ', N'laura.vendraminetto@ispascalcomandini.it                                                            ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ledion                                            ', N'rama                                              ', N'ledion.rama.stud@ispascalcomandini.it                                                               ', N'1G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'leonardo                                          ', N'arfelli                                           ', N'leonardo.arfelli.stud@ispascalcomandini.it                                                          ', N'3I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'leonardo                                          ', N'baldazzi                                          ', N'leonardo.baldazzi.stud@ispascalcomandini.it                                                         ', N'5G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'leonardo                                          ', N'calbi                                             ', N'leonardo.calbi.stud@ispascalcomandini.it                                                            ', N'1C-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'calisesi                                          ', N'leonardo                                          ', N'leonardo.calisesi.stud@ispascalcomandini.it                                                         ', N'2F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'leonardo                                          ', N'canali                                            ', N'leonardo.canali.stud@ispascalcomandini.it                                                           ', N'4I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'leonardo                                          ', N'canducci                                          ', N'leonardo.canducci@ispascalcomandini.it                                                              ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'leonardo                                          ', N'caniato                                           ', N'leonardo.caniato.stud@ispascalcomandini.it                                                          ', N'4B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'leonardo                                          ', N'croatti                                           ', N'leonardo.croatti.stud@ispascalcomandini.it                                                          ', N'5G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'leonardo                                          ', N'frassineti                                        ', N'leonardo.frassineti.stud@ispascalcomandini.it                                                       ', N'2H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'leonardo                                          ', N'giannini                                          ', N'leonardo.giannini.stud@ispascalcomandini.it                                                         ', N'4D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'leonardo                                          ', N'legni                                             ', N'leonardo.legni.stud@ispascalcomandini.it                                                            ', N'2C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'leonardo                                          ', N'lessi                                             ', N'leonardo.lessi.stud@ispascalcomandini.it                                                            ', N'1E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'leonardo                                          ', N'maione                                            ', N'leonardo.maione.stud@ispascalcomandini.it                                                           ', N'4A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mengozzi                                          ', N'leonardo                                          ', N'leonardo.mengozzi.stud@ispascalcomandini.it                                                         ', N'3I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'leonardo                                          ', N'perretta                                          ', N'leonardo.perretta.stud@ispascalcomandini.it                                                         ', N'4F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'leonardo                                          ', N'raffaelli                                         ', N'leonardo.raffaelli.stud@ispascalcomandini.it                                                        ', N'5D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'leonardo                                          ', N'vincenzi                                          ', N'leonardo.vincenzi.stud@ispascalcomandini.it                                                         ', N'5G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'leonardo antonio                                  ', N'lioi                                              ', N'leonardoantonio.lioi.stud@ispascalcomandini.it                                                      ', N'4F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'leone                                             ', N'lorusso                                           ', N'leone.lorusso.stud@ispascalcomandini.it                                                             ', N'2I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'letizia                                           ', N'taddei                                            ', N'letizia.taddei.stud@ispascalcomandini.it                                                            ', N'3M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'vallet                                            ', N'liam                                              ', N'liam.vallet.stud@ispascalcomandini.it                                                               ', N'3H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lihao                                             ', N'hu                                                ', N'lihao.hu.stud@ispascalcomandini.it                                                                  ', N'2F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lisa                                              ', N'pagano                                            ', N'lisa.pagano.stud@ispascalcomandini.it                                                               ', N'4B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lisa                                              ', N'parentelli                                        ', N'lisa.parentelli.stud@ispascalcomandini.it                                                           ', N'2M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lisa                                              ', N'pompili                                           ', N'lisa.pompili.stud@ispascalcomandini.it                                                              ', N'1L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'liviu adrian                                      ', N'bacalu                                            ', N'liviuadrian.bacalu.stud@ispascalcomandini.it                                                        ', N'4B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'liyu                                              ', N'jin                                               ', N'liyu.jin.stud@ispascalcomandini.it                                                                  ', N'5E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'llazar                                            ', N'tafa                                              ', N'llazar.tafa.stud@ispascalcomandini.it                                                               ', N'5C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lon chen                                          ', N'cao                                               ', N'lonchen.cao.stud@ispascalcomandini.it                                                               ', N'4D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lora                                              ', N'pieri                                             ', N'lora.pieri@ispascalcomandini.it                                                                     ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'loredana                                          ', N'maestri                                           ', N'loredana.maestri@ispascalcomandini.it                                                               ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'amadori                                           ', N'lorenzo.amadori.stud@ispascalcomandini.it                                                           ', N'5E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'baldazzi                                          ', N'lorenzo                                           ', N'lorenzo.baldazzi.stud@ispascalcomandini.it                                                          ', N'3H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'batani                                            ', N'lorenzo.batani.stud@ispascalcomandini.it                                                            ', N'3B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'belletti                                          ', N'lorenzo                                           ', N'lorenzo.belletti.stud@ispascalcomandini.it                                                          ', N'3E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'boccuzzi                                          ', N'lorenzo.boccuzzi.stud@ispascalcomandini.it                                                          ', N'4B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'brunelli                                          ', N'lorenzo.brunelli.stud@ispascalcomandini.it                                                          ', N'5C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'campa                                             ', N'lorenzo.campa.stud@ispascalcomandini.it                                                             ', N'1I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'camprini                                          ', N'lorenzo.camprini@ispascalcomandini.it                                                               ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'cangini                                           ', N'lorenzo                                           ', N'lorenzo.cangini.stud@ispascalcomandini.it                                                           ', N'3I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'castorri                                          ', N'lorenzo                                           ', N'lorenzo.castorri.stud@ispascalcomandini.it                                                          ', N'3E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'cola                                              ', N'lorenzo.cola.stud@ispascalcomandini.it                                                              ', N'4H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'collina                                           ', N'lorenzo.collina.stud@ispascalcomandini.it                                                           ', N'1A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'colombi                                           ', N'lorenzo                                           ', N'lorenzo.colombi.stud@ispascalcomandini.it                                                           ', N'3H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'del monte                                         ', N'lorenzo.delmonte.stud@ispascalcomandini.it                                                          ', N'2G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'donati                                            ', N'lorenzo.donati.stud@ispascalcomandini.it                                                            ', N'5G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'ermeti                                            ', N'lorenzo.ermeti.stud@ispascalcomandini.it                                                            ', N'4F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'fabbri                                            ', N'lorenzo.fabbri.stud@ispascalcomandini.it                                                            ', N'5H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'fabbri                                            ', N'lorenzo.fabbri01.stud@ispascalcomandini.it                                                          ', N'5G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'faedi                                             ', N'lorenzo.faedi.stud@ispascalcomandini.it                                                             ', N'1A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'ferri                                             ', N'lorenzo.ferri.stud@ispascalcomandini.it                                                             ', N'4L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'foschi                                            ', N'lorenzo.foschi@ispascalcomandini.it                                                                 ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'francia                                           ', N'lorenzo.francia.stud@ispascalcomandini.it                                                           ', N'1A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'gaina                                             ', N'lorenzo.gaina.stud@ispascalcomandini.it                                                             ', N'5G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'galletti                                          ', N'lorenzo.galletti.stud@ispascalcomandini.it                                                          ', N'2A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'guidazzi                                          ', N'lorenzo.guidazzi.stud@ispascalcomandini.it                                                          ', N'1C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'lacchini                                          ', N'lorenzo.lacchini.stud@ispascalcomandini.it                                                          ', N'3C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'laudonio                                          ', N'lorenzo.laudonio.stud@ispascalcomandini.it                                                          ', N'1N-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'lessi                                             ', N'lorenzo.lessi.stud@ispascalcomandini.it                                                             ', N'1F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'lizzo                                             ', N'lorenzo.lizzo.stud@ispascalcomandini.it                                                             ', N'5G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'lombardi                                          ', N'lorenzo.lombardi.stud@ispascalcomandini.it                                                          ', N'5C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'lontani                                           ', N'lorenzo.lontani.stud@ispascalcomandini.it                                                           ', N'5L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'magrini                                           ', N'lorenzo.magrini.stud@ispascalcomandini.it                                                           ', N'5G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'malucelli                                         ', N'lorenzo.malucelli.stud@ispascalcomandini.it                                                         ', N'3A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'marconi                                           ', N'lorenzo.marconi.stud@ispascalcomandini.it                                                           ', N'2A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'melagranati                                       ', N'lorenzo.melagranati@ispascalcomandini.it                                                            ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'montanari                                         ', N'lorenzo.montanari.stud@ispascalcomandini.it                                                         ', N'5B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'morini                                            ', N'lorenzo.morini.stud@ispascalcomandini.it                                                            ', N'1F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'moro                                              ', N'lorenzo.moro.stud@ispascalcomandini.it                                                              ', N'3B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'novelli                                           ', N'lorenzo.novelli.stud@ispascalcomandini.it                                                           ', N'4A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'nuraghi                                           ', N'lorenzo.nuraghi.stud@ispascalcomandini.it                                                           ', N'2A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'pasolini                                          ', N'lorenzo.pasolini.stud@ispascalcomandini.it                                                          ', N'4L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'perra                                             ', N'lorenzo.perra.stud@ispascalcomandini.it                                                             ', N'3B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'pirini                                            ', N'lorenzo.pirini.stud@ispascalcomandini.it                                                            ', N'5H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'pirini                                            ', N'lorenzo.pirini1.stud@ispascalcomandini.it                                                           ', N'3C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'romano                                            ', N'lorenzo.romano.stud@ispascalcomandini.it                                                            ', N'3E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'sabba                                             ', N'lorenzo.sabba.stud@ispascalcomandini.it                                                             ', N'4D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'savini                                            ', N'lorenzo.savini.stud@ispascalcomandini.it                                                            ', N'5B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'serra                                             ', N'lorenzo                                           ', N'lorenzo.serra.stud@ispascalcomandini.it                                                             ', N'3I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'soma                                              ', N'lorenzo.soma.stud@ispascalcomandini.it                                                              ', N'4C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'spazzoli                                          ', N'lorenzo.spazzoli.stud@ispascalcomandini.it                                                          ', N'1G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'zamagna                                           ', N'lorenzo.zamagna.stud@ispascalcomandini.it                                                           ', N'4C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'zamponi                                           ', N'lorenzo.zamponi.stud@ispascalcomandini.it                                                           ', N'2I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'zoffoli                                           ', N'lorenzo.zoffoli@ispascalcomandini.it                                                                ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lorenzo                                           ', N'zuttion                                           ', N'lorenzo.zuttion.stud@ispascalcomandini.it                                                           ', N'5G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'morano                                            ', N'lorenzo damiano                                   ', N'lorenzodamiano.morano.stud@ispascalcomandini.it                                                     ', N'2E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'loris                                             ', N'battistini                                        ', N'loris.battistini@ispascalcomandini.it                                                               ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'loris                                             ', N'montiguarnieri                                    ', N'loris.montiguarnieri.stud@ispascalcomandini.it                                                      ', N'1H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'baldacci                                          ', N'luca.baldacci.stud@ispascalcomandini.it                                                             ', N'5E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'baldini                                           ', N'luca.baldini.stud@ispascalcomandini.it                                                              ', N'5D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'bissoni                                           ', N'luca.bissoni.stud@ispascalcomandini.it                                                              ', N'2F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'bolognesi                                         ', N'luca.bolognesi.stud@ispascalcomandini.it                                                            ', N'1G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'buratti                                           ', N'luca.buratti.stud@ispascalcomandini.it                                                              ', N'2C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'camillini                                         ', N'luca.camillini.stud@ispascalcomandini.it                                                            ', N'5C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'camprini                                          ', N'luca.camprini.stud@ispascalcomandini.it                                                             ', N'4H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'casadei                                           ', N'luca.casadei.stud@ispascalcomandini.it                                                              ', N'5H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'castellani                                        ', N'luca.castellani.stud@ispascalcomandini.it                                                           ', N'4H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'cavallari                                         ', N'luca.cavallari.stud@ispascalcomandini.it                                                            ', N'5C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'chiarabaglio                                      ', N'luca.chiarabaglio.stud@ispascalcomandini.it                                                         ', N'4F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'dall''ara                                          ', N'luca.dallara.stud@ispascalcomandini.it                                                              ', N'4H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'domeniconi                                        ', N'luca.domeniconi.stud@ispascalcomandini.it                                                           ', N'1G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'fabbri                                            ', N'luca.fabbri.stud@ispascalcomandini.it                                                               ', N'4H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'fabbri                                            ', N'luca.fabbri1.stud@ispascalcomandini.it                                                              ', N'4A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'fagioli                                           ', N'luca.fagioli.stud@ispascalcomandini.it                                                              ', N'4F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'galli                                             ', N'luca.galli.stud@ispascalcomandini.it                                                                ', N'2C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'giordani                                          ', N'luca.giordani.stud@ispascalcomandini.it                                                             ', N'3C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'giovanardi                                        ', N'luca.giovanardi.stud@ispascalcomandini.it                                                           ', N'3B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gori                                              ', N'luca                                              ', N'luca.gori.stud@ispascalcomandini.it                                                                 ', N'3H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'landi                                             ', N'luca.landi.stud@ispascalcomandini.it                                                                ', N'4G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'liu                                               ', N'luca.liu.stud@ispascalcomandini.it                                                                  ', N'1N-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'mariani                                           ', N'luca.mariani.stud@ispascalcomandini.it                                                              ', N'5G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'marzocchi                                         ', N'luca.marzocchi.stud@ispascalcomandini.it                                                            ', N'1C-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'medri                                             ', N'luca.medri.stud@ispascalcomandini.it                                                                ', N'1L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'montalti                                          ', N'luca.montalti.stud@ispascalcomandini.it                                                             ', N'1B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mularoni                                          ', N'luca                                              ', N'luca.mularoni.stud@ispascalcomandini.it                                                             ', N'3G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'paganelli                                         ', N'luca.paganelli.stud@ispascalcomandini.it                                                            ', N'3A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'pasini                                            ', N'luca.pasini.stud@ispascalcomandini.it                                                               ', N'4F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'pieri                                             ', N'luca.pieri.stud@ispascalcomandini.it                                                                ', N'2A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'piraccini                                         ', N'luca.piraccini.stud@ispascalcomandini.it                                                            ', N'4B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'pulga                                             ', N'luca.pulga.stud@ispascalcomandini.it                                                                ', N'5L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'ricci                                             ', N'luca.ricci.stud@ispascalcomandini.it                                                                ', N'4D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'romagnoli                                         ', N'luca.romagnoli.stud@ispascalcomandini.it                                                            ', N'1G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'samorani                                          ', N'luca.samorani.stud@ispascalcomandini.it                                                             ', N'3I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'sandonati                                         ', N'luca.sandonati.stud@ispascalcomandini.it                                                            ', N'2B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'santagada                                         ', N'luca.santagada.stud@ispascalcomandini.it                                                            ', N'3A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'santi                                             ', N'luca.santi.stud@ispascalcomandini.it                                                                ', N'3E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'santolini                                         ', N'luca.santolini.stud@ispascalcomandini.it                                                            ', N'5E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'savadori                                          ', N'luca.savadori.stud@ispascalcomandini.it                                                             ', N'3G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'scarpa                                            ', N'luca.scarpa.stud@ispascalcomandini.it                                                               ', N'1B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'suzzi                                             ', N'luca.suzzi.stud@ispascalcomandini.it                                                                ', N'2A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'szeya                                             ', N'luca.szeya.stud@ispascalcomandini.it                                                                ', N'3H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'togni                                             ', N'luca                                              ', N'luca.togni.stud@ispascalcomandini.it                                                                ', N'3E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'trianti                                           ', N'luca.trianti.stud@ispascalcomandini.it                                                              ', N'5H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ursillo                                           ', N'luca                                              ', N'luca.ursillo.stud@ispascalcomandini.it                                                              ', N'2F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'vitali                                            ', N'luca.vitali.stud@ispascalcomandini.it                                                               ', N'5C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'zanchini                                          ', N'luca.zanchini.stud@ispascalcomandini.it                                                             ', N'3B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca                                              ', N'zoffoli                                           ', N'luca.zoffoli.stud@ispascalcomandini.it                                                              ', N'4L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca manuel                                       ', N'pergolino                                         ', N'lucamanuel.pergolino.stud@ispascalcomandini.it                                                      ', N'1C-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luca mihai                                        ', N'faedi                                             ', N'lucamihai.faedi.stud@ispascalcomandini.it                                                           ', N'4E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'lucas                                             ', N'ciani                                             ', N'lucas.ciani.stud@ispascalcomandini.it                                                               ', N'2B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'sambuco                                           ', N'luca silvestro                                    ', N'lucasilvestro.sambuco.stud@ispascalcomandini.it                                                     ', N'3G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ludovico                                          ', N'fattini                                           ', N'ludovico.fattini.stud@ispascalcomandini.it                                                          ', N'4L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ludovico maria                                    ', N'spitaleri                                         ', N'ludovicomaria.spitaleri.stud@ispascalcomandini.it                                                   ', N'4H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ganapini                                          ', N'ludovico mario                                    ', N'ludovicomario.ganapini.stud@ispascalcomandini.it                                                    ', N'3G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luigi                                             ', N'camilletti                                        ', N'luigi.camilletti.stud@ispascalcomandini.it                                                          ', N'5D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luigi                                             ', N'germinario                                        ', N'luigi.germinario.stud@ispascalcomandini.it                                                          ', N'1M-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luigi                                             ', N'imolesi                                           ', N'luigi.imolesi.stud@ispascalcomandini.it                                                             ', N'3B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luigi                                             ', N'maraldi                                           ', N'luigi.maraldi.stud@ispascalcomandini.it                                                             ', N'5C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luigi                                             ', N'provenzano                                        ', N'luigi.provenzano.stud@ispascalcomandini.it                                                          ', N'4D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luka                                              ', N'kerkapi                                           ', N'luka.kerkapi.stud@ispascalcomandini.it                                                              ', N'1E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'magalotti                                         ', N'lukas                                             ', N'lukas.magalotti.stud@ispascalcomandini.it                                                           ', N'3E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mactar ibrahima                                   ', N'seck                                              ', N'mactaribrahima.seck.stud@ispascalcomandini.it                                                       ', N'4F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'maddalena                                         ', N'mazza                                             ', N'maddalena.mazza.stud@ispascalcomandini.it                                                           ', N'2M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'magnon                                            ', N'toure                                             ', N'magnon.toure.stud@ispascalcomandini.it                                                              ', N'3M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'magret osamede                                    ', N'iyoha                                             ', N'magret.iyoha.stud@ispascalcomandini.it                                                              ', N'2M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mahanta                                           ', N'gueye                                             ', N'mahanta.gueye.stud@ispascalcomandini.it                                                             ', N'3E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'maia                                              ', N'novelli                                           ', N'maia.novelli.stud@ispascalcomandini.it                                                              ', N'1M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'maicol                                            ', N'golinucci                                         ', N'maicol.golinucci.stud@ispascalcomandini.it                                                          ', N'4G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'maicol                                            ', N'pareo                                             ', N'maicol.pareo.stud@ispascalcomandini.it                                                              ', N'4A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'maikol                                            ', N'romano                                            ', N'maikol.romano.stud@ispascalcomandini.it                                                             ', N'1E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'maikol                                            ', N'rossi                                             ', N'maikol.rossi.stud@ispascalcomandini.it                                                              ', N'4E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'maimouna                                          ', N'makenimaga diomande                               ', N'maimouna.makenimagadiomande.stud@ispascalcomandini.it                                               ', N'3M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mamadou lamine                                    ', N'diallo                                            ', N'mamadoulamine.diallo.stud@ispascalcomandini.it                                                      ', N'1E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'milandri                                          ', N'manolo                                            ', N'manolo.milandri.stud@ispascalcomandini.it                                                           ', N'3E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'manuel                                            ', N'baldoni                                           ', N'manuel.baldoni.stud@ispascalcomandini.it                                                            ', N'5H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'manuel                                            ', N'benagli                                           ', N'manuel.benagli.stud@ispascalcomandini.it                                                            ', N'4B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'manuel                                            ', N'berardi                                           ', N'manuel.berardi.stud@ispascalcomandini.it                                                            ', N'4B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'bosi                                              ', N'manuel                                            ', N'manuel.bosi.stud@ispascalcomandini.it                                                               ', N'3H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'manuel                                            ', N'bucci                                             ', N'manuel.bucci.stud@ispascalcomandini.it                                                              ', N'5C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'manuel                                            ', N'cacchi                                            ', N'manuel.cacchi.stud@ispascalcomandini.it                                                             ', N'1I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'manuel                                            ', N'campana                                           ', N'manuel.campana.stud@ispascalcomandini.it                                                            ', N'1F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'manuel                                            ', N'campitelli                                        ', N'manuel.campitelli.stud@ispascalcomandini.it                                                         ', N'3B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'manuel                                            ', N'ercolani                                          ', N'manuel.ercolani.stud@ispascalcomandini.it                                                           ', N'5G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'manuel                                            ', N'fedeli                                            ', N'manuel.fedeli.stud@ispascalcomandini.it                                                             ', N'5H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'manuel                                            ', N'magrini                                           ', N'manuel.magrini.stud@ispascalcomandini.it                                                            ', N'2A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'manuel                                            ', N'muresu                                            ', N'manuel.muresu.stud@ispascalcomandini.it                                                             ', N'5E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'manuel                                            ', N'ragazzini                                         ', N'manuel.ragazzini.stud@ispascalcomandini.it                                                          ', N'4L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'maodo                                             ', N'gueye                                             ', N'maodo.gueye.stud@ispascalcomandini.it                                                               ', N'1G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mara                                              ', N'monaldi                                           ', N'mara.monaldi@ispascalcomandini.it                                                                   ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marcello                                          ', N'belli                                             ', N'marcello.belli.stud@ispascalcomandini.it                                                            ', N'2E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'Marcello                                          ', N'Cruciano                                          ', N'marcello.cruciano@ispascalcomandini.it                                                              ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marcello                                          ', N'cucchi                                            ', N'marcello.cucchi.stud@ispascalcomandini.it                                                           ', N'5E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marcello                                          ', N'gardini                                           ', N'marcello.gardini.stud@ispascalcomandini.it                                                          ', N'2I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marcello                                          ', N'poggi                                             ', N'marcello.poggi.stud@ispascalcomandini.it                                                            ', N'4L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marco                                             ', N'amadori                                           ', N'marco.amadori.stud@ispascalcomandini.it                                                             ', N'4D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marco                                             ', N'balducci                                          ', N'marco.balducci.stud@ispascalcomandini.it                                                            ', N'1M-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marco                                             ', N'bartoletti                                        ', N'marco.bartoletti.stud@ispascalcomandini.it                                                          ', N'2A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marco                                             ', N'bellini                                           ', N'marco.bellini.stud@ispascalcomandini.it                                                             ', N'3A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marco                                             ', N'brighi                                            ', N'marco.brighi.stud@ispascalcomandini.it                                                              ', N'1L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marco                                             ', N'bucca                                             ', N'marco.bucca.stud@ispascalcomandini.it                                                               ', N'1E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marco                                             ', N'casali                                            ', N'marco.casali.stud@ispascalcomandini.it                                                              ', N'5L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marco                                             ', N'ceccarelli                                        ', N'marco.ceccarelli.stud@ispascalcomandini.it                                                          ', N'4B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marco                                             ', N'cedioli                                           ', N'marco.cedioli.stud@ispascalcomandini.it                                                             ', N'2C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marco                                             ', N'curti                                             ', N'marco.curti.stud@ispascalcomandini.it                                                               ', N'3B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marco                                             ', N'de pascalis                                       ', N'marco.depascalis.stud@ispascalcomandini.it                                                          ', N'3B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marco                                             ', N'donati                                            ', N'marco.donati.stud@ispascalcomandini.it                                                              ', N'4D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marco                                             ', N'ferretti                                          ', N'marco.ferretti@ispascalcomandini.it                                                                 ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marco                                             ', N'francisconi                                       ', N'marco.francisconi.stud@ispascalcomandini.it                                                         ', N'4C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marco                                             ', N'gaina                                             ', N'marco.gaina.stud@ispascalcomandini.it                                                               ', N'5E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marco                                             ', N'giugliani                                         ', N'marco.giugliani.stud@ispascalcomandini.it                                                           ', N'5L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marco                                             ', N'iosa                                              ', N'marco.iosa.stud@ispascalcomandini.it                                                                ', N'2E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marco                                             ', N'magnani                                           ', N'marco.magnani.stud@ispascalcomandini.it                                                             ', N'5H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marco                                             ', N'meraglia                                          ', N'marco.meraglia.stud@ispascalcomandini.it                                                            ', N'2A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marco                                             ', N'molari                                            ', N'marco.molari.stud@ispascalcomandini.it                                                              ', N'4H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marco                                             ', N'mondardini                                        ', N'marco.mondardini.stud@ispascalcomandini.it                                                          ', N'4L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marco                                             ', N'montalti                                          ', N'marco.montalti.stud@ispascalcomandini.it                                                            ', N'3C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marco                                             ', N'morri                                             ', N'marco.morri@ispascalcomandini.it                                                                    ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marco                                             ', N'sampaoli                                          ', N'marco.sampaoli.stud@ispascalcomandini.it                                                            ', N'5C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marco                                             ', N'veraldi                                           ', N'marco.veraldi.stud@ispascalcomandini.it                                                             ', N'3A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marco                                             ', N'versari                                           ', N'marco.versari.stud@ispascalcomandini.it                                                             ', N'1B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marco                                             ', N'visconti                                          ', N'marco.visconti.stud@ispascalcomandini.it                                                            ', N'1C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marco                                             ', N'zanotti                                           ', N'marco.zanotti.stud@ispascalcomandini.it                                                             ', N'1B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marco                                             ', N'zidda                                             ', N'marco.zidda.stud@ispascalcomandini.it                                                               ', N'3H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marco vinicius                                    ', N'fantini                                           ', N'marcovinicius.fantini.stud@ispascalcomandini.it                                                     ', N'2I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'margaret                                          ', N'nkrumah                                           ', N'margaret.nkrumah.stud@ispascalcomandini.it                                                          ', N'5A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'margherita                                        ', N'd''altri                                           ', N'margherita.daltri.stud@ispascalcomandini.it                                                         ', N'2A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'maria                                             ', N'agostini                                          ', N'maria.agostini@ispascalcomandini.it                                                                 ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'maria                                             ', N'rossi                                             ', N'maria.rossi.stud@ispascalcomandini.it                                                               ', N'1I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'maria antonietta                                  ', N'russo                                             ', N'mariaantonietta.russo@ispascalcomandini.it                                                          ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'maria flora                                       ', N'spatola                                           ', N'mariaflora.spatola@ispascalcomandini.it                                                             ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mariagrazia                                       ', N'gardelli                                          ', N'mariagrazia.gardelli@ispascalcomandini.it                                                           ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'maria jose                                        ', N'arevalo garcia                                    ', N'mariajose.arevalogarcia.stud@ispascalcomandini.it                                                   ', N'3M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marian                                            ', N'secrieru                                          ', N'marian.secrieru.stud@ispascalcomandini.it                                                           ', N'5L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marianna                                          ', N'bravaccini                                        ', N'marianna.bravaccini.stud@ispascalcomandini.it                                                       ', N'5A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marianna                                          ', N'pondini                                           ', N'marianna.pondini.stud@ispascalcomandini.it                                                          ', N'5A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'maria tatiana                                     ', N'fabbri                                            ', N'mariatatiana.fabbri.stud@ispascalcomandini.it                                                       ', N'1M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mariem                                            ', N'riahi                                             ', N'mariem.riahi.stud@ispascalcomandini.it                                                              ', N'3M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marilena                                          ', N'parente                                           ', N'marilena.parente@ispascalcomandini.it                                                               ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mario                                             ', N'de cola                                           ', N'mario.decola.stud@ispascalcomandini.it                                                              ', N'4D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mario                                             ', N'donatelli                                         ', N'mario.donatelli@ispascalcomandini.it                                                                ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mario                                             ', N'zammarchi                                         ', N'mario.zammarchi.stud@ispascalcomandini.it                                                           ', N'3B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mario samuel vasile                               ', N'heredea                                           ', N'mariosamuelvasile.heredea.stud@ispascalcomandini.it                                                 ', N'3E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marisa                                            ', N'di vuolo                                          ', N'marisa.divuolo@ispascalcomandini.it                                                                 ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marius catalin                                    ', N'oprea                                             ', N'mariuscatalin.oprea.stud@ispascalcomandini.it                                                       ', N'5E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'markovic                                          ', N'marko                                             ', N'marko.markovic.stud@ispascalcomandini.it                                                            ', N'3I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marsid                                            ', N'salia                                             ', N'marsid.salia.stud@ispascalcomandini.it                                                              ', N'1H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'martin                                            ', N'hoxhallari                                        ', N'martin.hoxhallari.stud@ispascalcomandini.it                                                         ', N'1B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'martin                                            ', N'montalti                                          ', N'martin.montalti.stud@ispascalcomandini.it                                                           ', N'5G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'martina                                           ', N'di girolamo                                       ', N'martina.digirolamo.stud@ispascalcomandini.it                                                        ', N'4I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'martina                                           ', N'gabelli                                           ', N'martina.gabelli.stud@ispascalcomandini.it                                                           ', N'4C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'martina                                           ', N'lulo                                              ', N'martina.lulo.stud@ispascalcomandini.it                                                              ', N'3M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'martina                                           ', N'senni                                             ', N'martina.senni.stud@ispascalcomandini.it                                                             ', N'2M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'martina francesca                                 ', N'casalboni                                         ', N'martinafrancesca.casalboni.stud@ispascalcomandini.it                                                ', N'4B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'massimiliano                                      ', N'ceredi                                            ', N'massimiliano.ceredi.stud@ispascalcomandini.it                                                       ', N'3B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'massimiliano                                      ', N'romano                                            ', N'massimiliano.romano.stud@ispascalcomandini.it                                                       ', N'5B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'massimiliano                                      ', N'rossetti                                          ', N'massimiliano.rossetti.stud@ispascalcomandini.it                                                     ', N'2A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'delvecchio                                        ', N'massimo                                           ', N'massimo.delvecchio.stud@ispascalcomandini.it                                                        ', N'2I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'massimo                                           ', N'maldini                                           ', N'massimo.maldini.stud@ispascalcomandini.it                                                           ', N'2G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'massimo                                           ', N'montalti                                          ', N'massimo.montalti.stud@ispascalcomandini.it                                                          ', N'1B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'massimo                                           ', N'nicolai                                           ', N'massimo.nicolai@ispascalcomandini.it                                                                ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'massimo                                           ', N'sabadini                                          ', N'massimo.sabadini@ispascalcomandini.it                                                               ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'massimo                                           ', N'urbini                                            ', N'massimo.urbini.stud@ispascalcomandini.it                                                            ', N'4A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mathias                                           ', N'pirazzini                                         ', N'mathias.pirazzini.stud@ispascalcomandini.it                                                         ', N'2F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matilde                                           ', N'bagnolini                                         ', N'matilde.bagnolini.stud@ispascalcomandini.it                                                         ', N'1M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matilde                                           ', N'ghetti                                            ', N'matilde.ghetti.stud@ispascalcomandini.it                                                            ', N'1E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'angiolillo                                        ', N'matteo.angiolillo.stud@ispascalcomandini.it                                                         ', N'1H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'baldiserri                                        ', N'matteo.baldiserri.stud@ispascalcomandini.it                                                         ', N'2C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'baldisserri                                       ', N'matteo.baldisserri.stud@ispascalcomandini.it                                                        ', N'4G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'barone                                            ', N'matteo.barone.stud@ispascalcomandini.it                                                             ', N'5D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'bernardi                                          ', N'matteo.bernardi.stud@ispascalcomandini.it                                                           ', N'3G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'bianco                                            ', N'matteo.bianco.stud@ispascalcomandini.it                                                             ', N'5E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'bonfim                                            ', N'matteo.bonfim.stud@ispascalcomandini.it                                                             ', N'1G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'boscherini                                        ', N'matteo.boscherini.stud@ispascalcomandini.it                                                         ', N'5E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'brasina                                           ', N'matteo.brasina.stud@ispascalcomandini.it                                                            ', N'4H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'buda                                              ', N'matteo.buda.stud@ispascalcomandini.it                                                               ', N'1N-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'calvanico                                         ', N'matteo.calvanico.stud@ispascalcomandini.it                                                          ', N'5H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'campana                                           ', N'matteo.campana.stud@ispascalcomandini.it                                                            ', N'4C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'cangini                                           ', N'matteo.cangini.stud@ispascalcomandini.it                                                            ', N'2E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'casadei                                           ', N'matteo.casadei.stud@ispascalcomandini.it                                                            ', N'3C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'ceccarelli                                        ', N'matteo.ceccarelli.stud@ispascalcomandini.it                                                         ', N'4C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'cenni                                             ', N'matteo.cenni.stud@ispascalcomandini.it                                                              ', N'1C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'colucci                                           ', N'matteo.colucci.stud@ispascalcomandini.it                                                            ', N'1H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'cutela                                            ', N'matteo.cutela.stud@ispascalcomandini.it                                                             ', N'1C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'della vittoria                                    ', N'matteo.dellavittoria.stud@ispascalcomandini.it                                                      ', N'1B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'di santo                                          ', N'matteo                                            ', N'matteo.disanto.stud@ispascalcomandini.it                                                            ', N'3E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'faccetta                                          ', N'matteo.faccetta.stud@ispascalcomandini.it                                                           ', N'2F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'faretina                                          ', N'matteo.faretina.stud@ispascalcomandini.it                                                           ', N'1C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'ferrini                                           ', N'matteo.ferrini.stud@ispascalcomandini.it                                                            ', N'3G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'fiorentini                                        ', N'matteo.fiorentini.stud@ispascalcomandini.it                                                         ', N'1N-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'gazza                                             ', N'matteo.gazza.stud@ispascalcomandini.it                                                              ', N'5H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'gentili                                           ', N'matteo.gentili1.stud@ispascalcomandini.it                                                           ', N'3B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'giunchi                                           ', N'matteo.giunchi.stud@ispascalcomandini.it                                                            ', N'2E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'grotti                                            ', N'matteo.grotti.stud@ispascalcomandini.it                                                             ', N'4I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'lucchi                                            ', N'matteo.lucchi@ispascalcomandini.it                                                                  ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'luongo                                            ', N'matteo                                            ', N'matteo.luongo.stud@ispascalcomandini.it                                                             ', N'3E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'maestrello                                        ', N'matteo.maestrello.stud@ispascalcomandini.it                                                         ', N'3B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'magrini                                           ', N'matteo.magrini.stud@ispascalcomandini.it                                                            ', N'5D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'martini                                           ', N'matteo.martini.stud@ispascalcomandini.it                                                            ', N'4C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'massaia                                           ', N'matteo                                            ', N'matteo.massaia.stud@ispascalcomandini.it                                                            ', N'3E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'mitrugno                                          ', N'matteo.mitrugno.stud@ispascalcomandini.it                                                           ', N'2H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'moscatelli                                        ', N'matteo                                            ', N'matteo.moscatelli.stud@ispascalcomandini.it                                                         ', N'2I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'muratori                                          ', N'matteo.muratori1.stud@ispascalcomandini.it                                                          ', N'3G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'pagliarani                                        ', N'matteo.pagliarani@ispascalcomandini.it                                                              ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'pio                                               ', N'matteo.pio.stud@ispascalcomandini.it                                                                ', N'1E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'piovaccari                                        ', N'matteo.piovaccari.stud@ispascalcomandini.it                                                         ', N'1A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'putzu                                             ', N'matteo.putzu.stud@ispascalcomandini.it                                                              ', N'2B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'raganini                                          ', N'matteo                                            ', N'matteo.raganini.stud@ispascalcomandini.it                                                           ', N'3G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'rakaj                                             ', N'matteo.rakaj.stud@ispascalcomandini.it                                                              ', N'2A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'ravaioli                                          ', N'matteo.ravaioli.stud@ispascalcomandini.it                                                           ', N'5G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'rossi                                             ', N'matteo.rossi.stud@ispascalcomandini.it                                                              ', N'2E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'rotondo                                           ', N'matteo.rotondo.stud@ispascalcomandini.it                                                            ', N'4C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'sammatrice                                        ', N'matteo.sammatrice.stud@ispascalcomandini.it                                                         ', N'1B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'senni                                             ', N'matteo.senni.stud@ispascalcomandini.it                                                              ', N'1L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'squillacioti                                      ', N'matteo.squillacioti.stud@ispascalcomandini.it                                                       ', N'4C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'tarlazzi                                          ', N'matteo.tarlazzi.stud@ispascalcomandini.it                                                           ', N'1B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'tonelli                                           ', N'matteo.tonelli.stud@ispascalcomandini.it                                                            ', N'4H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'toni                                              ', N'matteo.toni.stud@ispascalcomandini.it                                                               ', N'2I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'valanzano                                         ', N'matteo.valanzano.stud@ispascalcomandini.it                                                          ', N'1C-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matteo                                            ', N'vitali                                            ', N'matteo.vitali.stud@ispascalcomandini.it                                                             ', N'3E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'matthias                                          ', N'ciampoletti                                       ', N'matthias.ciampoletti.stud@ispascalcomandini.it                                                      ', N'1B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mattia                                            ', N'ardito                                            ', N'mattia.ardito.stud@ispascalcomandini.it                                                             ', N'5B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mattia                                            ', N'borghetti                                         ', N'mattia.borghetti.stud@ispascalcomandini.it                                                          ', N'1M-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mattia                                            ', N'caminati                                          ', N'mattia.caminati.stud@ispascalcomandini.it                                                           ', N'3E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mattia                                            ', N'campedelli                                        ', N'mattia.campedelli.stud@ispascalcomandini.it                                                         ', N'1C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mattia                                            ', N'camporesi                                         ', N'mattia.camporesi.stud@ispascalcomandini.it                                                          ', N'5L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mattia                                            ', N'casamenti                                         ', N'mattia.casamenti.stud@ispascalcomandini.it                                                          ', N'3A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mattia                                            ', N'cattedra                                          ', N'mattia.cattedra.stud@ispascalcomandini.it                                                           ', N'1A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mattia                                            ', N'cicognani                                         ', N'mattia.cicognani.stud@ispascalcomandini.it                                                          ', N'1E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mattia                                            ', N'cincotta                                          ', N'mattia.cincotta.stud@ispascalcomandini.it                                                           ', N'1M-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mattia                                            ', N'evangelisti                                       ', N'mattia.evangelisti.stud@ispascalcomandini.it                                                        ', N'3G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mattia                                            ', N'fabbri                                            ', N'mattia.fabbri.stud@ispascalcomandini.it                                                             ', N'1H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mattia                                            ', N'fellini                                           ', N'mattia.fellini.stud@ispascalcomandini.it                                                            ', N'1C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mattia                                            ', N'fiasco                                            ', N'mattia.fiasco.stud@ispascalcomandini.it                                                             ', N'1G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mattia                                            ', N'filippi                                           ', N'mattia.filippi.stud@ispascalcomandini.it                                                            ', N'4F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'gentili                                           ', N'mattia                                            ', N'mattia.gentili.stud@ispascalcomandini.it                                                            ', N'3H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mattia                                            ', N'giglio                                            ', N'mattia.giglio.stud@ispascalcomandini.it                                                             ', N'3A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'golinucci                                         ', N'mattia                                            ', N'mattia.golinucci.stud@ispascalcomandini.it                                                          ', N'3H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mattia                                            ', N'golinucci                                         ', N'mattia.golinucci1.stud@ispascalcomandini.it                                                         ', N'3G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mattia                                            ', N'grandi                                            ', N'mattia.grandi.stud@ispascalcomandini.it                                                             ', N'4B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mezzogori                                         ', N'mattia                                            ', N'mattia.mezzogori.stud@ispascalcomandini.it                                                          ', N'3G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mattia                                            ', N'molinari                                          ', N'mattia.molinari.stud@ispascalcomandini.it                                                           ', N'1N-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mattia                                            ', N'pasini                                            ', N'mattia.pasini.stud@ispascalcomandini.it                                                             ', N'2C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'pazzaglia                                         ', N'mattia                                            ', N'mattia.pazzaglia.stud@ispascalcomandini.it                                                          ', N'3E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mattia                                            ', N'rocchi                                            ', N'mattia.rocchi.stud@ispascalcomandini.it                                                             ', N'5E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mattia                                            ', N'rossi                                             ', N'mattia.rossi.stud@ispascalcomandini.it                                                              ', N'4C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mattia                                            ', N'russo                                             ', N'mattia.russo.stud@ispascalcomandini.it                                                              ', N'1H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mattia                                            ', N'senni                                             ', N'mattia.senni.stud@ispascalcomandini.it                                                              ', N'5G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mattia                                            ', N'severi                                            ', N'mattia.severi.stud@ispascalcomandini.it                                                             ', N'4D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mattia                                            ', N'stefani                                           ', N'mattia.stefani.stud@ispascalcomandini.it                                                            ', N'2E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mattia                                            ', N'turci                                             ', N'mattia.turci.stud@ispascalcomandini.it                                                              ', N'2C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mattia                                            ', N'ugolini                                           ', N'mattia.ugolini.stud@ispascalcomandini.it                                                            ', N'2H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mattia                                            ', N'vicinelli                                         ', N'mattia.vicinelli.stud@ispascalcomandini.it                                                          ', N'5G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mattia                                            ', N'zaccaria                                          ', N'mattia.zaccaria.stud@ispascalcomandini.it                                                           ', N'4C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mattia                                            ', N'zanetti                                           ', N'mattia.zanetti.stud@ispascalcomandini.it                                                            ', N'5D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'maurizio                                          ', N'amadori                                           ', N'maurizio.amadori.stud@ispascalcomandini.it                                                          ', N'5E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'maurizio                                          ', N'brighi                                            ', N'maurizio.brighi@ispascalcomandini.it                                                                ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'maurizio                                          ', N'sintuzzi                                          ', N'maurizio.sintuzzi@ispascalcomandini.it                                                              ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'maya                                              ', N'angelini                                          ', N'maya.angelini.stud@ispascalcomandini.it                                                             ', N'3B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'maycol                                            ', N'nardi                                             ', N'maycol.nardi.stud@ispascalcomandini.it                                                              ', N'3A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mayoro                                            ', N'kane                                              ', N'mayoro.kane.stud@ispascalcomandini.it                                                               ', N'2E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'md nahid                                          ', N'hossain                                           ', N'mdnahid.hossain.stud@ispascalcomandini.it                                                           ', N'2A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'melwin mons                                       ', N'palakunnel                                        ', N'melwinmons.palakunnel.stud@ispascalcomandini.it                                                     ', N'3H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mentor                                            ', N'plaka                                             ', N'mentor.plaka.stud@ispascalcomandini.it                                                              ', N'1E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'michael                                           ', N'casali                                            ', N'michael.casali.stud@ispascalcomandini.it                                                            ', N'4B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'michael                                           ', N'dellavalle                                        ', N'michael.dellavalle.stud@ispascalcomandini.it                                                        ', N'4A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'michael                                           ', N'giannini                                          ', N'michael.giannini.stud@ispascalcomandini.it                                                          ', N'3B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'michael                                           ', N'mariani                                           ', N'michael.mariani.stud@ispascalcomandini.it                                                           ', N'4E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'michael                                           ', N'razzani                                           ', N'michael.razzani.stud@ispascalcomandini.it                                                           ', N'1H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'micheal                                           ', N'bisacchi                                          ', N'micheal.bisacchi.stud@ispascalcomandini.it                                                          ', N'5A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'michela                                           ', N'mazzone                                           ', N'michela.mazzone.stud@ispascalcomandini.it                                                           ', N'3M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'michele                                           ', N'bagnolini                                         ', N'michele.bagnolini.stud@ispascalcomandini.it                                                         ', N'2F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'michele                                           ', N'balzani                                           ', N'michele.balzani.stud@ispascalcomandini.it                                                           ', N'3B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'michele                                           ', N'bentini                                           ', N'michele.bentini.stud@ispascalcomandini.it                                                           ', N'5E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'michele                                           ', N'botteghi                                          ', N'michele.botteghi.stud@ispascalcomandini.it                                                          ', N'4A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'michele                                           ', N'cirillo                                           ', N'michele.cirillo.stud@ispascalcomandini.it                                                           ', N'3E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'michele                                           ', N'd''alo                                             ', N'michele.dalo.stud@ispascalcomandini.it                                                              ', N'5E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'michele                                           ', N'de melo                                           ', N'michele.demelo.stud@ispascalcomandini.it                                                            ', N'2I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'michele                                           ', N'gualtieri                                         ', N'michele.gualtieri.stud@ispascalcomandini.it                                                         ', N'4E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'michele                                           ', N'impagnatiello                                     ', N'michele.impagnatiello.stud@ispascalcomandini.it                                                     ', N'2H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'michele                                           ', N'laudani                                           ', N'michele.laudani.stud@ispascalcomandini.it                                                           ', N'2E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'michele                                           ', N'morri                                             ', N'michele.morri.stud@ispascalcomandini.it                                                             ', N'2H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'michele                                           ', N'mosconi                                           ', N'michele.mosconi.stud@ispascalcomandini.it                                                           ', N'1G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'michele                                           ', N'pedrini                                           ', N'michele.pedrini.stud@ispascalcomandini.it                                                           ', N'1B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'michele                                           ', N'pepa                                              ', N'michele.pepa.stud@ispascalcomandini.it                                                              ', N'2B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'michele                                           ', N'piacentino                                        ', N'michele.piacentino.stud@ispascalcomandini.it                                                        ', N'1G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'michele                                           ', N'ricci                                             ', N'michele.ricci.stud@ispascalcomandini.it                                                             ', N'3E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'michele                                           ', N'spignoli                                          ', N'michele.spignoli.stud@ispascalcomandini.it                                                          ', N'3A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'michele                                           ', N'stoppa                                            ', N'michele.stoppa.stud@ispascalcomandini.it                                                            ', N'3E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'michele                                           ', N'valdinosi                                         ', N'michele.valdinosi@ispascalcomandini.it                                                              ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'michele                                           ', N'vangone                                           ', N'michele.vangone.stud@ispascalcomandini.it                                                           ', N'3G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'michele                                           ', N'xhelili                                           ', N'michele.xhelili.stud@ispascalcomandini.it                                                           ', N'2E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'michelle                                          ', N'alfonso                                           ', N'michelle.alfonso.stud@ispascalcomandini.it                                                          ', N'5A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mihai                                             ', N'badalan                                           ', N'mihai.badalan.stud@ispascalcomandini.it                                                             ', N'1E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mihai stefan                                      ', N'fersedi                                           ', N'mihaistefan.fersedi.stud@ispascalcomandini.it                                                       ', N'1G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mirco                                             ', N'roverelli                                         ', N'mirco.roverelli.stud@ispascalcomandini.it                                                           ', N'1C-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'miria                                             ', N'pracucci                                          ', N'miria.pracucci@ispascalcomandini.it                                                                 ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'miriam                                            ', N'briganti                                          ', N'miriam.briganti.stud@ispascalcomandini.it                                                           ', N'4M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'miriam                                            ', N'santi                                             ', N'miriam.santi.stud@ispascalcomandini.it                                                              ', N'2F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mirko                                             ', N'baldazzi                                          ', N'mirko.baldazzi.stud@ispascalcomandini.it                                                            ', N'4G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mirko                                             ', N'mastrovito                                        ', N'mirko.mastrovito.stud@ispascalcomandini.it                                                          ', N'5L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mirko                                             ', N'paganelli                                         ', N'mirko.paganelli.stud@ispascalcomandini.it                                                           ', N'1M-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'modou                                             ', N'ndiaye                                            ', N'modou.ndiaye.stud@ispascalcomandini.it                                                              ', N'3E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'modou                                             ', N'wade                                              ', N'modou.wade.stud@ispascalcomandini.it                                                                ', N'2E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mohamed                                           ', N'laribi                                            ', N'mohamed.laribi.stud@ispascalcomandini.it                                                            ', N'2C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mohamed                                           ', N'noumi                                             ', N'mohamed.noumi.stud@ispascalcomandini.it                                                             ', N'2G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mohamed                                           ', N'rami                                              ', N'mohamed.rami.stud@ispascalcomandini.it                                                              ', N'2A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mohamed                                           ', N'ridiaoui                                          ', N'mohamed.ridiaoui.stud@ispascalcomandini.it                                                          ', N'1G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mohammed                                          ', N'el markni                                         ', N'mohammed.elmarkni.stud@ispascalcomandini.it                                                         ', N'4B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mohammed amine                                    ', N'el hilali                                         ', N'mohammedamine.elhilali.stud@ispascalcomandini.it                                                    ', N'5G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mohammed samir                                    ', N'abiden                                            ', N'mohammedsamir.abiden.stud@ispascalcomandini.it                                                      ', N'1G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'molly                                             ', N'panzavolta                                        ', N'molly.panzavolta.stud@ispascalcomandini.it                                                          ', N'3M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'monica                                            ', N'd’auria                                           ', N'monica.dauria@ispascalcomandini.it                                                                  ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'monica                                            ', N'zampiga                                           ', N'monica.zampiga@ispascalcomandini.it                                                                 ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'monika vasileva                                   ', N'rashkova                                          ', N'monikavasileva.rashkova.stud@ispascalcomandini.it                                                   ', N'1M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mor                                               ', N'ndiaye                                            ', N'mor.ndiaye.stud@ispascalcomandini.it                                                                ', N'2G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'morena                                            ', N'gallinucci                                        ', N'morena.gallinucci@ispascalcomandini.it                                                              ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'barbieri                                          ', N'mose''                                             ', N'mose.barbieri.stud@ispascalcomandini.it                                                             ', N'3E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mouhamed                                          ', N'wade                                              ', N'mouhamed.wade.stud@ispascalcomandini.it                                                             ', N'2A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mouhamed badr                                     ', N'saci                                              ', N'mouhamedbadr.saci.stud@ispascalcomandini.it                                                         ', N'2G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mouhamet                                          ', N'sette                                             ', N'mouhamet.sette.stud@ispascalcomandini.it                                                            ', N'5A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'mustapha                                          ', N'gitieh                                            ', N'mustapha.gitieh.stud@ispascalcomandini.it                                                           ', N'3G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'myriam vittoria                                   ', N'de mite                                           ', N'myriamvittoria.demite.stud@ispascalcomandini.it                                                     ', N'1M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'natale                                            ', N'tanese                                            ', N'natale.tanese@ispascalcomandini.it                                                                  ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'natanaele                                         ', N'stefanini                                         ', N'natanaele.stefanini.stud@ispascalcomandini.it                                                       ', N'2H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'natan feim                                        ', N'lena                                              ', N'natanfeim.lena.stud@ispascalcomandini.it                                                            ', N'1M-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nathan                                            ', N'di donato                                         ', N'nathan.didonato.stud@ispascalcomandini.it                                                           ', N'3G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nazibul                                           ', N'hoque                                             ', N'nazibul.hoque.stud@ispascalcomandini.it                                                             ', N'2A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nertil                                            ', N'mullalli                                          ', N'nertil.mullalli.stud@ispascalcomandini.it                                                           ', N'1B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nevio                                             ', N'lombardi                                          ', N'nevio.lombardi@ispascalcomandini.it                                                                 ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'niccolo''                                          ', N'falzaresi                                         ', N'niccolo.falzaresi.stud@ispascalcomandini.it                                                         ', N'2E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'niccolo''                                          ', N'teodorani                                         ', N'niccolo.teodorani.stud@ispascalcomandini.it                                                         ', N'1A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicholas                                          ', N'fabbri                                            ', N'nicholas.fabbri.stud@ispascalcomandini.it                                                           ', N'4G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicholas                                          ', N'magi                                              ', N'nicholas.magi.stud@ispascalcomandini.it                                                             ', N'4F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicholas                                          ', N'monti                                             ', N'nicholas.monti.stud@ispascalcomandini.it                                                            ', N'5H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicholas                                          ', N'muccioli                                          ', N'nicholas.muccioli.stud@ispascalcomandini.it                                                         ', N'3B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicholas                                          ', N'sassano                                           ', N'nicholas.sassano.stud@ispascalcomandini.it                                                          ', N'1H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicholas                                          ', N'teodorani                                         ', N'nicholas.teodorani.stud@ispascalcomandini.it                                                        ', N'1B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicodemo otieno                                   ', N'abur                                              ', N'nicodemootieno.abur.stud@ispascalcomandini.it                                                       ', N'3C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicola                                            ', N'alessandri                                        ', N'nicola.alessandri.stud@ispascalcomandini.it                                                         ', N'4D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicola                                            ', N'barbanti                                          ', N'nicola.barbanti.stud@ispascalcomandini.it                                                           ', N'2B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicola                                            ', N'capelli                                           ', N'nicola.capelli.stud@ispascalcomandini.it                                                            ', N'5E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicola                                            ', N'drudi                                             ', N'nicola.drudi.stud@ispascalcomandini.it                                                              ', N'2B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicola                                            ', N'lombardi                                          ', N'nicola.lombardi.stud@ispascalcomandini.it                                                           ', N'2F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicola                                            ', N'mudadu                                            ', N'nicola.mudadu.stud@ispascalcomandini.it                                                             ', N'1C-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'placuzzi                                          ', N'nicola                                            ', N'nicola.placuzzi.stud@ispascalcomandini.it                                                           ', N'3E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicolas                                           ', N'bartolini                                         ', N'nicolas.bartolini.stud@ispascalcomandini.it                                                         ', N'3B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicolas                                           ', N'mancini                                           ', N'nicolas.mancini.stud@ispascalcomandini.it                                                           ', N'4I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicolas                                           ', N'minotti                                           ', N'nicolas.minotti.stud@ispascalcomandini.it                                                           ', N'1E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicolas                                           ', N'quaranta                                          ', N'nicolas.quaranta.stud@ispascalcomandini.it                                                          ', N'4B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicolas                                           ', N'ravegnini                                         ', N'nicolas.ravegnini.stud@ispascalcomandini.it                                                         ', N'4F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicolas                                           ', N'valdinoci                                         ', N'nicolas.valdinoci.stud@ispascalcomandini.it                                                         ', N'5E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicolas                                           ', N'villa                                             ', N'nicolas.villa.stud@ispascalcomandini.it                                                             ', N'1N-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicole                                            ', N'luisi                                             ', N'nicole.luisi.stud@ispascalcomandini.it                                                              ', N'3M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicole                                            ', N'severi                                            ', N'nicole.severi.stud@ispascalcomandini.it                                                             ', N'1E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicoletta                                         ', N'abbondanza                                        ', N'nicoletta.abbondanza@ispascalcomandini.it                                                           ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicoletta                                         ', N'belletti                                          ', N'nicoletta.belletti@ispascalcomandini.it                                                             ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicolo''                                           ', N'barbarulo                                         ', N'nicolo.barbarulo.stud@ispascalcomandini.it                                                          ', N'2B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicolo''                                           ', N'barbieri                                          ', N'nicolo.barbieri.stud@ispascalcomandini.it                                                           ', N'1C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicolo''                                           ', N'budini                                            ', N'nicolo.budini.stud@ispascalcomandini.it                                                             ', N'1B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicolo''                                           ', N'casadei                                           ', N'nicolo.casadei1.stud@ispascalcomandini.it                                                           ', N'2H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicolo''                                           ', N'casamenti                                         ', N'nicolo.casamenti.stud@ispascalcomandini.it                                                          ', N'4G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicolo''                                           ', N'casavecchia                                       ', N'nicolo.casavecchia.stud@ispascalcomandini.it                                                        ', N'1N-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicolo''                                           ', N'cellini                                           ', N'nicolo''.cellini.stud@ispascalcomandini.it                                                           ', N'3A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicolo''                                           ', N'di leo                                            ', N'nicolo.dileo.stud@ispascalcomandini.it                                                              ', N'1C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicolo''                                           ', N'fontana                                           ', N'nicolo.fontana.stud@ispascalcomandini.it                                                            ', N'5E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicolo''                                           ', N'fontana                                           ', N'nicolo.fontana1.stud@ispascalcomandini.it                                                           ', N'3E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicolo''                                           ', N'forti                                             ', N'nicolo.forti.stud@ispascalcomandini.it                                                              ', N'2C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicolo''                                           ', N'giorgi                                            ', N'nicolo.giorgi.stud@ispascalcomandini.it                                                             ', N'5A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicolo''                                           ', N'landini                                           ', N'nicolo.landini.stud@ispascalcomandini.it                                                            ', N'1H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicolo''                                           ', N'levach                                            ', N'nicolo.levach.stud@ispascalcomandini.it                                                             ', N'1B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'macchiavelli                                      ', N'nicolo''                                           ', N'nicolo.macchiavelli.stud@ispascalcomandini.it                                                       ', N'3H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicolo''                                           ', N'martis                                            ', N'nicolo.martis.stud@ispascalcomandini.it                                                             ', N'1G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicolo''                                           ', N'migliorini                                        ', N'nicolo.migliorini.stud@ispascalcomandini.it                                                         ', N'4H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicolo''                                           ', N'paglierani                                        ', N'nicolo.paglierani.stud@ispascalcomandini.it                                                         ', N'2E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicolò                                            ', N'polini                                            ', N'nicolo.polini.stud@ispascalcomandini.it                                                             ', N'3B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicolo''                                           ', N'renzi                                             ', N'nicolo.renzi.stud@ispascalcomandini.it                                                              ', N'1A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicolo''                                           ', N'ridolfi                                           ', N'nicolo.ridolfi.stud@ispascalcomandini.it                                                            ', N'1L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicolo''                                           ', N'zavalloni                                         ', N'nicolo.zavalloni.stud@ispascalcomandini.it                                                          ', N'1G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nicolo''                                           ', N'zoccheddu                                         ', N'nicolo.zoccheddu.stud@ispascalcomandini.it                                                          ', N'1G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nikita                                            ', N'bonaldo                                           ', N'nikita.bonaldo.stud@ispascalcomandini.it                                                            ', N'5B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nikita                                            ', N'lorenzi                                           ', N'nikita.lorenzi.stud@ispascalcomandini.it                                                            ', N'2A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'niko                                              ', N'bocci                                             ', N'niko.bocci.stud@ispascalcomandini.it                                                                ', N'3E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nikolas                                           ', N'panterini                                         ', N'nikolas.panterini.stud@ispascalcomandini.it                                                         ', N'2F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nina                                              ', N'zarova                                            ', N'nina.zarova.stud@ispascalcomandini.it                                                               ', N'2M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'noah                                              ', N'guerrini                                          ', N'noah.guerrini.stud@ispascalcomandini.it                                                             ', N'3A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'noemi                                             ', N'bazzocchi                                         ', N'noemi.bazzocchi.stud@ispascalcomandini.it                                                           ', N'1G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'noemi                                             ', N'lagrasta                                          ', N'noemi.lagrasta.stud@ispascalcomandini.it                                                            ', N'5A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'noemi                                             ', N'mudadu                                            ', N'noemi.mudadu.stud@ispascalcomandini.it                                                              ', N'1M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'noemy storm                                       ', N'pistone                                           ', N'noemystorm.pistone.stud@ispascalcomandini.it                                                        ', N'2M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'nouha                                             ', N'gayame                                            ', N'nouha.gayame.stud@ispascalcomandini.it                                                              ', N'2M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'oliver                                            ', N'kapaj                                             ', N'oliver.kapaj.stud@ispascalcomandini.it                                                              ', N'1H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'dallara                                           ', N'olmo                                              ', N'olmo.dallara.stud@ispascalcomandini.it                                                              ', N'3G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'omar                                              ', N'el mounim                                         ', N'omar.elmounim.stud@ispascalcomandini.it                                                             ', N'1C-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'omar                                              ', N'raziki                                            ', N'omar.raziki.stud@ispascalcomandini.it                                                               ', N'4E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'onkon                                             ', N'debnath                                           ', N'onkon.debnath.stud@ispascalcomandini.it                                                             ', N'1G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ossama                                            ', N'essaky                                            ', N'ossama.essaky.stud@ispascalcomandini.it                                                             ', N'2G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'othmane                                           ', N'ballouk                                           ', N'othmane.ballouk.stud@ispascalcomandini.it                                                           ', N'3E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'othmane                                           ', N'hassar                                            ', N'othmane.hassar.stud@ispascalcomandini.it                                                            ', N'1F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'paola                                             ', N'gasperoni                                         ', N'paola.gasperoni@ispascalcomandini.it                                                                ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'paola                                             ', N'masi                                              ', N'paola.masi@ispascalcomandini.it                                                                     ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'paolo                                             ', N'alessandrini                                      ', N'paolo.alessandrini@ispascalcomandini.it                                                             ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'paolo                                             ', N'bagnolini                                         ', N'paolo.bagnolini.stud@ispascalcomandini.it                                                           ', N'4E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'paolo                                             ', N'bazzocchi                                         ', N'paolo.bazzocchi.stud@ispascalcomandini.it                                                           ', N'1C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'paolo                                             ', N'ensini                                            ', N'paolo.ensini.stud@ispascalcomandini.it                                                              ', N'1E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'paolo                                             ', N'gabbanini                                         ', N'paolo.gabbanini.stud@ispascalcomandini.it                                                           ', N'3C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'paolo                                             ', N'lumini                                            ', N'paolo.lumini@ispascalcomandini.it                                                                   ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'paolo                                             ', N'magnani                                           ', N'paolo.magnani.stud@ispascalcomandini.it                                                             ', N'3I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'paolo                                             ', N'preti                                             ', N'paolo.preti.stud@ispascalcomandini.it                                                               ', N'1I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'paolo                                             ', N'zuttion                                           ', N'paolo.zuttion.stud@ispascalcomandini.it                                                             ', N'2E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'papa omar                                         ', N'ndiaye                                            ', N'papaomar.ndiaye.stud@ispascalcomandini.it                                                           ', N'1C-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'pape saer                                         ', N'diop                                              ', N'papesaer.diop.stud@ispascalcomandini.it                                                             ', N'1A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'paride                                            ', N'fiaschetti                                        ', N'paride.fiaschetti.stud@ispascalcomandini.it                                                         ', N'4C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'parvaneh                                          ', N'farrokhi                                          ', N'parvaneh.farrokhi.stud@ispascalcomandini.it                                                         ', N'4M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'pasquale                                          ', N'olandese                                          ', N'pasquale.olandese@ispascalcomandini.it                                                              ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'pasquale                                          ', N'sannino                                           ', N'pasquale.sannino.stud@ispascalcomandini.it                                                          ', N'3E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'pasquale alessio                                  ', N'minniti                                           ', N'pasqualealessio.minniti.stud@ispascalcomandini.it                                                   ', N'4I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'pasqualino                                        ', N'solomita                                          ', N'pasqualino.solomita@ispascalcomandini.it                                                            ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'battazza                                          ', N'patrick                                           ', N'patrick.battazza.stud@ispascalcomandini.it                                                          ', N'3E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'patrick                                           ', N'sbrighi                                           ', N'patrick.sbrighi.stud@ispascalcomandini.it                                                           ', N'5G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'patrick                                           ', N'versari                                           ', N'patrick.versari.stud@ispascalcomandini.it                                                           ', N'4A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'patrick pio                                       ', N'apollaro                                          ', N'patrickpio.apollaro.stud@ispascalcomandini.it                                                       ', N'2F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'pedro junior jesus                                ', N'rosario sarante                                   ', N'pedrojuniorjesus.rosariosarante.stud@ispascalcomandini.it                                           ', N'1E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'peter                                             ', N'bertaccini                                        ', N'peter.bertaccini.stud@ispascalcomandini.it                                                          ', N'1C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'piergiorgio                                       ', N'batani                                            ', N'piergiorgio.batani@ispascalcomandini.it                                                             ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'piero                                             ', N'comelli                                           ', N'piero.comelli@ispascalcomandini.it                                                                  ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'pier sebastiano                                   ', N'peluso                                            ', N'piersebastiano.peluso.stud@ispascalcomandini.it                                                     ', N'3A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'pietro                                            ', N'bernini carri                                     ', N'pietro.berninicarri.stud@ispascalcomandini.it                                                       ', N'1B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'pietro                                            ', N'buiatti                                           ', N'pietro.buiatti.stud@ispascalcomandini.it                                                            ', N'2G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'pietro                                            ', N'cicognani                                         ', N'pietro.cicognani.stud@ispascalcomandini.it                                                          ', N'5H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'pietro                                            ', N'dentale                                           ', N'pietro.dentale.stud@ispascalcomandini.it                                                            ', N'4G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'pietro                                            ', N'gardini                                           ', N'pietro.gardini.stud@ispascalcomandini.it                                                            ', N'4L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'pietro                                            ', N'laudani                                           ', N'pietro.laudani.stud@ispascalcomandini.it                                                            ', N'2E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'pietro                                            ', N'malzone                                           ', N'pietro.malzone.stud@ispascalcomandini.it                                                            ', N'1M-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'pietro                                            ', N'petti                                             ', N'pietro.petti@ispascalcomandini.it                                                                   ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'pietro                                            ', N'pirini casadei                                    ', N'pietro.pirinicasadei.stud@ispascalcomandini.it                                                      ', N'1G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'pietro                                            ', N'rodaro                                            ', N'pietro.rodaro.stud@ispascalcomandini.it                                                             ', N'1I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'pietro                                            ', N'savoretti                                         ', N'pietro.savoretti.stud@ispascalcomandini.it                                                          ', N'2B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'pietro                                            ', N'siboni                                            ', N'pietro.siboni.stud@ispascalcomandini.it                                                             ', N'4H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'tombaccini                                        ', N'pietro                                            ', N'pietro.tombaccini.stud@ispascalcomandini.it                                                         ', N'3I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'prova                                             ', N'prova                                             ', N'prova@ispascalcomandini.it                                                                          ', N'4H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'rachele                                           ', N'de gregorio                                       ', N'rachele.degregorio.stud@ispascalcomandini.it                                                        ', N'2M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'rachid                                            ', N'kaous                                             ', N'rachid.kaous.stud@ispascalcomandini.it                                                              ', N'2A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'raffaele                                          ', N'zanni                                             ', N'raffaele.zanni.stud@ispascalcomandini.it                                                            ', N'1G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'rashed                                            ', N'ali                                               ', N'rashed.ali.stud@ispascalcomandini.it                                                                ', N'1G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'rayan                                             ', N'el bir                                            ', N'rayan.elbir.stud@ispascalcomandini.it                                                               ', N'5G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'rayan                                             ', N'el ghafiri                                        ', N'rayan.elghafiri.stud@ispascalcomandini.it                                                           ', N'1N-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'rayan                                             ', N'montevecchi                                       ', N'rayan.montevecchi.stud@ispascalcomandini.it                                                         ', N'1B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'reda                                              ', N'belouad                                           ', N'reda.belouad.stud@ispascalcomandini.it                                                              ', N'2A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'renato                                            ', N'arcuri                                            ', N'renato.arcuri.stud@ispascalcomandini.it                                                             ', N'2H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'renwei                                            ', N'zhang                                             ', N'renwei.zhang.stud@ispascalcomandini.it                                                              ', N'1M-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'riccardo                                          ', N'assirelli                                         ', N'riccardo.assirelli.stud@ispascalcomandini.it                                                        ', N'1A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'riccardo                                          ', N'bada                                              ', N'riccardo.bada.stud@ispascalcomandini.it                                                             ', N'1A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'riccardo                                          ', N'bagnolini                                         ', N'riccardo.bagnolini.stud@ispascalcomandini.it                                                        ', N'3A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'riccardo                                          ', N'barducci                                          ', N'riccardo.barducci.stud@ispascalcomandini.it                                                         ', N'4F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'riccardo                                          ', N'bartolini                                         ', N'riccardo.bartolini.stud@ispascalcomandini.it                                                        ', N'1M-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'riccardo                                          ', N'bellavista                                        ', N'riccardo.bellavista.stud@ispascalcomandini.it                                                       ', N'2B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'riccardo                                          ', N'boghetta                                          ', N'riccardo.boghetta.stud@ispascalcomandini.it                                                         ', N'2H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'riccardo                                          ', N'brunelli                                          ', N'riccardo.brunelli.stud@ispascalcomandini.it                                                         ', N'4F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'riccardo                                          ', N'carposio                                          ', N'riccardo.carposio.stud@ispascalcomandini.it                                                         ', N'1A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'riccardo                                          ', N'caterino                                          ', N'riccardo.caterino.stud@ispascalcomandini.it                                                         ', N'4B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'riccardo                                          ', N'colaci                                            ', N'riccardo.colaci.stud@ispascalcomandini.it                                                           ', N'1A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'del grande                                        ', N'riccardo                                          ', N'riccardo.delgrande.stud@ispascalcomandini.it                                                        ', N'2I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'riccardo                                          ', N'filippi                                           ', N'riccardo.filippi.stud@ispascalcomandini.it                                                          ', N'1G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'riccardo                                          ', N'foschi                                            ', N'riccardo.foschi.stud@ispascalcomandini.it                                                           ', N'1G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'riccardo                                          ', N'galasso                                           ', N'riccardo.galasso.stud@ispascalcomandini.it                                                          ', N'5H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'riccardo                                          ', N'guccini                                           ', N'riccardo.guccini.stud@ispascalcomandini.it                                                          ', N'3E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'riccardo                                          ', N'guidi                                             ', N'riccardo.guidi.stud@ispascalcomandini.it                                                            ', N'3H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'riccardo                                          ', N'magalotti                                         ', N'riccardo.magalotti.stud@ispascalcomandini.it                                                        ', N'3B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'riccardo                                          ', N'magrini                                           ', N'riccardo.magrini.stud@ispascalcomandini.it                                                          ', N'3C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'riccardo                                          ', N'mancini                                           ', N'riccardo.mancini.stud@ispascalcomandini.it                                                          ', N'4G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'riccardo                                          ', N'picchetti                                         ', N'riccardo.picchetti.stud@ispascalcomandini.it                                                        ', N'1E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'riccardo                                          ', N'piolanti                                          ', N'riccardo.piolanti.stud@ispascalcomandini.it                                                         ', N'1E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'riccardo                                          ', N'ridolfi                                           ', N'riccardo.ridolfi.stud@ispascalcomandini.it                                                          ', N'4B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'riccardo                                          ', N'riva                                              ', N'riccardo.riva.stud@ispascalcomandini.it                                                             ', N'1G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'riccardo                                          ', N'romagnoli                                         ', N'riccardo.romagnoli.stud@ispascalcomandini.it                                                        ', N'2F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'riccardo                                          ', N'schillaci                                         ', N'riccardo.schillaci.stud@ispascalcomandini.it                                                        ', N'4H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'riccardo                                          ', N'stoppa                                            ', N'riccardo.stoppa.stud@ispascalcomandini.it                                                           ', N'2F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'riccardo                                          ', N'urbini                                            ', N'riccardo.urbini.stud@ispascalcomandini.it                                                           ', N'5D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'riccardo                                          ', N'ventrucci                                         ', N'riccardo.ventrucci.stud@ispascalcomandini.it                                                        ', N'4F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'riccardo                                          ', N'zamagni                                           ', N'riccardo.zamagni.stud@ispascalcomandini.it                                                          ', N'3B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'riccardo antonio                                  ', N'erroi                                             ', N'riccardoantonio.erroi.stud@ispascalcomandini.it                                                     ', N'2C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ricky                                             ', N'lombardi                                          ', N'ricky.lombardi.stud@ispascalcomandini.it                                                            ', N'1G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'rida                                              ', N'ait malouk                                        ', N'rida.aitmalouk.stud@ispascalcomandini.it                                                            ', N'1G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'rida                                              ', N'el mountassir                                     ', N'rida.elmountassir.stud@ispascalcomandini.it                                                         ', N'5A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'rida                                              ', N'meghras                                           ', N'rida.meghras.stud@ispascalcomandini.it                                                              ', N'3A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'rilind                                            ', N'aziri                                             ', N'rilind.aziri.stud@ispascalcomandini.it                                                              ', N'1C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'roberto                                           ', N'buono                                             ', N'roberto.buono@ispascalcomandini.it                                                                  ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'roberto                                           ', N'colavecchia                                       ', N'roberto.colavecchia.stud@ispascalcomandini.it                                                       ', N'1G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'roberto                                           ', N'cucchi                                            ', N'roberto.cucchi.stud@ispascalcomandini.it                                                            ', N'5L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'roberto                                           ', N'pascarella                                        ', N'roberto.pascarella.stud@ispascalcomandini.it                                                        ', N'1B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'roberto                                           ', N'pisu                                              ', N'roberto.pisu.stud@ispascalcomandini.it                                                              ', N'5L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'rocco                                             ', N'baglivo                                           ', N'rocco.baglivo@ispascalcomandini.it                                                                  ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'rosaria                                           ', N'amoroso                                           ', N'rosaria.amoroso@ispascalcomandini.it                                                                ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'rosetta                                           ', N'baldacci                                          ', N'rosetta.baldacci@ispascalcomandini.it                                                               ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'rossella                                          ', N'rivellini                                         ', N'rossella.rivellini@ispascalcomandini.it                                                             ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'roxanaantonella                                   ', N'graur                                             ', N'roxanaantonella.graur.stud@ispascalcomandini.it                                                     ', N'1M-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ruben                                             ', N'agostini                                          ', N'ruben.agostini.stud@ispascalcomandini.it                                                            ', N'2E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'rubin                                             ', N'burgu                                             ', N'rubin.burgu.stud@ispascalcomandini.it                                                               ', N'3M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'russi tonev                                       ', N'russev                                            ', N'russitonev.russev.stud@ispascalcomandini.it                                                         ', N'3G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ruth                                              ', N'goytia gutierrez                                  ', N'ruth.goytiagutierrez.stud@ispascalcomandini.it                                                      ', N'5A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ryad                                              ', N'kaous                                             ', N'ryad.kaous.stud@ispascalcomandini.it                                                                ', N'1C-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ryan                                              ', N'crociati                                          ', N'ryan.crociati.stud@ispascalcomandini.it                                                             ', N'2G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'zullo                                             ', N'ryan                                              ', N'ryan.zullo.stud@ispascalcomandini.it                                                                ', N'3I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'sabjan                                            ', N'sinani                                            ', N'sabjan.sinani.stud@ispascalcomandini.it                                                             ', N'2E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'sabrina                                           ', N'laouini                                           ', N'sabrina.laouini.stud@ispascalcomandini.it                                                           ', N'4M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'sabrina                                           ', N'nasolini                                          ', N'sabrina.nasolini.stud@ispascalcomandini.it                                                          ', N'4M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'sabrina                                           ', N'trento                                            ', N'sabrina.trento.stud@ispascalcomandini.it                                                            ', N'3I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'sadman                                            ', N'hossain                                           ', N'sadman.hossain.stud@ispascalcomandini.it                                                            ', N'1F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'said                                              ', N'chaibi                                            ', N'said.chaibi.stud@ispascalcomandini.it                                                               ', N'2A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'saleh                                             ', N'gaaloul                                           ', N'saleh.gaaloul.stud@ispascalcomandini.it                                                             ', N'5G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'salma                                             ', N'meghras                                           ', N'salma.meghras.stud@ispascalcomandini.it                                                             ', N'4M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'salvatore                                         ', N'montagna                                          ', N'salvatore.montagna.stud@ispascalcomandini.it                                                        ', N'1B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'salvatore                                         ', N'prosperino                                        ', N'salvatore.prosperino.stud@ispascalcomandini.it                                                      ', N'4E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'salvatrice                                        ', N'bentivegna                                        ', N'salvatrice.bentivegna.stud@ispascalcomandini.it                                                     ', N'1M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'salymata                                          ', N'bakayoko                                          ', N'salymata.bakayoko.stud@ispascalcomandini.it                                                         ', N'3M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'sami                                              ', N'qasmaoui                                          ', N'sami.qasmaoui.stud@ispascalcomandini.it                                                             ', N'1C-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'samuel                                            ', N'arapi                                             ', N'samuel.arapi.stud@ispascalcomandini.it                                                              ', N'2A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'samuel                                            ', N'iyama                                             ', N'samuel.iyama.stud@ispascalcomandini.it                                                              ', N'1E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'samuel                                            ', N'pagliarani                                        ', N'samuel.pagliarani.stud@ispascalcomandini.it                                                         ', N'5E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'samuele                                           ', N'aldini                                            ', N'samuele.aldini.stud@ispascalcomandini.it                                                            ', N'4L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'samuele                                           ', N'baroni                                            ', N'samuele.baroni.stud@ispascalcomandini.it                                                            ', N'5C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'samuele                                           ', N'bizzocchi                                         ', N'samuele.bizzocchi.stud@ispascalcomandini.it                                                         ', N'4F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'samuele                                           ', N'blasi                                             ', N'samuele.blasi.stud@ispascalcomandini.it                                                             ', N'1N-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'samuele                                           ', N'canzaniello                                       ', N'samuele.canzaniello.stud@ispascalcomandini.it                                                       ', N'5L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'samuele                                           ', N'giorgetti                                         ', N'samuele.giorgetti.stud@ispascalcomandini.it                                                         ', N'1A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'samuele                                           ', N'guri                                              ', N'samuele.guri.stud@ispascalcomandini.it                                                              ', N'1I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'samuele                                           ', N'lafabiana                                         ', N'samuele.lafabiana.stud@ispascalcomandini.it                                                         ', N'2E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'samuele                                           ', N'luongo                                            ', N'samuele.luongo.stud@ispascalcomandini.it                                                            ', N'1B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'samuele                                           ', N'magi                                              ', N'samuele.magi.stud@ispascalcomandini.it                                                              ', N'1N-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'samuele                                           ', N'manuzzi                                           ', N'samuele.manuzzi.stud@ispascalcomandini.it                                                           ', N'1F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'samuele                                           ', N'masini                                            ', N'samuele.masini.stud@ispascalcomandini.it                                                            ', N'2E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'samuele                                           ', N'mazzini                                           ', N'samuele.mazzini.stud@ispascalcomandini.it                                                           ', N'2G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'samuele                                           ', N'pagliaro                                          ', N'samuele.pagliaro.stud@ispascalcomandini.it                                                          ', N'2I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'samuele                                           ', N'paolucci                                          ', N'samuele.paolucci.stud@ispascalcomandini.it                                                          ', N'5E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'samuele                                           ', N'pesaresi                                          ', N'samuele.pesaresi.stud@ispascalcomandini.it                                                          ', N'4A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'samuele                                           ', N'piolanti                                          ', N'samuele.piolanti.stud@ispascalcomandini.it                                                          ', N'4E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'samuele                                           ', N'protti                                            ', N'samuele.protti.stud@ispascalcomandini.it                                                            ', N'5E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'samuele                                           ', N'rocchi                                            ', N'samuele.rocchi.stud@ispascalcomandini.it                                                            ', N'4L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'samuele                                           ', N'romagnoli                                         ', N'samuele.romagnoli.stud@ispascalcomandini.it                                                         ', N'1L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'samuele                                           ', N'snabl                                             ', N'samuele.snabl.stud@ispascalcomandini.it                                                             ', N'1L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'samuele                                           ', N'sola                                              ', N'samuele.sola.stud@ispascalcomandini.it                                                              ', N'1C-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'samuele                                           ', N'tomo''                                             ', N'samuele.tomo.stud@ispascalcomandini.it                                                              ', N'1M-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'samuele                                           ', N'trapani                                           ', N'samuele.trapani.stud@ispascalcomandini.it                                                           ', N'4H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'samuele maria                                     ', N'auletta                                           ', N'samuelemaria.auletta.stud@ispascalcomandini.it                                                      ', N'4B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'samuele vito                                      ', N'scorrano                                          ', N'samuelevito.scorrano.stud@ispascalcomandini.it                                                      ', N'1E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'cappelli                                          ', N'sara                                              ', N'sara.cappelli.stud@ispascalcomandini.it                                                             ', N'3E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'sara                                              ', N'gradara                                           ', N'sara.gradara@ispascalcomandini.it                                                                   ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'sara                                              ', N'pistocchi                                         ', N'sara.pistocchi@ispascalcomandini.it                                                                 ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'sara                                              ', N'strada                                            ', N'sara.strada.stud@ispascalcomandini.it                                                               ', N'4M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'sasha                                             ', N'africano                                          ', N'sasha.africano.stud@ispascalcomandini.it                                                            ', N'4L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'sebastian                                         ', N'halili                                            ', N'sebastian.halili.stud@ispascalcomandini.it                                                          ', N'3M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'sebastian                                         ', N'laska                                             ', N'sebastian.laska.stud@ispascalcomandini.it                                                           ', N'1C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'sebastiano                                        ', N'francia                                           ', N'sebastiano.francia.stud@ispascalcomandini.it                                                        ', N'1E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'rossi                                             ', N'sebastiano                                        ', N'sebastiano.rossi.stud@ispascalcomandini.it                                                          ', N'2H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'sebastiano                                        ', N'sacchetti                                         ', N'sebastiano.sacchetti.stud@ispascalcomandini.it                                                      ', N'4A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'selim                                             ', N'ayach                                             ', N'selim.ayach.stud@ispascalcomandini.it                                                               ', N'1E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'selin                                             ', N'zyberaj                                           ', N'selin.zyberaj.stud@ispascalcomandini.it                                                             ', N'1G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'sem                                               ', N'werpers                                           ', N'sem.werpers.stud@ispascalcomandini.it                                                               ', N'3A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'serena                                            ', N'carrano                                           ', N'serena.carrano@ispascalcomandini.it                                                                 ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'sergio                                            ', N'maltoni                                           ', N'sergio.maltoni.stud@ispascalcomandini.it                                                            ', N'2I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'sergio                                            ', N'quarta                                            ', N'sergio.quarta@ispascalcomandini.it                                                                  ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'sergio                                            ', N'stolear                                           ', N'sergio.stolear.stud@ispascalcomandini.it                                                            ', N'1I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'servedin                                          ', N'shkreli                                           ', N'servedin.shkreli.stud@ispascalcomandini.it                                                          ', N'3A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'shahdd                                            ', N'shama                                             ', N'shahdd.shama.stud@ispascalcomandini.it                                                              ', N'1M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'shahria ahammed somrat                            ', N'kalam azad                                        ', N'shahria.kalamazad.stud@ispascalcomandini.it                                                         ', N'1A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'shams                                             ', N'ismail ali ismail                                 ', N'shams.ismailaliismail.stud@ispascalcomandini.it                                                     ', N'3A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'astefanoaei                                       ', N'silvia                                            ', N'silvia.astefanoaei.stud@ispascalcomandini.it                                                        ', N'3I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'silvia                                            ', N'conti                                             ', N'silvia.conti@ispascalcomandini.it                                                                   ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'silvia                                            ', N'zavalloni                                         ', N'silvia.zavalloni@ispascalcomandini.it                                                               ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'simona                                            ', N'iannone                                           ', N'simona.iannone.stud@ispascalcomandini.it                                                            ', N'2E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'simone                                            ', N'baiardi                                           ', N'simone.baiardi.stud@ispascalcomandini.it                                                            ', N'3B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'simone                                            ', N'berlati                                           ', N'simone.berlati.stud@ispascalcomandini.it                                                            ', N'1A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'simone                                            ', N'bianculli                                         ', N'simone.bianculli.stud@ispascalcomandini.it                                                          ', N'1A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'simone                                            ', N'brighi                                            ', N'simone.brighi.stud@ispascalcomandini.it                                                             ', N'3A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'simone                                            ', N'cannolicchio                                      ', N'simone.cannolicchio@ispascalcomandini.it                                                            ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'simone                                            ', N'ceccarelli                                        ', N'simone.ceccarelli.stud@ispascalcomandini.it                                                         ', N'1F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'simone                                            ', N'ceccarelli                                        ', N'simone.ceccarelli1.stud@ispascalcomandini.it                                                        ', N'1H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'simone                                            ', N'chiariello                                        ', N'simone.chiariello.stud@ispascalcomandini.it                                                         ', N'1B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'simone                                            ', N'cola                                              ', N'simone.cola.stud@ispascalcomandini.it                                                               ', N'5D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'simone                                            ', N'contursi                                          ', N'simone.contursi.stud@ispascalcomandini.it                                                           ', N'4C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'simone                                            ', N'deodato                                           ', N'simone.deodato.stud@ispascalcomandini.it                                                            ', N'5B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'simone                                            ', N'faedi                                             ', N'simone.faedi.stud@ispascalcomandini.it                                                              ', N'4A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'simone                                            ', N'gramellini                                        ', N'simone.gramellini.stud@ispascalcomandini.it                                                         ', N'5G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'simone                                            ', N'lizzo                                             ', N'simone.lizzo.stud@ispascalcomandini.it                                                              ', N'2E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'simone                                            ', N'longo                                             ', N'simone.longo.stud@ispascalcomandini.it                                                              ', N'4B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'simone                                            ', N'marchetti                                         ', N'simone.marchetti.stud@ispascalcomandini.it                                                          ', N'2B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'marson                                            ', N'simone                                            ', N'simone.marson.stud@ispascalcomandini.it                                                             ', N'3H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'simone                                            ', N'mazza                                             ', N'simone.mazza.stud@ispascalcomandini.it                                                              ', N'1C-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'simone                                            ', N'mazzacano                                         ', N'simone.mazzacano.stud@ispascalcomandini.it                                                          ', N'4I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'simone                                            ', N'michelacci                                        ', N'simone.michelacci.stud@ispascalcomandini.it                                                         ', N'1I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'simone                                            ', N'migani                                            ', N'simone.migani.stud@ispascalcomandini.it                                                             ', N'3A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'simone                                            ', N'nucci                                             ', N'simone.nucci@ispascalcomandini.it                                                                   ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'simone                                            ', N'piolanti                                          ', N'simone.piolanti.stud@ispascalcomandini.it                                                           ', N'4F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'pitrolo                                           ', N'simone                                            ', N'simone.pitrolo.stud@ispascalcomandini.it                                                            ', N'3I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'simone                                            ', N'popolizio                                         ', N'simone.popolizio.stud@ispascalcomandini.it                                                          ', N'2B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'simone                                            ', N'pozzi                                             ', N'simone.pozzi.stud@ispascalcomandini.it                                                              ', N'3A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'simone                                            ', N'rinaldi                                           ', N'simone.rinaldi.stud@ispascalcomandini.it                                                            ', N'1G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'simone                                            ', N'rossi                                             ', N'simone.rossi.stud@ispascalcomandini.it                                                              ', N'4D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'simone                                            ', N'spadaccini                                        ', N'simone.spadaccini.stud@ispascalcomandini.it                                                         ', N'3A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'simone                                            ', N'tedaldi                                           ', N'simone.tedaldi.stud@ispascalcomandini.it                                                            ', N'2F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'simone                                            ', N'tizzano                                           ', N'simone.tizzano.stud@ispascalcomandini.it                                                            ', N'2H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'simone                                            ', N'valzania                                          ', N'simone.valzania.stud@ispascalcomandini.it                                                           ', N'1B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'simone                                            ', N'zamagna                                           ', N'simone.zamagna.stud@ispascalcomandini.it                                                            ', N'3G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'sofia                                             ', N'merci                                             ', N'sofia.merci.stud@ispascalcomandini.it                                                               ', N'3M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'sofia                                             ', N'scozzoli                                          ', N'sofia.scozzoli.stud@ispascalcomandini.it                                                            ', N'2I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'sofia                                             ', N'stella                                            ', N'sofia.stella.stud@ispascalcomandini.it                                                              ', N'1L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'sofia                                             ', N'viarani                                           ', N'sofia.viarani.stud@ispascalcomandini.it                                                             ', N'4I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'sofien                                            ', N'makhlouf                                          ', N'sofien.makhlouf.stud@ispascalcomandini.it                                                           ', N'5G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'bala                                              ', N'sokol                                             ', N'sokol.bala.stud@ispascalcomandini.it                                                                ', N'3I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'sophia                                            ', N'buzzone                                           ', N'sophia.buzzone.stud@ispascalcomandini.it                                                            ', N'3M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'sophia                                            ', N'haxhimima                                         ', N'sophia.haxhimima.stud@ispascalcomandini.it                                                          ', N'2M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'sophia                                            ', N'zuffi                                             ', N'sophia.zuffi.stud@ispascalcomandini.it                                                              ', N'2E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'sorin andrei                                      ', N'botez                                             ', N'sorinandrei.botez.stud@ispascalcomandini.it                                                         ', N'4C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'soualiho                                          ', N'toure                                             ', N'soualiho.toure.stud@ispascalcomandini.it                                                            ', N'3G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'soufiane                                          ', N'el khabouli                                       ', N'soufiane.elkhabouli.stud@ispascalcomandini.it                                                       ', N'2G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'soufiane                                          ', N'mostanfi                                          ', N'soufiane.mostanfi.stud@ispascalcomandini.it                                                         ', N'5B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'souhail                                           ', N'himes                                             ', N'souhail.himes.stud@ispascalcomandini.it                                                             ', N'2E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'soulaimane                                        ', N'radif                                             ', N'soulaimane.radif.stud@ispascalcomandini.it                                                          ', N'5B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'savov                                             ', N'stanimir aleksandrov                              ', N'stanimiraleksandrov.savov.stud@ispascalcomandini.it                                                 ', N'2E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'stanislav                                         ', N'popa                                              ', N'stanislav.popa.stud@ispascalcomandini.it                                                            ', N'4G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'stefan dragos                                     ', N'racovita                                          ', N'stefandragos.racovita.stud@ispascalcomandini.it                                                     ', N'4G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'stefania                                          ', N'carano                                            ', N'stefania.carano@ispascalcomandini.it                                                                ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'stefano                                           ', N'castagnoli                                        ', N'stefano.castagnoli@ispascalcomandini.it                                                             ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'stefano                                           ', N'severi                                            ', N'stefano.severi.stud@ispascalcomandini.it                                                            ', N'4C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'stefano mario                                     ', N'gasperoni                                         ', N'stefanomario.gasperoni.stud@ispascalcomandini.it                                                    ', N'1A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'steven                                            ', N'abouaissa                                         ', N'steven.abouaissa.stud@ispascalcomandini.it                                                          ', N'2G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'stive                                             ', N'bamouni                                           ', N'stive.bamouni.stud@ispascalcomandini.it                                                             ', N'4L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'svetoslav pavlov                                  ', N'dinev                                             ', N'svetoslavpavlov.dinev.stud@ispascalcomandini.it                                                     ', N'1M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'syria                                             ', N'malaguti                                          ', N'syria.malaguti.stud@ispascalcomandini.it                                                            ', N'2A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'thierno                                           ', N'gueye                                             ', N'thierno.gueye.stud@ispascalcomandini.it                                                             ', N'1G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'thomas                                            ', N'cangini                                           ', N'thomas.cangini.stud@ispascalcomandini.it                                                            ', N'4E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'thomas                                            ', N'cappellini                                        ', N'thomas.cappellini.stud@ispascalcomandini.it                                                         ', N'5C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'thomas                                            ', N'di consoli                                        ', N'thomas.diconsoli.stud@ispascalcomandini.it                                                          ', N'2H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'thomas                                            ', N'gianoglio                                         ', N'thomas.gianoglio.stud@ispascalcomandini.it                                                          ', N'3B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'thomas                                            ', N'granieri                                          ', N'thomas.granieri.stud@ispascalcomandini.it                                                           ', N'2F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'thomas                                            ', N'gualtieri                                         ', N'thomas.gualtieri@ispascalcomandini.it                                                               ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'thomas                                            ', N'rossini                                           ', N'thomas.rossini.stud@ispascalcomandini.it                                                            ', N'4E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'tiberio                                           ', N'tonetti                                           ', N'tiberio.tonetti@ispascalcomandini.it                                                                ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'baldacci                                          ', N'tommaso                                           ', N'tommaso.baldacci.stud@ispascalcomandini.it                                                          ', N'2F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'tommaso                                           ', N'benzi                                             ', N'tommaso.benzi.stud@ispascalcomandini.it                                                             ', N'1G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'tommaso                                           ', N'bessi                                             ', N'tommaso.bessi.stud@ispascalcomandini.it                                                             ', N'2E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'tommaso                                           ', N'billone                                           ', N'tommaso.billone.stud@ispascalcomandini.it                                                           ', N'1C-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'biserni                                           ', N'tommaso                                           ', N'tommaso.biserni.stud@ispascalcomandini.it                                                           ', N'3H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'tommaso                                           ', N'bonacci                                           ', N'tommaso.bonacci.stud@ispascalcomandini.it                                                           ', N'2A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'tommaso                                           ', N'brandinelli                                       ', N'tommaso.brandinelli.stud@ispascalcomandini.it                                                       ', N'5G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'tommaso                                           ', N'caminati                                          ', N'tommaso.caminati.stud@ispascalcomandini.it                                                          ', N'5G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'tommaso                                           ', N'carpano                                           ', N'tommaso.carpano.stud@ispascalcomandini.it                                                           ', N'1H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'tommaso                                           ', N'casadei                                           ', N'tommaso.casadei.stud@ispascalcomandini.it                                                           ', N'1I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'tommaso                                           ', N'conti                                             ', N'tommaso.conti.stud@ispascalcomandini.it                                                             ', N'3C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'tommaso                                           ', N'ensini                                            ', N'tommaso.ensini.stud@ispascalcomandini.it                                                            ', N'2E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'tommaso                                           ', N'fabbri                                            ', N'tommaso.fabbri.stud@ispascalcomandini.it                                                            ', N'4D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'tommaso                                           ', N'fiumana                                           ', N'tommaso.fiumana.stud@ispascalcomandini.it                                                           ', N'1A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'tommaso                                           ', N'foschi                                            ', N'tommaso.foschi.stud@ispascalcomandini.it                                                            ', N'1N-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'tommaso                                           ', N'gridella                                          ', N'tommaso.gridella.stud@ispascalcomandini.it                                                          ', N'5B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'tommaso                                           ', N'maestri                                           ', N'tommaso.maestri.stud@ispascalcomandini.it                                                           ', N'4F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'tommaso                                           ', N'mambelli                                          ', N'tommaso.mambelli.stud@ispascalcomandini.it                                                          ', N'4C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'tommaso                                           ', N'orioli                                            ', N'tommaso.orioli.stud@ispascalcomandini.it                                                            ', N'1C-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'tommaso                                           ', N'pagliarani                                        ', N'tommaso.pagliarani.stud@ispascalcomandini.it                                                        ', N'3A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'tommaso                                           ', N'petrini                                           ', N'tommaso.petrini.stud@ispascalcomandini.it                                                           ', N'1G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'tommaso                                           ', N'ragazzini                                         ', N'tommaso.ragazzini.stud@ispascalcomandini.it                                                         ', N'2F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'ricci                                             ', N'tommaso                                           ', N'tommaso.ricci.stud@ispascalcomandini.it                                                             ', N'3I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'tommaso                                           ', N'rossi                                             ', N'tommaso.rossi.stud@ispascalcomandini.it                                                             ', N'2B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'tommaso                                           ', N'rossi                                             ', N'tommaso.rossi1.stud@ispascalcomandini.it                                                            ', N'1L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'tommaso                                           ', N'sanchi                                            ', N'tommaso.sanchi.stud@ispascalcomandini.it                                                            ', N'2A-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'tommaso                                           ', N'sardelli                                          ', N'tommaso.sardelli.stud@ispascalcomandini.it                                                          ', N'4F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'tommaso                                           ', N'scarpellini                                       ', N'tommaso.scarpellini.stud@ispascalcomandini.it                                                       ', N'5D-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'tommaso                                           ', N'smeraldi                                          ', N'tommaso.smeraldi.stud@ispascalcomandini.it                                                          ', N'1M-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'tommaso                                           ', N'stefanini                                         ', N'tommaso.stefanini.stud@ispascalcomandini.it                                                         ', N'3C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'tommaso                                           ', N'zammarchi                                         ', N'tommaso.zammarchi.stud@ispascalcomandini.it                                                         ', N'5G-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'tommaso todorov                                   ', N'dinev                                             ', N'tommasotodorov.dinev.stud@ispascalcomandini.it                                                      ', N'1B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'tommy                                             ', N'gambelli                                          ', N'tommy.gambelli.stud@ispascalcomandini.it                                                            ', N'3E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'toni                                              ', N'greco                                             ', N'toni.greco@ispascalcomandini.it                                                                     ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'urbano                                            ', N'lupoli                                            ', N'urbano.lupoli.stud@ispascalcomandini.it                                                             ', N'3E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'vadim                                             ', N'tomsa                                             ', N'vadim.tomsa.stud@ispascalcomandini.it                                                               ', N'5B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'valentina                                         ', N'chiucchi                                          ', N'valentina.chiucchi.stud@ispascalcomandini.it                                                        ', N'2I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'valentina                                         ', N'monti                                             ', N'valentina.monti.stud@ispascalcomandini.it                                                           ', N'1M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'valentina atanasova                               ', N'todorova                                          ', N'valentina.todorova.stud@ispascalcomandini.it                                                        ', N'1F-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'valentino                                         ', N'forti                                             ', N'valentino.forti.stud@ispascalcomandini.it                                                           ', N'2G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'valentino                                         ', N'maris                                             ', N'valentino.maris.stud@ispascalcomandini.it                                                           ', N'1M-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'valentino                                         ', N'rrokaj                                            ', N'valentino.rrokaj.stud@ispascalcomandini.it                                                          ', N'2C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'valeria                                           ', N'apostolov                                         ', N'valeria.apostolov.stud@ispascalcomandini.it                                                         ', N'5A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'valerio                                           ', N'borsari                                           ', N'valerio.borsari.stud@ispascalcomandini.it                                                           ', N'1B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'valerio                                           ', N'gatta                                             ', N'valerio.gatta@ispascalcomandini.it                                                                  ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'vanessa                                           ', N'xhafa                                             ', N'vanessa.xhafa.stud@ispascalcomandini.it                                                             ', N'1M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'vanni                                             ', N'bacalu                                            ', N'vanni.bacalu.stud@ispascalcomandini.it                                                              ', N'1A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'vansita                                           ', N'cullhaj                                           ', N'vansita.cullhaj.stud@ispascalcomandini.it                                                           ', N'2M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'vasil ivanov                                      ', N'georgiev                                          ', N'vasilivanov.georgiev.stud@ispascalcomandini.it                                                      ', N'3G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'vasko                                             ', N'dallara                                           ', N'vasko.dallara.stud@ispascalcomandini.it                                                             ', N'1C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'vera                                              ', N'bravaccini                                        ', N'vera.bravaccini.stud@ispascalcomandini.it                                                           ', N'4M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'veronica                                          ', N'caprelli                                          ', N'veronica.caprelli.stud@ispascalcomandini.it                                                         ', N'1L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'veronica                                          ', N'magnani                                           ', N'veronica.magnani.stud@ispascalcomandini.it                                                          ', N'4M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'victor                                            ', N'cardinale                                         ', N'victor.cardinale.stud@ispascalcomandini.it                                                          ', N'3C-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'victor                                            ', N'lapardhaja                                        ', N'victor.lapardhaja.stud@ispascalcomandini.it                                                         ', N'1C-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'victor                                            ', N'morra                                             ', N'victor.morra.stud@ispascalcomandini.it                                                              ', N'5B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'victor luiz                                       ', N'marques de assis                                  ', N'victorluiz.marquesdeassis.stud@ispascalcomandini.it                                                 ', N'2G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'vincenzo                                          ', N'bomparola                                         ', N'vincenzo.bomparola.stud@ispascalcomandini.it                                                        ', N'2A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'vincenzo                                          ', N'flotta                                            ', N'vincenzo.flotta@ispascalcomandini.it                                                                ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'vincenzo                                          ', N'maisano                                           ', N'vincenzo.maisano@ispascalcomandini.it                                                               ', NULL, N'A')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'vincenzo                                          ', N'mazzara                                           ', N'vincenzo.mazzara@ispascalcomandini.it                                                               ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'vincenzo                                          ', N'prisco                                            ', N'vincenzo.prisco.stud@ispascalcomandini.it                                                           ', N'5L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'vincenzo                                          ', N'sciortino                                         ', N'vincenzo.sciortino.stud@ispascalcomandini.it                                                        ', N'1H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'vincenzo                                          ', N'silvestri                                         ', N'vincenzo.silvestri.stud@ispascalcomandini.it                                                        ', N'1I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'vinko                                             ', N'svrdlin                                           ', N'vinko.svrdlin.stud@ispascalcomandini.it                                                             ', N'5A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'virginia                                          ', N'sordano                                           ', N'virginia.sordano.stud@ispascalcomandini.it                                                          ', N'1M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'vitaliano                                         ', N'tescione                                          ', N'vitaliano.tescione.stud@ispascalcomandini.it                                                        ', N'1I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'vito                                              ', N'monfreda                                          ', N'vito.monfreda@ispascalcomandini.it                                                                  ', NULL, N'D')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'vittorio                                          ', N'sorrentino                                        ', N'vittorio.sorrentino.stud@ispascalcomandini.it                                                       ', N'2G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'vjacheslav gabriele                               ', N'testi                                             ', N'vjacheslavgabriele.testi.stud@ispascalcomandini.it                                                  ', N'4H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'vladislav                                         ', N'cazac                                             ', N'vladislav.cazac.stud@ispascalcomandini.it                                                           ', N'4G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'wassim                                            ', N'moussalli                                         ', N'wassim.moussalli.stud@ispascalcomandini.it                                                          ', N'2E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'wassim                                            ', N'zellal                                            ', N'wassim.zellal.stud@ispascalcomandini.it                                                             ', N'2E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'william                                           ', N'covella                                           ', N'william.covella.stud@ispascalcomandini.it                                                           ', N'4H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'xi                                                ', N'zhou                                              ', N'xi.zhou.stud@ispascalcomandini.it                                                                   ', N'5E-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'xu lin                                            ', N'ying                                              ', N'xulin.ying.stud@ispascalcomandini.it                                                                ', N'4M-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'yasser                                            ', N'rhobar                                            ', N'yasser.rhobar.stud@ispascalcomandini.it                                                             ', N'2A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'yassime rafate                                    ', N'modre                                             ', N'yassimerafate.modre.stud@ispascalcomandini.it                                                       ', N'1C-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'yassin                                            ', N'ezzouhri                                          ', N'yassin.ezzouhri.stud@ispascalcomandini.it                                                           ', N'3A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'kaybouci                                          ', N'yassin                                            ', N'yassin.kaybouci.stud@ispascalcomandini.it                                                           ', N'3I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'yassin                                            ', N'labid                                             ', N'yassin.labid.stud@ispascalcomandini.it                                                              ', N'1E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'yassin                                            ', N'ridiaoui                                          ', N'yassin.ridiaoui.stud@ispascalcomandini.it                                                           ', N'1E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'yassine                                           ', N'loissif                                           ', N'yassine.loissif.stud@ispascalcomandini.it                                                           ', N'1A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'yessir                                            ', N'samraoui                                          ', N'yessir.samraoui.stud@ispascalcomandini.it                                                           ', N'1B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'yosberto                                          ', N'baro.carbonell                                    ', N'yosberto.barocarbonell.stud@ispascalcomandini.it                                                    ', N'5L-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'youness                                           ', N'en nahi                                           ', N'youness.ennahi.stud@ispascalcomandini.it                                                            ', N'5G-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'younous                                           ', N'el hafyani                                        ', N'younous.elhafyani.stud@ispascalcomandini.it                                                         ', N'3A-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'yousef                                            ', N'djerir                                            ', N'yousef.djerir.stud@ispascalcomandini.it                                                             ', N'4E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'youssef                                           ', N'en naouny                                         ', N'youssef.ennaouny.stud@ispascalcomandini.it                                                          ', N'4B-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'yuri                                              ', N'gentile                                           ', N'yuri.gentile.stud@ispascalcomandini.it                                                              ', N'4I-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'zakaria                                           ', N'akharraz                                          ', N'zakaria.akharraz.stud@ispascalcomandini.it                                                          ', N'5H-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'zakaria                                           ', N'er-rat ma                                         ', N'zakaria.er-ratma.stud@ispascalcomandini.it                                                          ', N'3B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'zakaria                                           ', N'fikri                                             ', N'zakaria.fikri.stud@ispascalcomandini.it                                                             ', N'2E-C', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'zef                                               ', N'lekst akaj                                        ', N'zef.lekstakaj.stud@ispascalcomandini.it                                                             ', N'2B-P', N'S')
GO
INSERT [dbo].[ListaUtentiScolastici] ([Nome], [Cognome], [Email], [Classe], [Tipo]) VALUES (N'zorio                                             ', N'guerra                                            ', N'zorio.guerra@ispascalcomandini.it                                                                   ', NULL, N'A')
GO
INSERT [dbo].[Prodotto] ([Codce], [Nome], [Descrizione], [Note], [Prezzo], [TipologiaProdotto]) VALUES (1, N'La Mortadellazza                        ', N'Due semplici fette di pane riempite con delle fantastiche fette di Mortadella                                                                                                                                                                             ', NULL, 3.8, 1)
GO
INSERT [dbo].[Prodotto] ([Codce], [Nome], [Descrizione], [Note], [Prezzo], [TipologiaProdotto]) VALUES (2, N'Panino con il Prosciutto Crudo          ', NULL, NULL, 4.2, 1)
GO
SET IDENTITY_INSERT [dbo].[Sede] ON 
GO
INSERT [dbo].[Sede] ([Codice], [Tipo], [Descrizione], [Indirizzo], [Nome], [Telefono]) VALUES (1, NULL, NULL, N'''X''                           ', N'''FE''                ', 76643765)
GO
INSERT [dbo].[Sede] ([Codice], [Tipo], [Descrizione], [Indirizzo], [Nome], [Telefono]) VALUES (2, NULL, NULL, N'''casadife''                    ', N'''FA''                ', 5426389)
GO
SET IDENTITY_INSERT [dbo].[Sede] OFF
GO
SET IDENTITY_INSERT [dbo].[TipologiaProdotto] ON 
GO
INSERT [dbo].[TipologiaProdotto] ([Codice], [Nome], [Descrizione]) VALUES (1, N'Panini              ', NULL)
GO
SET IDENTITY_INSERT [dbo].[TipologiaProdotto] OFF
GO
ALTER TABLE [dbo].[Abilitazione]  WITH CHECK ADD  CONSTRAINT [FK_Abilitazione_Account] FOREIGN KEY([Account])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Abilitazione] CHECK CONSTRAINT [FK_Abilitazione_Account]
GO
ALTER TABLE [dbo].[Abilitazione]  WITH CHECK ADD  CONSTRAINT [FK_Abilitazione_Sede] FOREIGN KEY([Sede])
REFERENCES [dbo].[Sede] ([Codice])
GO
ALTER TABLE [dbo].[Abilitazione] CHECK CONSTRAINT [FK_Abilitazione_Sede]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Sede] FOREIGN KEY([Sede])
REFERENCES [dbo].[Sede] ([Codice])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Sede]
GO
ALTER TABLE [dbo].[CompostoDa]  WITH CHECK ADD  CONSTRAINT [FK_CompostoDa_Menu] FOREIGN KEY([Menu])
REFERENCES [dbo].[Menu] ([Codice])
GO
ALTER TABLE [dbo].[CompostoDa] CHECK CONSTRAINT [FK_CompostoDa_Menu]
GO
ALTER TABLE [dbo].[CompostoDa]  WITH CHECK ADD  CONSTRAINT [FK_CompostoDa_Prodotto] FOREIGN KEY([Prodotto])
REFERENCES [dbo].[Prodotto] ([Codce])
GO
ALTER TABLE [dbo].[CompostoDa] CHECK CONSTRAINT [FK_CompostoDa_Prodotto]
GO
ALTER TABLE [dbo].[Effettua]  WITH CHECK ADD  CONSTRAINT [FK_Effettua_Menu] FOREIGN KEY([Menu])
REFERENCES [dbo].[Menu] ([Codice])
GO
ALTER TABLE [dbo].[Effettua] CHECK CONSTRAINT [FK_Effettua_Menu]
GO
ALTER TABLE [dbo].[Effettua]  WITH CHECK ADD  CONSTRAINT [FK_Effettua_Prenotazione] FOREIGN KEY([Prenotazione])
REFERENCES [dbo].[Prenotazione] ([Codice])
GO
ALTER TABLE [dbo].[Effettua] CHECK CONSTRAINT [FK_Effettua_Prenotazione]
GO
ALTER TABLE [dbo].[Giacenza]  WITH CHECK ADD  CONSTRAINT [FK_Giacenza_Menu] FOREIGN KEY([Menu])
REFERENCES [dbo].[Menu] ([Codice])
GO
ALTER TABLE [dbo].[Giacenza] CHECK CONSTRAINT [FK_Giacenza_Menu]
GO
ALTER TABLE [dbo].[Giacenza]  WITH CHECK ADD  CONSTRAINT [FK_Giacenza_Sede] FOREIGN KEY([Sede])
REFERENCES [dbo].[Sede] ([Codice])
GO
ALTER TABLE [dbo].[Giacenza] CHECK CONSTRAINT [FK_Giacenza_Sede]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Sede] FOREIGN KEY([Sede])
REFERENCES [dbo].[Sede] ([Codice])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_Sede]
GO
ALTER TABLE [dbo].[Prenotazione]  WITH CHECK ADD  CONSTRAINT [FK_Prenotazione_Account] FOREIGN KEY([Account])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Prenotazione] CHECK CONSTRAINT [FK_Prenotazione_Account]
GO
ALTER TABLE [dbo].[Prenotazione]  WITH CHECK ADD  CONSTRAINT [FK_Prenotazione_Ritiro] FOREIGN KEY([DTORitiro], [SedeRitiro])
REFERENCES [dbo].[Ritiro] ([DataOraRitiro], [Sede])
GO
ALTER TABLE [dbo].[Prenotazione] CHECK CONSTRAINT [FK_Prenotazione_Ritiro]
GO
ALTER TABLE [dbo].[Prodotto]  WITH CHECK ADD  CONSTRAINT [FK_Prodotto_TipologiaProdotto] FOREIGN KEY([TipologiaProdotto])
REFERENCES [dbo].[TipologiaProdotto] ([Codice])
GO
ALTER TABLE [dbo].[Prodotto] CHECK CONSTRAINT [FK_Prodotto_TipologiaProdotto]
GO
ALTER TABLE [dbo].[Registrazione]  WITH CHECK ADD  CONSTRAINT [FK_Registrazione_Account] FOREIGN KEY([Account])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Registrazione] CHECK CONSTRAINT [FK_Registrazione_Account]
GO
ALTER TABLE [dbo].[Registrazione]  WITH CHECK ADD  CONSTRAINT [FK_Registrazione_Cliente] FOREIGN KEY([Cliente])
REFERENCES [dbo].[Cliente] ([Codice])
GO
ALTER TABLE [dbo].[Registrazione] CHECK CONSTRAINT [FK_Registrazione_Cliente]
GO
ALTER TABLE [dbo].[Ritiro]  WITH CHECK ADD  CONSTRAINT [FK_Ritiro_Sede] FOREIGN KEY([Sede])
REFERENCES [dbo].[Sede] ([Codice])
GO
ALTER TABLE [dbo].[Ritiro] CHECK CONSTRAINT [FK_Ritiro_Sede]
GO
USE [master]
GO
ALTER DATABASE [PCTO] SET  READ_WRITE 
GO
