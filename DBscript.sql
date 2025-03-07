USE [328300538_kitchenwareShop]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 04/03/2025 20:38:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 04/03/2025 20:38:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 04/03/2025 20:38:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Date] [datetime] NULL,
	[Sum] [float] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 04/03/2025 20:38:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Price] [float] NOT NULL,
	[Image] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 04/03/2025 20:38:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[RATING_ID] [int] IDENTITY(1,1) NOT NULL,
	[HOST] [nvarchar](50) NULL,
	[METHOD] [nchar](10) NULL,
	[PATH] [nvarchar](50) NULL,
	[REFERER] [nvarchar](100) NULL,
	[USER_AGENT] [nvarchar](max) NULL,
	[Record_Date] [datetime] NULL,
 CONSTRAINT [PK_RATING] PRIMARY KEY CLUSTERED 
(
	[RATING_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 04/03/2025 20:38:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](30) NOT NULL,
	[Password] [nchar](20) NOT NULL,
	[FirstName] [nchar](20) NULL,
	[LastName] [nchar](20) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'כלי הגשה            ')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'סירים               ')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'מכשירי חשמל         ')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (4, N'סכום                ')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (5, N'משטחי עבודה         ')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (6, N'קופסאות איחסון      ')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (7, N'מפיות               ')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (8, N'סכינים              ')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Description], [Price], [Image]) VALUES (27, 1, N'צלחת קרמיקה מעוצבת', N'צלחת קרמיקה בעיצוב ייחודי', 49.9, N'36.jpeg             ')
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Description], [Price], [Image]) VALUES (28, 1, N'כלי הגשה לעוגות', N'כלי הגשה מעוצב לעוגות', 59.9, N'40.jpeg             ')
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Description], [Price], [Image]) VALUES (29, 1, N'קערת מרק עמוקה', N'קערה עמוקה למרק', 39.9, N'38.jpeg             ')
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Description], [Price], [Image]) VALUES (30, 1, N'כד מעוצב', N'כד', 39.9, N'30.jpeg             ')
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Description], [Price], [Image]) VALUES (31, 1, N'כד אלגנטי', N'כד', 39.9, N'31.jpeg             ')
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Description], [Price], [Image]) VALUES (32, 2, N'סיר נירוסטה 24 ס"מ', N'סיר נירוסטה איכותי בקוטר 24 ס"מ', 129.9, N'51.jpeg             ')
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Description], [Price], [Image]) VALUES (33, 2, N'סיר לחץ 6 ליטר', N'סיר לחץ בנפח 6 ליטר', 199.9, N'52.jpeg             ')
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Description], [Price], [Image]) VALUES (34, 2, N'סיר אמייל 20 ס"מ', N'סיר אמייל איכותי בקוטר 20 ס"מ', 99.9, N'34.jpeg             ')
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Description], [Price], [Image]) VALUES (35, 3, N'מיקסר שולחני מקצועי', N'מיקסר מקצועי עם קערת נירוסטה', 399.9, N'16.jpg              ')
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Description], [Price], [Image]) VALUES (36, 3, N'שייקר', N'מכשיר שייקר איכותי', 299.9, N'15.jpg              ')
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Description], [Price], [Image]) VALUES (37, 3, N'מכשיר נינגה', N'מכשיר נינגה לבישול', 699.9, N'8.webp              ')
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Description], [Price], [Image]) VALUES (38, 3, N'מכשיר סלייסר', N'מכשיר סלייסר מקצועי', 699.9, N'67.jpeg             ')
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Description], [Price], [Image]) VALUES (39, 4, N'סט סכום נירוסטה 24 חלקים', N'סט סכום נירוסטה איכותי', 199.9, N'66.jpeg             ')
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Description], [Price], [Image]) VALUES (40, 4, N'כף הגשה גדולה', N'כף הגשה מנירוסטה', 29.9, N'35.jpeg             ')
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Description], [Price], [Image]) VALUES (41, 4, N'סט מזלגות קינוח', N'סט מזלגות קינוח 6 חלקים', 49.9, N'27.jpeg             ')
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Description], [Price], [Image]) VALUES (42, 5, N'קרש חיתוך עץ גדול', N'קרש חיתוך עשוי עץ איכותי', 89.9, N'54.jpeg             ')
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Description], [Price], [Image]) VALUES (43, 5, N'קרש חיתוך במבוק', N'קרש חיתוך עשוי במבוק', 79.9, N'55.jpeg             ')
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Description], [Price], [Image]) VALUES (44, 6, N'קופסאות איחסון זכוכית', N'סט קופסאות איחסון מזכוכית עם מכסים', 129.9, N'64.jpeg             ')
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Description], [Price], [Image]) VALUES (45, 6, N'קופסאות איחסון פלסטיק', N'סט קופסאות איחסון מפלסטיק', 79.9, N'63.jpeg             ')
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Description], [Price], [Image]) VALUES (46, 7, N'סט מפיות בד', N'סט מפיות בד בעיצוב ייחודי', 29.9, N'60.jpeg             ')
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Description], [Price], [Image]) VALUES (47, 7, N'מפיות נייר מעוצבות', N'מפיות נייר בעיצוב מודרני', 19.9, N'61.jpeg             ')
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Description], [Price], [Image]) VALUES (48, 8, N'סכין שף יפנית', N'סכין שף באורך 20 ס"מ בעיצוב יפני', 129.9, N'46.jpeg             ')
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Description], [Price], [Image]) VALUES (49, 8, N'סכין פריסה', N'סכין פריסה באורך 25 ס"מ', 99.9, N'43.jpeg             ')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Rating] ON 

INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1, N'localhost:7260', N'GET       ', N'/favicon.ico', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T14:19:50.557' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (2, N'localhost:7260', N'GET       ', N'/api/Categories', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T14:19:50.557' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (3, N'localhost:7260', N'GET       ', N'/api/Products/', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T14:19:50.557' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (4, N'localhost:7260', N'GET       ', N'/Products.html', N'', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T14:19:57.133' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (5, N'localhost:7260', N'GET       ', N'/Scripts/Products.js', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T14:19:57.237' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (6, N'localhost:7260', N'GET       ', N'/Images/searchIcon.svg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T14:19:57.247' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (7, N'localhost:7260', N'GET       ', N'/Styles/Products.css', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T14:19:57.247' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (8, N'localhost:7260', N'GET       ', N'/Images/BagActive.png', N'https://localhost:7260/Styles/Products.css', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T14:19:57.287' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (9, N'localhost:7260', N'GET       ', N'/api/Products/', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T14:19:57.333' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (10, N'localhost:7260', N'GET       ', N'/api/Categories', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T14:19:57.333' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (11, N'localhost:7260', N'GET       ', N'/favicon.ico', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T14:19:57.347' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (12, N'localhost:7260', N'GET       ', N'/Products.html', N'', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T14:20:07.707' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (13, N'localhost:7260', N'GET       ', N'/api/Categories', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T14:20:07.790' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (14, N'localhost:7260', N'GET       ', N'/api/Products/', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T14:20:07.790' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (15, N'localhost:7260', N'GET       ', N'/Products.html', N'', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T14:20:09.730' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (16, N'localhost:7260', N'GET       ', N'/api/Categories', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T14:20:12.600' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (17, N'localhost:7260', N'GET       ', N'/api/Products/', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T14:20:12.600' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (18, N'localhost:7260', N'GET       ', N'/favicon.ico', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T14:20:42.870' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (19, N'localhost:7260', N'GET       ', N'/api/Products/', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T14:20:42.870' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (20, N'localhost:7260', N'GET       ', N'/api/Categories', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T14:20:42.870' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (21, N'localhost:7260', N'GET       ', N'/favicon.ico', N'', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T14:20:57.540' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (22, N'localhost:7260', N'GET       ', N'/api/Products/', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T14:21:37.527' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (23, N'localhost:7260', N'GET       ', N'/favicon.ico', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T14:21:37.527' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (24, N'localhost:7260', N'GET       ', N'/api/Categories', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T14:21:37.527' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (25, N'localhost:7260', N'GET       ', N'/Products.html', N'', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:21.180' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (26, N'localhost:7260', N'GET       ', N'/Images/searchIcon.svg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:23.210' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (27, N'localhost:7260', N'GET       ', N'/api/Categories', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:23.300' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (28, N'localhost:7260', N'GET       ', N'/api/Products/', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:23.300' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (29, N'localhost:7260', N'GET       ', N'/Images/60.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:23.767' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (30, N'localhost:7260', N'GET       ', N'/Images/61.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:23.767' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (31, N'localhost:7260', N'GET       ', N'/Images/31.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:23.780' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (32, N'localhost:7260', N'GET       ', N'/Images/35.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:23.767' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (33, N'localhost:7260', N'GET       ', N'/Images/38.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:23.767' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (34, N'localhost:7260', N'GET       ', N'/Images/30.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:23.777' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (35, N'localhost:7260', N'GET       ', N'/Images/63.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:23.807' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (36, N'localhost:7260', N'GET       ', N'/Images/54.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:23.857' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (37, N'localhost:7260', N'GET       ', N'/Images/34.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:23.857' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (38, N'localhost:7260', N'GET       ', N'/Images/36.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:23.790' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (39, N'localhost:7260', N'GET       ', N'/Images/27.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:23.803' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (40, N'localhost:7260', N'GET       ', N'/Images/55.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:23.807' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (41, N'localhost:7260', N'GET       ', N'/Images/40.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:23.807' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (42, N'localhost:7260', N'GET       ', N'/Images/51.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:23.860' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (43, N'localhost:7260', N'GET       ', N'/Images/64.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:23.870' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (44, N'localhost:7260', N'GET       ', N'/Images/66.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:23.870' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (45, N'localhost:7260', N'GET       ', N'/Images/43.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:23.860' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (46, N'localhost:7260', N'GET       ', N'/Images/46.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:23.860' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (47, N'localhost:7260', N'GET       ', N'/Images/52.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:23.873' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (48, N'localhost:7260', N'GET       ', N'/Images/15.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:23.873' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (49, N'localhost:7260', N'GET       ', N'/Images/16.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:23.873' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (50, N'localhost:7260', N'GET       ', N'/Images/67.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:23.877' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (51, N'localhost:7260', N'GET       ', N'/Images/8.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:23.877' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (52, N'localhost:7260', N'GET       ', N'/api/Products/', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:36.947' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (53, N'localhost:7260', N'GET       ', N'/api/Products/', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:37.880' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (54, N'localhost:7260', N'GET       ', N'/Images/15.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:37.907' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (55, N'localhost:7260', N'GET       ', N'/Images/8.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:37.907' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (56, N'localhost:7260', N'GET       ', N'/Images/16.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:37.907' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (57, N'localhost:7260', N'GET       ', N'/api/Products/', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:39.440' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (58, N'localhost:7260', N'GET       ', N'/Images/8.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:39.460' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (59, N'localhost:7260', N'GET       ', N'/Images/15.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:39.460' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (60, N'localhost:7260', N'GET       ', N'/Images/16.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:39.460' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (61, N'localhost:7260', N'GET       ', N'/api/Products/', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:40.640' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (62, N'localhost:7260', N'GET       ', N'/Images/16.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:40.660' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (63, N'localhost:7260', N'GET       ', N'/Images/15.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:40.660' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (64, N'localhost:7260', N'GET       ', N'/Images/8.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:40.660' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (65, N'localhost:7260', N'GET       ', N'/api/Products/', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:41.487' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (66, N'localhost:7260', N'GET       ', N'/api/Products/', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:42.243' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (67, N'localhost:7260', N'GET       ', N'/Images/16.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:42.263' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (68, N'localhost:7260', N'GET       ', N'/Images/8.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:42.263' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (69, N'localhost:7260', N'GET       ', N'/Images/15.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:42.263' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (70, N'localhost:7260', N'GET       ', N'/api/Products/', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:43.377' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (71, N'localhost:7260', N'GET       ', N'/api/Products/', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:44.023' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (72, N'localhost:7260', N'GET       ', N'/Images/8.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:44.050' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (73, N'localhost:7260', N'GET       ', N'/Images/15.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:44.050' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (74, N'localhost:7260', N'GET       ', N'/Images/16.jpeg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:29:44.050' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (75, N'localhost:7260', N'GET       ', N'/Products.html', N'', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:31:19.160' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (76, N'localhost:7260', N'GET       ', N'/Images/searchIcon.svg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:31:19.180' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (77, N'localhost:7260', N'GET       ', N'/api/Categories', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:31:19.227' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (78, N'localhost:7260', N'GET       ', N'/api/Products/', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:31:19.227' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (79, N'localhost:7260', N'GET       ', N'/Images/8.webp', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:31:19.260' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (80, N'localhost:7260', N'GET       ', N'/Images/15.png', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:31:19.260' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (81, N'localhost:7260', N'GET       ', N'/Images/16.png', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:31:19.260' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (82, N'localhost:7260', N'GET       ', N'/Products.html', N'', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:31:48.503' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (83, N'localhost:7260', N'GET       ', N'/Images/searchIcon.svg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:31:48.523' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (84, N'localhost:7260', N'GET       ', N'/api/Categories', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:31:48.573' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (85, N'localhost:7260', N'GET       ', N'/api/Products/', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:31:48.573' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (86, N'localhost:7260', N'GET       ', N'/Images/15.jpg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:31:48.607' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (87, N'localhost:7260', N'GET       ', N'/Images/16.jpg', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:31:48.607' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (88, N'localhost:7260', N'GET       ', N'/ShoppingBag.html', N'https://localhost:7260/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:32:24.447' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (89, N'localhost:7260', N'GET       ', N'/Styles/ShoppingBag.css', N'https://localhost:7260/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:32:24.467' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (90, N'localhost:7260', N'GET       ', N'/Scripts/ShoppingBag.js', N'https://localhost:7260/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:32:24.470' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (91, N'localhost:7260', N'GET       ', N'/Images/icn-remove.png', N'https://localhost:7260/Styles/ShoppingBag.css', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:32:24.520' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (92, N'localhost:7260', N'GET       ', N'/Images/searchIcon.svg', N'https://localhost:7260/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:32:27.537' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (93, N'localhost:7260', N'GET       ', N'/api/Products/', N'https://localhost:7260/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:32:27.583' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (94, N'localhost:7260', N'GET       ', N'/api/Categories', N'https://localhost:7260/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:32:27.583' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (95, N'localhost:7260', N'GET       ', N'/Products.html', N'https://localhost:7260/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:34:55.020' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (96, N'localhost:7260', N'GET       ', N'/Images/searchIcon.svg', N'https://localhost:7260/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:34:55.047' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (97, N'localhost:7260', N'GET       ', N'/api/Products/', N'https://localhost:7260/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:34:55.137' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (98, N'localhost:7260', N'GET       ', N'/api/Categories', N'https://localhost:7260/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:34:55.137' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (99, N'localhost:7260', N'GET       ', N'/api/Products/', N'https://localhost:7260/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:35:00.810' AS DateTime))
GO
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (100, N'localhost:7260', N'GET       ', N'/api/Products/', N'https://localhost:7260/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:35:03.977' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (101, N'localhost:7260', N'GET       ', N'/Products.html', N'https://localhost:7260/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:36:31.057' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (102, N'localhost:7260', N'GET       ', N'/api/Products/', N'https://localhost:7260/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:36:31.130' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (103, N'localhost:7260', N'GET       ', N'/api/Categories', N'https://localhost:7260/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:36:31.130' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (104, N'localhost:7260', N'GET       ', N'/api/Products/', N'https://localhost:7260/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:36:47.033' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (105, N'localhost:7260', N'GET       ', N'/api/Products/', N'https://localhost:7260/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:36:48.073' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (106, N'localhost:7260', N'GET       ', N'/api/Products/', N'https://localhost:7260/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:36:49.183' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (107, N'localhost:7260', N'GET       ', N'/api/Products/', N'https://localhost:7260/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:36:49.973' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (108, N'localhost:7260', N'GET       ', N'/api/Products/', N'https://localhost:7260/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:36:50.697' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (109, N'localhost:7260', N'GET       ', N'/api/Products/', N'https://localhost:7260/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:36:51.333' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (110, N'localhost:7260', N'GET       ', N'/api/Products/', N'https://localhost:7260/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:36:52.743' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (111, N'localhost:7260', N'GET       ', N'/api/Products/', N'https://localhost:7260/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', CAST(N'2025-03-04T20:36:54.650' AS DateTime))
SET IDENTITY_INSERT [dbo].[Rating] OFF
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Orders]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Products1] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Products1]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
