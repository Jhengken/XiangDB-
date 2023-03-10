USE [master]
GO
/****** Object:  Database [dbX]    Script Date: 2023/2/1 上午 10:32:07 ******/
CREATE DATABASE [dbX]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbX', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbX.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbX_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbX_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbX] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbX].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbX] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbX] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbX] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbX] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbX] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbX] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbX] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbX] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbX] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbX] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbX] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbX] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbX] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbX] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbX] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbX] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbX] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbX] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbX] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbX] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbX] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbX] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbX] SET RECOVERY FULL 
GO
ALTER DATABASE [dbX] SET  MULTI_USER 
GO
ALTER DATABASE [dbX] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbX] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbX] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbX] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbX] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbX] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbX', N'ON'
GO
ALTER DATABASE [dbX] SET QUERY_STORE = OFF
GO
USE [dbX]
GO
/****** Object:  Table [dbo].[Advertise]    Script Date: 2023/2/1 上午 10:32:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advertise](
	[AdvertiseID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[UnitPrice] [int] NULL,
 CONSTRAINT [PK_Advertise] PRIMARY KEY CLUSTERED 
(
	[AdvertiseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AOrders]    Script Date: 2023/2/1 上午 10:32:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AOrders](
	[AOrderID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierID] [int] NULL,
	[AdvertiseID] [int] NULL,
	[OrderDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[Clicks] [int] NULL,
 CONSTRAINT [PK_AOrders] PRIMARY KEY CLUSTERED 
(
	[AOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COrders]    Script Date: 2023/2/1 上午 10:32:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COrders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[ProductID] [int] NULL,
	[OrderDate] [datetime] NOT NULL,
	[ReturnDate] [datetime] NULL,
	[CancelDate] [datetime] NULL,
	[TakeDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Status] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
	[Price] [money] NULL,
	[Code] [nvarchar](50) NULL,
 CONSTRAINT [PK_COrders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupons]    Script Date: 2023/2/1 上午 10:32:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupons](
	[CouponID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Discount] [money] NULL,
	[ExpiryDate] [datetime] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Coupons] PRIMARY KEY CLUSTERED 
(
	[CouponID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CouponsLog]    Script Date: 2023/2/1 上午 10:32:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CouponsLog](
	[CouponID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
 CONSTRAINT [PK_CouponsLog] PRIMARY KEY CLUSTERED 
(
	[CouponID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 2023/2/1 上午 10:32:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Birth] [datetime] NULL,
	[CreditCard] [nvarchar](50) NULL,
	[CreditPoints] [int] NULL,
	[BlackListed] [bit] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evaluations]    Script Date: 2023/2/1 上午 10:32:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evaluations](
	[EvaluationID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[ProductID] [int] NULL,
	[Date] [datetime] NULL,
	[Title] [nvarchar](100) NULL,
	[Description] [nvarchar](500) NULL,
	[Response] [nvarchar](500) NULL,
	[Star] [int] NULL,
 CONSTRAINT [PK_Evaluations] PRIMARY KEY CLUSTERED 
(
	[EvaluationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Managers]    Script Date: 2023/2/1 上午 10:32:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Managers](
	[ManagerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Managers] PRIMARY KEY CLUSTERED 
(
	[ManagerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2023/2/1 上午 10:32:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[UnitPrice] [int] NULL,
	[Image] [nvarchar](50) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PSite]    Script Date: 2023/2/1 上午 10:32:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PSite](
	[SiteID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Latitude] [nvarchar](50) NULL,
	[Longitude] [nvarchar](50) NULL,
	[UnitOrPing] [int] NULL,
	[UnitInStock] [int] NULL,
	[Image] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_PSite] PRIMARY KEY CLUSTERED 
(
	[SiteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 2023/2/1 上午 10:32:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[CreditPoints] [int] NULL,
	[BlackListed] [bit] NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [SupplierID], [Name], [UnitPrice], [Image]) VALUES (1, 1, N'行動電源', 11, N'202301311141398659567.jpg')
INSERT [dbo].[Products] ([ProductID], [SupplierID], [Name], [UnitPrice], [Image]) VALUES (2, 1, N'腳踏車', 15, N'202301301404124614162.jpg')
INSERT [dbo].[Products] ([ProductID], [SupplierID], [Name], [UnitPrice], [Image]) VALUES (3, 1, N'共用空間', 350, N'202301301404358692229.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SupplierID], [Category], [Name], [Email], [Phone], [Password], [Address], [CreditPoints], [BlackListed]) VALUES (1, N'行動電源', N'行動電源的公司', N'charge@gmail.com', N'0900', N'a123', N'台南市南區', 100, 0)
INSERT [dbo].[Suppliers] ([SupplierID], [Category], [Name], [Email], [Phone], [Password], [Address], [CreditPoints], [BlackListed]) VALUES (2, N'腳踏車', N'腳踏車的公司', N'bike@gmail.com', N'0911', N'a456', N'台南市東西', 100, 0)
INSERT [dbo].[Suppliers] ([SupplierID], [Category], [Name], [Email], [Phone], [Password], [Address], [CreditPoints], [BlackListed]) VALUES (3, N'共用空間', N'共用空間的公司', N'space@gmail.com', N'0922', N'a789', N'台南市北區', 100, 0)
INSERT [dbo].[Suppliers] ([SupplierID], [Category], [Name], [Email], [Phone], [Password], [Address], [CreditPoints], [BlackListed]) VALUES (5, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Coupons_Code]    Script Date: 2023/2/1 上午 10:32:07 ******/
ALTER TABLE [dbo].[Coupons] ADD  CONSTRAINT [UQ_Coupons_Code] UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Customers_CreditCard]    Script Date: 2023/2/1 上午 10:32:07 ******/
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [UQ_Customers_CreditCard] UNIQUE NONCLUSTERED 
(
	[CreditCard] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Customers_Email]    Script Date: 2023/2/1 上午 10:32:07 ******/
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [UQ_Customers_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Customers_Phone]    Script Date: 2023/2/1 上午 10:32:07 ******/
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [UQ_Customers_Phone] UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Managers_Email]    Script Date: 2023/2/1 上午 10:32:07 ******/
ALTER TABLE [dbo].[Managers] ADD  CONSTRAINT [UQ_Managers_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Managers_Phone]    Script Date: 2023/2/1 上午 10:32:07 ******/
ALTER TABLE [dbo].[Managers] ADD  CONSTRAINT [UQ_Managers_Phone] UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_PSite_Image]    Script Date: 2023/2/1 上午 10:32:07 ******/
ALTER TABLE [dbo].[PSite] ADD  CONSTRAINT [UQ_PSite_Image] UNIQUE NONCLUSTERED 
(
	[Image] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Suppliers_Email]    Script Date: 2023/2/1 上午 10:32:07 ******/
ALTER TABLE [dbo].[Suppliers] ADD  CONSTRAINT [UQ_Suppliers_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Suppliers_Phone]    Script Date: 2023/2/1 上午 10:32:07 ******/
ALTER TABLE [dbo].[Suppliers] ADD  CONSTRAINT [UQ_Suppliers_Phone] UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AOrders] ADD  DEFAULT (sysdatetime()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[COrders] ADD  DEFAULT (sysdatetime()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Customers] ADD  DEFAULT ((0)) FOR [BlackListed]
GO
ALTER TABLE [dbo].[Evaluations] ADD  DEFAULT (sysdatetime()) FOR [Date]
GO
ALTER TABLE [dbo].[AOrders]  WITH CHECK ADD  CONSTRAINT [FK_AOrders_Advertise] FOREIGN KEY([AdvertiseID])
REFERENCES [dbo].[Advertise] ([AdvertiseID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AOrders] CHECK CONSTRAINT [FK_AOrders_Advertise]
GO
ALTER TABLE [dbo].[AOrders]  WITH CHECK ADD  CONSTRAINT [FK_AOrders_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AOrders] CHECK CONSTRAINT [FK_AOrders_Suppliers]
GO
ALTER TABLE [dbo].[COrders]  WITH CHECK ADD  CONSTRAINT [FK_COrders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[COrders] CHECK CONSTRAINT [FK_COrders_Customers]
GO
ALTER TABLE [dbo].[COrders]  WITH CHECK ADD  CONSTRAINT [FK_COrders_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[COrders] CHECK CONSTRAINT [FK_COrders_Products]
GO
ALTER TABLE [dbo].[CouponsLog]  WITH CHECK ADD  CONSTRAINT [FK_CouponsLog_COrders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[COrders] ([OrderID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CouponsLog] CHECK CONSTRAINT [FK_CouponsLog_COrders]
GO
ALTER TABLE [dbo].[Evaluations]  WITH CHECK ADD  CONSTRAINT [FK_Evaluations_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Evaluations] CHECK CONSTRAINT [FK_Evaluations_Customers]
GO
ALTER TABLE [dbo].[Evaluations]  WITH CHECK ADD  CONSTRAINT [FK_Evaluations_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Evaluations] CHECK CONSTRAINT [FK_Evaluations_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [dbo].[PSite]  WITH CHECK ADD  CONSTRAINT [FK_PSite_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PSite] CHECK CONSTRAINT [FK_PSite_Products]
GO
