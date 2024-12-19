USE [master]
GO
/****** Object:  Database [FragrantWorld]    Script Date: 19.12.2024 5:10:46 ******/
CREATE DATABASE [FragrantWorld]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FragrantWorld', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FragrantWorld.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FragrantWorld_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FragrantWorld_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FragrantWorld] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FragrantWorld].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FragrantWorld] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FragrantWorld] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FragrantWorld] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FragrantWorld] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FragrantWorld] SET ARITHABORT OFF 
GO
ALTER DATABASE [FragrantWorld] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FragrantWorld] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FragrantWorld] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FragrantWorld] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FragrantWorld] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FragrantWorld] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FragrantWorld] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FragrantWorld] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FragrantWorld] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FragrantWorld] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FragrantWorld] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FragrantWorld] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FragrantWorld] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FragrantWorld] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FragrantWorld] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FragrantWorld] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FragrantWorld] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FragrantWorld] SET RECOVERY FULL 
GO
ALTER DATABASE [FragrantWorld] SET  MULTI_USER 
GO
ALTER DATABASE [FragrantWorld] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FragrantWorld] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FragrantWorld] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FragrantWorld] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FragrantWorld] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FragrantWorld] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FragrantWorld', N'ON'
GO
ALTER DATABASE [FragrantWorld] SET QUERY_STORE = ON
GO
ALTER DATABASE [FragrantWorld] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FragrantWorld]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 19.12.2024 5:10:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatus] [nvarchar](max) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[OrderDeliveryDate] [date] NOT NULL,
	[OrderPickupPoint] [int] NOT NULL,
	[OrderReceiptCode] [smallint] NOT NULL,
 CONSTRAINT [PK__Order__C3905BAF40E11E2A] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 19.12.2024 5:10:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[OrderQuantity] [tinyint] NOT NULL,
 CONSTRAINT [PK__Order__817A266277CA12A0] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickupPoint]    Script Date: 19.12.2024 5:10:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickupPoint](
	[PickupPointID] [int] IDENTITY(1,1) NOT NULL,
	[PostCode] [int] NOT NULL,
	[Address] [nvarchar](60) NOT NULL,
 CONSTRAINT [PK_PickupPoint] PRIMARY KEY CLUSTERED 
(
	[PickupPointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 19.12.2024 5:10:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductDescription] [nvarchar](max) NULL,
	[ProductCategory] [nvarchar](max) NOT NULL,
	[ProductPhoto] [image] NULL,
	[ProductManufacturer] [nvarchar](max) NOT NULL,
	[ProductCost] [decimal](19, 2) NOT NULL,
	[ProductDiscountAmount] [tinyint] NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductStatus] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__Prod__2EA7DCD5A72A3F42] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 19.12.2024 5:10:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 19.12.2024 5:10:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRole] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderReceiptCode]) VALUES (1, N'Новый', CAST(N'2022-05-04' AS Date), CAST(N'2022-05-10' AS Date), 24, 201)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderReceiptCode]) VALUES (2, N'Новый', CAST(N'2022-05-05' AS Date), CAST(N'2022-05-11' AS Date), 25, 202)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderReceiptCode]) VALUES (3, N'Новый', CAST(N'2022-05-06' AS Date), CAST(N'2022-05-12' AS Date), 26, 203)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderReceiptCode]) VALUES (4, N'Новый', CAST(N'2022-05-07' AS Date), CAST(N'2022-05-13' AS Date), 27, 204)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderReceiptCode]) VALUES (5, N'Новый', CAST(N'2022-05-08' AS Date), CAST(N'2022-05-14' AS Date), 28, 205)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderReceiptCode]) VALUES (6, N'Новый', CAST(N'2022-05-09' AS Date), CAST(N'2022-05-15' AS Date), 29, 206)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderReceiptCode]) VALUES (7, N'Новый', CAST(N'2022-05-10' AS Date), CAST(N'2022-05-16' AS Date), 30, 207)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderReceiptCode]) VALUES (8, N'Новый', CAST(N'2022-05-11' AS Date), CAST(N'2022-05-17' AS Date), 31, 208)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderReceiptCode]) VALUES (9, N'Новый', CAST(N'2022-05-12' AS Date), CAST(N'2022-05-18' AS Date), 32, 209)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderReceiptCode]) VALUES (10, N'Завершен', CAST(N'2022-05-13' AS Date), CAST(N'2022-05-19' AS Date), 33, 210)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderReceiptCode]) VALUES (14, N'Новый', CAST(N'2024-12-19' AS Date), CAST(N'2024-12-22' AS Date), 39, 832)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderReceiptCode]) VALUES (16, N'Новый', CAST(N'2024-12-19' AS Date), CAST(N'2024-12-22' AS Date), 41, 700)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderReceiptCode]) VALUES (17, N'Новый', CAST(N'2024-12-19' AS Date), CAST(N'2024-12-22' AS Date), 42, 626)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderReceiptCode]) VALUES (19, N'Новый', CAST(N'2024-12-19' AS Date), CAST(N'2024-12-22' AS Date), 44, 347)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderReceiptCode]) VALUES (21, N'Новый', CAST(N'2024-12-19' AS Date), CAST(N'2024-12-22' AS Date), 46, 404)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderReceiptCode]) VALUES (23, N'Новый', CAST(N'2024-12-19' AS Date), CAST(N'2024-12-22' AS Date), 48, 970)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderReceiptCode]) VALUES (24, N'Новый', CAST(N'2024-12-19' AS Date), CAST(N'2024-12-22' AS Date), 49, 155)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderReceiptCode]) VALUES (25, N'Новый', CAST(N'2024-12-19' AS Date), CAST(N'2024-12-22' AS Date), 50, 113)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderReceiptCode]) VALUES (26, N'Новый', CAST(N'2024-12-19' AS Date), CAST(N'2024-12-22' AS Date), 51, 383)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderReceiptCode]) VALUES (27, N'Новый', CAST(N'2024-12-19' AS Date), CAST(N'2024-12-22' AS Date), 52, 908)
GO
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (1, N'F893T5', 2)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (1, N'А112Т4', 2)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (2, N'E530Y6', 1)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (2, N'F346G5', 2)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (3, N'D344Y7', 2)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (3, N'J432E4', 1)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (4, N'D378D3', 2)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (4, N'E245R5', 1)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (5, N'H732R5', 3)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (5, N'R464G6', 2)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (6, N'E573G6', 3)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (6, N'K535G6', 3)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (7, N'F344S4', 6)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (7, N'G532R5', 5)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (8, N'D526R4', 5)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (8, N'S753T5', 4)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (9, N'A436H7', 3)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (9, N'V472S3', 3)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (10, N'E479G6', 1)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (10, N'O875F6', 4)
GO
SET IDENTITY_INSERT [dbo].[PickupPoint] ON 
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (1, 344288, N'г. Ангарск ул. Чехова 1')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (2, 614164, N'г.Ангарск  ул. Степная 30')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (3, 394242, N'г. Ангарск ул. Коммунистическая 43')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (4, 660540, N'г. Ангарск ул. Солнечная 25')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (5, 125837, N'г. Ангарск ул. Шоссейная 40')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (6, 125703, N'г. Ангарск ул. Партизанская 49')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (7, 625283, N'г. Ангарск ул. Победы 46')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (8, 614611, N'г. Ангарск ул. Молодежная 50')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (9, 454311, N'г.Ангарск ул. Новая 19')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (10, 660007, N'г.Ангарск ул. Октябрьская 19')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (11, 603036, N'г. Ангарск ул. Садовая 4')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (12, 450983, N'г.Ангарск ул. Комсомольская 26')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (13, 394782, N'г. Ангарск ул. Чехова 3')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (14, 603002, N'г. Ангарск ул. Дзержинского 28')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (15, 450558, N'г. Ангарск ул. Набережная 30')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (16, 394060, N'г.Ангарск ул. Фрунзе 43')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (17, 410661, N'г. Ангарск ул. Школьная 50')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (18, 625590, N'г. Ангарск ул. Коммунистическая 20')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (19, 625683, N'г. Ангарск ул. 8 Марта')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (20, 400562, N'г. Ангарск ул. Зеленая 32')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (21, 614510, N'г. Ангарск ул. Маяковского 47')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (22, 410542, N'г. Ангарск ул. Светлая 46')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (23, 620839, N'г. Ангарск ул. Цветочная 8')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (24, 443890, N'г. Ангарск ул. Коммунистическая 1')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (25, 603379, N'г. Ангарск ул. Спортивная 46')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (26, 603721, N'г. Ангарск ул. Гоголя 41')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (27, 410172, N'г. Ангарск ул. Северная 13')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (28, 420151, N'г. Ангарск ул. Вишневая 32')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (29, 125061, N'г. Ангарск ул. Подгорная 8')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (30, 630370, N'г. Ангарск ул. Шоссейная 24')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (31, 614753, N'г. Ангарск ул. Полевая 35')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (32, 426030, N'г. Ангарск ул. Маяковского 44')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (33, 450375, N'г. Ангарск ул. Клубная 44')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (34, 625560, N'г. Ангарск ул. Некрасова 12')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (35, 630201, N'г. Ангарск ул. Комсомольская 17')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (36, 190949, N'г. Ангарск ул. Мичурина 26')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (37, 344288, N'г. Ангарск ул. Чехова 1')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (38, 344288, N'г. Ангарск ул. Чехова 1')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (39, 614164, N'г.Ангарск  ул. Степная 30')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (41, 344288, N'г. Ангарск ул. Чехова 1')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (42, 660540, N'г. Ангарск ул. Солнечная 25')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (44, 660540, N'г. Ангарск ул. Солнечная 25')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (46, 344288, N'г. Ангарск ул. Чехова 1')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (48, 344288, N'г. Ангарск ул. Чехова 1')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (49, 614164, N'г.Ангарск  ул. Степная 30')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (50, 344288, N'г. Ангарск ул. Чехова 1')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (51, 344288, N'г. Ангарск ул. Чехова 1')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (52, 344288, N'г. Ангарск ул. Чехова 1')
GO
SET IDENTITY_INSERT [dbo].[PickupPoint] OFF
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'A436H7', N'La merce', N'Очень приятно пахнут', N'Духи', NULL, N'ПроизводительДухов', CAST(1000.00 AS Decimal(19, 2)), NULL, 200, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'D344Y7', N'DeMarke', N'Не пахнет', N'Бальзам', NULL, N'БальзамБесплатно', CAST(4000.00 AS Decimal(19, 2)), 20, 1000, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'D378D3', N'DOLCE & GABBANA PINEAPPLE', N'PINEAPPLE', N'Туалетная вода', NULL, N'Dolce & Gabbana', CAST(52000.00 AS Decimal(19, 2)), NULL, 2, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'D526R4', N'Крутые духи', N'PINEAPPLE', N'Духи', NULL, N'Dolce & Gabbana', CAST(2000.00 AS Decimal(19, 2)), 20, 90, N'Нет в наличии')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'E245R5', N'GeRare', N'Не пахнет', N'Туалетная вода', NULL, N'БальзамБесплатно', CAST(1450.00 AS Decimal(19, 2)), NULL, 1000, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'E479G6', N'JaMazur', N'Нотки апельсина', N'Бальзам', NULL, N'КрутойПроизводитель', CAST(1000.99 AS Decimal(19, 2)), 50, 150, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'E530Y6', N'LyaArch', N'Время 4:48', N'Туалетная вода', NULL, N'НеКрутойПроизводитель', CAST(2456.00 AS Decimal(19, 2)), NULL, 47, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'E573G6', N'Pomor', N'Очень классные', N'Духи', NULL, N'Dolce & Gabbana', CAST(145.00 AS Decimal(19, 2)), 10, 9999, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'F344S4', N'Hai', N'КрутоеОписание1', N'Туалетная вода', NULL, N'ПроизводительДухов', CAST(879.90 AS Decimal(19, 2)), 5, 156, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'F346G5', N'De mazur', N'Делается только из натуральных материалов', N'Духи', NULL, N'Dolce & Gabbana', CAST(178.00 AS Decimal(19, 2)), NULL, 1000, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'F893T5', N'KeLanke', N'Не делаеться', N'Помада', NULL, N'КрутойПроизводитель', CAST(567.00 AS Decimal(19, 2)), NULL, 2567, N'Не производятся')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'G532R5', N'Kelanke2', N'Крутые', N'Туалетная вода', NULL, N'Dolce & Gabbana', CAST(15000.00 AS Decimal(19, 2)), NULL, 1345, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'H732R5', N'GoodDAY', N'Купи', N'Бальзам', NULL, N'НеКрутойПроизводитель', CAST(35000.00 AS Decimal(19, 2)), 45, 987, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'J432E4', N'Li merci', N'Четверг', N'Тушь', NULL, N'ПроизводительДухов', CAST(78.00 AS Decimal(19, 2)), NULL, 100, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'K535G6', N'Крутые духи3', N'Объемное описание', N'Духи', NULL, N'Dolce & Gabbana', CAST(1569.00 AS Decimal(19, 2)), 15, 1, N'Нет в наличии')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'O875F6', N'New merci', N'КрутоеИОбъемноеОписание', N'Туалетная вода', NULL, N'КрутойПроизводитель', CAST(567.00 AS Decimal(19, 2)), NULL, 5, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'R464G6', N'HaDja', N'Со вкусом мандарина', N'Духи', NULL, N'НеКрутойПроизводитель', CAST(543.00 AS Decimal(19, 2)), 25, 78, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'S753T5', N'suhi', N'Коротко', N'Духи', NULL, N'НеКрутойПроизводитель', CAST(109.00 AS Decimal(19, 2)), 10, 99, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'V472S3', N'keki', N'Приятно пахнут', N'Духи', NULL, N'НеКрутойПроизводитель', CAST(25.00 AS Decimal(19, 2)), 10, 199, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'А112Т4', N'Japan', N'Увлажняет кожу', N'Бальзам', NULL, N'КрутойПроизводитель', CAST(2000.89 AS Decimal(19, 2)), 10, 25, N'Нет в наличии')
GO
SET IDENTITY_INSERT [dbo].[Role] ON 
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Менеджер')
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Клиент')
GO
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (1, N'Константинова', N'Вероника', N'Агафоновна', N'loginDEsgg2018', N'qhgYnW', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (2, N'Меркушев', N'Мартын', N'Федотович', N'loginDEdcd2018', N'LxR6YI', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (3, N'Казаков', N'Федот', N'Кондратович', N'loginDEisg2018', N'Cp8ddU', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (4, N'Карпов', N'Улеб', N'Леонидович', N'loginDEcph2018', N'7YpE0p', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (5, N'Королёв', N'Матвей', N'Вадимович', N'loginDEgco2018', N'nMr|ss', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (6, N'Юдин', N'Герман', N'Кондратович', N'loginDEwjg2018', N'9UfqWQ', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (7, N'Беляева', N'Анна', N'Вячеславовна', N'loginDEjbz2018', N'xIAWNI', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (8, N'Беляев', N'Валентин', N'Артёмович', N'loginDEmgu2018', N'0gC3bk', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (9, N'Семёнов', N'Герман', N'Дмитрьевич', N'loginDErdg2018', N'ni0ue0', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (10, N'Шестаков', N'Илья', N'Антонинович', N'loginDEjtv2018', N'f2ZaN6', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (11, N'Власов', N'Вадим', N'Васильевич', N'loginDEtfj2018', N'{{ksPn', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (12, N'Савельев', N'Арсений', N'Авксентьевич', N'loginDEpnb2018', N'{ADBdc', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (13, N'Ефимов', N'Руслан', N'Якунович', N'loginDEzer2018', N'5&R+zs', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (14, N'Бурова', N'Марфа', N'Федотовна', N'loginDEiin2018', N'y9l*b}', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (15, N'Селезнёв', N'Александр', N'Никитевич', N'loginDEqda2018', N'|h+r}I', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (16, N'Кулакова', N'Виктория', N'Георгьевна', N'loginDEbnj2018', N'#ИМЯ?', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (17, N'Дорофеева', N'Кира', N'Демьяновна', N'loginDEqte2018', N'dC8bDI', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (18, N'Сафонова', N'Нинель', N'Якововна', N'loginDEfeo2018', N'8cI7vq', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (19, N'Ситникова', N'София', N'Лукьевна', N'loginDEvni2018', N'e4pVIv', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (20, N'Медведев', N'Ириней', N'Геннадьевич', N'loginDEjis2018', N'A9K++2', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (21, N'Суханова', N'Евгения', N'Улебовна', N'loginDExvv2018', N'R1zh}|', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (22, N'Игнатьев', N'Владлен', N'Дамирович', N'loginDEadl2018', N'F&IWf4', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (23, N'Ефремов', N'Христофор', N'Владиславович', N'loginDEyzn2018', N'P1v24R', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (24, N'Кошелев', N'Ростислав', N'Куприянович', N'loginDEphn2018', N'F}jGsJ', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (25, N'Галкина', N'Тамара', N'Авксентьевна', N'loginDEdvk2018', N'NKNkup', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (26, N'Журавлёва', N'Вера', N'Арсеньевна', N'loginDEtld2018', N'c+CECK', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (27, N'Савина', N'Таисия', N'Глебовна', N'loginDEima2018', N'XK3sOA', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (28, N'Иванов', N'Яков', N'Мэлорович', N'loginDEyfe2018', N'4Bbzpa', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (29, N'Лыткин', N'Ким', N'Алексеевич', N'loginDEwqc2018', N'vRtAP*', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (30, N'Логинов', N'Федот', N'Святославович', N'loginDEgtt2018', N'7YD|BR', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (31, N'Русакова', N'Марина', N'Юлиановна', N'loginDEiwl2018', N'LhlmIl', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (32, N'Константинов', N'Пётр', N'Кондратович', N'loginDEyvi2018', N'22beR}', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (33, N'Поляков', N'Анатолий', N'Игоревич', N'loginDEtfz2018', N'uQY0ZQ', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (34, N'Панфилова', N'Василиса', N'Григорьевна', N'loginDEikb2018', N'*QkUxc', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (35, N'Воробьёв', N'Герман', N'Романович', N'loginDEdmi2018', N'HOGFbU', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (36, N'Андреев', N'Ростислав', N'Федосеевич', N'loginDEtlo2018', N'58Jxrg', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (37, N'Бобров', N'Агафон', N'Владимирович', N'loginDEsnd2018', N'lLHqZf', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (38, N'Лапин', N'Алексей', N'Витальевич', N'loginDEgno2018', N'4fqLiO', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (39, N'Шестаков', N'Авдей', N'Иванович', N'loginDEgnl2018', N'wdio{u', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (40, N'Гаврилова', N'Алина', N'Эдуардовна', N'loginDEzna2018', N'yz1iMB', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (41, N'Жуков', N'Юлиан', N'Валерьянович', N'loginDEsyh2018', N'&4jYGs', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (42, N'Пономарёв', N'Максим', N'Альвианович', N'loginDExex2018', N'rnh36{', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (43, N'Зиновьева', N'Мария', N'Лаврентьевна', N'loginDEdjm2018', N'KjI1JR', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (44, N'Осипов', N'Артём', N'Мэлорович', N'loginDEgup2018', N'36|KhF', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (45, N'Лапин', N'Вячеслав', N'Геласьевич', N'loginDEdat2018', N'ussd8Q', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (46, N'Зуев', N'Ириней', N'Вадимович', N'loginDEffj2018', N'cJP+HC', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (47, N'Коновалова', N'Агафья', N'Митрофановна', N'loginDEisp2018', N'dfz5Ii', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (48, N'Исаев', N'Дмитрий', N'Аристархович', N'loginDEfrp2018', N'6dcR|9', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (49, N'Белозёрова', N'Алевтина', N'Лаврентьевна', N'loginDEaee2018', N'5&qONH', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (50, N'Самсонов', N'Агафон', N'Максимович', N'loginDEthu2018', N'|0xWzV', 3)
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
/****** Object:  Index [IX_Order_OrderReceiptCode]    Script Date: 19.12.2024 5:10:46 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [IX_Order_OrderReceiptCode] UNIQUE NONCLUSTERED 
(
	[OrderReceiptCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_ExamPickupPoint] FOREIGN KEY([OrderPickupPoint])
REFERENCES [dbo].[PickupPoint] ([PickupPointID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_ExamPickupPoint]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__Order__Order__403A8C7D] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__Order__Order__403A8C7D]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__Order__Produ__412EB0B6] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__Order__Produ__412EB0B6]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [CK_OrderProduct] CHECK  (([OrderQuantity]>=(1)))
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [CK_OrderProduct]
GO
USE [master]
GO
ALTER DATABASE [FragrantWorld] SET  READ_WRITE 
GO
