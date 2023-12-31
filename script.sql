USE [Busticketsale]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/31/2023 5:35:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[CustomerOrder] [int] NULL,
	[IsActive] [bit] NULL,
	[Password] [nvarchar](50) NULL,
	[Images] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[SĐT] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerOrder]    Script Date: 12/31/2023 5:35:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerOrder](
	[CustomerOrderID] [bigint] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[SĐT] [nvarchar](10) NULL,
	[Email] [nvarchar](50) NULL,
	[PointStrDetail] [nvarchar](255) NULL,
	[PointEndDetail] [nvarchar](255) NULL,
	[ProvinceStr] [nvarchar](255) NULL,
	[ProvinceEnd] [nvarchar](255) NULL,
	[IsActive] [bit] NULL,
	[Date] [date] NULL,
	[Status] [int] NULL,
	[Seat] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[time] [nvarchar](50) NULL,
	[CustomerID] [int] NULL,
	[BookingOrderID] [bigint] NULL,
	[TotalPrice] [nvarchar](50) NULL,
 CONSTRAINT [PK_CustomerOrder] PRIMARY KEY CLUSTERED 
(
	[CustomerOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_CustomerOrder]    Script Date: 12/31/2023 5:35:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_CustomerOrder]
AS
SELECT        dbo.CustomerOrder.*
FROM            dbo.Customer INNER JOIN
                         dbo.CustomerOrder ON dbo.Customer.CustomerID = dbo.CustomerOrder.CustomerID
GO
/****** Object:  Table [dbo].[BookingOrder]    Script Date: 12/31/2023 5:35:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingOrder](
	[BookingOrderID] [bigint] IDENTITY(1,1) NOT NULL,
	[Time] [nvarchar](50) NULL,
	[ArrivalTime] [nvarchar](50) NULL,
	[ProvinceStart] [nvarchar](50) NULL,
	[ProvinceEnd] [nvarchar](50) NULL,
	[PointStart] [nvarchar](100) NULL,
	[PointEnd] [nvarchar](100) NULL,
	[Price] [nvarchar](50) NULL,
	[BookingID] [bigint] NULL,
	[IsActive] [bit] NULL,
	[Date] [date] NULL,
	[ItemTarget] [nvarchar](50) NULL,
	[IdName] [nvarchar](50) NULL,
	[DetailPointID] [int] NULL,
	[Seat] [int] NULL,
	[CustomerOrderID] [bigint] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_BookingOrderss] PRIMARY KEY CLUSTERED 
(
	[BookingOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 12/31/2023 5:35:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[BookingID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProvinceStarts] [nvarchar](255) NULL,
	[ProvinceEnds] [nvarchar](255) NULL,
	[IsActive] [bit] NULL,
	[Status] [int] NULL,
	[BookingOrder] [int] NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_BookingOrder]    Script Date: 12/31/2023 5:35:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_BookingOrder]
AS
SELECT        dbo.BookingOrder.BookingID AS Expr1, dbo.Booking.ProvinceStarts, dbo.Booking.ProvinceEnds, dbo.BookingOrder.*, dbo.Booking.BookingID AS Expr2
FROM            dbo.BookingOrder INNER JOIN
                         dbo.Booking ON dbo.BookingOrder.BookingID = dbo.Booking.BookingID
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 12/31/2023 5:35:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[MenuID] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[ControllerName] [nvarchar](50) NULL,
	[ActionName] [nvarchar](50) NULL,
	[Levels] [int] NULL,
	[ParentID] [int] NULL,
	[Link] [nvarchar](50) NULL,
	[MenuOrder] [int] NULL,
	[Position] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 12/31/2023 5:35:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[PostID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Abstract] [nvarchar](255) NULL,
	[Contents] [ntext] NULL,
	[Images] [nvarchar](255) NULL,
	[Link] [nvarchar](255) NULL,
	[Author] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[PostOrder] [int] NULL,
	[MenuID] [int] NULL,
	[Category] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Post_Menu]    Script Date: 12/31/2023 5:35:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Post_Menu]
AS
SELECT        dbo.Post.*, dbo.Menu.MenuName
FROM            dbo.Post INNER JOIN
                         dbo.Menu ON dbo.Post.MenuID = dbo.Menu.MenuID
GO
/****** Object:  View [dbo].[View_CustomerBooking]    Script Date: 12/31/2023 5:35:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_CustomerBooking]
AS
SELECT        dbo.BookingOrder.CustomerOrderID, dbo.CustomerOrder.Seat, dbo.CustomerOrder.Status
FROM            dbo.BookingOrder INNER JOIN
                         dbo.CustomerOrder ON dbo.BookingOrder.CustomerOrderID = dbo.CustomerOrder.CustomerOrderID
GO
/****** Object:  Table [dbo].[AdminMenu]    Script Date: 12/31/2023 5:35:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminMenu](
	[AdminMenuID] [bigint] IDENTITY(1,1) NOT NULL,
	[ItemName] [nvarchar](50) NULL,
	[ItemLevel] [int] NULL,
	[ParentLevel] [int] NULL,
	[ItemOrder] [int] NULL,
	[IsActive] [bit] NULL,
	[ItemTarget] [nvarchar](50) NULL,
	[AreaName] [nvarchar](50) NULL,
	[ControllerName] [nvarchar](50) NULL,
	[ActionName] [nvarchar](50) NULL,
	[Icon] [nvarchar](50) NULL,
	[IdName] [nvarchar](50) NULL,
 CONSTRAINT [PK_AdminMenu] PRIMARY KEY CLUSTERED 
(
	[AdminMenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdminUser]    Script Date: 12/31/2023 5:35:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminUser](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NULL,
	[Email] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[Position] [int] NULL,
	[Images] [nvarchar](255) NULL,
 CONSTRAINT [PK_AdminUser] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactQuality]    Script Date: 12/31/2023 5:35:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactQuality](
	[ContactQualityID] [bigint] IDENTITY(1,1) NOT NULL,
	[Images] [nvarchar](255) NULL,
	[Title] [nvarchar](100) NULL,
	[Phone] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[Status] [int] NULL,
	[ContactOrder] [int] NULL,
	[Position] [int] NULL,
	[Description] [nvarchar](100) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ContactQualityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerComment]    Script Date: 12/31/2023 5:35:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerComment](
	[CommentID] [bigint] IDENTITY(1,1) NOT NULL,
	[Images] [nvarchar](250) NULL,
	[FullName] [nvarchar](50) NULL,
	[Content] [text] NULL,
	[IsActive] [bit] NULL,
	[Status] [int] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_CustomerComment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailPoint]    Script Date: 12/31/2023 5:35:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailPoint](
	[DetailPointID] [int] IDENTITY(1,1) NOT NULL,
	[DetailPointStart] [nvarchar](255) NULL,
	[DetailPointEnd] [nvarchar](255) NULL,
	[IsActive] [bit] NULL,
	[Time] [nvarchar](50) NULL,
 CONSTRAINT [PK_DetailPoints] PRIMARY KEY CLUSTERED 
(
	[DetailPointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Investors]    Script Date: 12/31/2023 5:35:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Investors](
	[InvestorsID] [bigint] IDENTITY(1,1) NOT NULL,
	[Images] [nvarchar](255) NULL,
	[IsActive] [bit] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Investors] PRIMARY KEY CLUSTERED 
(
	[InvestorsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Route]    Script Date: 12/31/2023 5:35:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Route](
	[RouteID] [bigint] IDENTITY(1,1) NOT NULL,
	[IsActive] [bit] NULL,
	[Images] [nvarchar](255) NULL,
	[PointOfDe] [nvarchar](100) NULL,
	[StopPoint] [nvarchar](100) NULL,
	[Status] [int] NULL,
	[RouteOrder] [int] NULL,
	[Price] [nvarchar](100) NULL,
 CONSTRAINT [PK_Route] PRIMARY KEY CLUSTERED 
(
	[RouteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 12/31/2023 5:35:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ServiceID] [bigint] IDENTITY(1,1) NOT NULL,
	[Images] [nvarchar](255) NULL,
	[ServiceName] [nvarchar](100) NULL,
	[ServiceDesc] [nvarchar](255) NULL,
	[IsActive] [bit] NULL,
	[Status] [int] NULL,
	[ServiceOrder] [int] NULL,
	[LeftRight] [int] NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AdminMenu] ON 

INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (1, N'Bảng điều khiển', 0, 0, 1, 0, NULL, N'Admin', N'Home', N'Index', NULL, NULL)
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (2, N'Thông tin cá nhân', 0, 0, 2, 0, NULL, N'Admin', N'Home', N'Index', NULL, NULL)
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (3, N'Hướng dẫn sử dụng', 0, 0, 3, 0, NULL, N'Admin', N'Home', N'Index', NULL, NULL)
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (4, N'Liên lạc', 0, 0, 4, 0, NULL, N'Admin', N'Home', N'Index', NULL, NULL)
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (5, N'Đăng Xuất', 0, 0, 5, 0, NULL, N'Admin', N'Home', N'Index', NULL, NULL)
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (6, N'Quản lí bài viết', 1, 0, 1, 1, N'components-nav', N'Admin', N'Home', N'Index', N'bi bi-menu-button-wide', N'components-nav')
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (7, N'Cập nhật bài viết', 2, 6, 1, 1, NULL, N'Admin', N'Post', N'Index', NULL, NULL)
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (9, N'Quản lí Menu', 1, 0, 2, 1, N'components-mn', N'Admin', N'Home', N'Index', N'bi bi-menu-button-wide', N'components-mn')
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (10, N'Menu Header', 2, 9, 1, 1, NULL, N'Admin', N'Menu', N'Index', NULL, NULL)
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (11, N'Menu Footer', 2, 9, 1, 1, NULL, N'Admin', N'MenuFooter', N'Index', NULL, NULL)
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (12, N'MenuAdmin', 2, 9, 2, 1, NULL, N'Admin', N'MenuAdmin', N'Index', NULL, NULL)
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (13, N'MenuChillAdmin', 2, 9, 1, 1, NULL, N'Admin', N'MenuChill', N'Index', NULL, NULL)
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (10013, N'Quản lí các tuyến đường', 1, 0, 1, 1, N'componentts-router', N'Admin', N'Home', N'Index', NULL, N'componentts-router')
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (10014, N'Cập nhật tuyến đường', 2, 10013, 1, 1, NULL, N'Admin', N'Route', N'Index', NULL, NULL)
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (10015, N'Quản lí dịch vụ', 1, 0, 1, 1, N'componentts-service', N'Admin', N'Home', N'Index', NULL, N'componentts-service')
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (10016, N'Cập nhật dịch vụ', 2, 10015, 1, 1, NULL, N'Admin', N'Service', N'Index', NULL, NULL)
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (10017, N'Quản lí liên hệ', 1, 0, 1, 1, N'componentts-contact', N'Admin', N'Home', N'Index', NULL, N'componentts-contact')
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (10018, N'Cập nhật liên hệ', 2, 10017, 1, 1, NULL, N'Admin', N'Contact', N'Index', NULL, NULL)
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (10019, N'Quản lí Chất lượng', 1, 0, 1, 1, N'componentts-quality', N'Admin', N'Home', N'Index', NULL, N'componentts-quality')
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (10020, N'Cập nhật chất lượng', 2, 10019, 1, 1, NULL, N'Admin', N'Quality', N'Index', NULL, NULL)
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (10021, N'Quản lí tài khoản', 1, 0, 1, 1, N'componentts-user', N'Admin', N'Home', N'Index', NULL, N'componentts-user')
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (10022, N'Cập nhật tài khoản Admin', 2, 10021, 1, 1, NULL, N'Admin', N'AdminUser', N'Index', NULL, NULL)
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (10023, N'Cập nhật tài khoản khách hàng', 2, 10021, 1, 1, NULL, N'Admin', N'Customer', N'Index', NULL, NULL)
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (10024, N'Quản lí các chuyển xe', 1, 0, 1, 1, N'componentts-bus', N'Admin', N'Home', N'Index', NULL, N'componentts-bus')
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (10025, N'Cập nhật các chuyển xe', 2, 10024, 1, 1, NULL, N'Admin', N'Buses', N'Index', NULL, NULL)
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (10026, N'Cập nhật các tỉnh đi tỉnh đến', 2, 10024, 1, 1, NULL, N'Admin', N'Province', N'Index', NULL, NULL)
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (10027, N'Quản lí khách hàng đặt vé', 1, 0, 1, 1, N'componentts-CustomerOrder', N'Admin', N'Home', N'Index', NULL, N'componentts-CustomerOrder')
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (10028, N'Cập nhật thông tin đặt vé', 2, 10027, 1, 1, NULL, N'Admin', N'CustomerOrder', N'Index', NULL, NULL)
SET IDENTITY_INSERT [dbo].[AdminMenu] OFF
GO
SET IDENTITY_INSERT [dbo].[AdminUser] ON 

INSERT [dbo].[AdminUser] ([UserID], [UserName], [Password], [Email], [IsActive], [Position], [Images]) VALUES (2, N'Nguyễn Văn Minh', N'd411cf68bd7f71d13fb053154f455651', N'vanminh0344443924@gmail.com', 1, NULL, N'/Files/images/dichvu.jpg')
INSERT [dbo].[AdminUser] ([UserID], [UserName], [Password], [Email], [IsActive], [Position], [Images]) VALUES (3, N'Nguyễn Văn Minh', N'd411cf68bd7f71d13fb053154f455651', N'vanminh@gmail.com', 1, 0, N'/Files/images/dichvu.jpg')
SET IDENTITY_INSERT [dbo].[AdminUser] OFF
GO
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([BookingID], [ProvinceStarts], [ProvinceEnds], [IsActive], [Status], [BookingOrder]) VALUES (2, N'Nghệ An', N'Hà Nội', 0, 1, 0)
INSERT [dbo].[Booking] ([BookingID], [ProvinceStarts], [ProvinceEnds], [IsActive], [Status], [BookingOrder]) VALUES (3, N'Thanh Hoá', N'Hà Tĩnh', 0, 1, 0)
INSERT [dbo].[Booking] ([BookingID], [ProvinceStarts], [ProvinceEnds], [IsActive], [Status], [BookingOrder]) VALUES (4, N'Nam Định', N'hà giang', 0, 1, 0)
INSERT [dbo].[Booking] ([BookingID], [ProvinceStarts], [ProvinceEnds], [IsActive], [Status], [BookingOrder]) VALUES (5, N'bắc giang', N'Nam định', 0, 1, 0)
INSERT [dbo].[Booking] ([BookingID], [ProvinceStarts], [ProvinceEnds], [IsActive], [Status], [BookingOrder]) VALUES (8, N'Hà Nội', N'Hà Nội', 1, 1, 0)
INSERT [dbo].[Booking] ([BookingID], [ProvinceStarts], [ProvinceEnds], [IsActive], [Status], [BookingOrder]) VALUES (9, N'Nghệ An', N'Nghệ An', 1, 1, 0)
INSERT [dbo].[Booking] ([BookingID], [ProvinceStarts], [ProvinceEnds], [IsActive], [Status], [BookingOrder]) VALUES (10, N'Nam Định', N'Nam Định', 1, 1, 0)
INSERT [dbo].[Booking] ([BookingID], [ProvinceStarts], [ProvinceEnds], [IsActive], [Status], [BookingOrder]) VALUES (11, N'Thanh Hoá', N'Thanh Hoá', 1, 1, 0)
INSERT [dbo].[Booking] ([BookingID], [ProvinceStarts], [ProvinceEnds], [IsActive], [Status], [BookingOrder]) VALUES (12, N'Hà Tĩnh', N'Hà Tĩnh', 1, 1, 0)
SET IDENTITY_INSERT [dbo].[Booking] OFF
GO
SET IDENTITY_INSERT [dbo].[BookingOrder] ON 

INSERT [dbo].[BookingOrder] ([BookingOrderID], [Time], [ArrivalTime], [ProvinceStart], [ProvinceEnd], [PointStart], [PointEnd], [Price], [BookingID], [IsActive], [Date], [ItemTarget], [IdName], [DetailPointID], [Seat], [CustomerOrderID], [Status]) VALUES (1, N'7:00', N'8:00', N'Hà Nội', N'Nghệ An', N'BX Nước Ngầm', N'BX Phía đông', N'250.000', 0, 1, CAST(N'2023-04-20' AS Date), N'booking1', N'booking1', 1, 20, NULL, 1)
INSERT [dbo].[BookingOrder] ([BookingOrderID], [Time], [ArrivalTime], [ProvinceStart], [ProvinceEnd], [PointStart], [PointEnd], [Price], [BookingID], [IsActive], [Date], [ItemTarget], [IdName], [DetailPointID], [Seat], [CustomerOrderID], [Status]) VALUES (2, N'7:00', N'8:00', N'Nghệ an', N'Hà Nội', N'BX Mới', N'BX Mỹ đình', N'250.000', 0, 1, CAST(N'2024-12-03' AS Date), N'booking2', N'booking2', 1, 20, NULL, 1)
INSERT [dbo].[BookingOrder] ([BookingOrderID], [Time], [ArrivalTime], [ProvinceStart], [ProvinceEnd], [PointStart], [PointEnd], [Price], [BookingID], [IsActive], [Date], [ItemTarget], [IdName], [DetailPointID], [Seat], [CustomerOrderID], [Status]) VALUES (3, N'20:00', N'8:00', N'Hà Nội', N'Nghệ An', N'BX Mỹ Đình', N'BX Phía đông', N'250.000', 0, 1, CAST(N'2023-04-20' AS Date), N'booking3', N'booking3', 1, 20, NULL, 1)
INSERT [dbo].[BookingOrder] ([BookingOrderID], [Time], [ArrivalTime], [ProvinceStart], [ProvinceEnd], [PointStart], [PointEnd], [Price], [BookingID], [IsActive], [Date], [ItemTarget], [IdName], [DetailPointID], [Seat], [CustomerOrderID], [Status]) VALUES (4, N'18:00', N'20:00', N'Thanh Hoá', N'Nam định', N'BX sầm sơn', N'BX Giao Thuỷ', N'350.000', 0, 1, CAST(N'2023-04-30' AS Date), N'booking5', N'booking5', 1, 20, NULL, 1)
INSERT [dbo].[BookingOrder] ([BookingOrderID], [Time], [ArrivalTime], [ProvinceStart], [ProvinceEnd], [PointStart], [PointEnd], [Price], [BookingID], [IsActive], [Date], [ItemTarget], [IdName], [DetailPointID], [Seat], [CustomerOrderID], [Status]) VALUES (5, N'18:00', N'4h', N'Nghệ an', N'Hà Nội', N'BX Phía đông', N'Bến Xe Mỹ đình', N'450.000', 0, 1, CAST(N'2023-05-25' AS Date), N'Booking-6', N'Booking-6', NULL, 20, NULL, 1)
INSERT [dbo].[BookingOrder] ([BookingOrderID], [Time], [ArrivalTime], [ProvinceStart], [ProvinceEnd], [PointStart], [PointEnd], [Price], [BookingID], [IsActive], [Date], [ItemTarget], [IdName], [DetailPointID], [Seat], [CustomerOrderID], [Status]) VALUES (6, N'18:00', N'4:00', N'Thanh Hoá', N'Nam định', N'BX sầm sơn', N'BX Giao Thuỷ', N'250.000', 0, 1, CAST(N'2023-06-15' AS Date), N'samson', N'samson', NULL, 19, NULL, 1)
INSERT [dbo].[BookingOrder] ([BookingOrderID], [Time], [ArrivalTime], [ProvinceStart], [ProvinceEnd], [PointStart], [PointEnd], [Price], [BookingID], [IsActive], [Date], [ItemTarget], [IdName], [DetailPointID], [Seat], [CustomerOrderID], [Status]) VALUES (7, N'20:00', N'5:00', N'Thanh Hoá', N'Nam định', N'BX sầm sơn', N'BX Nam Định', N'350.000', 0, 1, CAST(N'2023-06-15' AS Date), N'thss', N'thss', NULL, 19, NULL, 1)
INSERT [dbo].[BookingOrder] ([BookingOrderID], [Time], [ArrivalTime], [ProvinceStart], [ProvinceEnd], [PointStart], [PointEnd], [Price], [BookingID], [IsActive], [Date], [ItemTarget], [IdName], [DetailPointID], [Seat], [CustomerOrderID], [Status]) VALUES (8, N'18:00', N'5:00', N'Nghệ An', N'Hà Nội', N'BX Bắc Vinh', N'BX Mỹ Đình', N'300.000', 0, 1, CAST(N'2023-11-03' AS Date), N'Customer-v', N'Customer-v', NULL, 20, NULL, 1)
INSERT [dbo].[BookingOrder] ([BookingOrderID], [Time], [ArrivalTime], [ProvinceStart], [ProvinceEnd], [PointStart], [PointEnd], [Price], [BookingID], [IsActive], [Date], [ItemTarget], [IdName], [DetailPointID], [Seat], [CustomerOrderID], [Status]) VALUES (9, N'23:30', N'4:00', N'Thanh Hoá', N'Nghệ An', N'BX sầm sơn', N'Thị Trấn Quán hành', N'200.000', 0, 1, CAST(N'2023-11-03' AS Date), N'Customer-H', N'Customer-H', NULL, 34, NULL, 1)
INSERT [dbo].[BookingOrder] ([BookingOrderID], [Time], [ArrivalTime], [ProvinceStart], [ProvinceEnd], [PointStart], [PointEnd], [Price], [BookingID], [IsActive], [Date], [ItemTarget], [IdName], [DetailPointID], [Seat], [CustomerOrderID], [Status]) VALUES (10, N'20:00', N'24:00', N'Nghệ an', N'Hà Nội', N'BX Bắc Vinh', N'BX Mỹ Đình', N'200.000', 0, 1, CAST(N'2023-11-03' AS Date), N'Customer-N', N'Customer-N', NULL, 34, NULL, 1)
INSERT [dbo].[BookingOrder] ([BookingOrderID], [Time], [ArrivalTime], [ProvinceStart], [ProvinceEnd], [PointStart], [PointEnd], [Price], [BookingID], [IsActive], [Date], [ItemTarget], [IdName], [DetailPointID], [Seat], [CustomerOrderID], [Status]) VALUES (11, N'18:00', N'5:00', N'Nghệ an', N'Hà Nội', N'BX Phía đông', N'Bến Xe Mỹ đình', N'350.000', 0, 1, CAST(N'2023-12-08' AS Date), N'Customer-n', N'Customer-n', NULL, 20, NULL, 1)
INSERT [dbo].[BookingOrder] ([BookingOrderID], [Time], [ArrivalTime], [ProvinceStart], [ProvinceEnd], [PointStart], [PointEnd], [Price], [BookingID], [IsActive], [Date], [ItemTarget], [IdName], [DetailPointID], [Seat], [CustomerOrderID], [Status]) VALUES (12, N'23:30', N'4:00', N'Nghệ an', N'Hà Nội', N'BX Bắc Vinh', N'BX Nam Định', N'450.000', 0, 1, CAST(N'2023-12-08' AS Date), N'Customer-s', N'Customer-s', NULL, 20, NULL, 1)
INSERT [dbo].[BookingOrder] ([BookingOrderID], [Time], [ArrivalTime], [ProvinceStart], [ProvinceEnd], [PointStart], [PointEnd], [Price], [BookingID], [IsActive], [Date], [ItemTarget], [IdName], [DetailPointID], [Seat], [CustomerOrderID], [Status]) VALUES (14, N'21:00', N'5:00', N'Nghệ An', N'Hà Nội', N'BX Bắc Vinh', N'BX Mỹ Đình', N'350.000', 0, 1, CAST(N'2023-12-21' AS Date), N'N', N'N', NULL, 20, NULL, NULL)
INSERT [dbo].[BookingOrder] ([BookingOrderID], [Time], [ArrivalTime], [ProvinceStart], [ProvinceEnd], [PointStart], [PointEnd], [Price], [BookingID], [IsActive], [Date], [ItemTarget], [IdName], [DetailPointID], [Seat], [CustomerOrderID], [Status]) VALUES (15, N'18:00', N'5:00', N'Nghệ An', N'Hà Nội', N'Bến Xe Bắc vinh', N'Bến Xe Mỹ đình', N'450.000', 0, 1, CAST(N'2023-12-21' AS Date), N'h', N'h', NULL, 20, NULL, NULL)
INSERT [dbo].[BookingOrder] ([BookingOrderID], [Time], [ArrivalTime], [ProvinceStart], [ProvinceEnd], [PointStart], [PointEnd], [Price], [BookingID], [IsActive], [Date], [ItemTarget], [IdName], [DetailPointID], [Seat], [CustomerOrderID], [Status]) VALUES (16, N'18:00', N'4:00', N'Nghệ An', N'Hà Nội', N'Bến Xe phía đông', N'Bến Xe Mỹ hậu', N'350.000', 0, 1, CAST(N'2023-12-21' AS Date), N'm', N'm', NULL, 20, NULL, NULL)
INSERT [dbo].[BookingOrder] ([BookingOrderID], [Time], [ArrivalTime], [ProvinceStart], [ProvinceEnd], [PointStart], [PointEnd], [Price], [BookingID], [IsActive], [Date], [ItemTarget], [IdName], [DetailPointID], [Seat], [CustomerOrderID], [Status]) VALUES (17, N'18:00', N'4:00', N'Hà Nội', N'Nghệ An', N'Bến Xe Bắc vinh', N'Bến Xe Mỹ đình', N'250.000', 0, 1, CAST(N'2023-12-23' AS Date), N'hn', N'hn', NULL, 20, NULL, NULL)
INSERT [dbo].[BookingOrder] ([BookingOrderID], [Time], [ArrivalTime], [ProvinceStart], [ProvinceEnd], [PointStart], [PointEnd], [Price], [BookingID], [IsActive], [Date], [ItemTarget], [IdName], [DetailPointID], [Seat], [CustomerOrderID], [Status]) VALUES (18, N'23:30', N'5:00', N'Nghệ An', N'Hà Nội', N'Bến Xe Bắc vinh', N'Bến Xe Mỹ đình', N'450.000', 0, 1, CAST(N'2023-12-23' AS Date), N'nh', N'nh', NULL, 20, NULL, NULL)
INSERT [dbo].[BookingOrder] ([BookingOrderID], [Time], [ArrivalTime], [ProvinceStart], [ProvinceEnd], [PointStart], [PointEnd], [Price], [BookingID], [IsActive], [Date], [ItemTarget], [IdName], [DetailPointID], [Seat], [CustomerOrderID], [Status]) VALUES (19, N'20:00', N'4:00', N'Nghệ An', N'Hà Nội', N'Bến Xe Bắc vinh', N'Bến Xe Mỹ hậu', N'450.000', 0, 1, CAST(N'2023-12-23' AS Date), N'nh1', N'nh1', NULL, 20, NULL, NULL)
INSERT [dbo].[BookingOrder] ([BookingOrderID], [Time], [ArrivalTime], [ProvinceStart], [ProvinceEnd], [PointStart], [PointEnd], [Price], [BookingID], [IsActive], [Date], [ItemTarget], [IdName], [DetailPointID], [Seat], [CustomerOrderID], [Status]) VALUES (20, N'20:00', N'5:00', N'Nghệ An', N'Hà Nội', N'Bến Xe Bắc vinh', N'Bến Xe Mỹ hậu', N'350.000', 0, 1, CAST(N'2023-12-23' AS Date), N'nt', N'nt', NULL, 20, NULL, NULL)
INSERT [dbo].[BookingOrder] ([BookingOrderID], [Time], [ArrivalTime], [ProvinceStart], [ProvinceEnd], [PointStart], [PointEnd], [Price], [BookingID], [IsActive], [Date], [ItemTarget], [IdName], [DetailPointID], [Seat], [CustomerOrderID], [Status]) VALUES (21, N'20:00', N'4:00', N'Hà Nội', N'Nghệ An', N'Bến Xe phía đông', N'Bến Xe sầm sơn', N'450.000', 0, 1, CAST(N'2023-12-23' AS Date), N'ht', N'ht', NULL, 20, NULL, NULL)
SET IDENTITY_INSERT [dbo].[BookingOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[ContactQuality] ON 

INSERT [dbo].[ContactQuality] ([ContactQualityID], [Images], [Title], [Phone], [IsActive], [Status], [ContactOrder], [Position], [Description]) VALUES (1, N'./assets/img/datve.png', N'Đặt vé qua hotline', N'1900 6467', 1, 1, 1, 1, NULL)
INSERT [dbo].[ContactQuality] ([ContactQualityID], [Images], [Title], [Phone], [IsActive], [Status], [ContactOrder], [Position], [Description]) VALUES (2, N'./assets/img/gưihang.png', N'Gửi hàng siêu tốc', N'1900 6762', 1, 1, 2, 1, NULL)
INSERT [dbo].[ContactQuality] ([ContactQualityID], [Images], [Title], [Phone], [IsActive], [Status], [ContactOrder], [Position], [Description]) VALUES (3, N'./assets/img/gưihang.png', N'Mua vé trực tiếp tại văn phòng', N'1900 6467', 1, 1, 3, 1, NULL)
INSERT [dbo].[ContactQuality] ([ContactQualityID], [Images], [Title], [Phone], [IsActive], [Status], [ContactOrder], [Position], [Description]) VALUES (8, N'./assets/img/xc_ticket.png', N'Dịch vụ uy tín', NULL, 1, 1, 1, 2, N'Xuất bến đúng giờ, cam kết KHÔNG bắt khách dọc đường.')
INSERT [dbo].[ContactQuality] ([ContactQualityID], [Images], [Title], [Phone], [IsActive], [Status], [ContactOrder], [Position], [Description]) VALUES (9, N'./assets/img/xc_bus.png', N'Giữ chỗ 100%', NULL, 1, 1, 1, 2, N'Mọi hành khách đặt vé sẽ được giữ chỗ 100%, KHÔNG để khách nằm luồng.')
INSERT [dbo].[ContactQuality] ([ContactQualityID], [Images], [Title], [Phone], [IsActive], [Status], [ContactOrder], [Position], [Description]) VALUES (10, N'./assets/img/xc_seat.png', N'Giá vé ổn định', NULL, 1, 1, 1, 2, N'Cam kết bán đúng giá niêm yết, KHÔNG tăng giá dịp lễ Tết.')
INSERT [dbo].[ContactQuality] ([ContactQualityID], [Images], [Title], [Phone], [IsActive], [Status], [ContactOrder], [Position], [Description]) VALUES (11, NULL, N'123', NULL, 1, 1, 1, 0, NULL)
INSERT [dbo].[ContactQuality] ([ContactQualityID], [Images], [Title], [Phone], [IsActive], [Status], [ContactOrder], [Position], [Description]) VALUES (12, NULL, N'123', NULL, 1, 1, 1, 0, NULL)
INSERT [dbo].[ContactQuality] ([ContactQualityID], [Images], [Title], [Phone], [IsActive], [Status], [ContactOrder], [Position], [Description]) VALUES (13, NULL, N'123', N'111', 1, 1, 1, 0, NULL)
SET IDENTITY_INSERT [dbo].[ContactQuality] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [FullName], [CustomerOrder], [IsActive], [Password], [Images], [Email], [SĐT]) VALUES (1, N'Nguyễn Văn Minh', 0, 1, N'd0afd43f169f68af6d56cf454d74b167', N'/Files/images/slider.jpg', N'vanminh@gmail.com', N'0379482055')
INSERT [dbo].[Customer] ([CustomerID], [FullName], [CustomerOrder], [IsActive], [Password], [Images], [Email], [SĐT]) VALUES (5, N'Nguyễn Văn An', 0, 1, N'd0afd43f169f68af6d56cf454d74b167', N'/Files/imgaes/carousel-2.jpg', N'An@gmail.com', N'0345678902')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerComment] ON 

INSERT [dbo].[CustomerComment] ([CommentID], [Images], [FullName], [Content], [IsActive], [Status], [CreateDate]) VALUES (5, N'/Files/images/slider.jpg', N'Nguyễn Văn Minh', N' nhà xe ch?t lu?ng', 1, 1, CAST(N'2023-05-09T23:35:26.600' AS DateTime))
INSERT [dbo].[CustomerComment] ([CommentID], [Images], [FullName], [Content], [IsActive], [Status], [CreateDate]) VALUES (6, N'/Files/images/slider.jpg', N'Nguyễn Văn Minh', N' nhà xe uy tín', 1, 1, CAST(N'2023-05-09T23:39:10.887' AS DateTime))
INSERT [dbo].[CustomerComment] ([CommentID], [Images], [FullName], [Content], [IsActive], [Status], [CreateDate]) VALUES (7, N'/Files/images/dichvu.jpg', N'nguyễn thị loan', N' nhà xe vui tính nhi?t tình', 1, 1, CAST(N'2023-05-10T10:05:53.530' AS DateTime))
INSERT [dbo].[CustomerComment] ([CommentID], [Images], [FullName], [Content], [IsActive], [Status], [CreateDate]) VALUES (8, N'/Files/images/dichvu.jpg', N'Phạm Tuấn Hải', N' nhà xe chât lu?ng', 1, 1, CAST(N'2023-05-11T09:25:06.433' AS DateTime))
INSERT [dbo].[CustomerComment] ([CommentID], [Images], [FullName], [Content], [IsActive], [Status], [CreateDate]) VALUES (9, N'/Files/images/dichvu.jpg', N'nguyễn thị loan', N' nhà xe vui tính nhi?t tình', 1, 1, CAST(N'2023-06-11T07:32:12.313' AS DateTime))
INSERT [dbo].[CustomerComment] ([CommentID], [Images], [FullName], [Content], [IsActive], [Status], [CreateDate]) VALUES (10, N'/Files/images/slider.jpg', N'Nguyễn Văn Minh', N' nhà xe vui tính nhi?t tình', 1, 1, CAST(N'2023-06-11T18:42:13.803' AS DateTime))
INSERT [dbo].[CustomerComment] ([CommentID], [Images], [FullName], [Content], [IsActive], [Status], [CreateDate]) VALUES (11, N'/Files/imgaes/messages-3.jpg', N'Lô Thị Trúc', N' nhà xe uy tín', 1, 1, CAST(N'2023-10-03T09:38:01.573' AS DateTime))
SET IDENTITY_INSERT [dbo].[CustomerComment] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerOrder] ON 

INSERT [dbo].[CustomerOrder] ([CustomerOrderID], [FullName], [SĐT], [Email], [PointStrDetail], [PointEndDetail], [ProvinceStr], [ProvinceEnd], [IsActive], [Date], [Status], [Seat], [CreateDate], [time], [CustomerID], [BookingOrderID], [TotalPrice]) VALUES (10053, N'Nguyễn Văn Minh', N'0379482055', N'vanminh@gmail.com', N'Bến Xe Bắc vinh', N'Bến Xe Mỹ đình', N'Nghệ an', N'Hà Nội', 1, CAST(N'2023-12-08' AS Date), 1, N'5', CAST(N'2023-12-18T10:57:29.433' AS DateTime), N'18:00', 1, 11, N'350.000')
INSERT [dbo].[CustomerOrder] ([CustomerOrderID], [FullName], [SĐT], [Email], [PointStrDetail], [PointEndDetail], [ProvinceStr], [ProvinceEnd], [IsActive], [Date], [Status], [Seat], [CreateDate], [time], [CustomerID], [BookingOrderID], [TotalPrice]) VALUES (10054, N'Nguyễn Văn Minh', N'0379482055', N'vanminh@gmail.com', N'bệnh viện ba lan', N'Bến Xe sầm sơn', N'Nghệ an', N'Hà Nội', 1, CAST(N'2023-12-08' AS Date), 1, N'14', CAST(N'2023-12-18T10:58:44.560' AS DateTime), N'23:30', 1, 12, N'350.000')
INSERT [dbo].[CustomerOrder] ([CustomerOrderID], [FullName], [SĐT], [Email], [PointStrDetail], [PointEndDetail], [ProvinceStr], [ProvinceEnd], [IsActive], [Date], [Status], [Seat], [CreateDate], [time], [CustomerID], [BookingOrderID], [TotalPrice]) VALUES (10055, N'Nguyễn Văn Minh', N'0379482055', N'vanminh@gmail.com', N'Bến Xe Bắc vinh', N'Bến Xe Mỹ đình', N'Nghệ an', N'Hà Nội', 1, CAST(N'2023-12-08' AS Date), 1, N'4', CAST(N'2023-12-18T21:53:56.130' AS DateTime), N'23:30', 1, 12, N'450.000')
INSERT [dbo].[CustomerOrder] ([CustomerOrderID], [FullName], [SĐT], [Email], [PointStrDetail], [PointEndDetail], [ProvinceStr], [ProvinceEnd], [IsActive], [Date], [Status], [Seat], [CreateDate], [time], [CustomerID], [BookingOrderID], [TotalPrice]) VALUES (10056, N'Nguyễn Văn An', N'0345678902', N'An@gmail.com', N'Bến Xe Bắc vinh', N'Bến Xe Mỹ đình', N'Nghệ an', N'Hà Nội', 1, CAST(N'2023-12-08' AS Date), 1, N'12', CAST(N'2023-12-19T10:57:00.317' AS DateTime), N'18:00', 5, 11, N'350.000')
INSERT [dbo].[CustomerOrder] ([CustomerOrderID], [FullName], [SĐT], [Email], [PointStrDetail], [PointEndDetail], [ProvinceStr], [ProvinceEnd], [IsActive], [Date], [Status], [Seat], [CreateDate], [time], [CustomerID], [BookingOrderID], [TotalPrice]) VALUES (10057, N'Nguyễn Văn Minh', N'0379482055', N'vanminh@gmail.com', N'bệnh viện ba lan', N'Bến Xe sầm sơn', N'Nghệ an', N'Hà Nội', 1, CAST(N'2023-12-08' AS Date), 1, N'14', CAST(N'2023-12-19T10:51:23.823' AS DateTime), N'18:00', 1, 11, N'350.000')
INSERT [dbo].[CustomerOrder] ([CustomerOrderID], [FullName], [SĐT], [Email], [PointStrDetail], [PointEndDetail], [ProvinceStr], [ProvinceEnd], [IsActive], [Date], [Status], [Seat], [CreateDate], [time], [CustomerID], [BookingOrderID], [TotalPrice]) VALUES (10058, N'Nguyễn Văn An', N'0345678902', N'An@gmail.com', N'Bến Xe Bắc vinh', N'Bến Xe Mỹ đình', N'Nghệ an', N'Hà Nội', 1, CAST(N'2023-12-08' AS Date), 1, N'12', CAST(N'2023-12-19T11:11:49.117' AS DateTime), N'23:30', 5, 12, N'450.000')
INSERT [dbo].[CustomerOrder] ([CustomerOrderID], [FullName], [SĐT], [Email], [PointStrDetail], [PointEndDetail], [ProvinceStr], [ProvinceEnd], [IsActive], [Date], [Status], [Seat], [CreateDate], [time], [CustomerID], [BookingOrderID], [TotalPrice]) VALUES (10059, N'Nguyễn Văn An', N'0345678902', N'An@gmail.com', N'Bến Xe Bắc vinh', N'Bến Xe Mỹ đình', N'Nghệ an', N'Hà Nội', 1, CAST(N'2023-12-08' AS Date), 1, N'19', CAST(N'2023-12-20T11:08:45.887' AS DateTime), N'23:30', 5, 12, N'450.000')
INSERT [dbo].[CustomerOrder] ([CustomerOrderID], [FullName], [SĐT], [Email], [PointStrDetail], [PointEndDetail], [ProvinceStr], [ProvinceEnd], [IsActive], [Date], [Status], [Seat], [CreateDate], [time], [CustomerID], [BookingOrderID], [TotalPrice]) VALUES (10060, N'Nguyễn Văn An', N'0345678902', N'An@gmail.com', N'Bến Xe Bắc vinh', N'Bến Xe Mỹ đình', N'Nghệ An', N'Hà Nội', 1, CAST(N'2023-12-23' AS Date), 2, N'4', CAST(N'2023-12-23T09:24:04.523' AS DateTime), N'23:30', 5, 18, N'450.000')
INSERT [dbo].[CustomerOrder] ([CustomerOrderID], [FullName], [SĐT], [Email], [PointStrDetail], [PointEndDetail], [ProvinceStr], [ProvinceEnd], [IsActive], [Date], [Status], [Seat], [CreateDate], [time], [CustomerID], [BookingOrderID], [TotalPrice]) VALUES (10061, N'Nguyễn Văn An', N'0345678902', N'An@gmail.com', N'Bến Xe Bắc vinh', N'Bến Xe Mỹ hậu', N'Nghệ An', N'Hà Nội', 1, CAST(N'2023-12-23' AS Date), 1, N'5', CAST(N'2023-12-30T10:09:14.503' AS DateTime), N'20:00', 5, 20, N'350.000')
SET IDENTITY_INSERT [dbo].[CustomerOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[DetailPoint] ON 

INSERT [dbo].[DetailPoint] ([DetailPointID], [DetailPointStart], [DetailPointEnd], [IsActive], [Time]) VALUES (1, N'Bến Xe Bắc vinh', N'Bến Xe Mỹ hậu', 1, N'22:00')
INSERT [dbo].[DetailPoint] ([DetailPointID], [DetailPointStart], [DetailPointEnd], [IsActive], [Time]) VALUES (2, N'Bến Xe Bắc vinh', N'Bến Xe Mỹ đình', 1, N'20:00')
INSERT [dbo].[DetailPoint] ([DetailPointID], [DetailPointStart], [DetailPointEnd], [IsActive], [Time]) VALUES (3, N'bệnh viện ba lan', N'Bến Xe sầm sơn', 1, N'5:00')
INSERT [dbo].[DetailPoint] ([DetailPointID], [DetailPointStart], [DetailPointEnd], [IsActive], [Time]) VALUES (4, N'Bến Xe phía đông', N'quốc lộ 1 a', 1, N'14:00')
SET IDENTITY_INSERT [dbo].[DetailPoint] OFF
GO
SET IDENTITY_INSERT [dbo].[Investors] ON 

INSERT [dbo].[Investors] ([InvestorsID], [Images], [IsActive], [Status]) VALUES (1, N'./assets/img/vendor-1.jpg', 1, 1)
INSERT [dbo].[Investors] ([InvestorsID], [Images], [IsActive], [Status]) VALUES (2, N'./assets/img/vendor-2.jpg', 1, 1)
INSERT [dbo].[Investors] ([InvestorsID], [Images], [IsActive], [Status]) VALUES (3, N'./assets/img/vendor-3.jpg', 1, 1)
INSERT [dbo].[Investors] ([InvestorsID], [Images], [IsActive], [Status]) VALUES (4, N'./assets/img/vendor-4.jpg', 1, 1)
INSERT [dbo].[Investors] ([InvestorsID], [Images], [IsActive], [Status]) VALUES (5, N'./assets/img/vendor-5.jpg', 1, 1)
SET IDENTITY_INSERT [dbo].[Investors] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (1, N'Trang chủ', 1, NULL, NULL, 1, 0, NULL, 1, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (2, N'Dịch vụ vận tải hành khách', 1, NULL, NULL, 1, 0, NULL, 2, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (3, N'Dịch vụ chuyển phát nhanh', 1, NULL, NULL, 1, 0, NULL, 3, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (4, N'Tin Tức', 1, NULL, NULL, 1, 0, NULL, 4, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (5, N'Tuyển dụng', 1, NULL, NULL, 1, 0, NULL, 5, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (6, N'Giới thiệu chung', 1, NULL, NULL, 2, 1, NULL, 1, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (7, N'Giá trị cốt lõi', 1, NULL, NULL, 2, 1, NULL, 2, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (8, N'Sứ mệnh tầm nhìn', 1, NULL, NULL, 2, 1, NULL, 3, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (9, N'Văn hoá doanh nghiệp', 1, NULL, NULL, 2, 1, NULL, 4, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (10, N'Đặt vé trực tuyến', 1, NULL, NULL, 2, 2, NULL, 1, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (11, N'Dòng xe và giá vé', 1, NULL, NULL, 2, 2, NULL, 2, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (13, N'Chính sách đổi trả', 1, NULL, NULL, 2, 2, NULL, 4, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (14, N'Công ty TNHH Văn Minh', 1, NULL, NULL, 1, 0, NULL, 1, 2)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (15, N'Liên Kết Nhanh', 1, NULL, NULL, 1, 0, NULL, 2, 2)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (16, N'Thanh Toán', 1, NULL, NULL, 1, 0, NULL, 3, 2)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (18, N' Địa chỉ : Khách sạn Thân Hoa', 1, NULL, NULL, 2, 14, NULL, 1, 2)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (19, N'Holline : 0975767676', 1, NULL, NULL, 2, 14, NULL, 2, 2)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (20, N'Tổng Đài : 19006467 / 1900 6762', 1, NULL, NULL, 2, 14, NULL, 3, 2)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (21, N'Hệ thống phòng vé', 1, NULL, NULL, 2, 15, NULL, 1, 2)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (22, N'Giờ xuất bến', 1, NULL, NULL, 2, 15, NULL, 2, 2)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (23, N'Điều khoản sử dụng', 1, NULL, NULL, 2, 15, NULL, 3, 2)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (24, N'Thư ngỏ', 1, NULL, NULL, 2, 15, NULL, 4, 2)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (25, N'Liên hệ', 1, NULL, NULL, 2, 15, NULL, 5, 2)
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([PostID], [Title], [Abstract], [Contents], [Images], [Link], [Author], [CreateDate], [IsActive], [PostOrder], [MenuID], [Category], [Status]) VALUES (1, N'CÔNG TY TNHH TM&DV VĂN MINH KHAI TRƯƠNG VĂN PHÒNG CHUYỂN PHÁT TÂY HỒ 12', N'Du lịch vào dịp Tết cổ truyền không còn xa lạ đối với nhiều người', N'<p>Nhằm phục vụ nhu cầu chuyển phát hàng hóa của quý khách hàng đã và đang tin tưởng lựa chọn sử dụng các dịch vụ của Văn Minh. Chúng tôi rất hân hạnh thông báo đến Quý khách hàng và đối tác về việc khai trương Văn phòng Chuyển phát Tây Hồ tại địa chỉ 228 Võ Chí Công, Phường Xuân La, Quận Tây Hồ, Thành phố Hà Nội.</p><p><br></p><p style="text-align: center; "><img src="/Files/imgaes/messages-3.jpg" style="width: 383px;"><br></p>', N'/Files/imgaes/messages-3.jpg', N'NULL', NULL, CAST(N'2023-06-12T07:03:50.620' AS DateTime), 1, 1, 4, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Abstract], [Contents], [Images], [Link], [Author], [CreateDate], [IsActive], [PostOrder], [MenuID], [Category], [Status]) VALUES (2, N'Top các địa điểm du lịch Nghệ An dịp Tết Nguyên Đán Qúy Mão 2023', N'Du lịch vào dịp Tết cổ truyền không còn xa lạ đối với nhiều người', N'Du lịch vào dịp Tết cổ truyền không còn xa lạ đối với nhiều người. Ngoài việc cùng nhau quây quần bên mâm cơm thì nay nhiều gia đình đã cùng nhau lên kế hoạch cho chuyến du lịch vào dịp Tết Nguyên Đán. Vậy Tết này đi đâu, cùng Văn Minh điểm qua các địa điểm du lịch Nghệ An dịp Tết Nguyên Đán Qúy Mão 2023.', N'./assets/img/quảng trường.jpg', NULL, N'John Doe', CAST(N'2045-01-01T00:00:00.000' AS DateTime), 1, 2, 4, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Abstract], [Contents], [Images], [Link], [Author], [CreateDate], [IsActive], [PostOrder], [MenuID], [Category], [Status]) VALUES (3, N'Chương Trình Đào Tạo “Huấn Luyện Telesales Thực Chiến” Cho Nhân Viên Tổng Đài Và Nhân Viên Tư Vấn Du Học', N'Du lịch vào dịp Tết cổ truyền không còn xa lạ đối với nhiều người', N'Ngày 06 tháng 01 năm 2023 vừa qua, Công ty TNHH Văn Minh đã tổ chức chương trình "Huấn Luyện Telesales Thực Chiến" nhằm bồi dưỡng, nâng cao hơn nữa nghiệp vụ, kỹ năng giao tiếp qua điện thoại cho nhân viên tư vấn và nhân viên trực tổng đài.', N'./assets/img/quảng trường.jpg', NULL, N'John Doe', CAST(N'2045-01-01T00:00:00.000' AS DateTime), 1, 3, 4, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Abstract], [Contents], [Images], [Link], [Author], [CreateDate], [IsActive], [PostOrder], [MenuID], [Category], [Status]) VALUES (4, N'Công ty a', N'chúng tôi hân hạnh được phục vụ quý khách', N'<ul><li style="text-align: center; "><img src="/Files/imgaes/dichvu.jpg" style="width: 50%;"></li></ul><p style="text-align: center; "><br></p><p style="text-align: center; "><br></p><p style="text-align: left;">chúng tôi cảm ơn bạn rất nhiều</p><p style="text-align: center;"><img src="/Files/imgaes/dichvu.jpg" style="width: 50%;"><br></p>', N'/Files/imgaes/carousel-2.jpg', N'NULL', NULL, CAST(N'2023-06-12T07:05:25.830' AS DateTime), 1, 1, 4, 1, 1)
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[Route] ON 

INSERT [dbo].[Route] ([RouteID], [IsActive], [Images], [PointOfDe], [StopPoint], [Status], [RouteOrder], [Price]) VALUES (1, 1, N'/Files/imgaes/hn1.jpg', N'Nghệ An - Vinh', N'Hà Nội (VIP)1', 1, 0, N'450.000đ')
INSERT [dbo].[Route] ([RouteID], [IsActive], [Images], [PointOfDe], [StopPoint], [Status], [RouteOrder], [Price]) VALUES (2, 1, N'./assets/img/hoguom2.jpg', N'Hà Nội', N'TP Hà Tĩnh (VIP)', 1, 2, N'450.000đ')
INSERT [dbo].[Route] ([RouteID], [IsActive], [Images], [PointOfDe], [StopPoint], [Status], [RouteOrder], [Price]) VALUES (3, 1, N'./assets/img/vincomplaza.jpg', N'Nghệ An - Vinh', N'Hà Nội (VIP)', 1, 3, N'450.000đ')
INSERT [dbo].[Route] ([RouteID], [IsActive], [Images], [PointOfDe], [StopPoint], [Status], [RouteOrder], [Price]) VALUES (4, 1, N'/Files/imgaes/xe-dong-nai-tay-ninh-1.jpg', N'Hà Nội', N'Vinh', 1, 0, N'250.000đ')
INSERT [dbo].[Route] ([RouteID], [IsActive], [Images], [PointOfDe], [StopPoint], [Status], [RouteOrder], [Price]) VALUES (5, 1, N'/Files/imgaes/bien-cua-lo-1.webp', N'Cửa Lò', N'BX Nước Ngầm', 1, 0, N'250.000đ')
INSERT [dbo].[Route] ([RouteID], [IsActive], [Images], [PointOfDe], [StopPoint], [Status], [RouteOrder], [Price]) VALUES (8, 0, NULL, NULL, NULL, 1, 0, NULL)
SET IDENTITY_INSERT [dbo].[Route] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ServiceID], [Images], [ServiceName], [ServiceDesc], [IsActive], [Status], [ServiceOrder], [LeftRight]) VALUES (1, N'./assets/img/istockphoto-540589442-1024x1024.jpg', N'Phản hồi - khiếu nại', N'Đến mua vé xe trực tiếp từ các bến xe hoặc điểm bán vé', 1, 1, 1, 0)
INSERT [dbo].[Service] ([ServiceID], [Images], [ServiceName], [ServiceDesc], [IsActive], [Status], [ServiceOrder], [LeftRight]) VALUES (2, N'./assets/img/phanhoi.png', N'Hợp đồng khách hàng', N'Quý khách có thể gọi điện trực tiếp đến hotline để đặt vé', 1, 1, 2, 1)
INSERT [dbo].[Service] ([ServiceID], [Images], [ServiceName], [ServiceDesc], [IsActive], [Status], [ServiceOrder], [LeftRight]) VALUES (3, N'./assets/img/phản hồi.svg', N'Giao hàng miễn phí nội thành', N'Đến mua vé xe trực tiếp từ các bến xe hoặc điểm bán vé', 1, 1, 3, 2)
INSERT [dbo].[Service] ([ServiceID], [Images], [ServiceName], [ServiceDesc], [IsActive], [Status], [ServiceOrder], [LeftRight]) VALUES (4, N'./assets/img/giaohang.png', N'Trung chuyển khách hàng', N'Không cần đến đại lý. Nhanh nhất, tiện nhất và tiết kiệm nhất ', 1, 1, 4, 2)
INSERT [dbo].[Service] ([ServiceID], [Images], [ServiceName], [ServiceDesc], [IsActive], [Status], [ServiceOrder], [LeftRight]) VALUES (5, N'./assets/img/dichvu.png', NULL, NULL, 1, 1, 1, 0)
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "BookingOrder"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "Booking"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 136
               Right = 420
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_BookingOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_BookingOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "BookingOrder"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 13
         End
         Begin Table = "CustomerOrder"
            Begin Extent = 
               Top = 6
               Left = 258
               Bottom = 136
               Right = 440
            End
            DisplayFlags = 280
            TopColumn = 8
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_CustomerBooking'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_CustomerBooking'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Customer"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CustomerOrder"
            Begin Extent = 
               Top = 6
               Left = 247
               Bottom = 136
               Right = 429
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_CustomerOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_CustomerOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Post"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Menu"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 420
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Post_Menu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Post_Menu'
GO
