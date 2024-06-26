USE [master]
GO
/****** Object:  Database [SQLFinal2024]    Script Date: 5/25/2024 7:55:22 PM ******/
CREATE DATABASE [SQLFinal2024]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SQLFinal2024', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SQLFinal2024.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SQLFinal2024_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SQLFinal2024_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SQLFinal2024].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SQLFinal2024] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SQLFinal2024] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SQLFinal2024] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SQLFinal2024] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SQLFinal2024] SET ARITHABORT OFF 
GO
ALTER DATABASE [SQLFinal2024] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SQLFinal2024] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SQLFinal2024] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SQLFinal2024] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SQLFinal2024] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SQLFinal2024] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SQLFinal2024] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SQLFinal2024] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SQLFinal2024] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SQLFinal2024] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SQLFinal2024] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SQLFinal2024] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SQLFinal2024] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SQLFinal2024] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SQLFinal2024] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SQLFinal2024] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SQLFinal2024] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SQLFinal2024] SET RECOVERY FULL 
GO
ALTER DATABASE [SQLFinal2024] SET  MULTI_USER 
GO
ALTER DATABASE [SQLFinal2024] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SQLFinal2024] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SQLFinal2024] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SQLFinal2024] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SQLFinal2024] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SQLFinal2024', N'ON'
GO
ALTER DATABASE [SQLFinal2024] SET QUERY_STORE = ON
GO
ALTER DATABASE [SQLFinal2024] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO)
GO
USE [SQLFinal2024]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 5/25/2024 7:55:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Client_ID] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [varchar](50) NOT NULL,
	[MI] [varchar](1) NULL,
	[Last_Name] [varchar](50) NOT NULL,
	[DOB] [date] NULL,
	[Phone] [varchar](15) NOT NULL,
	[Email] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Client_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 5/25/2024 7:55:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[Service_ID] [int] IDENTITY(1,1) NOT NULL,
	[Service_Name] [varchar](50) NOT NULL,
	[Service_Cost] [money] NOT NULL,
	[Service_Desc] [varchar](max) NOT NULL,
	[Avg_Time] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Service_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stylists]    Script Date: 5/25/2024 7:55:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stylists](
	[Stylist_ID] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [varchar](50) NOT NULL,
	[MI] [varchar](1) NULL,
	[Last_Name] [varchar](50) NOT NULL,
	[DOB] [date] NOT NULL,
	[Street] [varchar](100) NOT NULL,
	[CITY] [varchar](50) NOT NULL,
	[State] [varchar](2) NOT NULL,
	[Zip_Code] [int] NOT NULL,
	[Phone] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Stylist_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/25/2024 7:55:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Product_ID] [int] IDENTITY(1,1) NOT NULL,
	[Vendor_ID] [int] NULL,
	[Product_Name] [varchar](100) NOT NULL,
	[UPC] [varchar](100) NOT NULL,
	[Wholesale_Price] [money] NOT NULL,
	[Retail_Price] [money] NULL,
	[Order_Qty] [int] NOT NULL,
	[Discontinued] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 5/25/2024 7:55:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[Appt_ID] [int] IDENTITY(1,1) NOT NULL,
	[Appt_Date] [date] NOT NULL,
	[Appt_Time] [time](7) NOT NULL,
	[Client_ID] [int] NULL,
	[Stylist_ID] [int] NULL,
	[Service_ID] [int] NULL,
	[Product_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Appt_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[Day_Sheet]    Script Date: 5/25/2024 7:55:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Day_Sheet](@Day AS DATE) 
RETURNS TABLE
AS
RETURN (
    SELECT a.Appt_Date, a.Appt_Time, CONCAT(c.First_Name, ' ', c.Last_Name) AS Client_Name, se.Service_Name, p.Product_Name, CONCAT(st.First_Name, ' ', st.Last_Name) AS Stylist_Name
FROM Appointments AS a
JOIN Clients AS c
ON a.Client_ID = c.Client_ID 
JOIN Products AS p
ON a.Product_ID = p.Product_ID
JOIN Services AS se
ON a.Service_ID = se.Service_ID
JOIN Stylists AS st
ON a.Stylist_ID = st.Stylist_ID
WHERE a.Appt_Date = @Day
) 
GO
/****** Object:  Table [dbo].[Vendors]    Script Date: 5/25/2024 7:55:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendors](
	[Vendor_ID] [int] IDENTITY(1,1) NOT NULL,
	[Vendor_Name] [varchar](100) NOT NULL,
	[Street] [varchar](100) NOT NULL,
	[CITY] [varchar](50) NOT NULL,
	[State] [varchar](2) NOT NULL,
	[Zip_Code] [int] NOT NULL,
	[Phone] [varchar](15) NULL,
	[Email] [varchar](100) NULL,
	[Website] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Vendor_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 5/25/2024 7:55:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[Stock_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_ID] [int] NULL,
	[Amt_In_Stock] [int] NOT NULL,
	[Min_Stock] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Stock_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Stock_Low]    Script Date: 5/25/2024 7:55:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Stock_Low]
AS
SELECT i.Product_ID, i.Amt_In_Stock, i.Min_Stock, p.Product_Name, p.Order_Qty, p.Discontinued, v.Vendor_Name, v.Phone, v.Email, v.Website 
FROM Inventory AS i
JOIN Products AS p
ON p.Product_ID = i.Product_ID
JOIN Vendors AS v
ON v.Vendor_ID = p.Vendor_ID
WHERE i.Amt_In_Stock < i.Min_Stock
GO
/****** Object:  Table [dbo].[Products_Available]    Script Date: 5/25/2024 7:55:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products_Available](
	[Product_ID] [int] NULL,
	[Vendor_ID] [int] NULL,
	[Product_Name] [varchar](100) NULL,
	[UPC] [varchar](100) NULL,
	[Wholesale_Price] [money] NULL,
	[Retail_Price] [money] NULL,
	[Order_Qty] [int] NULL,
	[Discontinued] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products_Discontinued]    Script Date: 5/25/2024 7:55:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products_Discontinued](
	[Product_ID] [int] NULL,
	[Vendor_ID] [int] NULL,
	[Product_Name] [varchar](100) NULL,
	[UPC] [varchar](100) NULL,
	[Wholesale_Price] [money] NULL,
	[Retail_Price] [money] NULL,
	[Order_Qty] [int] NULL,
	[Discontinued] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 5/25/2024 7:55:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[Sales_ID] [int] IDENTITY(1,1) NOT NULL,
	[Appt_ID] [int] NULL,
	[Transation_Date] [date] NOT NULL,
	[Total_Charge] [money] NOT NULL,
	[Payment_Type] [varchar](50) NULL,
	[Credit_Transaction] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Sales_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Appointments]  WITH NOCHECK ADD FOREIGN KEY([Client_ID])
REFERENCES [dbo].[Clients] ([Client_ID])
GO
ALTER TABLE [dbo].[Appointments]  WITH NOCHECK ADD FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Products] ([Product_ID])
GO
ALTER TABLE [dbo].[Appointments]  WITH NOCHECK ADD FOREIGN KEY([Service_ID])
REFERENCES [dbo].[Services] ([Service_ID])
GO
ALTER TABLE [dbo].[Appointments]  WITH NOCHECK ADD FOREIGN KEY([Stylist_ID])
REFERENCES [dbo].[Stylists] ([Stylist_ID])
GO
ALTER TABLE [dbo].[Inventory]  WITH NOCHECK ADD FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Products] ([Product_ID])
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD FOREIGN KEY([Vendor_ID])
REFERENCES [dbo].[Vendors] ([Vendor_ID])
GO
ALTER TABLE [dbo].[Sales]  WITH NOCHECK ADD FOREIGN KEY([Appt_ID])
REFERENCES [dbo].[Appointments] ([Appt_ID])
GO
/****** Object:  StoredProcedure [dbo].[Book_Appt]    Script Date: 5/25/2024 7:55:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Book_Appt](
    @Appt_Date DATE,
    @Appt_Time TIME,
    @Client_ID INT,
    @Stylist_ID INT,
    @Service_ID INT,
    @Product_ID INT
)
AS
INSERT INTO Appointments(
    Appt_Date,
    Appt_Time,
    Client_ID,
    Stylist_ID,
    Service_ID,
    Product_ID
)
VALUES(
    @Appt_Date,
    @Appt_Time,
    @Client_ID,
    @Stylist_ID,
    @Service_ID,
    @Product_ID
)
GO
USE [master]
GO
ALTER DATABASE [SQLFinal2024] SET  READ_WRITE 
GO
