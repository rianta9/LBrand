USE [master]
GO
/****** Object:  Database [LBrand]    Script Date: 28/04/2021 07:14:45 SA ******/
CREATE DATABASE [LBrand]
GO
USE [LBrand]
GO
/****** Object:  Table [dbo].[account]    Script Date: 28/04/2021 07:14:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[account_id] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](64) NOT NULL,
	[full_name] [nvarchar](50) NOT NULL,
	[birthday] [date] NULL,
	[gender] [nvarchar](10) NULL,
	[date_created] [date] NOT NULL,
	[phone] [varchar](10) NOT NULL,
	[email] [varchar](100) NULL,
	[address] [nvarchar](255) NULL,
	[avatar] [varchar](255) NULL,
	[role_id] [int] NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[booking]    Script Date: 28/04/2021 07:14:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[booking](
	[booking_id] [bigint] IDENTITY(1,1) NOT NULL,
	[account_id] [bigint] NOT NULL,
	[brand_capacity_id] [bigint] NOT NULL,
	[date_created] [datetime] NOT NULL,
	[booking_status_id] [int] NOT NULL,
	[number_of_adults] [int] NOT NULL,
	[number_of_children] [int] NOT NULL,
	[note] [ntext] NULL,
	[contact_info] [nvarchar](255) NOT NULL,
	[date_in] [date] NOT NULL,
	[time_in] [time](7) NOT NULL,
	[payment_method_id] [int] NOT NULL,
	[deposit] [money] NOT NULL,
	[discount_code_id] [bigint] NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[booking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[booking_product_detail]    Script Date: 28/04/2021 07:14:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[booking_product_detail](
	[booking_detail_id] [bigint] IDENTITY(1,1) NOT NULL,
	[product_id] [bigint] NOT NULL,
	[booking_id] [bigint] NOT NULL,
	[quantity] [int] NOT NULL,
	[sale_price] [money] NOT NULL,
 CONSTRAINT [PK_order_detail] PRIMARY KEY CLUSTERED 
(
	[booking_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[booking_service_detail]    Script Date: 28/04/2021 07:14:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[booking_service_detail](
	[booking_detail_id] [bigint] IDENTITY(1,1) NOT NULL,
	[service_id] [bigint] NOT NULL,
	[booking_id] [bigint] NOT NULL,
	[sale_price_for_adult] [money] NOT NULL,
	[sale_price_for_children] [money] NOT NULL,
 CONSTRAINT [PK_booking_service_detail] PRIMARY KEY CLUSTERED 
(
	[booking_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[booking_status]    Script Date: 28/04/2021 07:14:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[booking_status](
	[booking_status_id] [int] IDENTITY(1,1) NOT NULL,
	[booking_status_name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_order_status] PRIMARY KEY CLUSTERED 
(
	[booking_status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[brand]    Script Date: 28/04/2021 07:14:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brand](
	[brand_id] [bigint] IDENTITY(1,1) NOT NULL,
	[brand_name] [nvarchar](255) NOT NULL,
	[info] [ntext] NOT NULL,
	[date_created] [datetime] NOT NULL,
	[open_time] [time](7) NOT NULL,
	[close_time] [time](7) NOT NULL,
	[avatar] [varchar](255) NOT NULL,
	[service_type_id] [int] NOT NULL,
	[address] [nvarchar](255) NULL,
	[phone] [varchar](11) NULL,
	[tel] [varchar](10) NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_brand] PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[brand_account]    Script Date: 28/04/2021 07:14:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brand_account](
	[brand_account_id] [bigint] IDENTITY(1,1) NOT NULL,
	[account_id] [bigint] NOT NULL,
	[brand_id] [bigint] NOT NULL,
 CONSTRAINT [PK_agency_account] PRIMARY KEY CLUSTERED 
(
	[brand_account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[brand_capacity]    Script Date: 28/04/2021 07:14:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brand_capacity](
	[brand_capacity_id] [bigint] IDENTITY(1,1) NOT NULL,
	[brand_id] [bigint] NOT NULL,
	[floor] [int] NOT NULL,
	[slot] [int] NOT NULL,
 CONSTRAINT [PK_agency_capacity] PRIMARY KEY CLUSTERED 
(
	[brand_capacity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[brand_comment]    Script Date: 28/04/2021 07:14:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brand_comment](
	[brand_comment_id] [bigint] IDENTITY(1,1) NOT NULL,
	[comment_id] [bigint] NOT NULL,
	[brand_id] [bigint] NOT NULL,
	[point] [float] NOT NULL,
 CONSTRAINT [PK_brand_comment] PRIMARY KEY CLUSTERED 
(
	[brand_comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[brand_interaction]    Script Date: 28/04/2021 07:14:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brand_interaction](
	[interaction_id] [bigint] IDENTITY(1,1) NOT NULL,
	[account_id] [bigint] NOT NULL,
	[brand_id] [bigint] NOT NULL,
	[favourite] [bit] NOT NULL,
	[last_view_date] [datetime] NOT NULL,
 CONSTRAINT [PK_product_interaction] PRIMARY KEY CLUSTERED 
(
	[interaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[brand_service_type]    Script Date: 28/04/2021 07:14:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brand_service_type](
	[service_type_id] [int] IDENTITY(1,1) NOT NULL,
	[service_type_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_service_type] PRIMARY KEY CLUSTERED 
(
	[service_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comment]    Script Date: 28/04/2021 07:14:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment](
	[comment_id] [bigint] IDENTITY(1,1) NOT NULL,
	[comment_content] [ntext] NOT NULL,
	[date_created] [datetime] NOT NULL,
	[parents_comment_id] [bigint] NULL,
	[account_id] [bigint] NOT NULL,
 CONSTRAINT [PK_product_comment] PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comment_image]    Script Date: 28/04/2021 07:14:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment_image](
	[image_id] [bigint] IDENTITY(1,1) NOT NULL,
	[image_url] [varchar](255) NOT NULL,
	[comment_id] [bigint] NOT NULL,
 CONSTRAINT [PK_comment_image] PRIMARY KEY CLUSTERED 
(
	[image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[discount_code]    Script Date: 28/04/2021 07:14:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discount_code](
	[discount_code_id] [bigint] IDENTITY(1,1) NOT NULL,
	[discount_code_name] [nvarchar](255) NOT NULL,
	[code] [varchar](50) NOT NULL,
	[info] [nvarchar](255) NULL,
	[brand_id] [bigint] NULL,
	[min_price] [money] NOT NULL,
	[percent_discount] [int] NOT NULL,
	[max_discount] [money] NOT NULL,
	[date_created] [datetime] NOT NULL,
	[date_begin] [datetime] NOT NULL,
	[date_end] [datetime] NOT NULL,
 CONSTRAINT [PK_discount_code] PRIMARY KEY CLUSTERED 
(
	[discount_code_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment_method]    Script Date: 28/04/2021 07:14:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment_method](
	[payment_method_id] [int] IDENTITY(1,1) NOT NULL,
	[payment_method_name] [nvarchar](100) NOT NULL,
	[info] [ntext] NULL,
	[image_url] [varchar](255) NULL,
 CONSTRAINT [PK_payment_method] PRIMARY KEY CLUSTERED 
(
	[payment_method_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persistent_Logins]    Script Date: 28/04/2021 07:14:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persistent_Logins](
	[username] [varchar](50) NULL,
	[series] [varchar](64) NOT NULL,
	[token] [varchar](64) NULL,
	[last_used] [varchar](30) NULL,
 CONSTRAINT [PK_Persistent_Logins] PRIMARY KEY CLUSTERED 
(
	[series] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 28/04/2021 07:14:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [bigint] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](255) NOT NULL,
	[category_id] [int] NOT NULL,
	[product_type_id] [int] NULL,
	[date_created] [datetime] NOT NULL,
	[description] [ntext] NOT NULL,
	[brand_id] [bigint] NOT NULL,
	[price] [money] NOT NULL,
	[sale_price] [money] NOT NULL,
	[number_of_people] [int] NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_category]    Script Date: 28/04/2021 07:14:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_code] [varchar](50) NOT NULL,
	[category_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_comment]    Script Date: 28/04/2021 07:14:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_comment](
	[product_comment_id] [bigint] IDENTITY(1,1) NOT NULL,
	[comment_id] [bigint] NOT NULL,
	[product_id] [bigint] NOT NULL,
	[point] [float] NOT NULL,
 CONSTRAINT [PK_product_comment_1] PRIMARY KEY CLUSTERED 
(
	[product_comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_image]    Script Date: 28/04/2021 07:14:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_image](
	[image_id] [bigint] IDENTITY(1,1) NOT NULL,
	[image_url] [varchar](255) NOT NULL,
	[product_id] [bigint] NOT NULL,
 CONSTRAINT [PK_product_image] PRIMARY KEY CLUSTERED 
(
	[image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_interaction]    Script Date: 28/04/2021 07:14:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_interaction](
	[interaction_id] [bigint] NOT NULL,
	[account_id] [bigint] NOT NULL,
	[product_id] [bigint] NOT NULL,
	[favourite] [bit] NOT NULL,
	[last_view_date] [datetime] NOT NULL,
 CONSTRAINT [PK_product_interaction_1] PRIMARY KEY CLUSTERED 
(
	[interaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_type]    Script Date: 28/04/2021 07:14:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_type](
	[product_type_id] [int] IDENTITY(1,1) NOT NULL,
	[product_type_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_product_type] PRIMARY KEY CLUSTERED 
(
	[product_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 28/04/2021 07:14:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_code] [varchar](50) NOT NULL,
	[role_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_role_1] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[service]    Script Date: 28/04/2021 07:14:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service](
	[service_id] [bigint] IDENTITY(1,1) NOT NULL,
	[service_name] [nvarchar](255) NOT NULL,
	[avatar] [varchar](255) NULL,
	[brand_id] [bigint] NOT NULL,
	[price_for_adult] [money] NOT NULL,
	[sale_price_for_adult] [money] NOT NULL,
	[price_for_children] [money] NULL,
	[sale_price_for_children] [money] NULL,
	[date_created] [datetime] NOT NULL,
	[description] [ntext] NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_service_1] PRIMARY KEY CLUSTERED 
(
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[service_comment]    Script Date: 28/04/2021 07:14:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service_comment](
	[service_comment_id] [bigint] IDENTITY(1,1) NOT NULL,
	[service_id] [bigint] NOT NULL,
	[comment_id] [bigint] NOT NULL,
	[point] [float] NOT NULL,
 CONSTRAINT [PK_service_comment] PRIMARY KEY CLUSTERED 
(
	[service_comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[service_image]    Script Date: 28/04/2021 07:14:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service_image](
	[image_id] [bigint] IDENTITY(1,1) NOT NULL,
	[image_url] [varchar](255) NOT NULL,
	[service_id] [bigint] NOT NULL,
 CONSTRAINT [PK_service_image] PRIMARY KEY CLUSTERED 
(
	[image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[service_interaction]    Script Date: 28/04/2021 07:14:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service_interaction](
	[interaction_id] [bigint] IDENTITY(1,1) NOT NULL,
	[service_id] [bigint] NOT NULL,
	[account_id] [bigint] NOT NULL,
	[favorite] [bit] NOT NULL,
	[last_view_date] [datetime] NOT NULL,
 CONSTRAINT [PK_service_interaction] PRIMARY KEY CLUSTERED 
(
	[interaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([account_id], [username], [password], [full_name], [birthday], [gender], [date_created], [phone], [email], [address], [avatar], [role_id], [status]) VALUES (1, N'admin', N'123456', N'Hoàng Quốc Khánh', CAST(N'1999-09-02' AS Date), N'Nam', CAST(N'2021-04-23' AS Date), N'0389829122', N'hqk@gmail.com', N'Huế, Việt Nam', N'image/account/avt1.jpg', 2, 1)
INSERT [dbo].[account] ([account_id], [username], [password], [full_name], [birthday], [gender], [date_created], [phone], [email], [address], [avatar], [role_id], [status]) VALUES (2, N'user1', N'123456', N'Lê Minh Long', CAST(N'1999-02-09' AS Date), N'Nam', CAST(N'2021-04-23' AS Date), N'0389829123', N'lml@gmail.com', N'Tp.HCM, Việt Nam', N'image/account/avt1.jpg', 1, 1)
INSERT [dbo].[account] ([account_id], [username], [password], [full_name], [birthday], [gender], [date_created], [phone], [email], [address], [avatar], [role_id], [status]) VALUES (3, N'brand1-admin', N'123456', N'Nguyễn Vân Linh', CAST(N'1999-03-09' AS Date), N'Nữ', CAST(N'2021-04-24' AS Date), N'0389829124', N'abc@gmail.com', N'Hà Nội, Việt Nam', N'image/account/avt2.jpg', 3, 1)
INSERT [dbo].[account] ([account_id], [username], [password], [full_name], [birthday], [gender], [date_created], [phone], [email], [address], [avatar], [role_id], [status]) VALUES (4, N'brand3-admin', N'123456', N'Tạ Quang Khải', CAST(N'1999-04-11' AS Date), N'Nữ', CAST(N'2021-04-24' AS Date), N'0389829125', N'def@gmail.com', N'Đà Nẵng, Việt Nam', N'image/account/avt2.jpg', 4, 1)
INSERT [dbo].[account] ([account_id], [username], [password], [full_name], [birthday], [gender], [date_created], [phone], [email], [address], [avatar], [role_id], [status]) VALUES (5, N'user2', N'123456', N'Trần Thu Thu', CAST(N'1999-12-02' AS Date), N'Nữ', CAST(N'2021-04-25' AS Date), N'0388989889', N'tat@gmail.com', N'Quảng Nam, Việt Nam', N'image/account/avt2.jpg', 1, 1)
INSERT [dbo].[account] ([account_id], [username], [password], [full_name], [birthday], [gender], [date_created], [phone], [email], [address], [avatar], [role_id], [status]) VALUES (6, N'user3', N'123456', N'Nguyễn Quốc Minh', CAST(N'1999-12-12' AS Date), N'Nam', CAST(N'2021-04-25' AS Date), N'0389812333', N'nqm@gmail.com', N'Hội An, Việt Nam', N'image/account/avt1.jpg', 1, 1)
INSERT [dbo].[account] ([account_id], [username], [password], [full_name], [birthday], [gender], [date_created], [phone], [email], [address], [avatar], [role_id], [status]) VALUES (7, N'user4', N'123456', N'Lê Minh Anh', CAST(N'1999-06-06' AS Date), N'Nữ', CAST(N'2021-04-25' AS Date), N'0398998231', N'nma@gmail.com', N'Thái Bình, Việt Nam', N'image/account/avt2.jpg', 1, 1)
INSERT [dbo].[account] ([account_id], [username], [password], [full_name], [birthday], [gender], [date_created], [phone], [email], [address], [avatar], [role_id], [status]) VALUES (8, N'user5', N'123456', N'Trần Quốc Tuấn', CAST(N'1999-12-02' AS Date), N'Nam', CAST(N'2021-04-18' AS Date), N'0356589812', N'tqt@gmail.com', N'Khánh Hoà, Việt Nam', N'image/account/avt1.jpg', 1, 1)
INSERT [dbo].[account] ([account_id], [username], [password], [full_name], [birthday], [gender], [date_created], [phone], [email], [address], [avatar], [role_id], [status]) VALUES (9, N'user7', N'123456', N'Đoàn Dự', CAST(N'1999-01-11' AS Date), N'Nam', CAST(N'2021-04-19' AS Date), N'0356157982', N'dd@gmail.com', N'Quảng Trị, Việt Nam', N'image/account/avt1.jpg', 1, 1)
INSERT [dbo].[account] ([account_id], [username], [password], [full_name], [birthday], [gender], [date_created], [phone], [email], [address], [avatar], [role_id], [status]) VALUES (10, N'user8', N'123456', N'Trần Trịnh Trọng', CAST(N'1999-10-19' AS Date), N'Nam', CAST(N'2021-04-19' AS Date), N'0361212548', N'ttt@gmail.com', N'Cà Mau, Việt Nam', N'image/account/avt1.jpg', 1, 1)
SET IDENTITY_INSERT [dbo].[account] OFF
GO
SET IDENTITY_INSERT [dbo].[booking] ON 

INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (1, 1, 1, CAST(N'2021-04-01T00:00:00.000' AS DateTime), 1, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-02' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (2, 1, 3, CAST(N'2021-04-15T00:00:00.000' AS DateTime), 2, 2, 2, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-20' AS Date), CAST(N'17:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (3, 1, 4, CAST(N'2021-04-18T00:00:00.000' AS DateTime), 3, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-20' AS Date), CAST(N'17:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (4, 1, 5, CAST(N'2021-04-18T00:00:00.000' AS DateTime), 4, 2, 1, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-20' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (5, 2, 6, CAST(N'2021-04-18T00:00:00.000' AS DateTime), 3, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-20' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (6, 2, 7, CAST(N'2021-04-01T00:00:00.000' AS DateTime), 2, 3, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-02' AS Date), CAST(N'17:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (7, 2, 8, CAST(N'2021-04-18T00:00:00.000' AS DateTime), 4, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-20' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (8, 2, 9, CAST(N'2021-04-15T00:00:00.000' AS DateTime), 3, 2, 3, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-20' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (9, 3, 1, CAST(N'2021-04-18T00:00:00.000' AS DateTime), 2, 8, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-20' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (10, 3, 10, CAST(N'2021-04-15T00:00:00.000' AS DateTime), 1, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-20' AS Date), CAST(N'17:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (11, 4, 11, CAST(N'2021-04-18T00:00:00.000' AS DateTime), 2, 5, 1, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-20' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (12, 5, 12, CAST(N'2021-04-01T00:00:00.000' AS DateTime), 3, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-20' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (13, 5, 13, CAST(N'2021-04-18T00:00:00.000' AS DateTime), 4, 9, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-20' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (14, 5, 14, CAST(N'2021-04-19T00:00:00.000' AS DateTime), 3, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-20' AS Date), CAST(N'17:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (15, 5, 15, CAST(N'2021-04-01T00:00:00.000' AS DateTime), 2, 2, 2, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-02' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (16, 5, 16, CAST(N'2021-04-18T00:00:00.000' AS DateTime), 3, 8, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-20' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (17, 5, 1, CAST(N'2021-04-01T00:00:00.000' AS DateTime), 1, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-20' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (18, 5, 2, CAST(N'2021-04-18T00:00:00.000' AS DateTime), 4, 2, 1, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-20' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (19, 6, 3, CAST(N'2021-04-01T00:00:00.000' AS DateTime), 1, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-02' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (20, 6, 4, CAST(N'2021-04-19T00:00:00.000' AS DateTime), 4, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-20' AS Date), CAST(N'17:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (21, 6, 5, CAST(N'2021-04-15T00:00:00.000' AS DateTime), 1, 6, 2, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-20' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (22, 6, 6, CAST(N'2021-04-18T00:00:00.000' AS DateTime), 4, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-20' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (23, 6, 7, CAST(N'2021-04-15T00:00:00.000' AS DateTime), 3, 4, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-20' AS Date), CAST(N'17:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (24, 7, 8, CAST(N'2021-04-18T00:00:00.000' AS DateTime), 1, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-20' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (25, 7, 9, CAST(N'2021-04-01T00:00:00.000' AS DateTime), 3, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-02' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (26, 8, 10, CAST(N'2021-04-18T00:00:00.000' AS DateTime), 4, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-20' AS Date), CAST(N'17:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (27, 8, 11, CAST(N'2021-04-01T00:00:00.000' AS DateTime), 3, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-02' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (28, 8, 1, CAST(N'2021-04-01T00:00:00.000' AS DateTime), 4, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-02' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (29, 9, 2, CAST(N'2021-04-18T00:00:00.000' AS DateTime), 4, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-20' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (30, 9, 3, CAST(N'2021-04-01T00:00:00.000' AS DateTime), 3, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-20' AS Date), CAST(N'17:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (31, 9, 9, CAST(N'2021-04-15T00:00:00.000' AS DateTime), 4, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-20' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (32, 9, 1, CAST(N'2021-04-01T00:00:00.000' AS DateTime), 4, 5, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-02' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (33, 9, 6, CAST(N'2021-04-18T00:00:00.000' AS DateTime), 3, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-20' AS Date), CAST(N'17:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (34, 9, 2, CAST(N'2021-04-19T00:00:00.000' AS DateTime), 4, 6, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-20' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (35, 9, 8, CAST(N'2021-04-19T00:00:00.000' AS DateTime), 3, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-20' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (36, 9, 3, CAST(N'2021-04-19T00:00:00.000' AS DateTime), 3, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-20' AS Date), CAST(N'17:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (37, 9, 8, CAST(N'2021-04-01T00:00:00.000' AS DateTime), 4, 2, 5, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-02' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (38, 10, 6, CAST(N'2021-04-15T00:00:00.000' AS DateTime), 1, 2, 5, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-02' AS Date), CAST(N'17:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (39, 10, 5, CAST(N'2021-04-19T00:00:00.000' AS DateTime), 2, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-20' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (40, 10, 12, CAST(N'2021-04-18T00:00:00.000' AS DateTime), 3, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-20' AS Date), CAST(N'17:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (41, 10, 6, CAST(N'2021-04-15T00:00:00.000' AS DateTime), 2, 6, 2, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-02' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (42, 10, 8, CAST(N'2021-04-18T00:00:00.000' AS DateTime), 3, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-20' AS Date), CAST(N'17:00:00' AS Time), 1, 0.0000, NULL)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount_code_id]) VALUES (47, 10, 14, CAST(N'2021-04-05T00:00:00.000' AS DateTime), 1, 2, 0, NULL, N'Nguyễn Thị A, 0389826586', CAST(N'2021-04-02' AS Date), CAST(N'18:00:00' AS Time), 1, 0.0000, NULL)
SET IDENTITY_INSERT [dbo].[booking] OFF
GO
SET IDENTITY_INSERT [dbo].[booking_service_detail] ON 

INSERT [dbo].[booking_service_detail] ([booking_detail_id], [service_id], [booking_id], [sale_price_for_adult], [sale_price_for_children]) VALUES (1, 1, 1, 95000.0000, 70000.0000)
INSERT [dbo].[booking_service_detail] ([booking_detail_id], [service_id], [booking_id], [sale_price_for_adult], [sale_price_for_children]) VALUES (2, 1, 9, 95000.0000, 70000.0000)
INSERT [dbo].[booking_service_detail] ([booking_detail_id], [service_id], [booking_id], [sale_price_for_adult], [sale_price_for_children]) VALUES (3, 1, 17, 100000.0000, 75000.0000)
INSERT [dbo].[booking_service_detail] ([booking_detail_id], [service_id], [booking_id], [sale_price_for_adult], [sale_price_for_children]) VALUES (4, 13, 35, 175000.0000, 100000.0000)
INSERT [dbo].[booking_service_detail] ([booking_detail_id], [service_id], [booking_id], [sale_price_for_adult], [sale_price_for_children]) VALUES (5, 13, 37, 150000.0000, 100000.0000)
INSERT [dbo].[booking_service_detail] ([booking_detail_id], [service_id], [booking_id], [sale_price_for_adult], [sale_price_for_children]) VALUES (6, 4, 10, 175000.0000, 120000.0000)
INSERT [dbo].[booking_service_detail] ([booking_detail_id], [service_id], [booking_id], [sale_price_for_adult], [sale_price_for_children]) VALUES (7, 4, 26, 175000.0000, 125000.0000)
INSERT [dbo].[booking_service_detail] ([booking_detail_id], [service_id], [booking_id], [sale_price_for_adult], [sale_price_for_children]) VALUES (8, 14, 27, 175000.0000, 125000.0000)
INSERT [dbo].[booking_service_detail] ([booking_detail_id], [service_id], [booking_id], [sale_price_for_adult], [sale_price_for_children]) VALUES (9, 19, 16, 100000.0000, 750000.0000)
INSERT [dbo].[booking_service_detail] ([booking_detail_id], [service_id], [booking_id], [sale_price_for_adult], [sale_price_for_children]) VALUES (10, 18, 15, 175000.0000, 127000.0000)
INSERT [dbo].[booking_service_detail] ([booking_detail_id], [service_id], [booking_id], [sale_price_for_adult], [sale_price_for_children]) VALUES (11, 16, 13, 180000.0000, 127000.0000)
INSERT [dbo].[booking_service_detail] ([booking_detail_id], [service_id], [booking_id], [sale_price_for_adult], [sale_price_for_children]) VALUES (12, 12, 4, 180000.0000, 150000.0000)
SET IDENTITY_INSERT [dbo].[booking_service_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[booking_status] ON 

INSERT [dbo].[booking_status] ([booking_status_id], [booking_status_name]) VALUES (1, N'Chờ xác nhận')
INSERT [dbo].[booking_status] ([booking_status_id], [booking_status_name]) VALUES (4, N'Đã huỷ')
INSERT [dbo].[booking_status] ([booking_status_id], [booking_status_name]) VALUES (3, N'Đã kết thúc')
INSERT [dbo].[booking_status] ([booking_status_id], [booking_status_name]) VALUES (2, N'Đã xác nhận')
SET IDENTITY_INSERT [dbo].[booking_status] OFF
GO
SET IDENTITY_INSERT [dbo].[brand] ON 

INSERT [dbo].[brand] ([brand_id], [brand_name], [info], [date_created], [open_time], [close_time], [avatar], [service_type_id], [address], [phone], [tel], [status]) VALUES (1, N'San Fu Lou', N'abc', CAST(N'2020-12-31T00:00:00.000' AS DateTime), CAST(N'07:00:00' AS Time), CAST(N'07:00:00' AS Time), N'image/brand/1.jpg', 1, N'70 Nguyễn Huệ, Huế', N'00000000001', NULL, 1)
INSERT [dbo].[brand] ([brand_id], [brand_name], [info], [date_created], [open_time], [close_time], [avatar], [service_type_id], [address], [phone], [tel], [status]) VALUES (3, N'The Log', N'abc', CAST(N'2020-12-12T00:00:00.000' AS DateTime), CAST(N'07:00:00' AS Time), CAST(N'23:00:00' AS Time), N'image/brand/2.jpg', 2, N'71 Nguyễn Huệ, Huế', N'00000000002', NULL, 1)
INSERT [dbo].[brand] ([brand_id], [brand_name], [info], [date_created], [open_time], [close_time], [avatar], [service_type_id], [address], [phone], [tel], [status]) VALUES (4, N'Wrap & Row', N'abc', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'07:00:00' AS Time), CAST(N'23:00:00' AS Time), N'image/brand/3.jpg', 3, N'72 Nguyễn Huệ, Huế', N'00000000003', NULL, 1)
INSERT [dbo].[brand] ([brand_id], [brand_name], [info], [date_created], [open_time], [close_time], [avatar], [service_type_id], [address], [phone], [tel], [status]) VALUES (5, N'Ngọc Sương', N'bca', CAST(N'2021-12-15T00:00:00.000' AS DateTime), CAST(N'07:00:00' AS Time), CAST(N'23:00:00' AS Time), N'image/brand/4.jpg', 4, N'73 Nguyễn Huệ, Huế', N'00000000004', NULL, 1)
INSERT [dbo].[brand] ([brand_id], [brand_name], [info], [date_created], [open_time], [close_time], [avatar], [service_type_id], [address], [phone], [tel], [status]) VALUES (6, N'Hoàng Yến Buffet Premier', N'acb', CAST(N'2018-04-05T00:00:00.000' AS DateTime), CAST(N'07:00:00' AS Time), CAST(N'23:00:00' AS Time), N'image/brand/5.jpg', 5, N'75 Nguyễn Huệ, Huế', N'00000000005', NULL, 1)
INSERT [dbo].[brand] ([brand_id], [brand_name], [info], [date_created], [open_time], [close_time], [avatar], [service_type_id], [address], [phone], [tel], [status]) VALUES (7, N'Đồng Restaurant', N'dd', CAST(N'2020-12-08T00:00:00.000' AS DateTime), CAST(N'07:15:00' AS Time), CAST(N'23:00:00' AS Time), N'image/brand/6.jpg', 6, N'76 Nguyễn Huệ, Huế', N'00000000006', NULL, 1)
INSERT [dbo].[brand] ([brand_id], [brand_name], [info], [date_created], [open_time], [close_time], [avatar], [service_type_id], [address], [phone], [tel], [status]) VALUES (8, N'Food House', N'a', CAST(N'2019-10-08T00:00:00.000' AS DateTime), CAST(N'07:00:00' AS Time), CAST(N'23:00:00' AS Time), N'image/brand/7.jpg', 7, N'77 Nguyễn Huệ, Huế', N'00000000008', NULL, 1)
INSERT [dbo].[brand] ([brand_id], [brand_name], [info], [date_created], [open_time], [close_time], [avatar], [service_type_id], [address], [phone], [tel], [status]) VALUES (9, N'Samurai BBQ', N'a', CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'16:00:00' AS Time), CAST(N'23:00:00' AS Time), N'image/brand/8.jpg', 8, N'78 Nguyễn Huệ, Huế', N'00000000009', NULL, 1)
INSERT [dbo].[brand] ([brand_id], [brand_name], [info], [date_created], [open_time], [close_time], [avatar], [service_type_id], [address], [phone], [tel], [status]) VALUES (10, N'Lạc Thái', N'a', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'08:00:00' AS Time), CAST(N'23:00:00' AS Time), N'image/brand/9.jpg', 9, N'79 Nguyễn Huệ, Huế', N'00000000010', NULL, 1)
INSERT [dbo].[brand] ([brand_id], [brand_name], [info], [date_created], [open_time], [close_time], [avatar], [service_type_id], [address], [phone], [tel], [status]) VALUES (11, N'Lẩu Băng Chuyền OSAKA', N'a', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'16:00:00' AS Time), CAST(N'23:00:00' AS Time), N'image/brand/10.jpg', 10, N'80 Nguyễn Huệ, Huế', N'00000000011', NULL, 1)
INSERT [dbo].[brand] ([brand_id], [brand_name], [info], [date_created], [open_time], [close_time], [avatar], [service_type_id], [address], [phone], [tel], [status]) VALUES (12, N'Stix', N'a', CAST(N'2020-12-12T00:00:00.000' AS DateTime), CAST(N'07:00:00' AS Time), CAST(N'23:00:00' AS Time), N'image/brand/11.jpg', 11, N'81 Nguyễn Huệ, Huế', N'00000000012', NULL, 1)
INSERT [dbo].[brand] ([brand_id], [brand_name], [info], [date_created], [open_time], [close_time], [avatar], [service_type_id], [address], [phone], [tel], [status]) VALUES (13, N'Việt Phố', N'a', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'07:00:00' AS Time), CAST(N'23:00:00' AS Time), N'image/brand/12.jpg', 12, N'82 Nguyễn Huệ, Huế', N'00000000013', NULL, 1)
INSERT [dbo].[brand] ([brand_id], [brand_name], [info], [date_created], [open_time], [close_time], [avatar], [service_type_id], [address], [phone], [tel], [status]) VALUES (14, N'Ân Nam Quán', N'a', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'07:00:00' AS Time), CAST(N'23:00:00' AS Time), N'image/brand/1.jpg', 13, N'83 Nguyễn Huệ, Huế', N'00000000014', NULL, 1)
INSERT [dbo].[brand] ([brand_id], [brand_name], [info], [date_created], [open_time], [close_time], [avatar], [service_type_id], [address], [phone], [tel], [status]) VALUES (15, N'King BBQ', N'a', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'07:00:00' AS Time), CAST(N'23:00:00' AS Time), N'image/brand/14.jpg', 14, N'84 Nguyễn Huệ, Huế', N'00000000015', NULL, 1)
INSERT [dbo].[brand] ([brand_id], [brand_name], [info], [date_created], [open_time], [close_time], [avatar], [service_type_id], [address], [phone], [tel], [status]) VALUES (16, N'Lindy', N'a', CAST(N'2020-12-01T00:00:00.000' AS DateTime), CAST(N'07:00:00' AS Time), CAST(N'23:00:00' AS Time), N'image/brand/15.jpg', 15, N'85 Nguyễn Huệ, Huế', N'00000000016', NULL, 1)
SET IDENTITY_INSERT [dbo].[brand] OFF
GO
SET IDENTITY_INSERT [dbo].[brand_account] ON 

INSERT [dbo].[brand_account] ([brand_account_id], [account_id], [brand_id]) VALUES (1, 3, 1)
INSERT [dbo].[brand_account] ([brand_account_id], [account_id], [brand_id]) VALUES (2, 4, 3)
SET IDENTITY_INSERT [dbo].[brand_account] OFF
GO
SET IDENTITY_INSERT [dbo].[brand_capacity] ON 

INSERT [dbo].[brand_capacity] ([brand_capacity_id], [brand_id], [floor], [slot]) VALUES (1, 1, 1, 50)
INSERT [dbo].[brand_capacity] ([brand_capacity_id], [brand_id], [floor], [slot]) VALUES (2, 1, 2, 40)
INSERT [dbo].[brand_capacity] ([brand_capacity_id], [brand_id], [floor], [slot]) VALUES (3, 3, 1, 50)
INSERT [dbo].[brand_capacity] ([brand_capacity_id], [brand_id], [floor], [slot]) VALUES (4, 4, 1, 100)
INSERT [dbo].[brand_capacity] ([brand_capacity_id], [brand_id], [floor], [slot]) VALUES (5, 6, 1, 80)
INSERT [dbo].[brand_capacity] ([brand_capacity_id], [brand_id], [floor], [slot]) VALUES (6, 6, 2, 80)
INSERT [dbo].[brand_capacity] ([brand_capacity_id], [brand_id], [floor], [slot]) VALUES (7, 6, 3, 80)
INSERT [dbo].[brand_capacity] ([brand_capacity_id], [brand_id], [floor], [slot]) VALUES (8, 7, 1, 30)
INSERT [dbo].[brand_capacity] ([brand_capacity_id], [brand_id], [floor], [slot]) VALUES (9, 7, 2, 45)
INSERT [dbo].[brand_capacity] ([brand_capacity_id], [brand_id], [floor], [slot]) VALUES (10, 5, 1, 20)
INSERT [dbo].[brand_capacity] ([brand_capacity_id], [brand_id], [floor], [slot]) VALUES (11, 8, 1, 50)
INSERT [dbo].[brand_capacity] ([brand_capacity_id], [brand_id], [floor], [slot]) VALUES (12, 9, 1, 50)
INSERT [dbo].[brand_capacity] ([brand_capacity_id], [brand_id], [floor], [slot]) VALUES (13, 10, 1, 50)
INSERT [dbo].[brand_capacity] ([brand_capacity_id], [brand_id], [floor], [slot]) VALUES (14, 11, 1, 50)
INSERT [dbo].[brand_capacity] ([brand_capacity_id], [brand_id], [floor], [slot]) VALUES (15, 12, 1, 50)
INSERT [dbo].[brand_capacity] ([brand_capacity_id], [brand_id], [floor], [slot]) VALUES (16, 13, 1, 50)
INSERT [dbo].[brand_capacity] ([brand_capacity_id], [brand_id], [floor], [slot]) VALUES (17, 14, 1, 50)
INSERT [dbo].[brand_capacity] ([brand_capacity_id], [brand_id], [floor], [slot]) VALUES (18, 15, 1, 50)
INSERT [dbo].[brand_capacity] ([brand_capacity_id], [brand_id], [floor], [slot]) VALUES (19, 16, 1, 50)
SET IDENTITY_INSERT [dbo].[brand_capacity] OFF
GO
SET IDENTITY_INSERT [dbo].[brand_service_type] ON 

INSERT [dbo].[brand_service_type] ([service_type_id], [service_type_name]) VALUES (1, N'Gọi món Việt')
INSERT [dbo].[brand_service_type] ([service_type_id], [service_type_name]) VALUES (2, N'Gọi món Nhật')
INSERT [dbo].[brand_service_type] ([service_type_id], [service_type_name]) VALUES (3, N'Gọi món Pháp')
INSERT [dbo].[brand_service_type] ([service_type_id], [service_type_name]) VALUES (4, N'Gọi món Ý')
INSERT [dbo].[brand_service_type] ([service_type_id], [service_type_name]) VALUES (5, N'Gọi món Âu')
INSERT [dbo].[brand_service_type] ([service_type_id], [service_type_name]) VALUES (6, N'Gọi món Thái')
INSERT [dbo].[brand_service_type] ([service_type_id], [service_type_name]) VALUES (7, N'Gọi món Hàn Quốc')
INSERT [dbo].[brand_service_type] ([service_type_id], [service_type_name]) VALUES (8, N'Gọi món Á')
INSERT [dbo].[brand_service_type] ([service_type_id], [service_type_name]) VALUES (9, N'Gọi món Á Âu')
INSERT [dbo].[brand_service_type] ([service_type_id], [service_type_name]) VALUES (10, N'Gọi món Hong Kong')
INSERT [dbo].[brand_service_type] ([service_type_id], [service_type_name]) VALUES (11, N'Gọi món Trung Hoa')
INSERT [dbo].[brand_service_type] ([service_type_id], [service_type_name]) VALUES (12, N'Buffet')
INSERT [dbo].[brand_service_type] ([service_type_id], [service_type_name]) VALUES (13, N'Buffet lẩu băng chuyền')
INSERT [dbo].[brand_service_type] ([service_type_id], [service_type_name]) VALUES (14, N'Buffet nướng lẩu Hàn Quốc')
INSERT [dbo].[brand_service_type] ([service_type_id], [service_type_name]) VALUES (15, N'Buffet nướng lẩu Nhật Bản')
INSERT [dbo].[brand_service_type] ([service_type_id], [service_type_name]) VALUES (16, N'Beer Club')
INSERT [dbo].[brand_service_type] ([service_type_id], [service_type_name]) VALUES (17, N'Chuyên hải sản')
INSERT [dbo].[brand_service_type] ([service_type_id], [service_type_name]) VALUES (18, N'Chuyên nướng cay')
INSERT [dbo].[brand_service_type] ([service_type_id], [service_type_name]) VALUES (19, N'BBQ')
INSERT [dbo].[brand_service_type] ([service_type_id], [service_type_name]) VALUES (20, N'Chuyên đặc sản bánh xèo nem lụi')
INSERT [dbo].[brand_service_type] ([service_type_id], [service_type_name]) VALUES (21, N'Chuyên món dê')
INSERT [dbo].[brand_service_type] ([service_type_id], [service_type_name]) VALUES (22, N'Gọi món, Buffet')
SET IDENTITY_INSERT [dbo].[brand_service_type] OFF
GO
SET IDENTITY_INSERT [dbo].[payment_method] ON 

INSERT [dbo].[payment_method] ([payment_method_id], [payment_method_name], [info], [image_url]) VALUES (1, N'Thanh toán tại nhà hàng', NULL, NULL)
INSERT [dbo].[payment_method] ([payment_method_id], [payment_method_name], [info], [image_url]) VALUES (2, N'Thanh toán bằng ZaloPay', NULL, NULL)
SET IDENTITY_INSERT [dbo].[payment_method] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (1, N'Đồ uống 1', 1, 4, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 1, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (3, N'Món khai vị 1', 9, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 1, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (4, N'Món chính 1', 6, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 1, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (5, N'Món chính 2', 10, 3, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 1, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (6, N'Đồ uống 1', 1, 4, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 3, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (7, N'Món khai vị 1', 9, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 3, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (8, N'Món chính 1', 6, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 3, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (9, N'Món chính 2', 10, 3, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 3, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (10, N'Đồ uống 1', 1, 4, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 4, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (11, N'Món khai vị 1', 9, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 4, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (12, N'Món chính 1', 6, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 4, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (13, N'Món chính 2', 10, 3, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 4, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (14, N'Đồ uống 1', 1, 4, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 5, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (15, N'Món khai vị 1', 9, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 5, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (16, N'Món chính 1', 6, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 5, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (17, N'Món chính 2', 10, 3, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 5, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (18, N'Đồ uống 1', 1, 4, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 6, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (19, N'Món khai vị 1', 9, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 6, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (20, N'Món chính 1', 6, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 6, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (21, N'Món chính 2', 10, 3, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 6, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (22, N'Đồ uống 1', 1, 4, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 7, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (23, N'Món khai vị 1', 9, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 7, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (24, N'Món chính 1', 6, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 7, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (25, N'Món chính 2', 10, 3, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 7, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (26, N'Đồ uống 1', 1, 4, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 8, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (27, N'Món khai vị 1', 9, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 8, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (28, N'Món chính 1', 6, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 8, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (29, N'Món chính 2', 10, 3, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 8, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (30, N'Đồ uống 1', 1, 4, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 9, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (31, N'Món khai vị 1', 9, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 9, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (32, N'Món chính 1', 6, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 9, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (33, N'Món chính 2', 10, 3, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 9, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (34, N'Đồ uống 1', 1, 4, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 10, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (35, N'Món khai vị 1', 9, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 10, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (36, N'Món chính 1', 6, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 10, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (37, N'Món chính 2', 10, 3, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 10, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (38, N'Đồ uống 1', 1, 4, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 11, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (39, N'Món khai vị 1', 9, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 11, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (40, N'Món chính 1', 6, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 11, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (41, N'Món chính 2', 10, 3, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 11, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (42, N'Đồ uống 1', 1, 4, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 12, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (43, N'Món khai vị 1', 9, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 12, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (44, N'Món chính 1', 6, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 12, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (45, N'Món chính 2', 10, 3, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 12, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (46, N'Đồ uống 1', 1, 4, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 13, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (47, N'Món khai vị 1', 9, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 13, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (48, N'Món chính 1', 6, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 13, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (49, N'Món chính 2', 10, 3, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 13, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (50, N'Đồ uống 1', 1, 4, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 14, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (51, N'Món khai vị 1', 9, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 14, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (52, N'Món chính 1', 6, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 14, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (53, N'Món chính 2', 10, 3, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 14, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (54, N'Đồ uống 1', 1, 4, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 15, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (55, N'Món khai vị 1', 9, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 15, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (56, N'Món chính 1', 6, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 15, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (57, N'Món chính 2', 10, 3, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 15, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (58, N'Đồ uống 1', 1, 4, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 16, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (59, N'Món khai vị 1', 9, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 16, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (60, N'Món chính 1', 6, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 16, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (61, N'Món chính 2', 10, 3, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 16, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (62, N'Đồ uống 1', 2, 4, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 1, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (63, N'Món khai vị 2', 9, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 1, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (64, N'Món chính 3', 6, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 1, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (65, N'Món chính 4', 10, 3, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 1, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (66, N'Đồ uống 2', 1, 4, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 3, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (67, N'Món khai vị 2', 9, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 3, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (68, N'Món chính 3', 6, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 3, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (69, N'Món chính 4', 10, 3, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 3, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (70, N'Đồ uống 2', 1, 4, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 4, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (71, N'Món khai vị 2', 9, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 4, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (72, N'Món chính 3', 6, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 4, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (73, N'Món chính 4', 10, 3, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 4, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (74, N'Đồ uống 2', 1, 4, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 5, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (75, N'Món khai vị 2', 9, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 5, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (76, N'Món chính 3', 6, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 5, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (77, N'Món chính 4', 10, 3, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 5, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (78, N'Đồ uống 2', 1, 4, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 6, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (79, N'Món khai vị 2', 9, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 6, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (80, N'Món chính 3', 6, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 6, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (81, N'Món chính 4', 10, 3, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 6, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (82, N'Đồ uống 2', 1, 4, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 7, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (83, N'Món khai vị 2', 9, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 7, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (84, N'Món chính 3', 6, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 7, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (85, N'Món chính 4', 10, 3, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 7, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (86, N'Đồ uống 2', 1, 4, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 8, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (87, N'Món khai vị 2', 9, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 8, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (88, N'Món chính 3', 6, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 8, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (89, N'Món chính 4', 10, 3, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 8, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (90, N'Đồ uống 2', 1, 4, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 9, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (91, N'Món khai vị 2', 9, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 9, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (92, N'Món chính 3', 6, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 9, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (93, N'Món chính 4', 10, 3, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 9, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (94, N'Đồ uống 2', 1, 4, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 10, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (95, N'Món khai vị 2', 9, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 10, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (96, N'Món chính 3', 6, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 10, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (97, N'Món chính 4', 10, 3, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 10, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (98, N'Đồ uống 2', 1, 4, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 11, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (99, N'Món khai vị 2', 9, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 11, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (100, N'Món chính 3', 6, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 11, 150000.0000, 150000.0000, 4, 1)
GO
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (101, N'Món chính 4', 10, 3, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 11, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (102, N'Đồ uống 2', 1, 4, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 12, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (103, N'Món khai vị 2', 9, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 12, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (104, N'Món chính 3', 6, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 12, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (105, N'Món chính 4', 10, 3, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 12, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (106, N'Đồ uống 2', 1, 4, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 13, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (107, N'Món khai vị 2', 9, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 13, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (108, N'Món chính 3', 6, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 13, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (109, N'Món chính 4', 10, 3, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 13, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (110, N'Đồ uống 2', 1, 4, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 14, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (111, N'Món khai vị 2', 9, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 14, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (112, N'Món chính 3', 6, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 14, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (113, N'Món chính 4', 10, 3, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 14, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (114, N'Đồ uống 2', 1, 4, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 15, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (115, N'Món khai vị 2', 9, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 15, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (116, N'Món chính 3', 6, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 15, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (117, N'Món chính 4', 10, 3, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 15, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (118, N'Đồ uống 2', 1, 4, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 16, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (119, N'Món khai vị 2', 9, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 16, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (120, N'Món chính 3', 6, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 16, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [product_type_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (121, N'Món chính 4', 10, 3, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 16, 135000.0000, 135000.0000, 4, 1)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[product_category] ON 

INSERT [dbo].[product_category] ([category_id], [category_code], [category_name]) VALUES (1, N'bia', N'Bia')
INSERT [dbo].[product_category] ([category_id], [category_code], [category_name]) VALUES (2, N'ruou-vang', N'Rượu Vang')
INSERT [dbo].[product_category] ([category_id], [category_code], [category_name]) VALUES (3, N'whisky', N'Whisky')
INSERT [dbo].[product_category] ([category_id], [category_code], [category_name]) VALUES (4, N'vodka', N'Vodka')
INSERT [dbo].[product_category] ([category_id], [category_code], [category_name]) VALUES (5, N'mon-nuong', N'Món nướng')
INSERT [dbo].[product_category] ([category_id], [category_code], [category_name]) VALUES (6, N'mon-lau', N'Món lẩu')
INSERT [dbo].[product_category] ([category_id], [category_code], [category_name]) VALUES (7, N'do-chay', N'Đồ chay')
INSERT [dbo].[product_category] ([category_id], [category_code], [category_name]) VALUES (8, N'lau-hai-san', N'Lẩu hải sản')
INSERT [dbo].[product_category] ([category_id], [category_code], [category_name]) VALUES (9, N'mon-goi', N'Món gỏi')
INSERT [dbo].[product_category] ([category_id], [category_code], [category_name]) VALUES (10, N'mon-ga', N'Món gà')
INSERT [dbo].[product_category] ([category_id], [category_code], [category_name]) VALUES (11, N'mon-ca', N'Món cá')
INSERT [dbo].[product_category] ([category_id], [category_code], [category_name]) VALUES (12, N'mon-bo', N'Món bò')
INSERT [dbo].[product_category] ([category_id], [category_code], [category_name]) VALUES (13, N'mon-heo', N'Món heo')
INSERT [dbo].[product_category] ([category_id], [category_code], [category_name]) VALUES (14, N'tom-hum', N'Tôm hùm')
INSERT [dbo].[product_category] ([category_id], [category_code], [category_name]) VALUES (15, N'mon-de', N'Món dê')
INSERT [dbo].[product_category] ([category_id], [category_code], [category_name]) VALUES (16, N'mon-muc', N'Món mực')
INSERT [dbo].[product_category] ([category_id], [category_code], [category_name]) VALUES (17, N'mon-rau', N'Món rau')
SET IDENTITY_INSERT [dbo].[product_category] OFF
GO
SET IDENTITY_INSERT [dbo].[product_image] ON 

INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (1, N'image/product/34.jpg', 1)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (2, N'image/product/1.jpg', 3)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (3, N'image/product/2.jpg', 4)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (4, N'image/product/3.jpg', 5)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (5, N'image/product/35.jpg', 6)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (6, N'image/product/4.jpg', 7)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (7, N'image/product/5.jpg', 8)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (8, N'image/product/6.jpg', 9)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (9, N'image/product/36.jpg', 10)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (10, N'image/product/7.jpg', 11)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (11, N'image/product/8.jpg', 12)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (12, N'image/product/9.jpg', 13)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (13, N'image/product/37.jpg', 14)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (14, N'image/product/10.jpg', 15)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (15, N'image/product/11.jpg', 16)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (16, N'image/product/12.jpg', 17)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (17, N'image/product/38.jpg', 18)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (18, N'image/product/13.jpg', 19)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (19, N'image/product/14.jpg', 20)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (20, N'image/product/15.jpg', 21)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (21, N'image/product/39.jpg', 22)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (22, N'image/product/16.jpg', 23)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (23, N'image/product/17.jpg', 24)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (24, N'image/product/18.jpg', 25)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (25, N'image/product/40.jpg', 26)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (26, N'image/product/19.jpg', 27)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (27, N'image/product/20.jpg', 28)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (28, N'image/product/21.jpg', 29)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (29, N'image/product/41.jpg', 30)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (30, N'image/product/22.jpg', 31)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (31, N'image/product/23.jpg', 32)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (32, N'image/product/24.jpg', 33)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (33, N'image/product/25.jpg', 34)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (34, N'image/product/26.jpg', 35)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (35, N'image/product/27.jpg', 36)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (36, N'image/product/28.jpg', 37)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (37, N'image/product/43.jpg', 38)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (38, N'image/product/29.jpg', 39)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (39, N'image/product/30.jpg', 40)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (40, N'image/product/3.jpg', 41)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (41, N'image/product/44.jpg', 42)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (42, N'image/product/1.jpg', 43)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (43, N'image/product/2.jpg', 44)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (44, N'image/product/3.jpg', 45)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (45, N'image/product/45.jpg', 46)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (46, N'image/product/1.jpg', 47)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (47, N'image/product/2.jpg', 48)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (48, N'image/product/3.jpg', 49)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (49, N'image/product/46.jpg', 50)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (50, N'image/product/1.jpg', 51)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (51, N'image/product/2.jpg', 52)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (52, N'image/product/3.jpg', 53)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (53, N'image/product/47.jpg', 54)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (54, N'image/product/1.jpg', 55)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (55, N'image/product/2.jpg', 56)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (56, N'image/product/3.jpg', 57)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (57, N'image/product/48.jpg', 58)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (58, N'image/product/1.jpg', 59)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (59, N'image/product/2.jpg', 60)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (60, N'image/product/3.jpg', 61)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (61, N'image/product/49.jpg', 62)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (62, N'image/product/1.jpg', 63)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (63, N'image/product/2.jpg', 64)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (64, N'image/product/3.jpg', 65)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (65, N'image/product/34.jpg', 66)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (66, N'image/product/1.jpg', 67)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (67, N'image/product/2.jpg', 68)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (68, N'image/product/3.jpg', 69)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (69, N'image/product/35.jpg', 70)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (70, N'image/product/1.jpg', 71)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (71, N'image/product/2.jpg', 72)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (72, N'image/product/3.jpg', 73)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (73, N'image/product/36.jpg', 74)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (74, N'image/product/1.jpg', 75)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (75, N'image/product/2.jpg', 76)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (76, N'image/product/3.jpg', 77)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (77, N'image/product/37.jpg', 78)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (78, N'image/product/1.jpg', 79)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (79, N'image/product/2.jpg', 80)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (80, N'image/product/3.jpg', 81)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (81, N'image/product/38.jpg', 82)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (82, N'image/product/1.jpg', 83)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (83, N'image/product/2.jpg', 84)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (84, N'image/product/3.jpg', 85)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (85, N'image/product/39.jpg', 86)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (86, N'image/product/1.jpg', 87)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (87, N'image/product/2.jpg', 88)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (88, N'image/product/3.jpg', 89)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (89, N'image/product/40.jpg', 90)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (90, N'image/product/1.jpg', 91)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (91, N'image/product/2.jpg', 9)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (92, N'image/product/3.jpg', 93)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (93, N'image/product/41.jpg', 94)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (94, N'image/product/1.jpg', 95)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (95, N'image/product/2.jpg', 96)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (96, N'image/product/3.jpg', 97)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (97, N'image/product/42.jpg', 98)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (98, N'image/product/1.jpg', 99)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (99, N'image/product/2.jpg', 100)
GO
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (100, N'image/product/3.jpg', 101)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (101, N'image/product/43.jpg', 102)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (102, N'image/product/1.jpg', 103)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (103, N'image/product/2.jpg', 104)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (104, N'image/product/3.jpg', 105)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (105, N'image/product/44.jpg', 106)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (106, N'image/product/1.jpg', 107)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (107, N'image/product/2.jpg', 108)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (108, N'image/product/3.jpg', 109)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (109, N'image/product/45.jpg', 110)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (110, N'image/product/1.jpg', 111)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (111, N'image/product/2.jpg', 112)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (112, N'image/product/3.jpg', 113)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (113, N'image/product/46.jpg', 114)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (114, N'image/product/1.jpg', 115)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (115, N'image/product/2.jpg', 116)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (116, N'image/product/3.jpg', 117)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (117, N'image/product/47.jpg', 118)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (118, N'image/product/1.jpg', 119)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (119, N'image/product/2.jpg', 120)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (120, N'image/product/3.jpg', 121)
SET IDENTITY_INSERT [dbo].[product_image] OFF
GO
SET IDENTITY_INSERT [dbo].[product_type] ON 

INSERT [dbo].[product_type] ([product_type_id], [product_type_name]) VALUES (4, N'Đồ uống')
INSERT [dbo].[product_type] ([product_type_id], [product_type_name]) VALUES (2, N'Món chính')
INSERT [dbo].[product_type] ([product_type_id], [product_type_name]) VALUES (1, N'Món khai vị')
INSERT [dbo].[product_type] ([product_type_id], [product_type_name]) VALUES (3, N'Món tráng miệng')
SET IDENTITY_INSERT [dbo].[product_type] OFF
GO
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([role_id], [role_code], [role_name]) VALUES (1, N'USER', N'User')
INSERT [dbo].[role] ([role_id], [role_code], [role_name]) VALUES (2, N'ADMIN', N'Admin')
INSERT [dbo].[role] ([role_id], [role_code], [role_name]) VALUES (3, N'BRAND_ADMIN', N'Brand Admin')
INSERT [dbo].[role] ([role_id], [role_code], [role_name]) VALUES (4, N'AGENCY_ADMIN', N'Agency Admin')
SET IDENTITY_INSERT [dbo].[role] OFF
GO
SET IDENTITY_INSERT [dbo].[service] ON 

INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (1, N'Buffet 1', N'image/service/1.jpg', 1, 100000.0000, 100000.0000, 75000.0000, 75000.0000, CAST(N'2020-12-15T00:00:00.000' AS DateTime), N'ok', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (2, N'Buffet 2', N'image/service/2.jpg', 3, 200000.0000, 175000.0000, 150000.0000, 125000.0000, CAST(N'2020-02-15T00:00:00.000' AS DateTime), N'ok', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (3, N'Buffet 3', N'image/service/3.jpg', 4, 200000.0000, 175000.0000, 150000.0000, 127000.0000, CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'ok', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (4, N'Buffet 4', N'image/service/4.jpg', 5, 200000.0000, 175000.0000, 150000.0000, 127000.0000, CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'ok', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (5, N'Buffet 1', N'image/service/5.jpg', 4, 250000.0000, 175000.0000, 185000.0000, 127000.0000, CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'ok', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (6, N'Buffet 2', N'image/service/6.jpg', 5, 250000.0000, 175000.0000, 185000.0000, 127000.0000, CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'ok', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (7, N'Buffet 2', N'image/service/7.jpg', 1, 100000.0000, 100000.0000, 75000.0000, 75000.0000, CAST(N'2020-12-15T00:00:00.000' AS DateTime), N'ok', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (8, N'Buffet 1', N'image/service/8.jpg', 3, 200000.0000, 175000.0000, 150000.0000, 125000.0000, CAST(N'2020-02-15T00:00:00.000' AS DateTime), N'ok', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (9, N'Buffet 2', N'image/service/9.jpg', 4, 200000.0000, 175000.0000, 150000.0000, 127000.0000, CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'ok', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (10, N'Buffet 2', N'image/service/10.jpg', 5, 200000.0000, 175000.0000, 150000.0000, 127000.0000, CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'ok', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (11, N'Buffet 1', N'image/service/11.jpg', 6, 250000.0000, 175000.0000, 185000.0000, 127000.0000, CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'ok', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (12, N'Buffet 2', N'image/service/12.jpg', 6, 220000.0000, 180000.0000, 150000.0000, 150000.0000, CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'ok', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (13, N'Buffet 1', N'image/service/13.jpg', 7, 100000.0000, 100000.0000, 75000.0000, 75000.0000, CAST(N'2020-12-15T00:00:00.000' AS DateTime), N'ok', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (14, N'Buffet 2', N'image/service/14.jpg', 8, 185000.0000, 175000.0000, 150000.0000, 125000.0000, CAST(N'2020-02-15T00:00:00.000' AS DateTime), N'ok', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (15, N'Buffet 3', N'image/service/15.jpg', 9, 200000.0000, 175000.0000, 150000.0000, 127000.0000, CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'ok', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (16, N'Buffet 4', N'image/service/16.jpg', 10, 200000.0000, 180000.0000, 150000.0000, 127000.0000, CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'ok', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (17, N'Buffet 1', N'image/service/17.jpg', 11, 220000.0000, 175000.0000, 185000.0000, 127000.0000, CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'ok', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (18, N'Buffet 2', N'image/service/18.jpg', 12, 250000.0000, 175000.0000, 185000.0000, 127000.0000, CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'ok', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (19, N'Buffet 2', N'image/service/19.jpg', 13, 100000.0000, 100000.0000, 75000.0000, 75000.0000, CAST(N'2020-12-15T00:00:00.000' AS DateTime), N'ok', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (20, N'Buffet 1', N'image/service/20.jpg', 14, 200000.0000, 175000.0000, 150000.0000, 125000.0000, CAST(N'2020-02-15T00:00:00.000' AS DateTime), N'ok', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (21, N'Buffet 2', N'image/service/21.jpg', 15, 200000.0000, 175000.0000, 150000.0000, 127000.0000, CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'ok', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (22, N'Buffet 2', N'image/service/22.jpg', 16, 200000.0000, 175000.0000, 150000.0000, 127000.0000, CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'ok', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (23, N'Buffet 2', N'image/service/23.jpg', 7, 250000.0000, 175000.0000, 185000.0000, 127000.0000, CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'ok', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (24, N'Buffet 1', N'image/service/24.jpg', 8, 220000.0000, 180000.0000, 150000.0000, 150000.0000, CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'ok', 1)
SET IDENTITY_INSERT [dbo].[service] OFF
GO
SET IDENTITY_INSERT [dbo].[service_image] ON 

INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (1, N'image/service/1.jpg', 1)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (2, N'image/service/2.jpg', 1)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (3, N'image/service/3.jpg', 1)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (4, N'image/service/4.jpg', 2)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (5, N'image/service/5.jpg', 2)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (6, N'image/service/6.jpg', 2)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (7, N'image/service/7.jpg', 3)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (8, N'image/service/8.jpg', 3)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (9, N'image/service/9.jpg', 3)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (10, N'image/service/10.jpg', 4)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (11, N'image/service/11.jpg', 4)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (12, N'image/service/12.jpg', 4)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (13, N'image/service/13.jpg', 5)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (14, N'image/service/14.jpg', 5)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (15, N'image/service/15.jpg', 5)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (16, N'image/service/16.jpg', 6)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (17, N'image/service/17.jpg', 6)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (18, N'image/service/18.jpg', 6)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (19, N'image/service/19.jpg', 7)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (20, N'image/service/20.jpg', 7)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (21, N'image/service/21.jpg', 7)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (22, N'image/service/22.jpg', 8)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (23, N'image/service/23.jpg', 8)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (24, N'image/service/24.jpg', 8)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (25, N'image/service/25.jpg', 9)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (26, N'image/service/26.jpg', 9)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (27, N'image/service/27.jpg', 9)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (28, N'image/service/28.jpg', 10)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (29, N'image/service/29.jpg', 10)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (30, N'image/service/30.jpg', 10)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (31, N'image/service/2.jpg', 11)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (32, N'image/service/4.jpg', 11)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (33, N'image/service/6.jpg', 11)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (34, N'image/service/8.jpg', 12)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (35, N'image/service/10.jpg', 12)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (36, N'image/service/12.jpg', 12)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (37, N'image/service/14.jpg', 13)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (38, N'image/service/18.jpg', 13)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (39, N'image/service/20.jpg', 13)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (40, N'image/service/22.jpg', 14)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (41, N'image/service/26.jpg', 14)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (42, N'image/service/28.jpg', 14)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (43, N'image/service/5.jpg', 15)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (44, N'image/service/7.jpg', 15)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (45, N'image/service/10.jpg', 15)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (46, N'image/service/11.jpg', 16)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (47, N'image/service/2.jpg', 16)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (48, N'image/service/3.jpg', 16)
SET IDENTITY_INSERT [dbo].[service_image] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_account]    Script Date: 28/04/2021 07:14:46 SA ******/
ALTER TABLE [dbo].[account] ADD  CONSTRAINT [IX_account] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_account_1]    Script Date: 28/04/2021 07:14:46 SA ******/
ALTER TABLE [dbo].[account] ADD  CONSTRAINT [IX_account_1] UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_account_2]    Script Date: 28/04/2021 07:14:46 SA ******/
ALTER TABLE [dbo].[account] ADD  CONSTRAINT [IX_account_2] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_booking_status]    Script Date: 28/04/2021 07:14:46 SA ******/
ALTER TABLE [dbo].[booking_status] ADD  CONSTRAINT [IX_booking_status] UNIQUE NONCLUSTERED 
(
	[booking_status_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_agency_capacity]    Script Date: 28/04/2021 07:14:46 SA ******/
ALTER TABLE [dbo].[brand_capacity] ADD  CONSTRAINT [IX_agency_capacity] UNIQUE NONCLUSTERED 
(
	[brand_id] ASC,
	[floor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_discount_code]    Script Date: 28/04/2021 07:14:46 SA ******/
ALTER TABLE [dbo].[discount_code] ADD  CONSTRAINT [IX_discount_code] UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_payment_method]    Script Date: 28/04/2021 07:14:46 SA ******/
ALTER TABLE [dbo].[payment_method] ADD  CONSTRAINT [IX_payment_method] UNIQUE NONCLUSTERED 
(
	[payment_method_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_product_category]    Script Date: 28/04/2021 07:14:46 SA ******/
ALTER TABLE [dbo].[product_category] ADD  CONSTRAINT [IX_product_category] UNIQUE NONCLUSTERED 
(
	[category_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_product_category_1]    Script Date: 28/04/2021 07:14:46 SA ******/
ALTER TABLE [dbo].[product_category] ADD  CONSTRAINT [IX_product_category_1] UNIQUE NONCLUSTERED 
(
	[category_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_product_type]    Script Date: 28/04/2021 07:14:46 SA ******/
ALTER TABLE [dbo].[product_type] ADD  CONSTRAINT [IX_product_type] UNIQUE NONCLUSTERED 
(
	[product_type_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_role]    Script Date: 28/04/2021 07:14:46 SA ******/
ALTER TABLE [dbo].[role] ADD  CONSTRAINT [IX_role] UNIQUE NONCLUSTERED 
(
	[role_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_role_1]    Script Date: 28/04/2021 07:14:46 SA ******/
ALTER TABLE [dbo].[role] ADD  CONSTRAINT [IX_role_1] UNIQUE NONCLUSTERED 
(
	[role_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[account] ADD  CONSTRAINT [DF_account_date_created]  DEFAULT (getdate()) FOR [date_created]
GO
ALTER TABLE [dbo].[account] ADD  CONSTRAINT [DF_account_role_id]  DEFAULT ((1)) FOR [role_id]
GO
ALTER TABLE [dbo].[account] ADD  CONSTRAINT [DF_account_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[booking] ADD  CONSTRAINT [DF_booking_date_created]  DEFAULT (getdate()) FOR [date_created]
GO
ALTER TABLE [dbo].[brand] ADD  CONSTRAINT [DF_brand_date_created]  DEFAULT (getdate()) FOR [date_created]
GO
ALTER TABLE [dbo].[brand] ADD  CONSTRAINT [DF_brand_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[comment] ADD  CONSTRAINT [DF_comment_date_created]  DEFAULT (getdate()) FOR [date_created]
GO
ALTER TABLE [dbo].[discount_code] ADD  CONSTRAINT [DF_discount_code_date_created]  DEFAULT (getdate()) FOR [date_created]
GO
ALTER TABLE [dbo].[product] ADD  CONSTRAINT [DF_product_date_created]  DEFAULT (getdate()) FOR [date_created]
GO
ALTER TABLE [dbo].[product] ADD  CONSTRAINT [DF_product_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[service] ADD  CONSTRAINT [DF_service_date_created]  DEFAULT (getdate()) FOR [date_created]
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD  CONSTRAINT [FK_account_role] FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([role_id])
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [FK_account_role]
GO
ALTER TABLE [dbo].[booking]  WITH CHECK ADD  CONSTRAINT [FK_booking_agency_capacity] FOREIGN KEY([brand_capacity_id])
REFERENCES [dbo].[brand_capacity] ([brand_capacity_id])
GO
ALTER TABLE [dbo].[booking] CHECK CONSTRAINT [FK_booking_agency_capacity]
GO
ALTER TABLE [dbo].[booking]  WITH CHECK ADD  CONSTRAINT [FK_order_account] FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[booking] CHECK CONSTRAINT [FK_order_account]
GO
ALTER TABLE [dbo].[booking]  WITH CHECK ADD  CONSTRAINT [FK_order_discount_code] FOREIGN KEY([discount_code_id])
REFERENCES [dbo].[discount_code] ([discount_code_id])
GO
ALTER TABLE [dbo].[booking] CHECK CONSTRAINT [FK_order_discount_code]
GO
ALTER TABLE [dbo].[booking]  WITH CHECK ADD  CONSTRAINT [FK_order_order_status] FOREIGN KEY([booking_status_id])
REFERENCES [dbo].[booking_status] ([booking_status_id])
GO
ALTER TABLE [dbo].[booking] CHECK CONSTRAINT [FK_order_order_status]
GO
ALTER TABLE [dbo].[booking]  WITH CHECK ADD  CONSTRAINT [FK_order_payment_method] FOREIGN KEY([payment_method_id])
REFERENCES [dbo].[payment_method] ([payment_method_id])
GO
ALTER TABLE [dbo].[booking] CHECK CONSTRAINT [FK_order_payment_method]
GO
ALTER TABLE [dbo].[booking_product_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_order] FOREIGN KEY([booking_id])
REFERENCES [dbo].[booking] ([booking_id])
GO
ALTER TABLE [dbo].[booking_product_detail] CHECK CONSTRAINT [FK_order_detail_order]
GO
ALTER TABLE [dbo].[booking_product_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[booking_product_detail] CHECK CONSTRAINT [FK_order_detail_product]
GO
ALTER TABLE [dbo].[booking_service_detail]  WITH CHECK ADD  CONSTRAINT [FK_booking_service_detail_booking] FOREIGN KEY([booking_id])
REFERENCES [dbo].[booking] ([booking_id])
GO
ALTER TABLE [dbo].[booking_service_detail] CHECK CONSTRAINT [FK_booking_service_detail_booking]
GO
ALTER TABLE [dbo].[booking_service_detail]  WITH CHECK ADD  CONSTRAINT [FK_booking_service_detail_service1] FOREIGN KEY([service_id])
REFERENCES [dbo].[service] ([service_id])
GO
ALTER TABLE [dbo].[booking_service_detail] CHECK CONSTRAINT [FK_booking_service_detail_service1]
GO
ALTER TABLE [dbo].[brand]  WITH CHECK ADD  CONSTRAINT [FK_brand_service_type] FOREIGN KEY([service_type_id])
REFERENCES [dbo].[brand_service_type] ([service_type_id])
GO
ALTER TABLE [dbo].[brand] CHECK CONSTRAINT [FK_brand_service_type]
GO
ALTER TABLE [dbo].[brand_account]  WITH CHECK ADD  CONSTRAINT [FK_agency_account_account] FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[brand_account] CHECK CONSTRAINT [FK_agency_account_account]
GO
ALTER TABLE [dbo].[brand_account]  WITH CHECK ADD  CONSTRAINT [FK_brand_account_brand] FOREIGN KEY([brand_id])
REFERENCES [dbo].[brand] ([brand_id])
GO
ALTER TABLE [dbo].[brand_account] CHECK CONSTRAINT [FK_brand_account_brand]
GO
ALTER TABLE [dbo].[brand_capacity]  WITH CHECK ADD  CONSTRAINT [FK_brand_capacity_brand] FOREIGN KEY([brand_id])
REFERENCES [dbo].[brand] ([brand_id])
GO
ALTER TABLE [dbo].[brand_capacity] CHECK CONSTRAINT [FK_brand_capacity_brand]
GO
ALTER TABLE [dbo].[brand_comment]  WITH CHECK ADD  CONSTRAINT [FK_brand_comment_brand] FOREIGN KEY([brand_id])
REFERENCES [dbo].[brand] ([brand_id])
GO
ALTER TABLE [dbo].[brand_comment] CHECK CONSTRAINT [FK_brand_comment_brand]
GO
ALTER TABLE [dbo].[brand_comment]  WITH CHECK ADD  CONSTRAINT [FK_brand_comment_comment] FOREIGN KEY([comment_id])
REFERENCES [dbo].[comment] ([comment_id])
GO
ALTER TABLE [dbo].[brand_comment] CHECK CONSTRAINT [FK_brand_comment_comment]
GO
ALTER TABLE [dbo].[brand_interaction]  WITH CHECK ADD  CONSTRAINT [FK_brand_interaction_brand] FOREIGN KEY([brand_id])
REFERENCES [dbo].[brand] ([brand_id])
GO
ALTER TABLE [dbo].[brand_interaction] CHECK CONSTRAINT [FK_brand_interaction_brand]
GO
ALTER TABLE [dbo].[brand_interaction]  WITH CHECK ADD  CONSTRAINT [FK_product_interaction_account] FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[brand_interaction] CHECK CONSTRAINT [FK_product_interaction_account]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK_product_comment_account] FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK_product_comment_account]
GO
ALTER TABLE [dbo].[comment_image]  WITH CHECK ADD  CONSTRAINT [FK_comment_image_product_comment] FOREIGN KEY([comment_id])
REFERENCES [dbo].[comment] ([comment_id])
GO
ALTER TABLE [dbo].[comment_image] CHECK CONSTRAINT [FK_comment_image_product_comment]
GO
ALTER TABLE [dbo].[discount_code]  WITH CHECK ADD  CONSTRAINT [FK_discount_code_brand] FOREIGN KEY([brand_id])
REFERENCES [dbo].[brand] ([brand_id])
GO
ALTER TABLE [dbo].[discount_code] CHECK CONSTRAINT [FK_discount_code_brand]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_brand] FOREIGN KEY([brand_id])
REFERENCES [dbo].[brand] ([brand_id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_brand]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[product_category] ([category_id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_category]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_product_type] FOREIGN KEY([product_type_id])
REFERENCES [dbo].[product_type] ([product_type_id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_product_type]
GO
ALTER TABLE [dbo].[product_comment]  WITH CHECK ADD  CONSTRAINT [FK_product_comment_comment] FOREIGN KEY([comment_id])
REFERENCES [dbo].[comment] ([comment_id])
GO
ALTER TABLE [dbo].[product_comment] CHECK CONSTRAINT [FK_product_comment_comment]
GO
ALTER TABLE [dbo].[product_comment]  WITH CHECK ADD  CONSTRAINT [FK_product_comment_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[product_comment] CHECK CONSTRAINT [FK_product_comment_product]
GO
ALTER TABLE [dbo].[product_image]  WITH CHECK ADD  CONSTRAINT [FK_product_image_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[product_image] CHECK CONSTRAINT [FK_product_image_product]
GO
ALTER TABLE [dbo].[product_interaction]  WITH CHECK ADD  CONSTRAINT [FK_product_interaction_account1] FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[product_interaction] CHECK CONSTRAINT [FK_product_interaction_account1]
GO
ALTER TABLE [dbo].[product_interaction]  WITH CHECK ADD  CONSTRAINT [FK_product_interaction_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[product_interaction] CHECK CONSTRAINT [FK_product_interaction_product]
GO
ALTER TABLE [dbo].[service]  WITH CHECK ADD  CONSTRAINT [FK_service_brand] FOREIGN KEY([brand_id])
REFERENCES [dbo].[brand] ([brand_id])
GO
ALTER TABLE [dbo].[service] CHECK CONSTRAINT [FK_service_brand]
GO
ALTER TABLE [dbo].[service_comment]  WITH CHECK ADD  CONSTRAINT [FK_service_comment_comment] FOREIGN KEY([comment_id])
REFERENCES [dbo].[comment] ([comment_id])
GO
ALTER TABLE [dbo].[service_comment] CHECK CONSTRAINT [FK_service_comment_comment]
GO
ALTER TABLE [dbo].[service_comment]  WITH CHECK ADD  CONSTRAINT [FK_service_comment_service] FOREIGN KEY([service_id])
REFERENCES [dbo].[service] ([service_id])
GO
ALTER TABLE [dbo].[service_comment] CHECK CONSTRAINT [FK_service_comment_service]
GO
ALTER TABLE [dbo].[service_image]  WITH CHECK ADD  CONSTRAINT [FK_service_image_service] FOREIGN KEY([service_id])
REFERENCES [dbo].[service] ([service_id])
GO
ALTER TABLE [dbo].[service_image] CHECK CONSTRAINT [FK_service_image_service]
GO
ALTER TABLE [dbo].[service_interaction]  WITH CHECK ADD  CONSTRAINT [FK_service_interaction_account] FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[service_interaction] CHECK CONSTRAINT [FK_service_interaction_account]
GO
ALTER TABLE [dbo].[service_interaction]  WITH CHECK ADD  CONSTRAINT [FK_service_interaction_service] FOREIGN KEY([service_id])
REFERENCES [dbo].[service] ([service_id])
GO
ALTER TABLE [dbo].[service_interaction] CHECK CONSTRAINT [FK_service_interaction_service]
GO
USE [master]
GO
ALTER DATABASE [LBrand] SET  READ_WRITE 
GO
