USE [master]
GO
/****** Object:  Database [LBrand]    Script Date: 22/04/2021 11:08:51 SA ******/
CREATE DATABASE [LBrand]
GO
USE [LBrand]
GO
/****** Object:  Table [dbo].[account]    Script Date: 22/04/2021 11:08:51 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[account_id] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NOT NULL,
	[full_name] [nvarchar](50) NOT NULL,
	[birthday] [date] NULL,
	[gender] [nvarchar](10) NULL,
	[date_created] [date] NOT NULL,
	[phone] [varchar](10) NOT NULL,
	[email] [varchar](50) NULL,
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
/****** Object:  Table [dbo].[agency]    Script Date: 22/04/2021 11:08:51 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agency](
	[agency_id] [bigint] IDENTITY(1,1) NOT NULL,
	[agency_name] [nvarchar](255) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[phone] [varchar](10) NOT NULL,
	[tel] [varchar](10) NULL,
	[brand_id] [bigint] NOT NULL,
	[date_created] [datetime] NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_agency] PRIMARY KEY CLUSTERED 
(
	[agency_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[agency_account]    Script Date: 22/04/2021 11:08:51 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agency_account](
	[agency_account_id] [bigint] IDENTITY(1,1) NOT NULL,
	[account_id] [bigint] NOT NULL,
	[agency_id] [bigint] NOT NULL,
 CONSTRAINT [PK_agency_account] PRIMARY KEY CLUSTERED 
(
	[agency_account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[agency_capacity]    Script Date: 22/04/2021 11:08:51 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agency_capacity](
	[agency_capacity_id] [bigint] IDENTITY(1,1) NOT NULL,
	[agency_id] [bigint] NOT NULL,
	[floor] [int] NOT NULL,
	[slot] [int] NOT NULL,
 CONSTRAINT [PK_agency_capacity] PRIMARY KEY CLUSTERED 
(
	[agency_capacity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[booking]    Script Date: 22/04/2021 11:08:51 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[booking](
	[booking_id] [bigint] IDENTITY(1,1) NOT NULL,
	[account_id] [bigint] NOT NULL,
	[agency_capacity_id] [bigint] NOT NULL,
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
/****** Object:  Table [dbo].[booking_product_detail]    Script Date: 22/04/2021 11:08:51 SA ******/
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
/****** Object:  Table [dbo].[booking_service_detail]    Script Date: 22/04/2021 11:08:51 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[booking_service_detail](
	[booking_detail_id] [bigint] IDENTITY(1,1) NOT NULL,
	[service_id] [bigint] NOT NULL,
	[booking_id] [bigint] NOT NULL,
	[sale_price] [money] NOT NULL,
 CONSTRAINT [PK_booking_service_detail] PRIMARY KEY CLUSTERED 
(
	[booking_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[booking_status]    Script Date: 22/04/2021 11:08:51 SA ******/
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
/****** Object:  Table [dbo].[brand]    Script Date: 22/04/2021 11:08:51 SA ******/
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
	[status] [int] NOT NULL,
 CONSTRAINT [PK_brand] PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[brand_comment]    Script Date: 22/04/2021 11:08:51 SA ******/
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
/****** Object:  Table [dbo].[brand_interaction]    Script Date: 22/04/2021 11:08:51 SA ******/
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
/****** Object:  Table [dbo].[brand_service_type]    Script Date: 22/04/2021 11:08:51 SA ******/
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
/****** Object:  Table [dbo].[comment]    Script Date: 22/04/2021 11:08:51 SA ******/
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
/****** Object:  Table [dbo].[comment_image]    Script Date: 22/04/2021 11:08:51 SA ******/
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
/****** Object:  Table [dbo].[discount_code]    Script Date: 22/04/2021 11:08:51 SA ******/
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
/****** Object:  Table [dbo].[group_message]    Script Date: 22/04/2021 11:08:51 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[group_message](
	[group_id] [bigint] NOT NULL,
	[brand_id] [bigint] NULL,
	[account_id] [bigint] NULL,
	[date_created] [datetime] NULL,
 CONSTRAINT [PK_group_message] PRIMARY KEY CLUSTERED 
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[message]    Script Date: 22/04/2021 11:08:51 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[message](
	[message_id] [bigint] NOT NULL,
	[account_id] [bigint] NULL,
	[groud_id] [bigint] NULL,
	[message] [ntext] NULL,
	[date_created] [datetime] NULL,
 CONSTRAINT [PK_message] PRIMARY KEY CLUSTERED 
(
	[message_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment_method]    Script Date: 22/04/2021 11:08:51 SA ******/
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
/****** Object:  Table [dbo].[product]    Script Date: 22/04/2021 11:08:51 SA ******/
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
/****** Object:  Table [dbo].[product_category]    Script Date: 22/04/2021 11:08:51 SA ******/
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
/****** Object:  Table [dbo].[product_comment]    Script Date: 22/04/2021 11:08:51 SA ******/
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
/****** Object:  Table [dbo].[product_image]    Script Date: 22/04/2021 11:08:51 SA ******/
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
/****** Object:  Table [dbo].[product_interaction]    Script Date: 22/04/2021 11:08:51 SA ******/
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
/****** Object:  Table [dbo].[product_type]    Script Date: 22/04/2021 11:08:51 SA ******/
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
/****** Object:  Table [dbo].[role]    Script Date: 22/04/2021 11:08:51 SA ******/
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
/****** Object:  Table [dbo].[service]    Script Date: 22/04/2021 11:08:51 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service](
	[service_id] [bigint] IDENTITY(1,1) NOT NULL,
	[service_name] [nvarchar](255) NOT NULL,
	[brand_id] [bigint] NOT NULL,
	[price] [money] NOT NULL,
	[sale_price] [money] NOT NULL,
	[date_created] [datetime] NOT NULL,
	[description] [ntext] NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_service_1] PRIMARY KEY CLUSTERED 
(
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[service_comment]    Script Date: 22/04/2021 11:08:51 SA ******/
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
/****** Object:  Table [dbo].[service_image]    Script Date: 22/04/2021 11:08:51 SA ******/
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
/****** Object:  Table [dbo].[service_interaction]    Script Date: 22/04/2021 11:08:51 SA ******/
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
SET IDENTITY_INSERT [dbo].[booking_status] ON 

INSERT [dbo].[booking_status] ([booking_status_id], [booking_status_name]) VALUES (1, N'Chờ xác nhận')
INSERT [dbo].[booking_status] ([booking_status_id], [booking_status_name]) VALUES (4, N'Đã huỷ')
INSERT [dbo].[booking_status] ([booking_status_id], [booking_status_name]) VALUES (3, N'Đã kết thúc')
INSERT [dbo].[booking_status] ([booking_status_id], [booking_status_name]) VALUES (2, N'Đã xác nhận')
SET IDENTITY_INSERT [dbo].[booking_status] OFF
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
SET IDENTITY_INSERT [dbo].[product_category] ON 

INSERT [dbo].[product_category] ([category_id], [category_code], [category_name]) VALUES (1, N'bia', N'Bia')
INSERT [dbo].[product_category] ([category_id], [category_code], [category_name]) VALUES (2, N'ruou-vang', N'Rượu Vang')
INSERT [dbo].[product_category] ([category_id], [category_code], [category_name]) VALUES (3, N'whisky', N'Whisky')
INSERT [dbo].[product_category] ([category_id], [category_code], [category_name]) VALUES (4, N'vodka', N'Vodka')
INSERT [dbo].[product_category] ([category_id], [category_code], [category_name]) VALUES (5, N'mon-nuong', N'Món nướng')
INSERT [dbo].[product_category] ([category_id], [category_code], [category_name]) VALUES (6, N'mon-lau', N'Món lẩu')
INSERT [dbo].[product_category] ([category_id], [category_code], [category_name]) VALUES (7, N'do-chay', N'Đồ chay')
INSERT [dbo].[product_category] ([category_id], [category_code], [category_name]) VALUES (8, N'hai-san', N'Hải sản')
INSERT [dbo].[product_category] ([category_id], [category_code], [category_name]) VALUES (9, N'mon-goi', N'Món gỏi')
INSERT [dbo].[product_category] ([category_id], [category_code], [category_name]) VALUES (10, N'mon-ga', N'Món gà')
INSERT [dbo].[product_category] ([category_id], [category_code], [category_name]) VALUES (11, N'mon-ca', N'Món cá')
INSERT [dbo].[product_category] ([category_id], [category_code], [category_name]) VALUES (12, N'mon-bo', N'Món bò')
INSERT [dbo].[product_category] ([category_id], [category_code], [category_name]) VALUES (13, N'mon-heo', N'Món heo')
INSERT [dbo].[product_category] ([category_id], [category_code], [category_name]) VALUES (14, N'tom-hum', N'Tôm hùm')
INSERT [dbo].[product_category] ([category_id], [category_code], [category_name]) VALUES (15, N'mon-de', N'Món dê')
SET IDENTITY_INSERT [dbo].[product_category] OFF
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_account]    Script Date: 22/04/2021 11:08:52 SA ******/
ALTER TABLE [dbo].[account] ADD  CONSTRAINT [IX_account] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_account_1]    Script Date: 22/04/2021 11:08:52 SA ******/
ALTER TABLE [dbo].[account] ADD  CONSTRAINT [IX_account_1] UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_account_2]    Script Date: 22/04/2021 11:08:52 SA ******/
ALTER TABLE [dbo].[account] ADD  CONSTRAINT [IX_account_2] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_agency_capacity]    Script Date: 22/04/2021 11:08:52 SA ******/
ALTER TABLE [dbo].[agency_capacity] ADD  CONSTRAINT [IX_agency_capacity] UNIQUE NONCLUSTERED 
(
	[agency_id] ASC,
	[floor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_booking_status]    Script Date: 22/04/2021 11:08:52 SA ******/
ALTER TABLE [dbo].[booking_status] ADD  CONSTRAINT [IX_booking_status] UNIQUE NONCLUSTERED 
(
	[booking_status_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_discount_code]    Script Date: 22/04/2021 11:08:52 SA ******/
ALTER TABLE [dbo].[discount_code] ADD  CONSTRAINT [IX_discount_code] UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_payment_method]    Script Date: 22/04/2021 11:08:52 SA ******/
ALTER TABLE [dbo].[payment_method] ADD  CONSTRAINT [IX_payment_method] UNIQUE NONCLUSTERED 
(
	[payment_method_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_product_category]    Script Date: 22/04/2021 11:08:52 SA ******/
ALTER TABLE [dbo].[product_category] ADD  CONSTRAINT [IX_product_category] UNIQUE NONCLUSTERED 
(
	[category_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_product_category_1]    Script Date: 22/04/2021 11:08:52 SA ******/
ALTER TABLE [dbo].[product_category] ADD  CONSTRAINT [IX_product_category_1] UNIQUE NONCLUSTERED 
(
	[category_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_product_type]    Script Date: 22/04/2021 11:08:52 SA ******/
ALTER TABLE [dbo].[product_type] ADD  CONSTRAINT [IX_product_type] UNIQUE NONCLUSTERED 
(
	[product_type_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_role]    Script Date: 22/04/2021 11:08:52 SA ******/
ALTER TABLE [dbo].[role] ADD  CONSTRAINT [IX_role] UNIQUE NONCLUSTERED 
(
	[role_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_role_1]    Script Date: 22/04/2021 11:08:52 SA ******/
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
ALTER TABLE [dbo].[agency] ADD  CONSTRAINT [DF_agency_date_created]  DEFAULT (getdate()) FOR [date_created]
GO
ALTER TABLE [dbo].[agency] ADD  CONSTRAINT [DF_agency_status]  DEFAULT ((1)) FOR [status]
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
ALTER TABLE [dbo].[agency]  WITH CHECK ADD  CONSTRAINT [FK_agency_brand1] FOREIGN KEY([brand_id])
REFERENCES [dbo].[brand] ([brand_id])
GO
ALTER TABLE [dbo].[agency] CHECK CONSTRAINT [FK_agency_brand1]
GO
ALTER TABLE [dbo].[agency_account]  WITH CHECK ADD  CONSTRAINT [FK_agency_account_account] FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[agency_account] CHECK CONSTRAINT [FK_agency_account_account]
GO
ALTER TABLE [dbo].[agency_account]  WITH CHECK ADD  CONSTRAINT [FK_agency_account_agency] FOREIGN KEY([agency_id])
REFERENCES [dbo].[agency] ([agency_id])
GO
ALTER TABLE [dbo].[agency_account] CHECK CONSTRAINT [FK_agency_account_agency]
GO
ALTER TABLE [dbo].[agency_capacity]  WITH CHECK ADD  CONSTRAINT [FK_agency_capacity_agency] FOREIGN KEY([agency_id])
REFERENCES [dbo].[agency] ([agency_id])
GO
ALTER TABLE [dbo].[agency_capacity] CHECK CONSTRAINT [FK_agency_capacity_agency]
GO
ALTER TABLE [dbo].[booking]  WITH CHECK ADD  CONSTRAINT [FK_booking_agency_capacity] FOREIGN KEY([agency_capacity_id])
REFERENCES [dbo].[agency_capacity] ([agency_capacity_id])
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
ALTER TABLE [dbo].[group_message]  WITH CHECK ADD  CONSTRAINT [FK_group_message_account] FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[group_message] CHECK CONSTRAINT [FK_group_message_account]
GO
ALTER TABLE [dbo].[group_message]  WITH CHECK ADD  CONSTRAINT [FK_group_message_brand] FOREIGN KEY([brand_id])
REFERENCES [dbo].[brand] ([brand_id])
GO
ALTER TABLE [dbo].[group_message] CHECK CONSTRAINT [FK_group_message_brand]
GO
ALTER TABLE [dbo].[message]  WITH CHECK ADD  CONSTRAINT [FK_message_group_message] FOREIGN KEY([groud_id])
REFERENCES [dbo].[group_message] ([group_id])
GO
ALTER TABLE [dbo].[message] CHECK CONSTRAINT [FK_message_group_message]
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
