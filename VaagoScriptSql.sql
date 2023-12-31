USE [VaagoProject]
GO
/****** Object:  Database [VaagoProject]    Script Date: 20/04/2021 4:43:07 pm ******/
CREATE DATABASE [VaagoProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VaagoProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\VaagoProject.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'VaagoProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\VaagoProject_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [VaagoProject] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VaagoProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VaagoProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VaagoProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VaagoProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VaagoProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VaagoProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [VaagoProject] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [VaagoProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VaagoProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VaagoProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VaagoProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VaagoProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VaagoProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VaagoProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VaagoProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VaagoProject] SET  ENABLE_BROKER 
GO
ALTER DATABASE [VaagoProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VaagoProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VaagoProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VaagoProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VaagoProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VaagoProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VaagoProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VaagoProject] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VaagoProject] SET  MULTI_USER 
GO
ALTER DATABASE [VaagoProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VaagoProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VaagoProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VaagoProject] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [VaagoProject] SET DELAYED_DURABILITY = DISABLED 
GO
USE [VaagoProject]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 20/04/2021 4:43:07 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[account_ID] [int] IDENTITY(1,1) NOT NULL,
	[account_type] [int] NULL,
	[name] [nvarchar](320) NULL,
	[email] [nvarchar](320) NULL,
	[pass] [nvarchar](320) NULL,
	[phone] [nvarchar](320) NULL,
	[location] [nvarchar](320) NULL,
PRIMARY KEY CLUSTERED 
(
	[account_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cart]    Script Date: 20/04/2021 4:43:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[account_ID] [int] NULL,
	[itemID] [int] NULL,
	[itemQuantity] [int] NULL,
	[totalAmount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 20/04/2021 4:43:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Menu](
	[itemID] [int] IDENTITY(1,1) NOT NULL,
	[itemName] [varchar](320) NULL,
	[itemDesc] [varchar](320) NULL,
	[itemImgpath] [varchar](320) NULL,
	[itemCategory] [varchar](320) NULL,
	[itemPrice] [varchar](320) NULL,
	[itemSKU]  AS ('MENU'+right('_'+CONVERT([varchar](8),[itemID]),(8))) PERSISTED,
PRIMARY KEY CLUSTERED 
(
	[itemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order_Details]    Script Date: 20/04/2021 4:43:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Details](
	[detailID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NULL,
	[itemQuantity] [int] NULL,
	[itemID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 20/04/2021 4:43:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[orderTime] [varchar](320) NULL,
	[orderDate] [varchar](320) NULL,
	[orderStatus] [varchar](320) NULL,
	[numberOfItems] [varchar](320) NULL,
	[Amount] [varchar](320) NULL,
	[deliveryCharges] [varchar](320) NULL,
	[City] [varchar](320) NULL,
	[notes] [varchar](320) NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 20/04/2021 4:43:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reservations](
	[reserveID] [int] IDENTITY(1,1) NOT NULL,
	[Reservation Number]  AS ('RESERVE'+right('00'+CONVERT([varchar](8),[reserveID]),(8))) PERSISTED,
	[byName] [nvarchar](320) NULL,
	[byEmail] [nvarchar](320) NULL,
	[byContact] [nvarchar](320) NULL,
	[numberOfPersons] [int] NULL,
	[reserveDateTime] [nvarchar](320) NULL,
	[eventType] [nvarchar](320) NULL,
	[byMessage] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[reserveID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 20/04/2021 4:43:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[roleID] [int] NOT NULL,
	[roleName] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SiteMessages]    Script Date: 20/04/2021 4:43:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SiteMessages](
	[msgID] [int] IDENTITY(1,1) NOT NULL,
	[msgName] [varchar](320) NULL,
	[msgEmail] [varchar](320) NULL,
	[msgSubject] [varchar](320) NULL,
	[msgBody] [varchar](320) NULL,
PRIMARY KEY CLUSTERED 
(
	[msgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

GO
INSERT [dbo].[Accounts] ([account_ID], [account_type], [name], [email], [pass], [phone], [location]) VALUES (1, 1, N'Asad Qamar Bajwa', N'qm@admin.com', N'000', N'+92 11111111', N'80% karachi, Sari Streets, Sari States, Pakistan')
GO
INSERT [dbo].[Accounts] ([account_ID], [account_type], [name], [email], [pass], [phone], [location]) VALUES (2, 2, N'Qamar Jawed Bajwa', N'Anums222@hotmail.com', N'555', N'+9211111111', N'80% karachi, Sari Streets, Sari States, Pakistan')
GO
INSERT [dbo].[Accounts] ([account_ID], [account_type], [name], [email], [pass], [phone], [location]) VALUES (3, 2, N'Test User', N'test@user.com', N'123456', N'123123123', N'Fkatr123 1231asd ')
GO
INSERT [dbo].[Accounts] ([account_ID], [account_type], [name], [email], [pass], [phone], [location]) VALUES (4, 2, N'Test User 2', N'test2@user.com', N'123', N'+213564879821', N'"aszzxc asd F;at218498465"')
GO
INSERT [dbo].[Accounts] ([account_ID], [account_type], [name], [email], [pass], [phone], [location]) VALUES (5, 2, N'Asd', N'asd123@asd', N'123', NULL, NULL)
GO
INSERT [dbo].[Accounts] ([account_ID], [account_type], [name], [email], [pass], [phone], [location]) VALUES (6, 2, N'Test final', N'test@asd.com', N'123456', NULL, NULL)
GO
INSERT [dbo].[Accounts] ([account_ID], [account_type], [name], [email], [pass], [phone], [location]) VALUES (7, 2, N'Abdurehman', N'somethinf@asd.com', N'123456789', NULL, NULL)
GO
INSERT [dbo].[Accounts] ([account_ID], [account_type], [name], [email], [pass], [phone], [location]) VALUES (8, 2, N'Test User', N'asd@gmail.com', N'111', N'123546789', N'Flasr123')
GO
INSERT [dbo].[Accounts] ([account_ID], [account_type], [name], [email], [pass], [phone], [location]) VALUES (9, 2, N'abcd', N'abcd@gmail.com', N'1234', N'123456789', N'"F;atasd asdasdsad"')
GO
INSERT [dbo].[Accounts] ([account_ID], [account_type], [name], [email], [pass], [phone], [location]) VALUES (1009, 2, N'Milad Khan', N'apple@a.com', N'123', N'23124123', N'"""asdasdasdasd"')
GO
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

GO
INSERT [dbo].[Cart] ([ID], [account_ID], [itemID], [itemQuantity], [totalAmount]) VALUES (26, 919057993, 2, 1, 1145)
GO
INSERT [dbo].[Cart] ([ID], [account_ID], [itemID], [itemQuantity], [totalAmount]) VALUES (27, 919057993, 4, 1, 1145)
GO
INSERT [dbo].[Cart] ([ID], [account_ID], [itemID], [itemQuantity], [totalAmount]) VALUES (30, 105303500, 13, 1, 1080)
GO
INSERT [dbo].[Cart] ([ID], [account_ID], [itemID], [itemQuantity], [totalAmount]) VALUES (31, 105303500, 1, 1, 1080)
GO
INSERT [dbo].[Cart] ([ID], [account_ID], [itemID], [itemQuantity], [totalAmount]) VALUES (32, 105303500, 14, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET ANSI_PADDING ON
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

GO
INSERT [dbo].[Menu] ([itemID], [itemName], [itemDesc], [itemImgpath], [itemCategory], [itemPrice]) VALUES (1, N'Chicken Reshmi Kebab', N'Marinated chicken in creamy spicy sauce', N'/images/reshmi.jpg', N'BBQ', N'480')
GO
INSERT [dbo].[Menu] ([itemID], [itemName], [itemDesc], [itemImgpath], [itemCategory], [itemPrice]) VALUES (2, N'Behari Kebab', N'Traditional bihari kebab with spicy touch to it', N'/images/bihari.jpg', N'BBQ', N'400')
GO
INSERT [dbo].[Menu] ([itemID], [itemName], [itemDesc], [itemImgpath], [itemCategory], [itemPrice]) VALUES (3, N'Chicken Tikka', N'Grilled Chicken breast, spring onions, secret sauces', N'/images/tikka.jpg', N'BBQ', N'280')
GO
INSERT [dbo].[Menu] ([itemID], [itemName], [itemDesc], [itemImgpath], [itemCategory], [itemPrice]) VALUES (4, N'Chicken Shezwan', N'julienne cut chicken and vegetables tossed in a balance flavored gravy, served with stir fried rice.', N'/images/shezwan.jpg', N'Chinese', N'695')
GO
INSERT [dbo].[Menu] ([itemID], [itemName], [itemDesc], [itemImgpath], [itemCategory], [itemPrice]) VALUES (5, N'Chicken Chilli Dry', N'julienne cut chicken, onion, capsicum, green chilli tossed in a balance flavored gravy, served with stir fried rice.', N'/images/chilliDry.jpg', N'Chinese', N'620')
GO
INSERT [dbo].[Menu] ([itemID], [itemName], [itemDesc], [itemImgpath], [itemCategory], [itemPrice]) VALUES (6, N'Mutton Karahi', N'A gravy of delicious and spicy combination of tomatoes, green chili, crush chili and black pepper full of flavor meat (Chicken or Mutton)', N'/images/muttonkarahi.jpg', N'Meals', N'280')
GO
INSERT [dbo].[Menu] ([itemID], [itemName], [itemDesc], [itemImgpath], [itemCategory], [itemPrice]) VALUES (7, N'Can (Pepsi)', N'Tin Can Of 300ml Pepsi', N'/images/pepsi.jpg', N'Beverages', N'90')
GO
INSERT [dbo].[Menu] ([itemID], [itemName], [itemDesc], [itemImgpath], [itemCategory], [itemPrice]) VALUES (8, N'Can (7up)', N'Tin Can Of 300ml 7up', N'/images/7up.jpg', N'Beverages', N'90')
GO
INSERT [dbo].[Menu] ([itemID], [itemName], [itemDesc], [itemImgpath], [itemCategory], [itemPrice]) VALUES (9, N'Can (Mirinda)', N'Tin Can Of 300ml Mirinda', N'/images/mirinda.jpg', N'Beverages', N'90')
GO
INSERT [dbo].[Menu] ([itemID], [itemName], [itemDesc], [itemImgpath], [itemCategory], [itemPrice]) VALUES (10, N'Singaporian Rice', N'A perfect blend of Egg fried rice, noodles and chicken manchrian, topped with green chilli and creamy mayo.', N'/images/singaporianrice.jpg', N'Rice', N'670')
GO
INSERT [dbo].[Menu] ([itemID], [itemName], [itemDesc], [itemImgpath], [itemCategory], [itemPrice]) VALUES (11, N'Chicken Pulao', N'Made with sensational chicken yakhni and falvours.', N'images/pulao.jpg', N'Rice', N'350')
GO
INSERT [dbo].[Menu] ([itemID], [itemName], [itemDesc], [itemImgpath], [itemCategory], [itemPrice]) VALUES (12, N'Kashmiri Tea', N'Blend of Kashmiri Chai', N'/images/kashmiri.jpg', N'Beverages', N'320')
GO
INSERT [dbo].[Menu] ([itemID], [itemName], [itemDesc], [itemImgpath], [itemCategory], [itemPrice]) VALUES (13, N'American  Omelette', N'Scrambled eggs, the method by which the eggs are heated and stirred.', N'/images/american-omelet.jpg', N'LunchNBreakfast', N'550')
GO
INSERT [dbo].[Menu] ([itemID], [itemName], [itemDesc], [itemImgpath], [itemCategory], [itemPrice]) VALUES (14, N'Test Item', N'Test Description', N'/images/1.png', N'LunchNBreakfast', N'1000')
GO
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Details] ON 

GO
INSERT [dbo].[Order_Details] ([detailID], [orderID], [itemQuantity], [itemID]) VALUES (1, 1, 5, 4)
GO
INSERT [dbo].[Order_Details] ([detailID], [orderID], [itemQuantity], [itemID]) VALUES (2, 1, 2, 3)
GO
INSERT [dbo].[Order_Details] ([detailID], [orderID], [itemQuantity], [itemID]) VALUES (3, 1, 2, 8)
GO
INSERT [dbo].[Order_Details] ([detailID], [orderID], [itemQuantity], [itemID]) VALUES (4, 2, 1, 13)
GO
INSERT [dbo].[Order_Details] ([detailID], [orderID], [itemQuantity], [itemID]) VALUES (5, 2, 1, 4)
GO
INSERT [dbo].[Order_Details] ([detailID], [orderID], [itemQuantity], [itemID]) VALUES (6, 2, 1, 7)
GO
INSERT [dbo].[Order_Details] ([detailID], [orderID], [itemQuantity], [itemID]) VALUES (7, 2, 1, 3)
GO
INSERT [dbo].[Order_Details] ([detailID], [orderID], [itemQuantity], [itemID]) VALUES (8, 2, 1, 9)
GO
INSERT [dbo].[Order_Details] ([detailID], [orderID], [itemQuantity], [itemID]) VALUES (9, 2, 1, 13)
GO
INSERT [dbo].[Order_Details] ([detailID], [orderID], [itemQuantity], [itemID]) VALUES (10, 3, 1, 10)
GO
INSERT [dbo].[Order_Details] ([detailID], [orderID], [itemQuantity], [itemID]) VALUES (11, 3, 1, 9)
GO
INSERT [dbo].[Order_Details] ([detailID], [orderID], [itemQuantity], [itemID]) VALUES (12, 4, 1, 13)
GO
INSERT [dbo].[Order_Details] ([detailID], [orderID], [itemQuantity], [itemID]) VALUES (13, 4, 1, 11)
GO
INSERT [dbo].[Order_Details] ([detailID], [orderID], [itemQuantity], [itemID]) VALUES (14, 5, 1, 13)
GO
INSERT [dbo].[Order_Details] ([detailID], [orderID], [itemQuantity], [itemID]) VALUES (15, 5, 1, 3)
GO
INSERT [dbo].[Order_Details] ([detailID], [orderID], [itemQuantity], [itemID]) VALUES (16, 6, 1, 6)
GO
INSERT [dbo].[Order_Details] ([detailID], [orderID], [itemQuantity], [itemID]) VALUES (17, 6, 1, 8)
GO
INSERT [dbo].[Order_Details] ([detailID], [orderID], [itemQuantity], [itemID]) VALUES (1016, 1006, 1, 4)
GO
INSERT [dbo].[Order_Details] ([detailID], [orderID], [itemQuantity], [itemID]) VALUES (1017, 1006, 1, 5)
GO
INSERT [dbo].[Order_Details] ([detailID], [orderID], [itemQuantity], [itemID]) VALUES (1018, 1006, 1, 13)
GO
INSERT [dbo].[Order_Details] ([detailID], [orderID], [itemQuantity], [itemID]) VALUES (1019, 1006, 1, 5)
GO
INSERT [dbo].[Order_Details] ([detailID], [orderID], [itemQuantity], [itemID]) VALUES (1020, 1007, 1, 6)
GO
SET IDENTITY_INSERT [dbo].[Order_Details] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

GO
INSERT [dbo].[Orders] ([orderID], [CustomerID], [orderTime], [orderDate], [orderStatus], [numberOfItems], [Amount], [deliveryCharges], [City], [notes]) VALUES (1, 8, N'5:41:49 PM', N'Mon Apr 05 2021', N'Cancelled', N'3', N'4495', N'50', NULL, NULL)
GO
INSERT [dbo].[Orders] ([orderID], [CustomerID], [orderTime], [orderDate], [orderStatus], [numberOfItems], [Amount], [deliveryCharges], [City], [notes]) VALUES (2, 3, N'4:44:22 pm', N'Friday, 9 April 2021', N'Pending', N'6', N'2305', N'50', N'Karachi', N'Asda')
GO
INSERT [dbo].[Orders] ([orderID], [CustomerID], [orderTime], [orderDate], [orderStatus], [numberOfItems], [Amount], [deliveryCharges], [City], [notes]) VALUES (3, 4, N'4:55:33 pm', N'Friday, 9 April 2021', N'Approved', N'2', N'810', N'50', N'Karachi', N'asdqe1qdasd')
GO
INSERT [dbo].[Orders] ([orderID], [CustomerID], [orderTime], [orderDate], [orderStatus], [numberOfItems], [Amount], [deliveryCharges], [City], [notes]) VALUES (4, 4, N'5:07:44 pm', N'Friday, 9 April 2021', N'Approved', N'2', N'950', N'50', N'Karachi', N'')
GO
INSERT [dbo].[Orders] ([orderID], [CustomerID], [orderTime], [orderDate], [orderStatus], [numberOfItems], [Amount], [deliveryCharges], [City], [notes]) VALUES (5, 4, N'2:24:37 am', N'Friday, 16 April 2021', N'Cancelled', N'2', N'880', N'50', N'Karachi', N'jhbjhbk')
GO
INSERT [dbo].[Orders] ([orderID], [CustomerID], [orderTime], [orderDate], [orderStatus], [numberOfItems], [Amount], [deliveryCharges], [City], [notes]) VALUES (6, 9, N'7:58:28 pm', N'Monday, 19 April 2021', N'Cancelled', N'2', N'420', N'50', N'Karachi', N'468lkpijo')
GO
INSERT [dbo].[Orders] ([orderID], [CustomerID], [orderTime], [orderDate], [orderStatus], [numberOfItems], [Amount], [deliveryCharges], [City], [notes]) VALUES (1006, 1009, N'4:34:29 pm', N'Tuesday, 20 April 2021', N'Cancelled', N'4', N'1365', N'50', N'Karachi', N'')
GO
INSERT [dbo].[Orders] ([orderID], [CustomerID], [orderTime], [orderDate], [orderStatus], [numberOfItems], [Amount], [deliveryCharges], [City], [notes]) VALUES (1007, 1009, N'4:35:53 pm', N'Tuesday, 20 April 2021', N'Approved', N'1', N'330', N'50', N'Karachi', N'')
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET ANSI_PADDING ON
GO
SET IDENTITY_INSERT [dbo].[Reservations] ON 

GO
INSERT [dbo].[Reservations] ([reserveID], [byName], [byEmail], [byContact], [numberOfPersons], [reserveDateTime], [eventType], [byMessage]) VALUES (1, N'Anum Shafi', N'Anums222@hotmail.com', N'+92123456789', 4, N'12, March 2021 07:00:00 PM', N'Birthday Event', N'asd asdasdasdasdas das')
GO
INSERT [dbo].[Reservations] ([reserveID], [byName], [byEmail], [byContact], [numberOfPersons], [reserveDateTime], [eventType], [byMessage]) VALUES (2, N'asdasd', N'dasdasd@asdasd', N'12341234123', NULL, N'123123-03-12T12:31', N'Family Dine-in', N'1231231 123 12312 sada ad')
GO
INSERT [dbo].[Reservations] ([reserveID], [byName], [byEmail], [byContact], [numberOfPersons], [reserveDateTime], [eventType], [byMessage]) VALUES (3, N'Milad Khan', N'aasdad@asda.com', N'0333031245', NULL, N'45122-02-01T02:52', N'Birthday Event', N'asd 12 asd awd12e cas')
GO
INSERT [dbo].[Reservations] ([reserveID], [byName], [byEmail], [byContact], [numberOfPersons], [reserveDateTime], [eventType], [byMessage]) VALUES (4, N'Milad Khan', N'aasdad@asda.com', N'0333031245', NULL, N'45122-02-01T02:52', N'Birthday Event', N'asd 12 asd awd12e cas')
GO
INSERT [dbo].[Reservations] ([reserveID], [byName], [byEmail], [byContact], [numberOfPersons], [reserveDateTime], [eventType], [byMessage]) VALUES (5, N'asdasda', N'asdasd@asdasd', N'123123123', 2, N'123213-03-12T12:31', N'Get together', N'asdasdad')
GO
INSERT [dbo].[Reservations] ([reserveID], [byName], [byEmail], [byContact], [numberOfPersons], [reserveDateTime], [eventType], [byMessage]) VALUES (6, N'asdasd', N'asdasd@asd', N'12312312312', 2, N'123123-03-12T02:13', N'Birthday Event', N'123123')
GO
SET IDENTITY_INSERT [dbo].[Reservations] OFF
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Roles] ([roleID], [roleName]) VALUES (1, N'Admin')
GO
INSERT [dbo].[Roles] ([roleID], [roleName]) VALUES (2, N'Customer')
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Accounts__AB6E616446A75296]    Script Date: 20/04/2021 4:43:08 pm ******/
ALTER TABLE [dbo].[Accounts] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD FOREIGN KEY([account_type])
REFERENCES [dbo].[Roles] ([roleID])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([itemID])
REFERENCES [dbo].[Menu] ([itemID])
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD FOREIGN KEY([itemID])
REFERENCES [dbo].[Menu] ([itemID])
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Accounts] ([account_ID])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD CHECK  (([itemQuantity]>(0) AND [itemQuantity]<(15)))
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD CHECK  (([itemQuantity]>(0) AND [itemQuantity]<(15)))
GO
USE [master]
GO
ALTER DATABASE [VaagoProject] SET  READ_WRITE 
GO
