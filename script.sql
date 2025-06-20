USE [master]
GO
/****** Object:  Database [GaripovMozaika]    Script Date: 12.06.2025 14:52:30 ******/
CREATE DATABASE [GaripovMozaika]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GaripovMozaika', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GaripovMozaika.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GaripovMozaika_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GaripovMozaika_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GaripovMozaika] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GaripovMozaika].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GaripovMozaika] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GaripovMozaika] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GaripovMozaika] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GaripovMozaika] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GaripovMozaika] SET ARITHABORT OFF 
GO
ALTER DATABASE [GaripovMozaika] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GaripovMozaika] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GaripovMozaika] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GaripovMozaika] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GaripovMozaika] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GaripovMozaika] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GaripovMozaika] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GaripovMozaika] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GaripovMozaika] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GaripovMozaika] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GaripovMozaika] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GaripovMozaika] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GaripovMozaika] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GaripovMozaika] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GaripovMozaika] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GaripovMozaika] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GaripovMozaika] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GaripovMozaika] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GaripovMozaika] SET  MULTI_USER 
GO
ALTER DATABASE [GaripovMozaika] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GaripovMozaika] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GaripovMozaika] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GaripovMozaika] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GaripovMozaika] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GaripovMozaika] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GaripovMozaika] SET QUERY_STORE = OFF
GO
USE [GaripovMozaika]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 12.06.2025 14:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[Material_ID] [int] IDENTITY(1,1) NOT NULL,
	[Material_Name] [nvarchar](100) NOT NULL,
	[Material_Type] [int] NOT NULL,
	[Material_Cost] [decimal](10, 2) NOT NULL,
	[Material_Count_in_Ware] [bigint] NOT NULL,
	[Material_Min_Count] [int] NOT NULL,
	[Material_Count_In_Pack] [int] NOT NULL,
	[Material_Unit] [nvarchar](2) NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[Material_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material_Supplier]    Script Date: 12.06.2025 14:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material_Supplier](
	[Material_ID] [int] NOT NULL,
	[Supplier_ID] [int] NOT NULL,
 CONSTRAINT [PK_Material_Supplier] PRIMARY KEY CLUSTERED 
(
	[Material_ID] ASC,
	[Supplier_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material_Type]    Script Date: 12.06.2025 14:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material_Type](
	[Material_Type_ID] [int] NOT NULL,
	[Material_Type_Name] [nvarchar](50) NOT NULL,
	[Material_Type_Proccent] [decimal](10, 4) NOT NULL,
 CONSTRAINT [PK_Material_Type] PRIMARY KEY CLUSTERED 
(
	[Material_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12.06.2025 14:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Product_ID] [int] NOT NULL,
	[Product_Article] [bigint] NOT NULL,
	[Product_Type] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Material]    Script Date: 12.06.2025 14:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Material](
	[Product_ID] [int] NOT NULL,
	[Material_ID] [int] NOT NULL,
	[Material_Count] [int] NOT NULL,
 CONSTRAINT [PK_Product_Material] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC,
	[Material_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Type]    Script Date: 12.06.2025 14:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Type](
	[Product_Type_ID] [int] NOT NULL,
	[Product_Type_Name] [nvarchar](50) NOT NULL,
	[Product_Type_Coeff] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Product_Type] PRIMARY KEY CLUSTERED 
(
	[Product_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 12.06.2025 14:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Supplier_ID] [int] NOT NULL,
	[Supplier_Name] [nvarchar](100) NOT NULL,
	[Supplier_Type] [int] NOT NULL,
	[Supplier_INN] [bigint] NOT NULL,
	[Supplier_Rating] [int] NOT NULL,
	[Supplier_Date_Of_Start] [date] NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[Supplier_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier_Type]    Script Date: 12.06.2025 14:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier_Type](
	[Supplier_Type] [int] NOT NULL,
	[Supplier_Type_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Supplier_Type] PRIMARY KEY CLUSTERED 
(
	[Supplier_Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([Material_ID], [Material_Name], [Material_Type], [Material_Cost], [Material_Count_in_Ware], [Material_Min_Count], [Material_Count_In_Pack], [Material_Unit]) VALUES (1, N'Глина', 4, CAST(15.29 AS Decimal(10, 2)), 1570, 5500, 30, N'кг')
INSERT [dbo].[Material] ([Material_ID], [Material_Name], [Material_Type], [Material_Cost], [Material_Count_in_Ware], [Material_Min_Count], [Material_Count_In_Pack], [Material_Unit]) VALUES (2, N'Каолин', 4, CAST(18.20 AS Decimal(10, 2)), 1030, 3500, 25, N'кг')
INSERT [dbo].[Material] ([Material_ID], [Material_Name], [Material_Type], [Material_Cost], [Material_Count_in_Ware], [Material_Min_Count], [Material_Count_In_Pack], [Material_Unit]) VALUES (3, N'Гидрослюда', 4, CAST(17.20 AS Decimal(10, 2)), 2147, 3500, 25, N'кг')
INSERT [dbo].[Material] ([Material_ID], [Material_Name], [Material_Type], [Material_Cost], [Material_Count_in_Ware], [Material_Min_Count], [Material_Count_In_Pack], [Material_Unit]) VALUES (4, N'Монтмориллонит', 4, CAST(17.67 AS Decimal(10, 2)), 3000, 3000, 30, N'кг')
INSERT [dbo].[Material] ([Material_ID], [Material_Name], [Material_Type], [Material_Cost], [Material_Count_in_Ware], [Material_Min_Count], [Material_Count_In_Pack], [Material_Unit]) VALUES (5, N'Перлит', 2, CAST(13.99 AS Decimal(10, 2)), 150, 1000, 50, N'л')
INSERT [dbo].[Material] ([Material_ID], [Material_Name], [Material_Type], [Material_Cost], [Material_Count_in_Ware], [Material_Min_Count], [Material_Count_In_Pack], [Material_Unit]) VALUES (6, N'Стекло', 2, CAST(2.40 AS Decimal(10, 2)), 3000, 1500, 500, N'кг')
INSERT [dbo].[Material] ([Material_ID], [Material_Name], [Material_Type], [Material_Cost], [Material_Count_in_Ware], [Material_Min_Count], [Material_Count_In_Pack], [Material_Unit]) VALUES (7, N'Дегидратированная глина', 2, CAST(21.95 AS Decimal(10, 2)), 3000, 2500, 20, N'кг')
INSERT [dbo].[Material] ([Material_ID], [Material_Name], [Material_Type], [Material_Cost], [Material_Count_in_Ware], [Material_Min_Count], [Material_Count_In_Pack], [Material_Unit]) VALUES (8, N'Шамот', 2, CAST(27.50 AS Decimal(10, 2)), 2300, 1960, 20, N'кг')
INSERT [dbo].[Material] ([Material_ID], [Material_Name], [Material_Type], [Material_Cost], [Material_Count_in_Ware], [Material_Min_Count], [Material_Count_In_Pack], [Material_Unit]) VALUES (9, N'Техническая сода', 5, CAST(54.55 AS Decimal(10, 2)), 1200, 1500, 25, N'кг')
INSERT [dbo].[Material] ([Material_ID], [Material_Name], [Material_Type], [Material_Cost], [Material_Count_in_Ware], [Material_Min_Count], [Material_Count_In_Pack], [Material_Unit]) VALUES (10, N'Жидкое стекло', 5, CAST(76.59 AS Decimal(10, 2)), 500, 1500, 15, N'кг')
INSERT [dbo].[Material] ([Material_ID], [Material_Name], [Material_Type], [Material_Cost], [Material_Count_in_Ware], [Material_Min_Count], [Material_Count_In_Pack], [Material_Unit]) VALUES (11, N'Кварц', 1, CAST(375.96 AS Decimal(10, 2)), 1500, 2500, 10, N'кг')
INSERT [dbo].[Material] ([Material_ID], [Material_Name], [Material_Type], [Material_Cost], [Material_Count_in_Ware], [Material_Min_Count], [Material_Count_In_Pack], [Material_Unit]) VALUES (12, N'Полевой шпат', 1, CAST(15.99 AS Decimal(10, 2)), 750, 1500, 100, N'кг')
INSERT [dbo].[Material] ([Material_ID], [Material_Name], [Material_Type], [Material_Cost], [Material_Count_in_Ware], [Material_Min_Count], [Material_Count_In_Pack], [Material_Unit]) VALUES (13, N'Краска-раствор', 3, CAST(200.90 AS Decimal(10, 2)), 1496, 2500, 5, N'л')
INSERT [dbo].[Material] ([Material_ID], [Material_Name], [Material_Type], [Material_Cost], [Material_Count_in_Ware], [Material_Min_Count], [Material_Count_In_Pack], [Material_Unit]) VALUES (14, N'Порошок цветной', 3, CAST(84.39 AS Decimal(10, 2)), 511, 1750, 25, N'кг')
INSERT [dbo].[Material] ([Material_ID], [Material_Name], [Material_Type], [Material_Cost], [Material_Count_in_Ware], [Material_Min_Count], [Material_Count_In_Pack], [Material_Unit]) VALUES (15, N'Кварцевый песок', 2, CAST(4.29 AS Decimal(10, 2)), 3000, 1600, 50, N'кг')
INSERT [dbo].[Material] ([Material_ID], [Material_Name], [Material_Type], [Material_Cost], [Material_Count_in_Ware], [Material_Min_Count], [Material_Count_In_Pack], [Material_Unit]) VALUES (16, N'Жильный кварц', 2, CAST(18.60 AS Decimal(10, 2)), 2556, 1600, 25, N'кг')
INSERT [dbo].[Material] ([Material_ID], [Material_Name], [Material_Type], [Material_Cost], [Material_Count_in_Ware], [Material_Min_Count], [Material_Count_In_Pack], [Material_Unit]) VALUES (17, N'Барий углекислый', 1, CAST(303.64 AS Decimal(10, 2)), 340, 1500, 25, N'кг')
INSERT [dbo].[Material] ([Material_ID], [Material_Name], [Material_Type], [Material_Cost], [Material_Count_in_Ware], [Material_Min_Count], [Material_Count_In_Pack], [Material_Unit]) VALUES (18, N'Бура техническая', 1, CAST(125.99 AS Decimal(10, 2)), 165, 1300, 25, N'кг')
INSERT [dbo].[Material] ([Material_ID], [Material_Name], [Material_Type], [Material_Cost], [Material_Count_in_Ware], [Material_Min_Count], [Material_Count_In_Pack], [Material_Unit]) VALUES (19, N'Углещелочной реагент', 5, CAST(3.45 AS Decimal(10, 2)), 450, 1100, 25, N'кг')
INSERT [dbo].[Material] ([Material_ID], [Material_Name], [Material_Type], [Material_Cost], [Material_Count_in_Ware], [Material_Min_Count], [Material_Count_In_Pack], [Material_Unit]) VALUES (20, N'Пирофосфат натрия', 5, CAST(700.99 AS Decimal(10, 2)), 356, 1200, 25, N'кг')
INSERT [dbo].[Material] ([Material_ID], [Material_Name], [Material_Type], [Material_Cost], [Material_Count_in_Ware], [Material_Min_Count], [Material_Count_In_Pack], [Material_Unit]) VALUES (21, N'Глинаа', 4, CAST(1000.00 AS Decimal(10, 2)), 10, 100, 5, N'кг')
INSERT [dbo].[Material] ([Material_ID], [Material_Name], [Material_Type], [Material_Cost], [Material_Count_in_Ware], [Material_Min_Count], [Material_Count_In_Pack], [Material_Unit]) VALUES (22, N'Глина2', 5, CAST(12.00 AS Decimal(10, 2)), 12, 12, 10, N'л')
INSERT [dbo].[Material] ([Material_ID], [Material_Name], [Material_Type], [Material_Cost], [Material_Count_in_Ware], [Material_Min_Count], [Material_Count_In_Pack], [Material_Unit]) VALUES (23, N'Глина3', 4, CAST(122.00 AS Decimal(10, 2)), 100, 10, 10, N'кг')
SET IDENTITY_INSERT [dbo].[Material] OFF
GO
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (1, 1)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (1, 4)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (1, 6)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (1, 10)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (2, 1)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (2, 3)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (2, 5)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (2, 9)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (3, 3)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (3, 4)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (3, 5)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (3, 9)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (4, 3)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (4, 4)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (4, 9)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (4, 10)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (5, 5)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (5, 6)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (5, 9)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (5, 10)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (6, 2)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (6, 7)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (6, 19)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (6, 20)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (7, 2)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (7, 7)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (7, 9)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (7, 11)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (8, 2)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (8, 11)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (8, 17)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (8, 19)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (9, 7)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (9, 8)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (9, 16)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (9, 18)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (10, 7)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (10, 12)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (10, 16)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (10, 18)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (11, 11)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (11, 13)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (11, 14)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (11, 15)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (12, 1)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (12, 4)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (12, 10)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (12, 12)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (13, 8)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (13, 12)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (13, 16)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (13, 19)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (14, 8)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (14, 12)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (14, 16)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (14, 19)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (15, 1)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (15, 14)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (15, 15)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (15, 20)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (16, 10)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (16, 13)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (16, 15)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (16, 17)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (17, 5)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (17, 7)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (17, 17)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (17, 20)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (18, 2)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (18, 7)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (18, 13)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (18, 20)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (19, 5)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (19, 8)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (19, 12)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (19, 16)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (20, 5)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (20, 7)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (20, 8)
INSERT [dbo].[Material_Supplier] ([Material_ID], [Supplier_ID]) VALUES (20, 20)
GO
INSERT [dbo].[Material_Type] ([Material_Type_ID], [Material_Type_Name], [Material_Type_Proccent]) VALUES (1, N'Глазурь', CAST(0.0030 AS Decimal(10, 4)))
INSERT [dbo].[Material_Type] ([Material_Type_ID], [Material_Type_Name], [Material_Type_Proccent]) VALUES (2, N'Добавка', CAST(0.0020 AS Decimal(10, 4)))
INSERT [dbo].[Material_Type] ([Material_Type_ID], [Material_Type_Name], [Material_Type_Proccent]) VALUES (3, N'Пигмент', CAST(0.0025 AS Decimal(10, 4)))
INSERT [dbo].[Material_Type] ([Material_Type_ID], [Material_Type_Name], [Material_Type_Proccent]) VALUES (4, N'Пластичные материалы', CAST(0.0012 AS Decimal(10, 4)))
INSERT [dbo].[Material_Type] ([Material_Type_ID], [Material_Type_Name], [Material_Type_Proccent]) VALUES (5, N'Электролит', CAST(0.0015 AS Decimal(10, 4)))
GO
INSERT [dbo].[Product] ([Product_ID], [Product_Article], [Product_Type]) VALUES (1, 2222222, 1)
INSERT [dbo].[Product] ([Product_ID], [Product_Article], [Product_Type]) VALUES (2, 2222223, 2)
INSERT [dbo].[Product] ([Product_ID], [Product_Article], [Product_Type]) VALUES (3, 2133123, 3)
GO
INSERT [dbo].[Product_Material] ([Product_ID], [Material_ID], [Material_Count]) VALUES (1, 2, 33)
INSERT [dbo].[Product_Material] ([Product_ID], [Material_ID], [Material_Count]) VALUES (2, 3, 34)
INSERT [dbo].[Product_Material] ([Product_ID], [Material_ID], [Material_Count]) VALUES (3, 3, 333)
GO
INSERT [dbo].[Product_Type] ([Product_Type_ID], [Product_Type_Name], [Product_Type_Coeff]) VALUES (1, N'Тип продукции 1', CAST(1.20 AS Decimal(10, 2)))
INSERT [dbo].[Product_Type] ([Product_Type_ID], [Product_Type_Name], [Product_Type_Coeff]) VALUES (2, N'Тип продукции 2', CAST(8.59 AS Decimal(10, 2)))
INSERT [dbo].[Product_Type] ([Product_Type_ID], [Product_Type_Name], [Product_Type_Coeff]) VALUES (3, N'Тип продукции 3', CAST(3.45 AS Decimal(10, 2)))
INSERT [dbo].[Product_Type] ([Product_Type_ID], [Product_Type_Name], [Product_Type_Coeff]) VALUES (4, N'Тип продукции 4', CAST(5.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name], [Supplier_Type], [Supplier_INN], [Supplier_Rating], [Supplier_Date_Of_Start]) VALUES (1, N'БрянскСтройресурс', 1, 9432455179, 8, CAST(N'2015-12-20' AS Date))
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name], [Supplier_Type], [Supplier_INN], [Supplier_Rating], [Supplier_Date_Of_Start]) VALUES (2, N'Стройкомплект', 1, 7803888520, 7, CAST(N'2017-09-13' AS Date))
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name], [Supplier_Type], [Supplier_INN], [Supplier_Rating], [Supplier_Date_Of_Start]) VALUES (3, N'Железногорская руда', 3, 8430391035, 7, CAST(N'2016-12-23' AS Date))
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name], [Supplier_Type], [Supplier_INN], [Supplier_Rating], [Supplier_Date_Of_Start]) VALUES (4, N'Белая гора', 3, 4318170454, 8, CAST(N'2019-05-27' AS Date))
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name], [Supplier_Type], [Supplier_INN], [Supplier_Rating], [Supplier_Date_Of_Start]) VALUES (5, N'Тульский обрабатывающий завод ', 3, 7687851800, 7, CAST(N'2015-06-16' AS Date))
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name], [Supplier_Type], [Supplier_INN], [Supplier_Rating], [Supplier_Date_Of_Start]) VALUES (6, N'ГорТехРазработка', 4, 6119144874, 9, CAST(N'2021-12-27' AS Date))
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name], [Supplier_Type], [Supplier_INN], [Supplier_Rating], [Supplier_Date_Of_Start]) VALUES (7, N'Сапфир', 2, 1122170258, 3, CAST(N'2022-04-10' AS Date))
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name], [Supplier_Type], [Supplier_INN], [Supplier_Rating], [Supplier_Date_Of_Start]) VALUES (8, N'ХимБытСервис', 4, 8355114917, 5, CAST(N'2022-03-13' AS Date))
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name], [Supplier_Type], [Supplier_INN], [Supplier_Rating], [Supplier_Date_Of_Start]) VALUES (9, N'ВоронежРудоКомбинат', 2, 3532367439, 8, CAST(N'2023-11-11' AS Date))
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name], [Supplier_Type], [Supplier_INN], [Supplier_Rating], [Supplier_Date_Of_Start]) VALUES (10, N'Смоленский добывающий комбинат', 2, 2362431140, 3, CAST(N'2018-11-23' AS Date))
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name], [Supplier_Type], [Supplier_INN], [Supplier_Rating], [Supplier_Date_Of_Start]) VALUES (11, N'МосКарьер', 4, 4159215346, 2, CAST(N'2012-07-07' AS Date))
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name], [Supplier_Type], [Supplier_INN], [Supplier_Rating], [Supplier_Date_Of_Start]) VALUES (12, N'КурскРесурс', 1, 9032455179, 4, CAST(N'2021-07-23' AS Date))
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name], [Supplier_Type], [Supplier_INN], [Supplier_Rating], [Supplier_Date_Of_Start]) VALUES (13, N'Нижегородская разработка', 2, 3776671267, 9, CAST(N'2016-05-23' AS Date))
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name], [Supplier_Type], [Supplier_INN], [Supplier_Rating], [Supplier_Date_Of_Start]) VALUES (14, N'Речная долина', 2, 7447864518, 8, CAST(N'2015-06-25' AS Date))
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name], [Supplier_Type], [Supplier_INN], [Supplier_Rating], [Supplier_Date_Of_Start]) VALUES (15, N'Карелия добыча', 4, 9037040523, 6, CAST(N'2017-03-09' AS Date))
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name], [Supplier_Type], [Supplier_INN], [Supplier_Rating], [Supplier_Date_Of_Start]) VALUES (16, N'Московский ХимЗавод', 4, 6221520857, 4, CAST(N'2015-05-07' AS Date))
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name], [Supplier_Type], [Supplier_INN], [Supplier_Rating], [Supplier_Date_Of_Start]) VALUES (17, N'Горная компания', 1, 2262431140, 3, CAST(N'2020-12-22' AS Date))
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name], [Supplier_Type], [Supplier_INN], [Supplier_Rating], [Supplier_Date_Of_Start]) VALUES (18, N'Минерал Ресурс', 3, 4155215346, 7, CAST(N'2015-05-22' AS Date))
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name], [Supplier_Type], [Supplier_INN], [Supplier_Rating], [Supplier_Date_Of_Start]) VALUES (19, N'Арсенал', 1, 3961234561, 5, CAST(N'2010-11-25' AS Date))
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name], [Supplier_Type], [Supplier_INN], [Supplier_Rating], [Supplier_Date_Of_Start]) VALUES (20, N'КамчаткаСтройМинералы', 1, 9600275878, 7, CAST(N'2016-12-20' AS Date))
GO
INSERT [dbo].[Supplier_Type] ([Supplier_Type], [Supplier_Type_Name]) VALUES (1, N'ЗАО')
INSERT [dbo].[Supplier_Type] ([Supplier_Type], [Supplier_Type_Name]) VALUES (2, N'ОАО')
INSERT [dbo].[Supplier_Type] ([Supplier_Type], [Supplier_Type_Name]) VALUES (3, N'ООО')
INSERT [dbo].[Supplier_Type] ([Supplier_Type], [Supplier_Type_Name]) VALUES (4, N'ПАО')
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_Material_Type] FOREIGN KEY([Material_Type])
REFERENCES [dbo].[Material_Type] ([Material_Type_ID])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_Material_Type]
GO
ALTER TABLE [dbo].[Material_Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Material_Supplier_Material] FOREIGN KEY([Material_ID])
REFERENCES [dbo].[Material] ([Material_ID])
GO
ALTER TABLE [dbo].[Material_Supplier] CHECK CONSTRAINT [FK_Material_Supplier_Material]
GO
ALTER TABLE [dbo].[Material_Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Material_Supplier_Supplier] FOREIGN KEY([Supplier_ID])
REFERENCES [dbo].[Supplier] ([Supplier_ID])
GO
ALTER TABLE [dbo].[Material_Supplier] CHECK CONSTRAINT [FK_Material_Supplier_Supplier]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Product_Type] FOREIGN KEY([Product_Type])
REFERENCES [dbo].[Product_Type] ([Product_Type_ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Product_Type]
GO
ALTER TABLE [dbo].[Product_Material]  WITH CHECK ADD  CONSTRAINT [FK_Product_Material_Material] FOREIGN KEY([Material_ID])
REFERENCES [dbo].[Material] ([Material_ID])
GO
ALTER TABLE [dbo].[Product_Material] CHECK CONSTRAINT [FK_Product_Material_Material]
GO
ALTER TABLE [dbo].[Product_Material]  WITH CHECK ADD  CONSTRAINT [FK_Product_Material_Product] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[Product_Material] CHECK CONSTRAINT [FK_Product_Material_Product]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Supplier_Type] FOREIGN KEY([Supplier_Type])
REFERENCES [dbo].[Supplier_Type] ([Supplier_Type])
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [FK_Supplier_Supplier_Type]
GO
USE [master]
GO
ALTER DATABASE [GaripovMozaika] SET  READ_WRITE 
GO
