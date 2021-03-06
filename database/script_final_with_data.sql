USE [master]
GO
/****** Object:  Database [LBrand]    Script Date: 25/05/2021 09:56:12 SA ******/
CREATE DATABASE [LBrand] 
GO
USE [LBrand]
GO
/****** Object:  Table [dbo].[account]    Script Date: 25/05/2021 09:56:12 SA ******/
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
/****** Object:  Table [dbo].[banner]    Script Date: 25/05/2021 09:56:12 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[banner](
	[banner_id] [int] IDENTITY(1,1) NOT NULL,
	[brand_id] [bigint] NULL,
	[title] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
	[image_url] [varchar](255) NULL,
	[link_content] [varchar](255) NULL,
	[date_created] [date] NULL,
	[date_begin] [date] NULL,
	[date_end] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[booking]    Script Date: 25/05/2021 09:56:12 SA ******/
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
	[discount] [money] NOT NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[booking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[booking_product_detail]    Script Date: 25/05/2021 09:56:12 SA ******/
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
/****** Object:  Table [dbo].[booking_service_detail]    Script Date: 25/05/2021 09:56:12 SA ******/
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
/****** Object:  Table [dbo].[booking_status]    Script Date: 25/05/2021 09:56:12 SA ******/
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
/****** Object:  Table [dbo].[brand]    Script Date: 25/05/2021 09:56:12 SA ******/
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
	[position_lat] [float] NULL,
	[position_lng] [float] NULL,
	[phone] [varchar](11) NULL,
	[tel] [varchar](10) NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_brand] PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[brand_account]    Script Date: 25/05/2021 09:56:12 SA ******/
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
/****** Object:  Table [dbo].[brand_capacity]    Script Date: 25/05/2021 09:56:12 SA ******/
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
/****** Object:  Table [dbo].[brand_comment]    Script Date: 25/05/2021 09:56:12 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brand_comment](
	[brand_comment_id] [bigint] IDENTITY(1,1) NOT NULL,
	[comment_id] [bigint] NOT NULL,
	[booking_id] [bigint] NULL,
	[brand_id] [bigint] NOT NULL,
	[status] [int] NULL,
	[point] [float] NOT NULL,
 CONSTRAINT [PK_brand_comment] PRIMARY KEY CLUSTERED 
(
	[brand_comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[brand_image]    Script Date: 25/05/2021 09:56:12 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brand_image](
	[image_id] [bigint] IDENTITY(1,1) NOT NULL,
	[image_url] [varchar](255) NULL,
	[brand_id] [bigint] NULL,
 CONSTRAINT [PK_brand_image] PRIMARY KEY CLUSTERED 
(
	[image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[brand_interaction]    Script Date: 25/05/2021 09:56:12 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brand_interaction](
	[interaction_id] [bigint] IDENTITY(1,1) NOT NULL,
	[account_id] [bigint] NOT NULL,
	[brand_id] [bigint] NOT NULL,
	[favourite] [bit] NULL,
	[last_view_date] [datetime] NOT NULL,
 CONSTRAINT [PK_product_interaction] PRIMARY KEY CLUSTERED 
(
	[interaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[brand_service_type]    Script Date: 25/05/2021 09:56:12 SA ******/
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
/****** Object:  Table [dbo].[comment]    Script Date: 25/05/2021 09:56:12 SA ******/
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
/****** Object:  Table [dbo].[comment_image]    Script Date: 25/05/2021 09:56:12 SA ******/
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
/****** Object:  Table [dbo].[discount_code]    Script Date: 25/05/2021 09:56:12 SA ******/
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
/****** Object:  Table [dbo].[invoice]    Script Date: 25/05/2021 09:56:12 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invoice](
	[invoice_id] [bigint] IDENTITY(1,1) NOT NULL,
	[booking_id] [bigint] NOT NULL,
	[txn_ref] [varchar](255) NOT NULL,
	[amount] [money] NOT NULL,
	[bank_code] [varchar](50) NULL,
	[pay_date] [datetime] NOT NULL,
	[order_info] [varchar](255) NOT NULL,
	[response_code] [varchar](50) NOT NULL,
	[transaction_no] [varchar](100) NOT NULL,
 CONSTRAINT [PK_invoice] PRIMARY KEY CLUSTERED 
(
	[invoice_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment_method]    Script Date: 25/05/2021 09:56:12 SA ******/
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
/****** Object:  Table [dbo].[Persistent_Logins]    Script Date: 25/05/2021 09:56:12 SA ******/
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
/****** Object:  Table [dbo].[product]    Script Date: 25/05/2021 09:56:12 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [bigint] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](255) NOT NULL,
	[avatar] [varchar](255) NULL,
	[category_id] [int] NOT NULL,
	[product_type_id] [int] NULL,
	[product_unit_id] [int] NULL,
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
/****** Object:  Table [dbo].[product_category]    Script Date: 25/05/2021 09:56:12 SA ******/
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
/****** Object:  Table [dbo].[product_comment]    Script Date: 25/05/2021 09:56:12 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_comment](
	[product_comment_id] [bigint] IDENTITY(1,1) NOT NULL,
	[comment_id] [bigint] NOT NULL,
	[booking_detail_id] [bigint] NULL,
	[product_id] [bigint] NOT NULL,
	[status] [int] NULL,
	[point] [float] NOT NULL,
 CONSTRAINT [PK_product_comment_1] PRIMARY KEY CLUSTERED 
(
	[product_comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_image]    Script Date: 25/05/2021 09:56:12 SA ******/
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
/****** Object:  Table [dbo].[product_interaction]    Script Date: 25/05/2021 09:56:12 SA ******/
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
/****** Object:  Table [dbo].[product_type]    Script Date: 25/05/2021 09:56:12 SA ******/
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
/****** Object:  Table [dbo].[product_unit]    Script Date: 25/05/2021 09:56:12 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_unit](
	[product_unit_id] [int] IDENTITY(1,1) NOT NULL,
	[product_unit_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_product_unit] PRIMARY KEY CLUSTERED 
(
	[product_unit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 25/05/2021 09:56:12 SA ******/
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
/****** Object:  Table [dbo].[service]    Script Date: 25/05/2021 09:56:12 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service](
	[service_id] [bigint] IDENTITY(1,1) NOT NULL,
	[service_name] [nvarchar](255) NOT NULL,
	[avatar] [varchar](255) NULL,
	[brand_id] [bigint] NOT NULL,
	[category_id] [int] NULL,
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
/****** Object:  Table [dbo].[service_category]    Script Date: 25/05/2021 09:56:12 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service_category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](50) NULL,
	[category_code] [varchar](50) NULL,
 CONSTRAINT [PK_service_category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[service_comment]    Script Date: 25/05/2021 09:56:12 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service_comment](
	[service_comment_id] [bigint] IDENTITY(1,1) NOT NULL,
	[booking_detail_id] [bigint] NULL,
	[service_id] [bigint] NOT NULL,
	[comment_id] [bigint] NOT NULL,
	[status] [int] NULL,
	[point] [float] NOT NULL,
 CONSTRAINT [PK_service_comment] PRIMARY KEY CLUSTERED 
(
	[service_comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[service_image]    Script Date: 25/05/2021 09:56:12 SA ******/
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
/****** Object:  Table [dbo].[service_interaction]    Script Date: 25/05/2021 09:56:12 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service_interaction](
	[interaction_id] [bigint] IDENTITY(1,1) NOT NULL,
	[service_id] [bigint] NOT NULL,
	[account_id] [bigint] NOT NULL,
	[favourite] [bit] NULL,
	[last_view_date] [datetime] NOT NULL,
 CONSTRAINT [PK_service_interaction] PRIMARY KEY CLUSTERED 
(
	[interaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_month]    Script Date: 25/05/2021 09:56:12 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_month](
	[month] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([account_id], [username], [password], [full_name], [birthday], [gender], [date_created], [phone], [email], [address], [avatar], [role_id], [status]) VALUES (1, N'admin', N'123456', N'Hoàng Quốc Khánh', CAST(N'1999-09-02' AS Date), N'Nam', CAST(N'2021-04-23' AS Date), N'0389829122', N'hqk@gmail.com', N'Huế, Việt Nam', N'image/account/avt1.jpg', 2, 1)
INSERT [dbo].[account] ([account_id], [username], [password], [full_name], [birthday], [gender], [date_created], [phone], [email], [address], [avatar], [role_id], [status]) VALUES (2, N'user1', N'123456', N'Tạ Quốc Thiên', CAST(N'1999-03-17' AS Date), N'Nam', CAST(N'2021-04-23' AS Date), N'0389829123', N'lml@gmail.com', N'Tp.HCM, Việt Nam', N'image/account/avt1.jpg', 1, 1)
INSERT [dbo].[account] ([account_id], [username], [password], [full_name], [birthday], [gender], [date_created], [phone], [email], [address], [avatar], [role_id], [status]) VALUES (3, N'brand1-admin', N'123456', N'Trần Thu Thu', CAST(N'1999-02-12' AS Date), N'Nữ', CAST(N'2021-04-24' AS Date), N'0389829124', N'abc@gmail.com', N'Hà Nội, Việt Nam', N'image/account/avt2.jpg', 3, 1)
INSERT [dbo].[account] ([account_id], [username], [password], [full_name], [birthday], [gender], [date_created], [phone], [email], [address], [avatar], [role_id], [status]) VALUES (4, N'brand3-admin', N'123456', N'Hoàng Mạnh Trường', CAST(N'1999-04-11' AS Date), N'Nam', CAST(N'2021-04-24' AS Date), N'0389829125', N'def@gmail.com', N'Đà Nẵng, Việt Nam', N'image/account/avt2.jpg', 3, 1)
INSERT [dbo].[account] ([account_id], [username], [password], [full_name], [birthday], [gender], [date_created], [phone], [email], [address], [avatar], [role_id], [status]) VALUES (5, N'user2', N'123456', N'Nguyễn Vân Linh', CAST(N'1999-12-02' AS Date), N'Nữ', CAST(N'2021-04-25' AS Date), N'0388989889', N'tat@gmail.com', N'Quảng Nam, Việt Nam', N'image/account/avt2.jpg', 1, 1)
INSERT [dbo].[account] ([account_id], [username], [password], [full_name], [birthday], [gender], [date_created], [phone], [email], [address], [avatar], [role_id], [status]) VALUES (6, N'user3', N'123456', N'Trần Đình Vĩnh', CAST(N'1999-12-12' AS Date), N'Nam', CAST(N'2021-04-25' AS Date), N'0389812333', N'nqm@gmail.com', N'Hội An, Việt Nam', N'image/account/avt1.jpg', 1, 1)
INSERT [dbo].[account] ([account_id], [username], [password], [full_name], [birthday], [gender], [date_created], [phone], [email], [address], [avatar], [role_id], [status]) VALUES (7, N'user4', N'123456', N'Trương Anh Khoa', CAST(N'1999-06-06' AS Date), N'Nam', CAST(N'2021-04-25' AS Date), N'0398998231', N'nma@gmail.com', N'Thái Bình, Việt Nam', N'image/account/avt2.jpg', 1, 1)
INSERT [dbo].[account] ([account_id], [username], [password], [full_name], [birthday], [gender], [date_created], [phone], [email], [address], [avatar], [role_id], [status]) VALUES (8, N'user5', N'123456', N'Trần Quốc Tuấn', CAST(N'1999-12-02' AS Date), N'Nam', CAST(N'2021-04-18' AS Date), N'0356589812', N'tqt@gmail.com', N'Khánh Hoà, Việt Nam', N'image/account/avt1.jpg', 1, 1)
INSERT [dbo].[account] ([account_id], [username], [password], [full_name], [birthday], [gender], [date_created], [phone], [email], [address], [avatar], [role_id], [status]) VALUES (9, N'user7', N'123456', N'Đoàn Phú Thuận', CAST(N'1999-01-11' AS Date), N'Nam', CAST(N'2021-04-19' AS Date), N'0356157982', N'dd@gmail.com', N'Quảng Trị, Việt Nam', N'image/account/avt1.jpg', 1, 1)
INSERT [dbo].[account] ([account_id], [username], [password], [full_name], [birthday], [gender], [date_created], [phone], [email], [address], [avatar], [role_id], [status]) VALUES (10, N'user8', N'123456', N'Trần Như Trọng Nghĩa', CAST(N'1999-10-19' AS Date), N'Nam', CAST(N'2021-04-19' AS Date), N'0361212548', N'ttt@gmail.com', N'Cà Mau, Việt Nam', N'image/account/avt1.jpg', 1, 1)
INSERT [dbo].[account] ([account_id], [username], [password], [full_name], [birthday], [gender], [date_created], [phone], [email], [address], [avatar], [role_id], [status]) VALUES (11, N'user9', N'k123456789', N'Hoàng Quốc Khánh', NULL, NULL, CAST(N'2021-05-22' AS Date), N'0389829129', N'loliteam9@gmail.com', N'Hue, VietNam', N'image/account/avt2.jpg', 1, 1)
SET IDENTITY_INSERT [dbo].[account] OFF
GO
SET IDENTITY_INSERT [dbo].[banner] ON 

INSERT [dbo].[banner] ([banner_id], [brand_id], [title], [description], [image_url], [link_content], [date_created], [date_begin], [date_end]) VALUES (1, 6, N'Hoàng Yến Ẩm Thực Truyền Thống', N'Món ăn sáng tạo và mang đậm dấu ấn
 riêng của các đầu bếp tại Quán Mộc, nhưng vẫn hài hoà với hương
 vị ẩm thực Việt truyền thống.', N'image/banner/bg-large-6.jpg', N'/brand/6', CAST(N'2021-04-01' AS Date), CAST(N'2021-04-01' AS Date), CAST(N'2021-12-31' AS Date))
INSERT [dbo].[banner] ([banner_id], [brand_id], [title], [description], [image_url], [link_content], [date_created], [date_begin], [date_end]) VALUES (2, 4, N'Wrap & Row Nét Đặc Trưng Trong Văn Hoá Ẩm Thực Việt', N'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words...', N'image/banner/bg-large-5.jpg', N'/brand/4', CAST(N'2021-04-01' AS Date), CAST(N'2021-04-01' AS Date), CAST(N'2021-12-31' AS Date))
INSERT [dbo].[banner] ([banner_id], [brand_id], [title], [description], [image_url], [link_content], [date_created], [date_begin], [date_end]) VALUES (3, 1, N'San Fu Lo Buffet Nướng Cay Giá Ưu Đãi', N'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words...', N'image/banner/bg-large-9.jpg', N'/brand/1', CAST(N'2021-04-01' AS Date), CAST(N'2021-04-01' AS Date), CAST(N'2021-12-31' AS Date))
INSERT [dbo].[banner] ([banner_id], [brand_id], [title], [description], [image_url], [link_content], [date_created], [date_begin], [date_end]) VALUES (4, 3, N'The Log Không Gian Ẩm Thực Độc Đáo', N'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words...', N'image/banner/bg-large-17.jpg', N'/brand/3', CAST(N'2021-04-01' AS Date), CAST(N'2021-04-01' AS Date), CAST(N'2021-12-31' AS Date))
SET IDENTITY_INSERT [dbo].[banner] OFF
GO
SET IDENTITY_INSERT [dbo].[booking] ON 

INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (1, 1, 1, CAST(N'2021-05-01T00:00:00.000' AS DateTime), 1, 2, 0, N'Gọi cho tôi trong giờ hành chính', N'Hoàng Quốc Khánh, 0389819822', CAST(N'2021-05-01' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, 50000.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (2, 1, 3, CAST(N'2021-05-15T00:00:00.000' AS DateTime), 3, 2, 2, N'Gọi cho tôi trong giờ hành chính', N'Hoàng Quốc Khánh, 0389819822', CAST(N'2021-05-01' AS Date), CAST(N'17:00:00' AS Time), 1, 0.0000, 50000.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (3, 1, 4, CAST(N'2021-04-01T00:00:00.000' AS DateTime), 3, 2, 0, N'Gọi cho tôi trong giờ hành chính', N'Hoàng Quốc Khánh, 0389819822', CAST(N'2021-04-01' AS Date), CAST(N'17:00:00' AS Time), 1, 0.0000, 20000.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (4, 1, 5, CAST(N'2021-04-01T00:00:00.000' AS DateTime), 3, 2, 1, N'Gọi cho tôi trong giờ hành chính', N'Hoàng Quốc Khánh, 0389819822', CAST(N'2021-04-01' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, 50000.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (5, 2, 6, CAST(N'2021-04-01T00:00:00.000' AS DateTime), 3, 2, 0, N'Gọi cho tôi trong giờ hành chính', N'Hoàng Quốc Khánh, 0389819822', CAST(N'2021-04-01' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (6, 2, 7, CAST(N'2021-05-01T00:00:00.000' AS DateTime), 3, 3, 0, N'Gọi cho tôi trong giờ hành chính', N'Nguyễn Thị A, 038982922', CAST(N'2021-05-01' AS Date), CAST(N'17:00:00' AS Time), 1, 0.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (7, 2, 8, CAST(N'2021-05-18T00:00:00.000' AS DateTime), 4, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-05-01' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (8, 2, 9, CAST(N'2021-04-01T00:00:00.000' AS DateTime), 3, 2, 3, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-01' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, 50000.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (9, 3, 1, CAST(N'2021-05-18T00:00:00.000' AS DateTime), 3, 8, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-05-01' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (10, 3, 10, CAST(N'2021-04-01T00:00:00.000' AS DateTime), 3, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-01' AS Date), CAST(N'17:00:00' AS Time), 1, 0.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (11, 4, 11, CAST(N'2021-05-18T00:00:00.000' AS DateTime), 3, 5, 1, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-05-01' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, 50000.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (12, 5, 12, CAST(N'2021-05-01T00:00:00.000' AS DateTime), 3, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-05-01' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (13, 5, 13, CAST(N'2021-03-15T00:00:00.000' AS DateTime), 3, 9, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-03-15' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, 50000.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (14, 5, 14, CAST(N'2021-05-19T00:00:00.000' AS DateTime), 3, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-05-01' AS Date), CAST(N'17:00:00' AS Time), 1, 0.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (15, 5, 15, CAST(N'2021-05-01T00:00:00.000' AS DateTime), 3, 2, 2, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-05-01' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (16, 5, 16, CAST(N'2021-05-18T00:00:00.000' AS DateTime), 3, 8, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-05-01' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, 50000.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (17, 5, 1, CAST(N'2021-03-15T00:00:00.000' AS DateTime), 3, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-03-15' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (18, 5, 2, CAST(N'2021-05-18T00:00:00.000' AS DateTime), 4, 2, 1, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-05-01' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, 50000.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (19, 6, 3, CAST(N'2021-05-01T00:00:00.000' AS DateTime), 3, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-05-01' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (20, 6, 4, CAST(N'2021-05-19T00:00:00.000' AS DateTime), 4, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-05-01' AS Date), CAST(N'17:00:00' AS Time), 1, 0.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (21, 6, 5, CAST(N'2021-03-15T00:00:00.000' AS DateTime), 3, 6, 2, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-03-15' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (22, 6, 6, CAST(N'2021-05-18T00:00:00.000' AS DateTime), 4, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-05-01' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, 50000.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (23, 6, 7, CAST(N'2021-05-15T00:00:00.000' AS DateTime), 3, 4, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-05-01' AS Date), CAST(N'17:00:00' AS Time), 1, 0.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (24, 7, 8, CAST(N'2021-05-18T00:00:00.000' AS DateTime), 3, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-05-01' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (25, 7, 9, CAST(N'2021-05-01T00:00:00.000' AS DateTime), 3, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-05-01' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (26, 8, 10, CAST(N'2021-05-18T00:00:00.000' AS DateTime), 3, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-05-01' AS Date), CAST(N'17:00:00' AS Time), 1, 0.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (27, 8, 11, CAST(N'2021-05-01T00:00:00.000' AS DateTime), 3, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-05-01' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (28, 8, 1, CAST(N'2021-05-01T00:00:00.000' AS DateTime), 3, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-05-01' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (29, 9, 2, CAST(N'2021-05-18T00:00:00.000' AS DateTime), 3, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-05-01' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, 50000.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (30, 9, 3, CAST(N'2021-05-01T00:00:00.000' AS DateTime), 3, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-05-01' AS Date), CAST(N'17:00:00' AS Time), 1, 0.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (31, 9, 9, CAST(N'2021-04-15T00:00:00.000' AS DateTime), 4, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-05-01' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (32, 9, 1, CAST(N'2021-04-01T00:00:00.000' AS DateTime), 4, 5, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-05-01' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (33, 9, 6, CAST(N'2021-04-18T00:00:00.000' AS DateTime), 3, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-05-01' AS Date), CAST(N'17:00:00' AS Time), 1, 0.0000, 50000.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (34, 9, 2, CAST(N'2021-04-19T00:00:00.000' AS DateTime), 4, 6, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-19' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (35, 9, 8, CAST(N'2021-04-19T00:00:00.000' AS DateTime), 3, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-19' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, 50000.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (36, 9, 3, CAST(N'2021-04-19T00:00:00.000' AS DateTime), 3, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-19' AS Date), CAST(N'17:00:00' AS Time), 1, 0.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (37, 9, 8, CAST(N'2021-04-01T00:00:00.000' AS DateTime), 4, 2, 5, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-19' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (38, 10, 6, CAST(N'2021-04-15T00:00:00.000' AS DateTime), 3, 2, 5, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-05-01' AS Date), CAST(N'17:00:00' AS Time), 1, 0.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (39, 10, 5, CAST(N'2021-04-19T00:00:00.000' AS DateTime), 2, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-05-01' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (40, 10, 12, CAST(N'2021-04-18T00:00:00.000' AS DateTime), 3, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-19' AS Date), CAST(N'17:00:00' AS Time), 1, 0.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (41, 10, 6, CAST(N'2021-04-15T00:00:00.000' AS DateTime), 3, 6, 2, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-05-01' AS Date), CAST(N'20:00:00' AS Time), 1, 0.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (42, 10, 8, CAST(N'2021-04-18T00:00:00.000' AS DateTime), 3, 2, 0, NULL, N'Nguyễn Thị A, 038982922', CAST(N'2021-04-19' AS Date), CAST(N'17:00:00' AS Time), 1, 0.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (47, 10, 14, CAST(N'2021-04-05T00:00:00.000' AS DateTime), 3, 2, 0, NULL, N'Nguyễn Thị A, 0389826586', CAST(N'2021-05-01' AS Date), CAST(N'18:00:00' AS Time), 1, 0.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (48, 1, 8, CAST(N'2021-05-17T17:02:03.930' AS DateTime), 6, 14, 5, N'Gọi cho tôi sớm nhất có thể nhé. ', N'Người liên hệ: Hoàng Quốc Khánh; Sđt: 0389829122', CAST(N'2021-05-20' AS Date), CAST(N'06:00:00' AS Time), 2, 387500.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (49, 1, 9, CAST(N'2021-05-17T17:08:30.763' AS DateTime), 5, 9, 8, N'Sai thì sửa...ahihi', N'Người liên hệ: Hoàng Quốc Khánh; Sđt: 0389829122', CAST(N'2021-05-18' AS Date), CAST(N'10:00:00' AS Time), 2, 340000.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (50, 1, 12, CAST(N'2021-05-18T04:07:25.400' AS DateTime), 6, 12, 4, N'ko có gì cả...hihi', N'Người liên hệ: Hoàng Quốc Khánh; Sđt: 0389829122', CAST(N'2021-05-19' AS Date), CAST(N'06:00:00' AS Time), 2, 387500.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (10050, 1, 4, CAST(N'2021-05-20T17:39:28.613' AS DateTime), 5, 12, 0, N'Gọi cho tôi trong giờ hành chính nhé...hihi', N'Người liên hệ: Hoàng Quốc Khánh; Sđt: 0389829122', CAST(N'2021-05-20' AS Date), CAST(N'20:00:00' AS Time), 2, 240000.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (10051, 1, 4, CAST(N'2021-05-20T17:39:54.867' AS DateTime), 6, 13, 0, N'', N'Người liên hệ: Hoàng Quốc Khánh; Sđt: 0389829122', CAST(N'2021-05-21' AS Date), CAST(N'20:00:00' AS Time), 2, 260000.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (10052, 1, 13, CAST(N'2021-05-20T18:00:13.947' AS DateTime), 5, 2, 0, N'', N'Người liên hệ: Hoàng Quốc Khánh; Sđt: 0389829122', CAST(N'2021-05-26' AS Date), CAST(N'19:30:00' AS Time), 3, 467500.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (10053, 1, 13, CAST(N'2021-05-20T18:03:02.023' AS DateTime), 5, 10, 0, N'', N'Người liên hệ: Hoàng Quốc Khánh; Sđt: 0389829122', CAST(N'2021-05-28' AS Date), CAST(N'09:00:00' AS Time), 2, 200000.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (10054, 2, 6, CAST(N'2021-05-20T18:08:37.470' AS DateTime), 5, 12, 0, N'', N'Người liên hệ: Tạ Quốc Thiên; Sđt: 0389829123', CAST(N'2021-05-28' AS Date), CAST(N'06:00:00' AS Time), 3, 240000.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (10055, 2, 1, CAST(N'2021-03-20T00:00:00.000' AS DateTime), 3, 12, 0, N'', N'Người liên hệ: Tạ Quốc Thiên; Sđt: 0389829123', CAST(N'2021-03-22' AS Date), CAST(N'06:00:00' AS Time), 3, 240000.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (10056, 3, 3, CAST(N'2021-04-18T00:00:00.000' AS DateTime), 3, 1, 5, N'', N'Người liên hệ: Trần Thu Thu; Sđt: 0389829124', CAST(N'2021-04-19' AS Date), CAST(N'08:30:00' AS Time), 1, 0.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (10057, 5, 2, CAST(N'2021-03-20T00:00:00.000' AS DateTime), 3, 10, 0, N'Gọi cho tôi sớm nhất có thể nhé', N'Người liên hệ: Nguyễn Vân Linh; Sđt: 0388989889', CAST(N'2021-03-22' AS Date), CAST(N'10:30:00' AS Time), 2, 2070000.0000, 100000.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (10058, 5, 1, CAST(N'2021-04-18T00:00:00.000' AS DateTime), 3, 13, 6, N'ok man', N'Người liên hệ: Nguyễn Vân Linh; Sđt: 0388989889', CAST(N'2021-04-19' AS Date), CAST(N'10:00:00' AS Time), 3, 2307500.0000, 100000.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (10059, 11, 1, CAST(N'2021-05-22T07:14:08.507' AS DateTime), 3, 11, 13, N'', N'Người liên hệ: Hoàng Quốc Khánh; Sđt: 0389829129', CAST(N'2021-05-22' AS Date), CAST(N'18:30:00' AS Time), 2, 480000.0000, 100000.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (10060, 11, 1, CAST(N'2021-05-22T08:19:34.663' AS DateTime), 6, 8, 0, N'', N'Người liên hệ: Hoàng Quốc Khánh; Sđt: 0389829129', CAST(N'2021-05-22' AS Date), CAST(N'10:00:00' AS Time), 2, 1142500.0000, 100000.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (10061, 11, 1, CAST(N'2021-05-22T08:23:36.840' AS DateTime), 6, 30, 10, N'Gọi cho tôi sớm nhất có thể', N'Người liên hệ: Hoàng Quốc Khánh; Sđt: 0389829129', CAST(N'2021-05-27' AS Date), CAST(N'11:00:00' AS Time), 3, 800000.0000, 0.0000)
INSERT [dbo].[booking] ([booking_id], [account_id], [brand_capacity_id], [date_created], [booking_status_id], [number_of_adults], [number_of_children], [note], [contact_info], [date_in], [time_in], [payment_method_id], [deposit], [discount]) VALUES (10062, 11, 2, CAST(N'2021-05-22T08:24:51.583' AS DateTime), 4, 2, 0, N'', N'Người liên hệ: Hoàng Quốc Khánh; Sđt: 0389829129', CAST(N'2021-05-27' AS Date), CAST(N'06:00:00' AS Time), 1, 0.0000, 0.0000)
SET IDENTITY_INSERT [dbo].[booking] OFF
GO
SET IDENTITY_INSERT [dbo].[booking_product_detail] ON 

INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (1, 1, 1, 2, 100000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (4, 3, 1, 2, 100000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (5, 4, 1, 1, 100000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (6, 1, 3, 5, 100000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (7, 6, 3, 2, 100000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (8, 7, 3, 2, 100000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (9, 8, 5, 2, 100000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (10, 10, 5, 1, 100000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (11, 9, 5, 1, 100000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (12, 11, 5, 1, 120000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (14, 1, 8, 1, 150000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (15, 3, 8, 2, 100000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (16, 10, 8, 2, 250000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (17, 11, 12, 2, 150000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (18, 13, 12, 2, 180000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (19, 14, 12, 2, 100000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (20, 15, 14, 1, 150000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (21, 16, 14, 2, 150000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (22, 17, 14, 3, 200000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (23, 18, 14, 2, 185000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (24, 22, 48, 1, 175000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (25, 23, 48, 1, 150000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (26, 24, 48, 3, 150000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (27, 30, 50, 1, 175000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (28, 31, 50, 3, 150000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (29, 32, 50, 1, 150000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (10027, 34, 10052, 1, 175000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (10028, 94, 10052, 1, 175000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (10029, 95, 10052, 2, 150000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (10030, 96, 10052, 1, 150000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (10031, 97, 10052, 1, 135000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (10032, 1, 10057, 3, 175000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (10033, 3, 10057, 3, 150000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (10034, 4, 10057, 3, 150000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (10035, 5, 10057, 2, 135000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (10036, 62, 10057, 1, 175000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (10037, 65, 10057, 2, 135000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (10038, 123, 10057, 2, 1000000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (10039, 1, 10058, 2, 175000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (10040, 3, 10058, 2, 150000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (10041, 4, 10058, 2, 150000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (10042, 5, 10058, 2, 135000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (10043, 62, 10058, 2, 175000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (10044, 63, 10058, 2, 150000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (10045, 64, 10058, 2, 150000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (10046, 65, 10058, 2, 135000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (10047, 123, 10058, 2, 1000000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (10048, 126, 10058, 1, 100000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (10049, 124, 10058, 3, 25000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (10050, 1, 10060, 6, 175000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (10051, 3, 10060, 3, 150000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (10052, 4, 10060, 2, 150000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (10053, 5, 10060, 1, 135000.0000)
INSERT [dbo].[booking_product_detail] ([booking_detail_id], [product_id], [booking_id], [quantity], [sale_price]) VALUES (10054, 62, 10060, 2, 175000.0000)
SET IDENTITY_INSERT [dbo].[booking_product_detail] OFF
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
INSERT [dbo].[booking_service_detail] ([booking_detail_id], [service_id], [booking_id], [sale_price_for_adult], [sale_price_for_children]) VALUES (13, 13, 49, 100000.0000, 75000.0000)
INSERT [dbo].[booking_service_detail] ([booking_detail_id], [service_id], [booking_id], [sale_price_for_adult], [sale_price_for_children]) VALUES (14, 5, 10050, 175000.0000, 127000.0000)
INSERT [dbo].[booking_service_detail] ([booking_detail_id], [service_id], [booking_id], [sale_price_for_adult], [sale_price_for_children]) VALUES (15, 5, 10051, 175000.0000, 127000.0000)
INSERT [dbo].[booking_service_detail] ([booking_detail_id], [service_id], [booking_id], [sale_price_for_adult], [sale_price_for_children]) VALUES (16, 11, 10054, 175000.0000, 127000.0000)
INSERT [dbo].[booking_service_detail] ([booking_detail_id], [service_id], [booking_id], [sale_price_for_adult], [sale_price_for_children]) VALUES (17, 1, 10055, 100000.0000, 75000.0000)
INSERT [dbo].[booking_service_detail] ([booking_detail_id], [service_id], [booking_id], [sale_price_for_adult], [sale_price_for_children]) VALUES (18, 2, 10056, 175000.0000, 125000.0000)
INSERT [dbo].[booking_service_detail] ([booking_detail_id], [service_id], [booking_id], [sale_price_for_adult], [sale_price_for_children]) VALUES (19, 1, 10059, 100000.0000, 75000.0000)
INSERT [dbo].[booking_service_detail] ([booking_detail_id], [service_id], [booking_id], [sale_price_for_adult], [sale_price_for_children]) VALUES (20, 1, 10061, 100000.0000, 75000.0000)
INSERT [dbo].[booking_service_detail] ([booking_detail_id], [service_id], [booking_id], [sale_price_for_adult], [sale_price_for_children]) VALUES (21, 1, 10062, 100000.0000, 75000.0000)
SET IDENTITY_INSERT [dbo].[booking_service_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[booking_status] ON 

INSERT [dbo].[booking_status] ([booking_status_id], [booking_status_name]) VALUES (1, N'Chờ xác nhận')
INSERT [dbo].[booking_status] ([booking_status_id], [booking_status_name]) VALUES (5, N'Chờ xác nhận, chưa thanh toán đặt cọc')
INSERT [dbo].[booking_status] ([booking_status_id], [booking_status_name]) VALUES (6, N'Chờ xác nhận, đã thanh toán đặt cọc')
INSERT [dbo].[booking_status] ([booking_status_id], [booking_status_name]) VALUES (4, N'Đã huỷ')
INSERT [dbo].[booking_status] ([booking_status_id], [booking_status_name]) VALUES (3, N'Đã kết thúc')
INSERT [dbo].[booking_status] ([booking_status_id], [booking_status_name]) VALUES (9, N'Đã từ chối')
INSERT [dbo].[booking_status] ([booking_status_id], [booking_status_name]) VALUES (2, N'Đã xác nhận')
INSERT [dbo].[booking_status] ([booking_status_id], [booking_status_name]) VALUES (7, N'Đã xác nhận, chưa thanh toán đặt cọc')
INSERT [dbo].[booking_status] ([booking_status_id], [booking_status_name]) VALUES (8, N'Đã xác nhận, đã thanh toán đặt cọc')
SET IDENTITY_INSERT [dbo].[booking_status] OFF
GO
SET IDENTITY_INSERT [dbo].[brand] ON 

INSERT [dbo].[brand] ([brand_id], [brand_name], [info], [date_created], [open_time], [close_time], [avatar], [service_type_id], [address], [position_lat], [position_lng], [phone], [tel], [status]) VALUES (1, N'San Fu Lou', N'<h2>Giới thiệu San Fu Lo Buffet &ndash; Lotte Mart Nam S&agrave;i G&ograve;n</h2>

<p>Ph&ugrave; hợp:</p>

<p>Đặt tiệc, tụ họp, gặp mặt, li&ecirc;n hoan, họp nh&oacute;m, gia đ&igrave;nh&hellip;</p>

<p>M&oacute;n đặc sắc:</p>

<p>Dẻ Sườn b&ograve; mỹ, Cổ b&ograve; mỹ sốt San Fu Lo, Bắp b&ograve; sốt muối ớt, Nầm heo nướng chao đỏ, Sườn heo, Ba chỉ b&ograve; Mỹ sốt San Fu Lo, Bạch tuộc sốt cay, B&ograve; x&agrave;o Bulgogi nồi đất, Cơm trộn H&agrave;n Quốc, &hellip;</p>

<p>Kh&ocirc;ng gian:</p>

<p>- H&agrave;n Quốc. Hiện đại</p>

<p>- Sức chứa: 150 Kh&aacute;ch</p>

<p>Để &ocirc; t&ocirc;:</p>

<p>C&oacute; (Ph&iacute; phụ thuộc đơn vị tr&ocirc;ng giữ xe)</p>

<p>Điểm đặc trưng:</p>

<p>-San Fu Lo thuộc sở hữu của Tập đo&agrave;n RedSun ITI &ndash; Một trong những tập đo&agrave;n ẩm thực lớn mạnh bậc nhất Việt Nam, sở hữu nhiều thương hiệu ẩm thực nổi tiếng kh&aacute;c như: ThaiExpress, Hotpot Story, Seoul Garden, Sushi Kei, Buk Buk, Capricciosa, Khao Lao, Tasaki BBQ, Meiwei, Truly Việt, Dolpan Sam</p>

<p>- C&ocirc;ng thức độc quyền của &ldquo;nước sốt King&rdquo; &ndash; được ch&iacute;nh Bếp trưởng Park Sung Min, một trong những đầu bếp nổi tiếng nhất H&agrave;n Quốc, với kinh nghiệm hơn 40 năm trong ng&agrave;nh ẩm thực, trực tiếp nghi&ecirc;n cứu v&agrave; chế biến.</p>

<p>&nbsp;</p>

<h3>San Fu Lo Buffet Lotte Mart Nam S&agrave;i G&ograve;n - B&agrave;i ca thịt nướng cuốn h&uacute;t v&agrave; v&ocirc; c&ugrave;ng hấp dẫn</h3>

<p>M&oacute;n nướng kiểu H&agrave;n tuy kh&ocirc;ng qu&aacute; xa lạ đối với thực kh&aacute;ch Việt, nhưng kh&ocirc;ng phải ở bất cứ đ&acirc;u bạn cũng c&oacute; thể thưởng thức &ldquo;vị ngon đ&uacute;ng điệu&rdquo; đậm chất H&agrave;n. V&agrave; nếu bạn l&agrave; một &ldquo;t&iacute;n đồ&rdquo; s&agrave;nh về <a href="https://pasgo.vn/ho-chi-minh/nha-hang/nuong-25" target="_blank">ẩm thực nướng</a> th&igrave; chắc hẳn đ&atilde; từng gh&eacute; qua San Fu Lo Buffet. Đến đ&acirc;y, bạn sẽ c&oacute; cơ hội trải nghiệm một bữa tiệc buffet với c&aacute;c m&oacute;n ăn kh&ocirc;ng chỉ thơm ngon, hấp dẫn m&agrave; c&ograve;n rất tốt cho sức khỏ, đặc biệt l&agrave; c&aacute;c m&oacute;n nướng ngon tuyệt hảo.</p>

<p><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584"><!--cho ?nh vào dây --> <img alt="King BBQ Lotte Mart Nam Sài Gòn 1" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-1.jpg" /> </a></p>

<p>&nbsp;</p>

<p>B&agrave;n tiệc nướng đủ vị khiến thực kh&aacute;ch kh&oacute; t&iacute;nh nhất cũng phải xi&ecirc;u l&ograve;ng</p>

<p><img alt="King BBQ Lotte Mart Nam Sài Gòn 2" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-2.jpg" /></p>

<p>Từng m&oacute;n ăn đều được chăm ch&uacute;t v&agrave; chuẩn bị rất kĩ lưỡng</p>

<p><img alt="King BBQ Lotte Mart Nam Sài Gòn 3" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-3.jpg" /></p>

<p>Kh&ocirc;ng chỉ c&oacute; thịt nướng đơn thuần, King BBQ Buffet c&ograve;n biến tấu th&agrave;nh rất nhiều những hương vị kh&aacute;c nhau cho thực kh&aacute;ch dễ d&agrave;ng lựa chọn</p>

<p><img alt="King BBQ Lotte Mart Nam Sài Gòn 4" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-4.jpg" /></p>

<p>Mỗi m&oacute;n ăn đều chứa đựng bao t&acirc;m huyết v&agrave; đam m&ecirc; của người đầu bếp</p>

<p><img alt="King BBQ Lotte Mart Nam Sài Gòn 5" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-5.jpg" /></p>

<p>Kh&ocirc;ng chỉ ngon miệng m&agrave; c&ograve;n được b&agrave;i tr&iacute; rất đẹp mắt đ&oacute; nha</p>

<p>Ở San Fu Lo Buffet Lotte Mart Nam S&agrave;i G&ograve;n, bạn chắc hẳn sẽ bị chinh phục ngay bởi c&aacute;ch b&agrave;y tr&iacute; m&oacute;n ăn v&ocirc; c&ugrave;ng cuốn h&uacute;t. Trong đ&oacute;, điểm nhấn vẫn l&agrave; thịt nướng bao gồm thịt b&ograve;, thịt heo, thịt g&agrave;, c&oacute; thể kế đến như: Cổ b&ograve; Mỹ sốt San Fu Lo, Ba chỉ b&ograve; Mỹ sốt San Fu Lo, Ba chỉ b&ograve; Mỹ sốt GuangYang, Bắp b&ograve; &Uacute;c sốt ớt chu&ocirc;ng đỏ, Ba chỉ heo sốt cay H&agrave;n Quốc, Ba chỉ heo ướp muối, Sườn heo bản lớn, Nạc vai heo sốt tỏi, Đ&ugrave;i g&agrave; r&uacute;t xương sốt San Fu Lo,... tất cả đều được th&aacute;i l&aacute;t mỏng đẹp mắt, rải đều sốt đậm đ&agrave;, thơm lừng. Ngo&agrave;i ra, hải sản tươi ngon như: Bạch tuộc nướng, Mực trứng sốt cay,&hellip; cũng sẽ khiến bạn ng&acirc;y ngất bởi dư vị mặn m&ograve;i, rất kh&aacute;c biệt.</p>

<p>Đặc biệt, bạn cũng c&oacute; thể thưởng thức c&aacute;c m&oacute;n lẩu thơm ngọt để tăng th&ecirc;m dư vị cho bữa tiệc ở San Fu Lo Buffet nha. Nước d&ugrave;ng được ninh ho&agrave;n to&agrave;n từ xương ống, n&oacute;i kh&ocirc;ng với m&igrave; ch&iacute;nh, San Fu Lo Buffet lu&ocirc;n đặt sức khỏe của thực kh&aacute;ch l&ecirc;n h&agrave;ng đầu.</p>

<p><img alt="King BBQ Lotte Mart Nam Sài Gòn 7" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-7.jpg" /></p>

<p>Với 10 vị sốt tẩm ướp kh&aacute;c nhau, thực kh&aacute;ch c&oacute; thể dễ d&agrave;ng chọn được hương vị m&agrave; m&igrave;nh y&ecirc;u th&iacute;ch</p>

<p>&nbsp;</p>

<p><img alt="King BBQ Lotte Mart Nam Sài Gòn 8" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-8.jpg" /></p>

<p>Nước sốt chấm được pha chế độc quyền bởi bếp trưởng Park Sung Min, bạn sẽ kh&ocirc;ng thể t&igrave;m thấy ở bất k&igrave; n<a href="https://pasgo.vn/ho-chi-minh/nha-hang" target="_blank">h&agrave; h&agrave;ng</a> n&agrave;o</p>

<p><img alt="King BBQ Lotte Mart Nam Sài Gòn 9" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-9.jpg" /></p>

<p>Nguy&ecirc;n liệu tươi ngon được nhập từ c&aacute;c nh&agrave; cung cấp uy t&iacute;n l&agrave;m n&ecirc;n chất lượng m&oacute;n ăn tuyệt hảo</p>

<p><img alt="King BBQ Lotte Mart Nam Sài Gòn 10" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-10.jpg" /></p>

<p>B&ecirc;n cạnh sốt tẩm ướp th&igrave; San Fu Lo Buffet Lotte Mart Nam S&agrave;i G&ograve;n c&ograve;n c&oacute; cả sốt chấm cực k&igrave; ngon đ&oacute; nha!</p>

<p><img alt="King BBQ Lotte Mart Nam Sài Gòn 11" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-11.jpg" /></p>

<p>Kh&ocirc;ng chỉ c&oacute; c&aacute;c loại thịt, hải sản cũng l&agrave; m&oacute;n được rất nhiều người y&ecirc;u th&iacute;ch</p>

<p>Nếu bạn thấy b&agrave;i viết n&agrave;y hữu &iacute;ch, h&atilde;y chia sẻ v&agrave; b&igrave;nh luận ngay nh&eacute;!</p>
', CAST(N'2020-12-31T00:00:00.000' AS DateTime), CAST(N'07:00:00' AS Time), CAST(N'07:00:00' AS Time), N'image/brand/10.jpg', 1, N'70 Nguyễn Huệ, Huế', 16.4598068, 107.5926476, N'00000000001', N'', 1)
INSERT [dbo].[brand] ([brand_id], [brand_name], [info], [date_created], [open_time], [close_time], [avatar], [service_type_id], [address], [position_lat], [position_lng], [phone], [tel], [status]) VALUES (3, N'The Log', N'<div class="content">
    <h2 class="text-header"><span>Giới thiệu Pachi Pachi - Mạc Đĩnh Chi</span></h2>
    <link href="https://cdn.pastaxi-manager.onepas.vn/content/style-special.css" rel="stylesheet" type="text/css"><div class="row-app"><div class="col-xs-app-7"><div class="txt-title">Phù hợp:</div><div class="text-description">Tụ họp, gặp mặt, liên hoan</div><div class="txt-title">Món đặc sắc:</div><div class="text-description">Súp bò cây, Mực nướng sa tế, Gà phi lê chiên giòn, Liên sườn bò nướng, Cá Sapa nướng giấy bạc, Lẩu Shabu Shabu…</div><div class="txt-title">Không gian:</div><div class="text-description"><p>- Phong cách hiện đại, mang hơi hướng Nhật Bản.</p><p>- Sức chứa: 120 Khách</p><p>- Phòng riêng: 2 phòng ngồi bệt (10 &amp; 17 Khách/phòng), 2 phòng ngồi ghế (15 &amp; 14 Khách/phòng)</p></div><div class="txt-title">Để ô tô:</div><div class="text-description">Không</div><div class="txt-title">Điểm đặc trưng:</div><div class="text-description"><p>-	Nhà hàng có loại nước sốt Tare đặc biệt, mang tới cho các món ăn mùi vị tuyệt hảo từ Nhật Bản.
</p><p>-	Nhà hàng có dịch vụ cơm văn phòng và giao hàng tận nơi.
        </p></div></div><div class="col-xs-app-5"><h2 class="txt-title">Thông tin thêm</h2><ul><li><img class="img-app" src="https://cdn.pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Phòng riêng</div></li><li><img class="img-app" src="https://cdn.pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Wifi</div></li><li><img class="img-app" src="https://cdn.pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Điều hòa</div></li><li><img class="img-app" src="https://cdn.pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Hóa đơn VAT</div></li><li><img class="img-app" src="https://cdn.pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Ghế trẻ em</div></li><li><img class="img-app" src="https://cdn.pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Visa/master card</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Trang trí sự kiện</div></li><li><img class="img-app" src="https://cdn.pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Bàn ngoài trời</div></li><li><img class="img-app" src="https://cdn.pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-false">Chỗ chơi trẻ em</div></li><li><img class="img-app" src="https://cdn.pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Chỗ hút thuốc</div></li><li><img class="img-app" src="https://cdn.pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">HĐ trực tiếp</div></li><li><img class="img-app" src="https://cdn.pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Đặt ship PasGo</div></li><li><img class="img-app" src="https://cdn.pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Set Lunch</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Karaoke</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Máy chiếu</div></li></ul></div></div><div id="eJOY__extension_root" style="all:unset;"></div>
    <h3 style="text-align:center;"><strong>Nhà hàng Pachi Pachi - Số 52 Mạc Đĩnh Chi, Phường Đa Kao, Quận 1 - Đủ món lẩu nướng&nbsp;hương vị Nhật Bản&nbsp;cho bạn tha hồ khám phá</strong></h3><p>Tọa lạc tại số 52 Mạc Đĩnh Chi, Phường Đa Kao, Quận 1, nhà hàng Pachi Pachi với những món ăn đặc trưng xứ sở Hoa Anh Đào là điểm đến quá đỗi quen thuộc với người Sài Gòn. Hoạt động theo mô hình nhà hàng nướng lẩu (kết hợp phục vụ buffet &amp; gọi món), nhà hàng Pachi Pachi mang đến cho thực khách những trải nghiệm hoàn toàn mới lạ từ cách tẩm ướp, hương vị cho đến cách thưởng thức món ăn. </p><p>Nhìn vào menu,&nbsp;<a href="https://pasgo.vn/tim-kiem?search=buffet" target="_blank">nhà hàng</a>&nbsp;Pachi Pachi đã mang đến nhiều sự lựa chọn với nguồn nguyên liệu đa dạng với các loại thịt bò nướng, các loại cá, hải sản, thịt gà, cá sấu, đà điểu và các loại lòng gà, lòng bò nướng,... được lựa chọn một cách tỉ mỉ để luôn đảm bảo độ tươi ngon cho thực khách. Bên cạnh sự tươi ngon, các món ăn của nhà hàng lẩu nướng Pachi Pachi được tẩm ướp một cách cầu kỳ với nhiều loại nước sốt mang thương hiệu Nhật Bản như Teriyaki, nước sốt BBQ, nước sốt cay nồng, nước sốt ngọt nhẹ... vừa phong phú vừa đa dạng giúp thực khách có những trải nghiệm vị giác đầy thú vị.&nbsp;</p><p>Không quá rộng rãi nhưng nhà hàng Pachi Pachi vẫn biết cách sắp xếp những không gian chung và riêng khác nhau giúp đáp ứng nhiều nhu cầu khác nhau của nhiều thực khách. Sở hữu sức chứa 120 khách với 02 phòng riêng (01 phòng ngồi bệt và 01 phòng ngồi ghế) và lối thiết kế không cầu kỳ nhưng lại chi tiết đúng phong cách Nhật, từ những vách ngăn, ô kính màu cho đến ánh đèn vàng... tất cả hòa quyện vào nhau vừa lãng mạn vừa ấm cúng &nbsp;lại rất thoải mái với nhiều mục đích đi ăn của thực khách từ ăn gia đình, bạn bè đến đặt tiệc, liên hoan, họp nhóm,...</p><p style="font-size:9pt;"><img alt="Nhà hàng buffet Pachi Pachi 52 Mạc Đĩnh Chi 2" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/ngocdang/pachi-pachi/nha-hang-pachi-pachi-mac-dinh-chi-8.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/ngocdang/pachi-pachi/nha-hang-pachi-pachi-mac-dinh-chi-8.jpg">
        </p><div class="custom-box">
            <div class="in" id="gioithieu-more" style="height: auto;">
                <div class="box-list">
                    <p></p><h5>Nhà hàng có 4 loại bò cao cấp: vai bò, ba chỉ, liên sườn bò non, sườn không xương với bếp than hồng đã sẵn sàng, đang chờ bạn đến thưởng thức</h5><p><img alt="Nhà hàng buffet Pachi Pachi 52 Mạc Đĩnh Chi 3" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/ngocdang/pachi-pachi/nha-hang-pachi-pachi-mac-dinh-chi-17.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/ngocdang/pachi-pachi/nha-hang-pachi-pachi-mac-dinh-chi-17.jpg"></p><h5>Nguyên liệu thịt tại nhà hàng Pachi Pachi đều được nhập khẩu từ Mỹ, để đảm bảo mang đến cho thực khách món ăn chất lượng nhất</h5><p><img alt="Pachi Pachi - Mạc Đĩnh Chi-2" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/ngocdang/pachi-pachi/nha-hang-pachi-pachi-mac-dinh-chi-2.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/ngocdang/pachi-pachi/nha-hang-pachi-pachi-mac-dinh-chi-2.jpg"></p><h5>Các món nướng được tẩm ướp cầu kỳ ở Buffet Pachi Pachi Mạc Đĩnh Chi</h5><p><img alt="Nhà hàng buffet Pachi Pachi 52 Mạc Đĩnh Chi 4" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/ngocdang/pachi-pachi/nha-hang-pachi-pachi-mac-dinh-chi-16.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/ngocdang/pachi-pachi/nha-hang-pachi-pachi-mac-dinh-chi-16.jpg"></p><h5>Không chỉ chú trọng ở hương vị, các món ăn cũng được trình bày rất đẹp mắt</h5><p><img alt="Nhà hàng buffet Pachi Pachi 52 Mạc Đĩnh Chi 5" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/ngocdang/pachi-pachi/nha-hang-pachi-pachi-mac-dinh-chi-7.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/ngocdang/pachi-pachi/nha-hang-pachi-pachi-mac-dinh-chi-7.jpg"></p><h5>Đến với nhà hàng Pachi Pachi, thực khách sẽ được khám phá một phong cách nướng hoàn toàn khác ở cả hương vị lẫn cách thưởng thức</h5><p><img alt="Pachi Pachi - Mạc Đĩnh Chi-5" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/ngocdang/pachi-pachi/nha-hang-pachi-pachi-mac-dinh-chi-23.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/ngocdang/pachi-pachi/nha-hang-pachi-pachi-mac-dinh-chi-23.jpg"></p><h5>Những miếng thịt được cắt khá dày, với phần vân mỡ trắng xen kẽ và từng thớ thịt không chỉ đẹp mắt, mà còn giúp phần thịt không bị khô khi nướng giúp người ăn ngon miệng hơn</h5><p><img alt="Nhà hàng buffet Pachi Pachi 52 Mạc Đĩnh Chi 6" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/ngocdang/pachi-pachi/nha-hang-pachi-pachi-mac-dinh-chi-15.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/ngocdang/pachi-pachi/nha-hang-pachi-pachi-mac-dinh-chi-15.jpg"></p><p><img alt="Pachi Pachi - Mạc Đĩnh Chi-7" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/ngocdang/pachi-pachi/nha-hang-pachi-pachi-mac-dinh-chi-9.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/ngocdang/pachi-pachi/nha-hang-pachi-pachi-mac-dinh-chi-9.jpg"></p><h5>Không thể thiếu những hải sản ngon miệng khác dành cho bạn</h5><p><img alt="Nhà hàng buffet Pachi Pachi 52 Mạc Đĩnh Chi 8" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/ngocdang/pachi-pachi/nha-hang-pachi-pachi-mac-dinh-chi-22.jpg"></p><p><img alt="Pachi Pachi - Mạc Đĩnh Chi-9" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/ngocdang/pachi-pachi/nha-hang-pachi-pachi-mac-dinh-chi-20.jpg"></p><h5>Nếu những món thịt nướng là điểm sáng thì những món nóng cũng là cái tên không thể bỏ qua<br></h5><p><img alt="Nhà hàng buffet Pachi Pachi 52 Mạc Đĩnh Chi 7" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/ngocdang/pachi-pachi/nha-hang-pachi-pachi-mac-dinh-chi-18.jpg"></p><p><img alt="Pachi Pachi - Mạc Đĩnh Chi-11" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/ngocdang/pachi-pachi/nha-hang-pachi-pachi-mac-dinh-chi-5.jpg"></p><h5>Hương vị đặc trưng đại diện cho xứ Mặt Trời Mọc</h5><p><span style="font-size:9pt;line-height:15.6px;"><img alt="Pachi Pachi - Mạc Đĩnh Chi-12" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/ngocdang/pachi-pachi/nha-hang-pachi-pachi-mac-dinh-chi-10.jpg"></span></p><h5>Và những món lẩu đầy hấp dẫn</h5><p><img alt="Nhà hàng buffet Pachi Pachi 52 Mạc Đĩnh Chi 9" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/ngocdang/pachi-pachi/nha-hang-pachi-pachi-mac-dinh-chi-19.jpg"></p><h5>Bạn có cưỡng lại được trước sức hấp dẫn của nguyên liệu này phải không?</h5><p><img alt="Pachi Pachi - Mạc Đĩnh Chi-14" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/ngocdang/pachi-pachi/nha-hang-pachi-pachi-mac-dinh-chi-11.jpg" style="font-size:9pt;"></p><h5 style="text-align:center;"></h5><h5>Những thức uống ở Pachi Pachi tuy không quá cầu kỳ nhưng cũng đủ để thực khách hài lòng với nhiều loại nước giải khát, soda, cocktail hay rượu truyền thống của Nhật làm tăng thêm hương vị cho bữa ăn</h5><p><img alt="Pachi Pachi - Mạc Đĩnh Chi-15" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/ngocdang/pachi-pachi/nha-hang-pachi-pachi-mac-dinh-chi-6.jpg"></p><h5><span style="text-align:center;">Nhà hàng lựa chọn cho mình lối kiến trúc thanh lịch, tuy đơn giản nhưng tinh tế, mang đến cho thực khách cảm giác vô cùng thoải mái và dễ chịu khi đến thưởng thức món ăn tại đây</span>
 <br></h5><h5><img alt="Pachi Pachi - Mạc Đĩnh Chi-16" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/ngocdang/pachi-pachi/nha-hang-pachi-pachi-mac-dinh-chi-1.jpg"></h5><h5>Lựa chọn cho mình bất cứ vị trí nào, bạn cũng sẽ cảm thấy hài lòng, ấn tượng</h5><p>“Pachi” trong tiếng Nhật là tiếng cháy tí tách của ngọn lửa trong lò than nóng hổi. Tên nhà hàng mang ý nghĩa gợi lên cảm giác ấm áp và thân quen, bởi bếp lửa là hiện thân cho sự đoàn tụ, sức sống của mỗi gia đình. Cũng vì thế, không gian nhà hàng Pachi Pachi Quận 1 được thiết kế tinh tế và ấm cúng với gam màu trầm nóng, vừa tạo phong cách hiện đại, vừa tạo sự gần gũi cho thực khách kết hợp với những món lẩu nướng Nhật Bản đúng chất thì còn gì tuyệt hơn? Đừng quên&nbsp;đặt bàn qua&nbsp;PasGo - Mạng lưới nhà hàng ngon&nbsp;để nhận ngay ưu đãi khi thưởng thức tại nhà hàng! Bạn cũng có thể khám phá thêm danh sách nhà hàng lẩu nướng Nhật Bản ngon nổi tiếng, hút khách nhất ở Tp.HCM<a href="https://pasgo.vn/kham-pha/ho-chi-minh/top-10-nha-hang-lau-nuong-nhat-ban-ngon-nhat-o-tphcm-338" target="_blank"> tại đây</a> để có nhiều sự lựa chọn hơn cho mình!
    <br></p><h4>Địa chỉ Nhà hàng:</h4><h4>Nhà hàng Pachi Pachi: Số 52 Mạc Đĩnh Chi, Phường Đa Kao, Quận 1, TP.HCM</h4><p></p><div id="eJOY__extension_root" style="all:unset;"></div>
                </div>
            </div>
            <a class="btn-xemthem" role="button" data-toggle="collapse" href="#gioithieu-more" aria-expanded="false" aria-controls="gioithieu-more" style="display: none;">
                Xem thêm
            </a>
        </div>
    <div class="col-xs-12 col-md-12">
        <div class="col-md-3">
            <div class="social-like">
                <div class="fb-like fb_iframe_widget" data-href="https://pasgo.vn/nha-hang/nha-hang-buffet-pachi-pachi-52-mac-dinh-chi-quan-1-712" data-layout="button_count" data-action="like" data-share="true" fb-xfbml-state="rendered" fb-iframe-plugin-query="action=like&amp;app_id=584525768323186&amp;container_width=217&amp;href=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fnha-hang-buffet-pachi-pachi-52-mac-dinh-chi-quan-1-712&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true"><span style="vertical-align: bottom; width: 150px; height: 28px;"><iframe name="f1efed59db90bd8" width="1000px" height="1000px" data-testid="fb:like Facebook Social Plugin" title="fb:like Facebook Social Plugin" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" allow="encrypted-media" src="https://www.facebook.com/v5.0/plugins/like.php?action=like&amp;app_id=584525768323186&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fx%2Fconnect%2Fxd_arbiter%2F%3Fversion%3D46%23cb%3Df33919aa4b80af%26domain%3Dpasgo.vn%26origin%3Dhttps%253A%252F%252Fpasgo.vn%252Ff23b3c2c827ff28%26relation%3Dparent.parent&amp;container_width=217&amp;href=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fnha-hang-buffet-pachi-pachi-52-mac-dinh-chi-quan-1-712&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true" style="border: none; visibility: visible; width: 150px; height: 28px;" class=""></iframe></span></div>
            </div>
        </div>
        <div class="col-md-2">
            <div id="___plusone_0" style="position: absolute; width: 450px; left: -10000px;"><iframe ng-non-bindable="" frameborder="0" hspace="0" marginheight="0" marginwidth="0" scrolling="no" style="position:absolute;top:-10000px;width:450px;margin:0px;border-style:none" tabindex="0" vspace="0" width="100%" id="I0_1620214603449" name="I0_1620214603449" src="https://apis.google.com/u/0/se/0/_/+1/fastbutton?usegapi=1&amp;origin=https%3A%2F%2Fpasgo.vn&amp;url=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fnha-hang-buffet-pachi-pachi-52-mac-dinh-chi-quan-1-712&amp;gsrc=3p&amp;ic=1&amp;jsh=m%3B%2F_%2Fscs%2Fapps-static%2F_%2Fjs%2Fk%3Doz.gapi.vi.Np5UIK_lCuw.O%2Fm%3D__features__%2Fam%3DAQE%2Frt%3Dj%2Fd%3D1%2Frs%3DAGLTcCMfAte-OUXlAWpDj4LziXXJDdgBFA#_methods=onPlusOne%2C_ready%2C_close%2C_open%2C_resizeMe%2C_renderstart%2Concircled%2Cdrefresh%2Cerefresh%2Conload&amp;id=I0_1620214603449&amp;_gfid=I0_1620214603449&amp;parent=https%3A%2F%2Fpasgo.vn&amp;pfname=&amp;rpctoken=10295604"></iframe></div><div class="g-plusone" data-href="https://pasgo.vn/nha-hang/nha-hang-buffet-pachi-pachi-52-mac-dinh-chi-quan-1-712" data-gapiscan="true" data-onload="true" data-gapistub="true"></div>
        </div>
        <div class="col-md-7">
            Nếu bạn thấy bài viết này hữu ích, hãy chia sẻ và bình luận ngay nhé!
        </div>
    </div>
</div>', CAST(N'2020-12-12T00:00:00.000' AS DateTime), CAST(N'07:00:00' AS Time), CAST(N'23:00:00' AS Time), N'image/brand/2.jpg', 2, N'71 Nguyễn Huệ, Huế', 16.4598068, 107.5926476, N'00000000002', NULL, 1)
INSERT [dbo].[brand] ([brand_id], [brand_name], [info], [date_created], [open_time], [close_time], [avatar], [service_type_id], [address], [position_lat], [position_lng], [phone], [tel], [status]) VALUES (4, N'Wrap & Row', N'<div class="content">
    <h2 class="text-header"><span>Giới thiệu King BBQ Buffet – Lotte Mart Nam Sài Gòn </span></h2>
    <link href="https://pastaxi-manager.onepas.vn/content/style-special.css" rel="stylesheet" type="text/css"><div class="row-app"><div class="col-xs-app-7"><div class="txt-title">Phù hợp:</div><div class="text-description">Đặt tiệc, tụ họp, gặp mặt, liên hoan, họp nhóm, gia đình…</div><div class="txt-title">Món đặc sắc:</div><div class="text-description">Dẻ Sườn bò mỹ, Cổ bò mỹ sốt King BBQ, Bắp bò sốt muối ớt, Nầm heo nướng chao đỏ, Sườn heo, Ba chỉ bò Mỹ sốt King BBQ, Bạch tuộc sốt cay, Bò xào Bulgogi nồi đất, Cơm trộn Hàn Quốc, …
</div><div class="txt-title">Không gian:</div><div class="text-description"><p>- Hàn Quốc. Hiện đại </p><p>- Sức chứa: 150 Khách</p></div><div class="txt-title">Để ô tô:</div><div class="text-description">Có (Phí phụ thuộc đơn vị trông giữ xe)</div><div class="txt-title">Điểm đặc trưng:</div><div class="text-description"><p>- <span style="color:#1b1b1b;font-size:15px;">King BBQ thuộc sở hữu của Tập đoàn RedSun ITI – Một trong những tập đoàn ẩm thực lớn mạnh bậc nhất Việt Nam, sở hữu nhiều thương hiệu ẩm thực nổi tiếng khác như: ThaiExpress, Hotpot Story, Seoul Garden, Sushi Kei, Buk Buk, Capricciosa, Khao Lao, Tasaki BBQ, Meiwei, Truly Việt, Dolpan Sam</span>
</p><p>- Công thức độc quyền của “nước sốt King” – được chính Bếp trưởng Park Sung Min, một trong những đầu bếp nổi tiếng nhất Hàn Quốc, với kinh nghiệm hơn 40 năm trong ngành ẩm thực, trực tiếp nghiên cứu và chế biến. 
</p></div></div><div class="col-xs-app-5"><div class="txt-title">Thông tin thêm</div><ul><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Ghế trẻ em</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Wifi</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Điều hòa</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Visa / Master card</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Hóa đơn VAT</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Chỗ hút thuốc</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Phòng riêng</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Bàn ngoài trời</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Chỗ chơi trẻ em</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">HĐ trực tiếp</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Đặt ship PasGo</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Karaoke</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Máy chiếu</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Trang trí sự kiện</div></li></ul></div></div>
    <h3>King BBQ Buffet Lotte Mart Nam Sài Gòn - Bài ca thịt nướng cuốn hút và vô cùng hấp dẫn</h3><p>Món nướng kiểu Hàn tuy không quá xa lạ đối với thực khách Việt, nhưng không phải ở bất cứ đâu bạn cũng có thể thưởng thức “vị ngon đúng điệu” đậm chất Hàn. Và nếu bạn là một “tín đồ” sành về <a href="https://pasgo.vn/ho-chi-minh/nha-hang/nuong-25" target="_blank">ẩm thực nướng</a> thì chắc hẳn đã từng ghé qua King BBQ Buffet. Đến đây, bạn sẽ có cơ hội trải nghiệm một bữa tiệc buffet với các món ăn không chỉ thơm ngon, hấp dẫn mà còn rất tốt cho sức khỏ, đặc biệt là các món nướng ngon tuyệt hảo.</p><p><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584"><!--cho ?nh vào dây -->
 <img alt="King BBQ Lotte Mart Nam Sài Gòn 1" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-1.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-1.jpg">
        </a></p><div class="custom-box"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
            </a><div class="in" id="gioithieu-more" style="height: auto;"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
                </a><div class="box-list"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
                    </a>
<p></p><h5>Bàn tiệc nướng đủ vị khiến thực khách khó tính nhất cũng phải xiêu lòng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 2" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-2.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-2.jpg"></p><h5>Từng món ăn đều được chăm chút và chuẩn bị rất kĩ lưỡng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 3" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-3.jpg"><br></p><h5>Không chỉ có thịt nướng đơn thuần, King BBQ Buffet còn biến tấu thành rất nhiều những hương vị khác nhau cho thực khách dễ dàng lựa chọn</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 4" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-4.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-4.jpg"></p><h5>Mỗi món ăn đều chứa đựng bao tâm huyết và đam mê của người đầu bếp</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 5" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-5.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-5.jpg"></p><h5>Không chỉ ngon miệng mà còn được bài trí rất đẹp mắt đó nha</h5><p>Ở King BBQ Buffet Lotte Mart Nam Sài Gòn, bạn chắc hẳn sẽ bị chinh phục ngay bởi cách bày trí món ăn vô cùng cuốn hút. Trong đó, điểm nhấn vẫn là thịt nướng bao gồm thịt bò, thịt heo, thịt gà, có thể kế đến như: Cổ bò Mỹ sốt King BBQ, Ba chỉ bò Mỹ sốt King BBQ, Ba chỉ bò Mỹ sốt GuangYang, Bắp bò Úc sốt ớt chuông đỏ, Ba chỉ heo sốt cay Hàn Quốc, Ba chỉ heo ướp muối, Sườn heo bản lớn, Nạc vai heo sốt tỏi, Đùi gà rút xương sốt King BBQ,... tất cả đều được thái lát mỏng đẹp mắt, rải đều sốt đậm đà, thơm lừng. Ngoài ra, hải sản tươi ngon như: Bạch tuộc nướng, Mực trứng sốt cay,… cũng sẽ khiến bạn ngây ngất bởi dư vị mặn mòi, rất khác biệt.</p><p>Đặc biệt, bạn cũng có thể thưởng thức các món lẩu thơm ngọt để tăng thêm dư vị cho bữa tiệc ở King BBQ Buffet nha. Nước dùng được ninh hoàn toàn từ xương ống, nói không với mì chính, King BBQ Buffet luôn đặt sức khỏe của thực khách lên hàng đầu.</p><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 7" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-7.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-7.jpg"></p><h5>Với 10 vị sốt tẩm ướp khác nhau, thực khách có thể dễ dàng chọn được hương vị mà mình yêu thích</h5><p></p><img alt="King BBQ Lotte Mart Nam Sài Gòn 8" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-8.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-8.jpg"><h5>Nước sốt chấm được pha chế độc quyền bởi bếp trưởng Park Sung Min, bạn sẽ không thể tìm thấy ở bất kì n<a href="https://pasgo.vn/ho-chi-minh/nha-hang" target="_blank">hà hàng</a> nào</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 9" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-9.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-9.jpg"></p><h5>Nguyên liệu tươi ngon được nhập từ các nhà cung cấp uy tín làm nên chất lượng món ăn tuyệt hảo</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 10" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-10.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-10.jpg"></p><h5>Bên cạnh sốt tẩm ướp thì King BBQ Buffet Lotte Mart Nam Sài Gòn còn có cả sốt chấm cực kì ngon đó nha!</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 11" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-11.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-11.jpg"></p><h5>Không chỉ có các loại thịt, hải sản cũng là món được rất nhiều người yêu thích</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 12" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-12.jpg"></p><h5>Nào mực, nào cá với dư vị biển khơi mặn mòi đầy mời gọi</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 13" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-13.jpg"></p><h5>Bạn đừng quên thưởng thức các hương vị lẩu ấm nóng ở King BBQ Buffet Lotte Mart Nam Sài Gòn nha</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 14" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-14.jpg"></p><p>Với không gian ấm cúng và thân thiện, quầy buffet rộng với nhiều đồ ăn phong phú thay đổi theo từng ngày, King BBQ Buffet Lotte Mart Nam Sài Gòn sẽ là lựa chọn không thể thiếu cho các bữa tiệc gia đình hay tụ tập bạn bè, đồng nghiệp ngày cuối tuần. Hệ thống bếp nướng không khói thuận tiện, vừa giúp giữ nguyên hương vị món ăn, vừa mang lại một không gian thoải mái, thực khách thỏa sức thưởng thức các món nướng mà không lo bị ám mùi khó chịu.</p><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 15" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-15.jpg"></p><h5>Không gian King BBQ Buffet không quá rộng nhưng sắp xếp hợp lý nên rất thoáng đãng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 16" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-16.jpg"></p><h5>Dù là bữa tiệc đông người hay một nhóm nhỏ thì King BBQ Buffet Lotte Mart Nam Sài Gòn vẫn rất phù hợp</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 17" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-17.jpg"></p><h5>Bạn có thể thoải mái lựa chọn chỗ ngồi thích hợp khi đến đây</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 18" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-18.jpg"></p><h5>Quầy line được sắp xếp rất hợp lý, thông minh để phục vụ thực khách được tốt nhất</h5><p></p><img alt="King BBQ Lotte Mart Nam Sài Gòn 19" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-19.jpg"><h5>Điểm cộng của nhà hàng đó chính là thái độ phụ vụ rất chuyên nghiệp của nhân viên</h5><p>Hãy đến ngay với King BBQ Buffet Lotte Mart Nam Sài Gòn thưởng thức bữa tiệc buffet đặc sắc trong không gian ấm cúng và vô cùng gần gũi nha. Đừng quên đặt bàn qua PasGo – Mạng lưới nhà hàng ngon để nhận thêm nhiều ưu đãi bất ngờ!</p><h4>Địa chỉ Nhà hàng:</h4><h4>Nhà hàng King BBQ Buffet Lotte Mart Nam Sài Gòn: Tầng 3F – Lotte Mart Nam Sài Gòn, số 469 Nguyễn Hữu Thọ, Phường Tân Hưng, Quận 7, TP.HCM</h4>
                </div>
            </div>
            <a class="btn-xemthem" role="button" data-toggle="collapse" href="#gioithieu-more" aria-expanded="false" aria-controls="gioithieu-more" style="display: none;">
                Xem thêm
            </a>
        </div>
    <div class="col-xs-12 col-md-12">
        <div class="col-md-3">
            <div class="social-like">
                <div class="fb-like fb_iframe_widget" data-href="https://pasgo.vn/nha-hang/king-bbq-lotte-mart-nam-sai-gon-2478" data-layout="button_count" data-action="like" data-share="true" fb-xfbml-state="rendered" fb-iframe-plugin-query="action=like&amp;app_id=584525768323186&amp;container_width=217&amp;href=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true"><span style="vertical-align: bottom; width: 150px; height: 28px;"><iframe name="f3ef37f6bb72ce4" width="1000px" height="1000px" data-testid="fb:like Facebook Social Plugin" title="fb:like Facebook Social Plugin" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" allow="encrypted-media" src="https://www.facebook.com/v5.0/plugins/like.php?action=like&amp;app_id=584525768323186&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fx%2Fconnect%2Fxd_arbiter%2F%3Fversion%3D46%23cb%3Df1d25b142847adc%26domain%3Dpasgo.vn%26origin%3Dhttps%253A%252F%252Fpasgo.vn%252Ff160d5dc831f6ac%26relation%3Dparent.parent&amp;container_width=217&amp;href=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true" style="border: none; visibility: visible; width: 150px; height: 28px;" class=""></iframe></span></div>
            </div>
        </div>
        <div class="col-md-2">
            <div id="___plusone_0" style="position: absolute; width: 450px; left: -10000px;"><iframe ng-non-bindable="" frameborder="0" hspace="0" marginheight="0" marginwidth="0" scrolling="no" style="position:absolute;top:-10000px;width:450px;margin:0px;border-style:none" tabindex="0" vspace="0" width="100%" id="I0_1620214350994" name="I0_1620214350994" src="https://apis.google.com/u/0/se/0/_/+1/fastbutton?usegapi=1&amp;origin=https%3A%2F%2Fpasgo.vn&amp;url=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;gsrc=3p&amp;ic=1&amp;jsh=m%3B%2F_%2Fscs%2Fapps-static%2F_%2Fjs%2Fk%3Doz.gapi.vi.Np5UIK_lCuw.O%2Fm%3D__features__%2Fam%3DAQE%2Frt%3Dj%2Fd%3D1%2Frs%3DAGLTcCMfAte-OUXlAWpDj4LziXXJDdgBFA#_methods=onPlusOne%2C_ready%2C_close%2C_open%2C_resizeMe%2C_renderstart%2Concircled%2Cdrefresh%2Cerefresh%2Conload&amp;id=I0_1620214350994&amp;_gfid=I0_1620214350994&amp;parent=https%3A%2F%2Fpasgo.vn&amp;pfname=&amp;rpctoken=28530923"></iframe></div><div class="g-plusone" data-href="https://pasgo.vn/nha-hang/king-bbq-lotte-mart-nam-sai-gon-2478" data-gapiscan="true" data-onload="true" data-gapistub="true"></div>
        </div>
        <div class="col-md-7">
            Nếu bạn thấy bài viết này hữu ích, hãy chia sẻ và bình luận ngay nhé!
        </div>
    </div>
</div>', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'07:00:00' AS Time), CAST(N'23:00:00' AS Time), N'image/brand/3.jpg', 3, N'72 Nguyễn Huệ, Huế', 16.4598068, 107.5926476, N'00000000003', NULL, 1)
INSERT [dbo].[brand] ([brand_id], [brand_name], [info], [date_created], [open_time], [close_time], [avatar], [service_type_id], [address], [position_lat], [position_lng], [phone], [tel], [status]) VALUES (5, N'Ngọc Sương', N'<div class="content">
    <h2 class="text-header"><span>Giới thiệu King BBQ Buffet – Lotte Mart Nam Sài Gòn </span></h2>
    <link href="https://pastaxi-manager.onepas.vn/content/style-special.css" rel="stylesheet" type="text/css"><div class="row-app"><div class="col-xs-app-7"><div class="txt-title">Phù hợp:</div><div class="text-description">Đặt tiệc, tụ họp, gặp mặt, liên hoan, họp nhóm, gia đình…</div><div class="txt-title">Món đặc sắc:</div><div class="text-description">Dẻ Sườn bò mỹ, Cổ bò mỹ sốt King BBQ, Bắp bò sốt muối ớt, Nầm heo nướng chao đỏ, Sườn heo, Ba chỉ bò Mỹ sốt King BBQ, Bạch tuộc sốt cay, Bò xào Bulgogi nồi đất, Cơm trộn Hàn Quốc, …
</div><div class="txt-title">Không gian:</div><div class="text-description"><p>- Hàn Quốc. Hiện đại </p><p>- Sức chứa: 150 Khách</p></div><div class="txt-title">Để ô tô:</div><div class="text-description">Có (Phí phụ thuộc đơn vị trông giữ xe)</div><div class="txt-title">Điểm đặc trưng:</div><div class="text-description"><p>- <span style="color:#1b1b1b;font-size:15px;">King BBQ thuộc sở hữu của Tập đoàn RedSun ITI – Một trong những tập đoàn ẩm thực lớn mạnh bậc nhất Việt Nam, sở hữu nhiều thương hiệu ẩm thực nổi tiếng khác như: ThaiExpress, Hotpot Story, Seoul Garden, Sushi Kei, Buk Buk, Capricciosa, Khao Lao, Tasaki BBQ, Meiwei, Truly Việt, Dolpan Sam</span>
</p><p>- Công thức độc quyền của “nước sốt King” – được chính Bếp trưởng Park Sung Min, một trong những đầu bếp nổi tiếng nhất Hàn Quốc, với kinh nghiệm hơn 40 năm trong ngành ẩm thực, trực tiếp nghiên cứu và chế biến. 
</p></div></div><div class="col-xs-app-5"><div class="txt-title">Thông tin thêm</div><ul><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Ghế trẻ em</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Wifi</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Điều hòa</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Visa / Master card</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Hóa đơn VAT</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Chỗ hút thuốc</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Phòng riêng</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Bàn ngoài trời</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Chỗ chơi trẻ em</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">HĐ trực tiếp</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Đặt ship PasGo</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Karaoke</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Máy chiếu</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Trang trí sự kiện</div></li></ul></div></div>
    <h3>King BBQ Buffet Lotte Mart Nam Sài Gòn - Bài ca thịt nướng cuốn hút và vô cùng hấp dẫn</h3><p>Món nướng kiểu Hàn tuy không quá xa lạ đối với thực khách Việt, nhưng không phải ở bất cứ đâu bạn cũng có thể thưởng thức “vị ngon đúng điệu” đậm chất Hàn. Và nếu bạn là một “tín đồ” sành về <a href="https://pasgo.vn/ho-chi-minh/nha-hang/nuong-25" target="_blank">ẩm thực nướng</a> thì chắc hẳn đã từng ghé qua King BBQ Buffet. Đến đây, bạn sẽ có cơ hội trải nghiệm một bữa tiệc buffet với các món ăn không chỉ thơm ngon, hấp dẫn mà còn rất tốt cho sức khỏ, đặc biệt là các món nướng ngon tuyệt hảo.</p><p><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584"><!--cho ?nh vào dây -->
 <img alt="King BBQ Lotte Mart Nam Sài Gòn 1" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-1.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-1.jpg">
        </a></p><div class="custom-box"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
            </a><div class="in" id="gioithieu-more" style="height: auto;"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
                </a><div class="box-list"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
                    </a>
<p></p><h5>Bàn tiệc nướng đủ vị khiến thực khách khó tính nhất cũng phải xiêu lòng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 2" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-2.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-2.jpg"></p><h5>Từng món ăn đều được chăm chút và chuẩn bị rất kĩ lưỡng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 3" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-3.jpg"><br></p><h5>Không chỉ có thịt nướng đơn thuần, King BBQ Buffet còn biến tấu thành rất nhiều những hương vị khác nhau cho thực khách dễ dàng lựa chọn</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 4" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-4.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-4.jpg"></p><h5>Mỗi món ăn đều chứa đựng bao tâm huyết và đam mê của người đầu bếp</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 5" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-5.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-5.jpg"></p><h5>Không chỉ ngon miệng mà còn được bài trí rất đẹp mắt đó nha</h5><p>Ở King BBQ Buffet Lotte Mart Nam Sài Gòn, bạn chắc hẳn sẽ bị chinh phục ngay bởi cách bày trí món ăn vô cùng cuốn hút. Trong đó, điểm nhấn vẫn là thịt nướng bao gồm thịt bò, thịt heo, thịt gà, có thể kế đến như: Cổ bò Mỹ sốt King BBQ, Ba chỉ bò Mỹ sốt King BBQ, Ba chỉ bò Mỹ sốt GuangYang, Bắp bò Úc sốt ớt chuông đỏ, Ba chỉ heo sốt cay Hàn Quốc, Ba chỉ heo ướp muối, Sườn heo bản lớn, Nạc vai heo sốt tỏi, Đùi gà rút xương sốt King BBQ,... tất cả đều được thái lát mỏng đẹp mắt, rải đều sốt đậm đà, thơm lừng. Ngoài ra, hải sản tươi ngon như: Bạch tuộc nướng, Mực trứng sốt cay,… cũng sẽ khiến bạn ngây ngất bởi dư vị mặn mòi, rất khác biệt.</p><p>Đặc biệt, bạn cũng có thể thưởng thức các món lẩu thơm ngọt để tăng thêm dư vị cho bữa tiệc ở King BBQ Buffet nha. Nước dùng được ninh hoàn toàn từ xương ống, nói không với mì chính, King BBQ Buffet luôn đặt sức khỏe của thực khách lên hàng đầu.</p><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 7" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-7.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-7.jpg"></p><h5>Với 10 vị sốt tẩm ướp khác nhau, thực khách có thể dễ dàng chọn được hương vị mà mình yêu thích</h5><p></p><img alt="King BBQ Lotte Mart Nam Sài Gòn 8" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-8.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-8.jpg"><h5>Nước sốt chấm được pha chế độc quyền bởi bếp trưởng Park Sung Min, bạn sẽ không thể tìm thấy ở bất kì n<a href="https://pasgo.vn/ho-chi-minh/nha-hang" target="_blank">hà hàng</a> nào</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 9" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-9.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-9.jpg"></p><h5>Nguyên liệu tươi ngon được nhập từ các nhà cung cấp uy tín làm nên chất lượng món ăn tuyệt hảo</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 10" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-10.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-10.jpg"></p><h5>Bên cạnh sốt tẩm ướp thì King BBQ Buffet Lotte Mart Nam Sài Gòn còn có cả sốt chấm cực kì ngon đó nha!</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 11" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-11.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-11.jpg"></p><h5>Không chỉ có các loại thịt, hải sản cũng là món được rất nhiều người yêu thích</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 12" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-12.jpg"></p><h5>Nào mực, nào cá với dư vị biển khơi mặn mòi đầy mời gọi</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 13" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-13.jpg"></p><h5>Bạn đừng quên thưởng thức các hương vị lẩu ấm nóng ở King BBQ Buffet Lotte Mart Nam Sài Gòn nha</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 14" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-14.jpg"></p><p>Với không gian ấm cúng và thân thiện, quầy buffet rộng với nhiều đồ ăn phong phú thay đổi theo từng ngày, King BBQ Buffet Lotte Mart Nam Sài Gòn sẽ là lựa chọn không thể thiếu cho các bữa tiệc gia đình hay tụ tập bạn bè, đồng nghiệp ngày cuối tuần. Hệ thống bếp nướng không khói thuận tiện, vừa giúp giữ nguyên hương vị món ăn, vừa mang lại một không gian thoải mái, thực khách thỏa sức thưởng thức các món nướng mà không lo bị ám mùi khó chịu.</p><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 15" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-15.jpg"></p><h5>Không gian King BBQ Buffet không quá rộng nhưng sắp xếp hợp lý nên rất thoáng đãng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 16" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-16.jpg"></p><h5>Dù là bữa tiệc đông người hay một nhóm nhỏ thì King BBQ Buffet Lotte Mart Nam Sài Gòn vẫn rất phù hợp</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 17" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-17.jpg"></p><h5>Bạn có thể thoải mái lựa chọn chỗ ngồi thích hợp khi đến đây</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 18" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-18.jpg"></p><h5>Quầy line được sắp xếp rất hợp lý, thông minh để phục vụ thực khách được tốt nhất</h5><p></p><img alt="King BBQ Lotte Mart Nam Sài Gòn 19" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-19.jpg"><h5>Điểm cộng của nhà hàng đó chính là thái độ phụ vụ rất chuyên nghiệp của nhân viên</h5><p>Hãy đến ngay với King BBQ Buffet Lotte Mart Nam Sài Gòn thưởng thức bữa tiệc buffet đặc sắc trong không gian ấm cúng và vô cùng gần gũi nha. Đừng quên đặt bàn qua PasGo – Mạng lưới nhà hàng ngon để nhận thêm nhiều ưu đãi bất ngờ!</p><h4>Địa chỉ Nhà hàng:</h4><h4>Nhà hàng King BBQ Buffet Lotte Mart Nam Sài Gòn: Tầng 3F – Lotte Mart Nam Sài Gòn, số 469 Nguyễn Hữu Thọ, Phường Tân Hưng, Quận 7, TP.HCM</h4>
                </div>
            </div>
            <a class="btn-xemthem" role="button" data-toggle="collapse" href="#gioithieu-more" aria-expanded="false" aria-controls="gioithieu-more" style="display: none;">
                Xem thêm
            </a>
        </div>
    <div class="col-xs-12 col-md-12">
        <div class="col-md-3">
            <div class="social-like">
                <div class="fb-like fb_iframe_widget" data-href="https://pasgo.vn/nha-hang/king-bbq-lotte-mart-nam-sai-gon-2478" data-layout="button_count" data-action="like" data-share="true" fb-xfbml-state="rendered" fb-iframe-plugin-query="action=like&amp;app_id=584525768323186&amp;container_width=217&amp;href=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true"><span style="vertical-align: bottom; width: 150px; height: 28px;"><iframe name="f3ef37f6bb72ce4" width="1000px" height="1000px" data-testid="fb:like Facebook Social Plugin" title="fb:like Facebook Social Plugin" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" allow="encrypted-media" src="https://www.facebook.com/v5.0/plugins/like.php?action=like&amp;app_id=584525768323186&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fx%2Fconnect%2Fxd_arbiter%2F%3Fversion%3D46%23cb%3Df1d25b142847adc%26domain%3Dpasgo.vn%26origin%3Dhttps%253A%252F%252Fpasgo.vn%252Ff160d5dc831f6ac%26relation%3Dparent.parent&amp;container_width=217&amp;href=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true" style="border: none; visibility: visible; width: 150px; height: 28px;" class=""></iframe></span></div>
            </div>
        </div>
        <div class="col-md-2">
            <div id="___plusone_0" style="position: absolute; width: 450px; left: -10000px;"><iframe ng-non-bindable="" frameborder="0" hspace="0" marginheight="0" marginwidth="0" scrolling="no" style="position:absolute;top:-10000px;width:450px;margin:0px;border-style:none" tabindex="0" vspace="0" width="100%" id="I0_1620214350994" name="I0_1620214350994" src="https://apis.google.com/u/0/se/0/_/+1/fastbutton?usegapi=1&amp;origin=https%3A%2F%2Fpasgo.vn&amp;url=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;gsrc=3p&amp;ic=1&amp;jsh=m%3B%2F_%2Fscs%2Fapps-static%2F_%2Fjs%2Fk%3Doz.gapi.vi.Np5UIK_lCuw.O%2Fm%3D__features__%2Fam%3DAQE%2Frt%3Dj%2Fd%3D1%2Frs%3DAGLTcCMfAte-OUXlAWpDj4LziXXJDdgBFA#_methods=onPlusOne%2C_ready%2C_close%2C_open%2C_resizeMe%2C_renderstart%2Concircled%2Cdrefresh%2Cerefresh%2Conload&amp;id=I0_1620214350994&amp;_gfid=I0_1620214350994&amp;parent=https%3A%2F%2Fpasgo.vn&amp;pfname=&amp;rpctoken=28530923"></iframe></div><div class="g-plusone" data-href="https://pasgo.vn/nha-hang/king-bbq-lotte-mart-nam-sai-gon-2478" data-gapiscan="true" data-onload="true" data-gapistub="true"></div>
        </div>
        <div class="col-md-7">
            Nếu bạn thấy bài viết này hữu ích, hãy chia sẻ và bình luận ngay nhé!
        </div>
    </div>
</div>', CAST(N'2021-12-15T00:00:00.000' AS DateTime), CAST(N'07:00:00' AS Time), CAST(N'23:00:00' AS Time), N'image/brand/4.jpg', 4, N'73 Nguyễn Huệ, Huế', 16.4598068, 107.5926476, N'00000000004', NULL, 1)
INSERT [dbo].[brand] ([brand_id], [brand_name], [info], [date_created], [open_time], [close_time], [avatar], [service_type_id], [address], [position_lat], [position_lng], [phone], [tel], [status]) VALUES (6, N'Hoàng Yến Buffet Premier', N'<div class="content">
    <h2 class="text-header"><span>Giới thiệu King BBQ Buffet – Lotte Mart Nam Sài Gòn </span></h2>
    <link href="https://pastaxi-manager.onepas.vn/content/style-special.css" rel="stylesheet" type="text/css"><div class="row-app"><div class="col-xs-app-7"><div class="txt-title">Phù hợp:</div><div class="text-description">Đặt tiệc, tụ họp, gặp mặt, liên hoan, họp nhóm, gia đình…</div><div class="txt-title">Món đặc sắc:</div><div class="text-description">Dẻ Sườn bò mỹ, Cổ bò mỹ sốt King BBQ, Bắp bò sốt muối ớt, Nầm heo nướng chao đỏ, Sườn heo, Ba chỉ bò Mỹ sốt King BBQ, Bạch tuộc sốt cay, Bò xào Bulgogi nồi đất, Cơm trộn Hàn Quốc, …
</div><div class="txt-title">Không gian:</div><div class="text-description"><p>- Hàn Quốc. Hiện đại </p><p>- Sức chứa: 150 Khách</p></div><div class="txt-title">Để ô tô:</div><div class="text-description">Có (Phí phụ thuộc đơn vị trông giữ xe)</div><div class="txt-title">Điểm đặc trưng:</div><div class="text-description"><p>- <span style="color:#1b1b1b;font-size:15px;">King BBQ thuộc sở hữu của Tập đoàn RedSun ITI – Một trong những tập đoàn ẩm thực lớn mạnh bậc nhất Việt Nam, sở hữu nhiều thương hiệu ẩm thực nổi tiếng khác như: ThaiExpress, Hotpot Story, Seoul Garden, Sushi Kei, Buk Buk, Capricciosa, Khao Lao, Tasaki BBQ, Meiwei, Truly Việt, Dolpan Sam</span>
</p><p>- Công thức độc quyền của “nước sốt King” – được chính Bếp trưởng Park Sung Min, một trong những đầu bếp nổi tiếng nhất Hàn Quốc, với kinh nghiệm hơn 40 năm trong ngành ẩm thực, trực tiếp nghiên cứu và chế biến. 
</p></div></div><div class="col-xs-app-5"><div class="txt-title">Thông tin thêm</div><ul><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Ghế trẻ em</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Wifi</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Điều hòa</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Visa / Master card</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Hóa đơn VAT</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Chỗ hút thuốc</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Phòng riêng</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Bàn ngoài trời</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Chỗ chơi trẻ em</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">HĐ trực tiếp</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Đặt ship PasGo</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Karaoke</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Máy chiếu</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Trang trí sự kiện</div></li></ul></div></div>
    <h3>King BBQ Buffet Lotte Mart Nam Sài Gòn - Bài ca thịt nướng cuốn hút và vô cùng hấp dẫn</h3><p>Món nướng kiểu Hàn tuy không quá xa lạ đối với thực khách Việt, nhưng không phải ở bất cứ đâu bạn cũng có thể thưởng thức “vị ngon đúng điệu” đậm chất Hàn. Và nếu bạn là một “tín đồ” sành về <a href="https://pasgo.vn/ho-chi-minh/nha-hang/nuong-25" target="_blank">ẩm thực nướng</a> thì chắc hẳn đã từng ghé qua King BBQ Buffet. Đến đây, bạn sẽ có cơ hội trải nghiệm một bữa tiệc buffet với các món ăn không chỉ thơm ngon, hấp dẫn mà còn rất tốt cho sức khỏ, đặc biệt là các món nướng ngon tuyệt hảo.</p><p><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584"><!--cho ?nh vào dây -->
 <img alt="King BBQ Lotte Mart Nam Sài Gòn 1" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-1.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-1.jpg">
        </a></p><div class="custom-box"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
            </a><div class="in" id="gioithieu-more" style="height: auto;"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
                </a><div class="box-list"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
                    </a>
<p></p><h5>Bàn tiệc nướng đủ vị khiến thực khách khó tính nhất cũng phải xiêu lòng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 2" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-2.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-2.jpg"></p><h5>Từng món ăn đều được chăm chút và chuẩn bị rất kĩ lưỡng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 3" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-3.jpg"><br></p><h5>Không chỉ có thịt nướng đơn thuần, King BBQ Buffet còn biến tấu thành rất nhiều những hương vị khác nhau cho thực khách dễ dàng lựa chọn</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 4" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-4.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-4.jpg"></p><h5>Mỗi món ăn đều chứa đựng bao tâm huyết và đam mê của người đầu bếp</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 5" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-5.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-5.jpg"></p><h5>Không chỉ ngon miệng mà còn được bài trí rất đẹp mắt đó nha</h5><p>Ở King BBQ Buffet Lotte Mart Nam Sài Gòn, bạn chắc hẳn sẽ bị chinh phục ngay bởi cách bày trí món ăn vô cùng cuốn hút. Trong đó, điểm nhấn vẫn là thịt nướng bao gồm thịt bò, thịt heo, thịt gà, có thể kế đến như: Cổ bò Mỹ sốt King BBQ, Ba chỉ bò Mỹ sốt King BBQ, Ba chỉ bò Mỹ sốt GuangYang, Bắp bò Úc sốt ớt chuông đỏ, Ba chỉ heo sốt cay Hàn Quốc, Ba chỉ heo ướp muối, Sườn heo bản lớn, Nạc vai heo sốt tỏi, Đùi gà rút xương sốt King BBQ,... tất cả đều được thái lát mỏng đẹp mắt, rải đều sốt đậm đà, thơm lừng. Ngoài ra, hải sản tươi ngon như: Bạch tuộc nướng, Mực trứng sốt cay,… cũng sẽ khiến bạn ngây ngất bởi dư vị mặn mòi, rất khác biệt.</p><p>Đặc biệt, bạn cũng có thể thưởng thức các món lẩu thơm ngọt để tăng thêm dư vị cho bữa tiệc ở King BBQ Buffet nha. Nước dùng được ninh hoàn toàn từ xương ống, nói không với mì chính, King BBQ Buffet luôn đặt sức khỏe của thực khách lên hàng đầu.</p><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 7" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-7.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-7.jpg"></p><h5>Với 10 vị sốt tẩm ướp khác nhau, thực khách có thể dễ dàng chọn được hương vị mà mình yêu thích</h5><p></p><img alt="King BBQ Lotte Mart Nam Sài Gòn 8" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-8.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-8.jpg"><h5>Nước sốt chấm được pha chế độc quyền bởi bếp trưởng Park Sung Min, bạn sẽ không thể tìm thấy ở bất kì n<a href="https://pasgo.vn/ho-chi-minh/nha-hang" target="_blank">hà hàng</a> nào</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 9" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-9.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-9.jpg"></p><h5>Nguyên liệu tươi ngon được nhập từ các nhà cung cấp uy tín làm nên chất lượng món ăn tuyệt hảo</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 10" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-10.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-10.jpg"></p><h5>Bên cạnh sốt tẩm ướp thì King BBQ Buffet Lotte Mart Nam Sài Gòn còn có cả sốt chấm cực kì ngon đó nha!</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 11" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-11.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-11.jpg"></p><h5>Không chỉ có các loại thịt, hải sản cũng là món được rất nhiều người yêu thích</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 12" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-12.jpg"></p><h5>Nào mực, nào cá với dư vị biển khơi mặn mòi đầy mời gọi</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 13" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-13.jpg"></p><h5>Bạn đừng quên thưởng thức các hương vị lẩu ấm nóng ở King BBQ Buffet Lotte Mart Nam Sài Gòn nha</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 14" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-14.jpg"></p><p>Với không gian ấm cúng và thân thiện, quầy buffet rộng với nhiều đồ ăn phong phú thay đổi theo từng ngày, King BBQ Buffet Lotte Mart Nam Sài Gòn sẽ là lựa chọn không thể thiếu cho các bữa tiệc gia đình hay tụ tập bạn bè, đồng nghiệp ngày cuối tuần. Hệ thống bếp nướng không khói thuận tiện, vừa giúp giữ nguyên hương vị món ăn, vừa mang lại một không gian thoải mái, thực khách thỏa sức thưởng thức các món nướng mà không lo bị ám mùi khó chịu.</p><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 15" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-15.jpg"></p><h5>Không gian King BBQ Buffet không quá rộng nhưng sắp xếp hợp lý nên rất thoáng đãng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 16" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-16.jpg"></p><h5>Dù là bữa tiệc đông người hay một nhóm nhỏ thì King BBQ Buffet Lotte Mart Nam Sài Gòn vẫn rất phù hợp</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 17" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-17.jpg"></p><h5>Bạn có thể thoải mái lựa chọn chỗ ngồi thích hợp khi đến đây</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 18" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-18.jpg"></p><h5>Quầy line được sắp xếp rất hợp lý, thông minh để phục vụ thực khách được tốt nhất</h5><p></p><img alt="King BBQ Lotte Mart Nam Sài Gòn 19" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-19.jpg"><h5>Điểm cộng của nhà hàng đó chính là thái độ phụ vụ rất chuyên nghiệp của nhân viên</h5><p>Hãy đến ngay với King BBQ Buffet Lotte Mart Nam Sài Gòn thưởng thức bữa tiệc buffet đặc sắc trong không gian ấm cúng và vô cùng gần gũi nha. Đừng quên đặt bàn qua PasGo – Mạng lưới nhà hàng ngon để nhận thêm nhiều ưu đãi bất ngờ!</p><h4>Địa chỉ Nhà hàng:</h4><h4>Nhà hàng King BBQ Buffet Lotte Mart Nam Sài Gòn: Tầng 3F – Lotte Mart Nam Sài Gòn, số 469 Nguyễn Hữu Thọ, Phường Tân Hưng, Quận 7, TP.HCM</h4>
                </div>
            </div>
            <a class="btn-xemthem" role="button" data-toggle="collapse" href="#gioithieu-more" aria-expanded="false" aria-controls="gioithieu-more" style="display: none;">
                Xem thêm
            </a>
        </div>
    <div class="col-xs-12 col-md-12">
        <div class="col-md-3">
            <div class="social-like">
                <div class="fb-like fb_iframe_widget" data-href="https://pasgo.vn/nha-hang/king-bbq-lotte-mart-nam-sai-gon-2478" data-layout="button_count" data-action="like" data-share="true" fb-xfbml-state="rendered" fb-iframe-plugin-query="action=like&amp;app_id=584525768323186&amp;container_width=217&amp;href=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true"><span style="vertical-align: bottom; width: 150px; height: 28px;"><iframe name="f3ef37f6bb72ce4" width="1000px" height="1000px" data-testid="fb:like Facebook Social Plugin" title="fb:like Facebook Social Plugin" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" allow="encrypted-media" src="https://www.facebook.com/v5.0/plugins/like.php?action=like&amp;app_id=584525768323186&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fx%2Fconnect%2Fxd_arbiter%2F%3Fversion%3D46%23cb%3Df1d25b142847adc%26domain%3Dpasgo.vn%26origin%3Dhttps%253A%252F%252Fpasgo.vn%252Ff160d5dc831f6ac%26relation%3Dparent.parent&amp;container_width=217&amp;href=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true" style="border: none; visibility: visible; width: 150px; height: 28px;" class=""></iframe></span></div>
            </div>
        </div>
        <div class="col-md-2">
            <div id="___plusone_0" style="position: absolute; width: 450px; left: -10000px;"><iframe ng-non-bindable="" frameborder="0" hspace="0" marginheight="0" marginwidth="0" scrolling="no" style="position:absolute;top:-10000px;width:450px;margin:0px;border-style:none" tabindex="0" vspace="0" width="100%" id="I0_1620214350994" name="I0_1620214350994" src="https://apis.google.com/u/0/se/0/_/+1/fastbutton?usegapi=1&amp;origin=https%3A%2F%2Fpasgo.vn&amp;url=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;gsrc=3p&amp;ic=1&amp;jsh=m%3B%2F_%2Fscs%2Fapps-static%2F_%2Fjs%2Fk%3Doz.gapi.vi.Np5UIK_lCuw.O%2Fm%3D__features__%2Fam%3DAQE%2Frt%3Dj%2Fd%3D1%2Frs%3DAGLTcCMfAte-OUXlAWpDj4LziXXJDdgBFA#_methods=onPlusOne%2C_ready%2C_close%2C_open%2C_resizeMe%2C_renderstart%2Concircled%2Cdrefresh%2Cerefresh%2Conload&amp;id=I0_1620214350994&amp;_gfid=I0_1620214350994&amp;parent=https%3A%2F%2Fpasgo.vn&amp;pfname=&amp;rpctoken=28530923"></iframe></div><div class="g-plusone" data-href="https://pasgo.vn/nha-hang/king-bbq-lotte-mart-nam-sai-gon-2478" data-gapiscan="true" data-onload="true" data-gapistub="true"></div>
        </div>
        <div class="col-md-7">
            Nếu bạn thấy bài viết này hữu ích, hãy chia sẻ và bình luận ngay nhé!
        </div>
    </div>
</div>', CAST(N'2018-04-05T00:00:00.000' AS DateTime), CAST(N'07:00:00' AS Time), CAST(N'23:00:00' AS Time), N'image/brand/5.jpg', 5, N'75 Nguyễn Huệ, Huế', 16.4598068, 107.5926476, N'00000000005', NULL, 1)
INSERT [dbo].[brand] ([brand_id], [brand_name], [info], [date_created], [open_time], [close_time], [avatar], [service_type_id], [address], [position_lat], [position_lng], [phone], [tel], [status]) VALUES (7, N'Đồng Restaurant', N'<div class="content">
    <h2 class="text-header"><span>Giới thiệu King BBQ Buffet – Lotte Mart Nam Sài Gòn </span></h2>
    <link href="https://pastaxi-manager.onepas.vn/content/style-special.css" rel="stylesheet" type="text/css"><div class="row-app"><div class="col-xs-app-7"><div class="txt-title">Phù hợp:</div><div class="text-description">Đặt tiệc, tụ họp, gặp mặt, liên hoan, họp nhóm, gia đình…</div><div class="txt-title">Món đặc sắc:</div><div class="text-description">Dẻ Sườn bò mỹ, Cổ bò mỹ sốt King BBQ, Bắp bò sốt muối ớt, Nầm heo nướng chao đỏ, Sườn heo, Ba chỉ bò Mỹ sốt King BBQ, Bạch tuộc sốt cay, Bò xào Bulgogi nồi đất, Cơm trộn Hàn Quốc, …
</div><div class="txt-title">Không gian:</div><div class="text-description"><p>- Hàn Quốc. Hiện đại </p><p>- Sức chứa: 150 Khách</p></div><div class="txt-title">Để ô tô:</div><div class="text-description">Có (Phí phụ thuộc đơn vị trông giữ xe)</div><div class="txt-title">Điểm đặc trưng:</div><div class="text-description"><p>- <span style="color:#1b1b1b;font-size:15px;">King BBQ thuộc sở hữu của Tập đoàn RedSun ITI – Một trong những tập đoàn ẩm thực lớn mạnh bậc nhất Việt Nam, sở hữu nhiều thương hiệu ẩm thực nổi tiếng khác như: ThaiExpress, Hotpot Story, Seoul Garden, Sushi Kei, Buk Buk, Capricciosa, Khao Lao, Tasaki BBQ, Meiwei, Truly Việt, Dolpan Sam</span>
</p><p>- Công thức độc quyền của “nước sốt King” – được chính Bếp trưởng Park Sung Min, một trong những đầu bếp nổi tiếng nhất Hàn Quốc, với kinh nghiệm hơn 40 năm trong ngành ẩm thực, trực tiếp nghiên cứu và chế biến. 
</p></div></div><div class="col-xs-app-5"><div class="txt-title">Thông tin thêm</div><ul><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Ghế trẻ em</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Wifi</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Điều hòa</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Visa / Master card</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Hóa đơn VAT</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Chỗ hút thuốc</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Phòng riêng</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Bàn ngoài trời</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Chỗ chơi trẻ em</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">HĐ trực tiếp</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Đặt ship PasGo</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Karaoke</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Máy chiếu</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Trang trí sự kiện</div></li></ul></div></div>
    <h3>King BBQ Buffet Lotte Mart Nam Sài Gòn - Bài ca thịt nướng cuốn hút và vô cùng hấp dẫn</h3><p>Món nướng kiểu Hàn tuy không quá xa lạ đối với thực khách Việt, nhưng không phải ở bất cứ đâu bạn cũng có thể thưởng thức “vị ngon đúng điệu” đậm chất Hàn. Và nếu bạn là một “tín đồ” sành về <a href="https://pasgo.vn/ho-chi-minh/nha-hang/nuong-25" target="_blank">ẩm thực nướng</a> thì chắc hẳn đã từng ghé qua King BBQ Buffet. Đến đây, bạn sẽ có cơ hội trải nghiệm một bữa tiệc buffet với các món ăn không chỉ thơm ngon, hấp dẫn mà còn rất tốt cho sức khỏ, đặc biệt là các món nướng ngon tuyệt hảo.</p><p><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584"><!--cho ?nh vào dây -->
 <img alt="King BBQ Lotte Mart Nam Sài Gòn 1" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-1.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-1.jpg">
        </a></p><div class="custom-box"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
            </a><div class="in" id="gioithieu-more" style="height: auto;"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
                </a><div class="box-list"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
                    </a>
<p></p><h5>Bàn tiệc nướng đủ vị khiến thực khách khó tính nhất cũng phải xiêu lòng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 2" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-2.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-2.jpg"></p><h5>Từng món ăn đều được chăm chút và chuẩn bị rất kĩ lưỡng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 3" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-3.jpg"><br></p><h5>Không chỉ có thịt nướng đơn thuần, King BBQ Buffet còn biến tấu thành rất nhiều những hương vị khác nhau cho thực khách dễ dàng lựa chọn</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 4" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-4.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-4.jpg"></p><h5>Mỗi món ăn đều chứa đựng bao tâm huyết và đam mê của người đầu bếp</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 5" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-5.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-5.jpg"></p><h5>Không chỉ ngon miệng mà còn được bài trí rất đẹp mắt đó nha</h5><p>Ở King BBQ Buffet Lotte Mart Nam Sài Gòn, bạn chắc hẳn sẽ bị chinh phục ngay bởi cách bày trí món ăn vô cùng cuốn hút. Trong đó, điểm nhấn vẫn là thịt nướng bao gồm thịt bò, thịt heo, thịt gà, có thể kế đến như: Cổ bò Mỹ sốt King BBQ, Ba chỉ bò Mỹ sốt King BBQ, Ba chỉ bò Mỹ sốt GuangYang, Bắp bò Úc sốt ớt chuông đỏ, Ba chỉ heo sốt cay Hàn Quốc, Ba chỉ heo ướp muối, Sườn heo bản lớn, Nạc vai heo sốt tỏi, Đùi gà rút xương sốt King BBQ,... tất cả đều được thái lát mỏng đẹp mắt, rải đều sốt đậm đà, thơm lừng. Ngoài ra, hải sản tươi ngon như: Bạch tuộc nướng, Mực trứng sốt cay,… cũng sẽ khiến bạn ngây ngất bởi dư vị mặn mòi, rất khác biệt.</p><p>Đặc biệt, bạn cũng có thể thưởng thức các món lẩu thơm ngọt để tăng thêm dư vị cho bữa tiệc ở King BBQ Buffet nha. Nước dùng được ninh hoàn toàn từ xương ống, nói không với mì chính, King BBQ Buffet luôn đặt sức khỏe của thực khách lên hàng đầu.</p><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 7" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-7.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-7.jpg"></p><h5>Với 10 vị sốt tẩm ướp khác nhau, thực khách có thể dễ dàng chọn được hương vị mà mình yêu thích</h5><p></p><img alt="King BBQ Lotte Mart Nam Sài Gòn 8" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-8.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-8.jpg"><h5>Nước sốt chấm được pha chế độc quyền bởi bếp trưởng Park Sung Min, bạn sẽ không thể tìm thấy ở bất kì n<a href="https://pasgo.vn/ho-chi-minh/nha-hang" target="_blank">hà hàng</a> nào</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 9" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-9.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-9.jpg"></p><h5>Nguyên liệu tươi ngon được nhập từ các nhà cung cấp uy tín làm nên chất lượng món ăn tuyệt hảo</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 10" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-10.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-10.jpg"></p><h5>Bên cạnh sốt tẩm ướp thì King BBQ Buffet Lotte Mart Nam Sài Gòn còn có cả sốt chấm cực kì ngon đó nha!</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 11" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-11.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-11.jpg"></p><h5>Không chỉ có các loại thịt, hải sản cũng là món được rất nhiều người yêu thích</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 12" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-12.jpg"></p><h5>Nào mực, nào cá với dư vị biển khơi mặn mòi đầy mời gọi</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 13" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-13.jpg"></p><h5>Bạn đừng quên thưởng thức các hương vị lẩu ấm nóng ở King BBQ Buffet Lotte Mart Nam Sài Gòn nha</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 14" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-14.jpg"></p><p>Với không gian ấm cúng và thân thiện, quầy buffet rộng với nhiều đồ ăn phong phú thay đổi theo từng ngày, King BBQ Buffet Lotte Mart Nam Sài Gòn sẽ là lựa chọn không thể thiếu cho các bữa tiệc gia đình hay tụ tập bạn bè, đồng nghiệp ngày cuối tuần. Hệ thống bếp nướng không khói thuận tiện, vừa giúp giữ nguyên hương vị món ăn, vừa mang lại một không gian thoải mái, thực khách thỏa sức thưởng thức các món nướng mà không lo bị ám mùi khó chịu.</p><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 15" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-15.jpg"></p><h5>Không gian King BBQ Buffet không quá rộng nhưng sắp xếp hợp lý nên rất thoáng đãng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 16" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-16.jpg"></p><h5>Dù là bữa tiệc đông người hay một nhóm nhỏ thì King BBQ Buffet Lotte Mart Nam Sài Gòn vẫn rất phù hợp</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 17" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-17.jpg"></p><h5>Bạn có thể thoải mái lựa chọn chỗ ngồi thích hợp khi đến đây</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 18" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-18.jpg"></p><h5>Quầy line được sắp xếp rất hợp lý, thông minh để phục vụ thực khách được tốt nhất</h5><p></p><img alt="King BBQ Lotte Mart Nam Sài Gòn 19" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-19.jpg"><h5>Điểm cộng của nhà hàng đó chính là thái độ phụ vụ rất chuyên nghiệp của nhân viên</h5><p>Hãy đến ngay với King BBQ Buffet Lotte Mart Nam Sài Gòn thưởng thức bữa tiệc buffet đặc sắc trong không gian ấm cúng và vô cùng gần gũi nha. Đừng quên đặt bàn qua PasGo – Mạng lưới nhà hàng ngon để nhận thêm nhiều ưu đãi bất ngờ!</p><h4>Địa chỉ Nhà hàng:</h4><h4>Nhà hàng King BBQ Buffet Lotte Mart Nam Sài Gòn: Tầng 3F – Lotte Mart Nam Sài Gòn, số 469 Nguyễn Hữu Thọ, Phường Tân Hưng, Quận 7, TP.HCM</h4>
                </div>
            </div>
            <a class="btn-xemthem" role="button" data-toggle="collapse" href="#gioithieu-more" aria-expanded="false" aria-controls="gioithieu-more" style="display: none;">
                Xem thêm
            </a>
        </div>
    <div class="col-xs-12 col-md-12">
        <div class="col-md-3">
            <div class="social-like">
                <div class="fb-like fb_iframe_widget" data-href="https://pasgo.vn/nha-hang/king-bbq-lotte-mart-nam-sai-gon-2478" data-layout="button_count" data-action="like" data-share="true" fb-xfbml-state="rendered" fb-iframe-plugin-query="action=like&amp;app_id=584525768323186&amp;container_width=217&amp;href=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true"><span style="vertical-align: bottom; width: 150px; height: 28px;"><iframe name="f3ef37f6bb72ce4" width="1000px" height="1000px" data-testid="fb:like Facebook Social Plugin" title="fb:like Facebook Social Plugin" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" allow="encrypted-media" src="https://www.facebook.com/v5.0/plugins/like.php?action=like&amp;app_id=584525768323186&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fx%2Fconnect%2Fxd_arbiter%2F%3Fversion%3D46%23cb%3Df1d25b142847adc%26domain%3Dpasgo.vn%26origin%3Dhttps%253A%252F%252Fpasgo.vn%252Ff160d5dc831f6ac%26relation%3Dparent.parent&amp;container_width=217&amp;href=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true" style="border: none; visibility: visible; width: 150px; height: 28px;" class=""></iframe></span></div>
            </div>
        </div>
        <div class="col-md-2">
            <div id="___plusone_0" style="position: absolute; width: 450px; left: -10000px;"><iframe ng-non-bindable="" frameborder="0" hspace="0" marginheight="0" marginwidth="0" scrolling="no" style="position:absolute;top:-10000px;width:450px;margin:0px;border-style:none" tabindex="0" vspace="0" width="100%" id="I0_1620214350994" name="I0_1620214350994" src="https://apis.google.com/u/0/se/0/_/+1/fastbutton?usegapi=1&amp;origin=https%3A%2F%2Fpasgo.vn&amp;url=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;gsrc=3p&amp;ic=1&amp;jsh=m%3B%2F_%2Fscs%2Fapps-static%2F_%2Fjs%2Fk%3Doz.gapi.vi.Np5UIK_lCuw.O%2Fm%3D__features__%2Fam%3DAQE%2Frt%3Dj%2Fd%3D1%2Frs%3DAGLTcCMfAte-OUXlAWpDj4LziXXJDdgBFA#_methods=onPlusOne%2C_ready%2C_close%2C_open%2C_resizeMe%2C_renderstart%2Concircled%2Cdrefresh%2Cerefresh%2Conload&amp;id=I0_1620214350994&amp;_gfid=I0_1620214350994&amp;parent=https%3A%2F%2Fpasgo.vn&amp;pfname=&amp;rpctoken=28530923"></iframe></div><div class="g-plusone" data-href="https://pasgo.vn/nha-hang/king-bbq-lotte-mart-nam-sai-gon-2478" data-gapiscan="true" data-onload="true" data-gapistub="true"></div>
        </div>
        <div class="col-md-7">
            Nếu bạn thấy bài viết này hữu ích, hãy chia sẻ và bình luận ngay nhé!
        </div>
    </div>
</div>', CAST(N'2020-12-08T00:00:00.000' AS DateTime), CAST(N'07:15:00' AS Time), CAST(N'23:00:00' AS Time), N'image/brand/6.jpg', 6, N'76 Nguyễn Huệ, Huế', 16.4598068, 107.5926476, N'00000000006', NULL, 1)
INSERT [dbo].[brand] ([brand_id], [brand_name], [info], [date_created], [open_time], [close_time], [avatar], [service_type_id], [address], [position_lat], [position_lng], [phone], [tel], [status]) VALUES (8, N'Food House', N'<div class="content">
    <h2 class="text-header"><span>Giới thiệu King BBQ Buffet – Lotte Mart Nam Sài Gòn </span></h2>
    <link href="https://pastaxi-manager.onepas.vn/content/style-special.css" rel="stylesheet" type="text/css"><div class="row-app"><div class="col-xs-app-7"><div class="txt-title">Phù hợp:</div><div class="text-description">Đặt tiệc, tụ họp, gặp mặt, liên hoan, họp nhóm, gia đình…</div><div class="txt-title">Món đặc sắc:</div><div class="text-description">Dẻ Sườn bò mỹ, Cổ bò mỹ sốt King BBQ, Bắp bò sốt muối ớt, Nầm heo nướng chao đỏ, Sườn heo, Ba chỉ bò Mỹ sốt King BBQ, Bạch tuộc sốt cay, Bò xào Bulgogi nồi đất, Cơm trộn Hàn Quốc, …
</div><div class="txt-title">Không gian:</div><div class="text-description"><p>- Hàn Quốc. Hiện đại </p><p>- Sức chứa: 150 Khách</p></div><div class="txt-title">Để ô tô:</div><div class="text-description">Có (Phí phụ thuộc đơn vị trông giữ xe)</div><div class="txt-title">Điểm đặc trưng:</div><div class="text-description"><p>- <span style="color:#1b1b1b;font-size:15px;">King BBQ thuộc sở hữu của Tập đoàn RedSun ITI – Một trong những tập đoàn ẩm thực lớn mạnh bậc nhất Việt Nam, sở hữu nhiều thương hiệu ẩm thực nổi tiếng khác như: ThaiExpress, Hotpot Story, Seoul Garden, Sushi Kei, Buk Buk, Capricciosa, Khao Lao, Tasaki BBQ, Meiwei, Truly Việt, Dolpan Sam</span>
</p><p>- Công thức độc quyền của “nước sốt King” – được chính Bếp trưởng Park Sung Min, một trong những đầu bếp nổi tiếng nhất Hàn Quốc, với kinh nghiệm hơn 40 năm trong ngành ẩm thực, trực tiếp nghiên cứu và chế biến. 
</p></div></div><div class="col-xs-app-5"><div class="txt-title">Thông tin thêm</div><ul><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Ghế trẻ em</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Wifi</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Điều hòa</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Visa / Master card</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Hóa đơn VAT</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Chỗ hút thuốc</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Phòng riêng</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Bàn ngoài trời</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Chỗ chơi trẻ em</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">HĐ trực tiếp</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Đặt ship PasGo</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Karaoke</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Máy chiếu</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Trang trí sự kiện</div></li></ul></div></div>
    <h3>King BBQ Buffet Lotte Mart Nam Sài Gòn - Bài ca thịt nướng cuốn hút và vô cùng hấp dẫn</h3><p>Món nướng kiểu Hàn tuy không quá xa lạ đối với thực khách Việt, nhưng không phải ở bất cứ đâu bạn cũng có thể thưởng thức “vị ngon đúng điệu” đậm chất Hàn. Và nếu bạn là một “tín đồ” sành về <a href="https://pasgo.vn/ho-chi-minh/nha-hang/nuong-25" target="_blank">ẩm thực nướng</a> thì chắc hẳn đã từng ghé qua King BBQ Buffet. Đến đây, bạn sẽ có cơ hội trải nghiệm một bữa tiệc buffet với các món ăn không chỉ thơm ngon, hấp dẫn mà còn rất tốt cho sức khỏ, đặc biệt là các món nướng ngon tuyệt hảo.</p><p><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584"><!--cho ?nh vào dây -->
 <img alt="King BBQ Lotte Mart Nam Sài Gòn 1" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-1.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-1.jpg">
        </a></p><div class="custom-box"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
            </a><div class="in" id="gioithieu-more" style="height: auto;"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
                </a><div class="box-list"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
                    </a>
<p></p><h5>Bàn tiệc nướng đủ vị khiến thực khách khó tính nhất cũng phải xiêu lòng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 2" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-2.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-2.jpg"></p><h5>Từng món ăn đều được chăm chút và chuẩn bị rất kĩ lưỡng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 3" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-3.jpg"><br></p><h5>Không chỉ có thịt nướng đơn thuần, King BBQ Buffet còn biến tấu thành rất nhiều những hương vị khác nhau cho thực khách dễ dàng lựa chọn</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 4" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-4.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-4.jpg"></p><h5>Mỗi món ăn đều chứa đựng bao tâm huyết và đam mê của người đầu bếp</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 5" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-5.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-5.jpg"></p><h5>Không chỉ ngon miệng mà còn được bài trí rất đẹp mắt đó nha</h5><p>Ở King BBQ Buffet Lotte Mart Nam Sài Gòn, bạn chắc hẳn sẽ bị chinh phục ngay bởi cách bày trí món ăn vô cùng cuốn hút. Trong đó, điểm nhấn vẫn là thịt nướng bao gồm thịt bò, thịt heo, thịt gà, có thể kế đến như: Cổ bò Mỹ sốt King BBQ, Ba chỉ bò Mỹ sốt King BBQ, Ba chỉ bò Mỹ sốt GuangYang, Bắp bò Úc sốt ớt chuông đỏ, Ba chỉ heo sốt cay Hàn Quốc, Ba chỉ heo ướp muối, Sườn heo bản lớn, Nạc vai heo sốt tỏi, Đùi gà rút xương sốt King BBQ,... tất cả đều được thái lát mỏng đẹp mắt, rải đều sốt đậm đà, thơm lừng. Ngoài ra, hải sản tươi ngon như: Bạch tuộc nướng, Mực trứng sốt cay,… cũng sẽ khiến bạn ngây ngất bởi dư vị mặn mòi, rất khác biệt.</p><p>Đặc biệt, bạn cũng có thể thưởng thức các món lẩu thơm ngọt để tăng thêm dư vị cho bữa tiệc ở King BBQ Buffet nha. Nước dùng được ninh hoàn toàn từ xương ống, nói không với mì chính, King BBQ Buffet luôn đặt sức khỏe của thực khách lên hàng đầu.</p><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 7" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-7.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-7.jpg"></p><h5>Với 10 vị sốt tẩm ướp khác nhau, thực khách có thể dễ dàng chọn được hương vị mà mình yêu thích</h5><p></p><img alt="King BBQ Lotte Mart Nam Sài Gòn 8" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-8.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-8.jpg"><h5>Nước sốt chấm được pha chế độc quyền bởi bếp trưởng Park Sung Min, bạn sẽ không thể tìm thấy ở bất kì n<a href="https://pasgo.vn/ho-chi-minh/nha-hang" target="_blank">hà hàng</a> nào</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 9" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-9.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-9.jpg"></p><h5>Nguyên liệu tươi ngon được nhập từ các nhà cung cấp uy tín làm nên chất lượng món ăn tuyệt hảo</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 10" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-10.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-10.jpg"></p><h5>Bên cạnh sốt tẩm ướp thì King BBQ Buffet Lotte Mart Nam Sài Gòn còn có cả sốt chấm cực kì ngon đó nha!</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 11" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-11.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-11.jpg"></p><h5>Không chỉ có các loại thịt, hải sản cũng là món được rất nhiều người yêu thích</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 12" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-12.jpg"></p><h5>Nào mực, nào cá với dư vị biển khơi mặn mòi đầy mời gọi</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 13" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-13.jpg"></p><h5>Bạn đừng quên thưởng thức các hương vị lẩu ấm nóng ở King BBQ Buffet Lotte Mart Nam Sài Gòn nha</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 14" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-14.jpg"></p><p>Với không gian ấm cúng và thân thiện, quầy buffet rộng với nhiều đồ ăn phong phú thay đổi theo từng ngày, King BBQ Buffet Lotte Mart Nam Sài Gòn sẽ là lựa chọn không thể thiếu cho các bữa tiệc gia đình hay tụ tập bạn bè, đồng nghiệp ngày cuối tuần. Hệ thống bếp nướng không khói thuận tiện, vừa giúp giữ nguyên hương vị món ăn, vừa mang lại một không gian thoải mái, thực khách thỏa sức thưởng thức các món nướng mà không lo bị ám mùi khó chịu.</p><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 15" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-15.jpg"></p><h5>Không gian King BBQ Buffet không quá rộng nhưng sắp xếp hợp lý nên rất thoáng đãng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 16" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-16.jpg"></p><h5>Dù là bữa tiệc đông người hay một nhóm nhỏ thì King BBQ Buffet Lotte Mart Nam Sài Gòn vẫn rất phù hợp</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 17" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-17.jpg"></p><h5>Bạn có thể thoải mái lựa chọn chỗ ngồi thích hợp khi đến đây</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 18" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-18.jpg"></p><h5>Quầy line được sắp xếp rất hợp lý, thông minh để phục vụ thực khách được tốt nhất</h5><p></p><img alt="King BBQ Lotte Mart Nam Sài Gòn 19" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-19.jpg"><h5>Điểm cộng của nhà hàng đó chính là thái độ phụ vụ rất chuyên nghiệp của nhân viên</h5><p>Hãy đến ngay với King BBQ Buffet Lotte Mart Nam Sài Gòn thưởng thức bữa tiệc buffet đặc sắc trong không gian ấm cúng và vô cùng gần gũi nha. Đừng quên đặt bàn qua PasGo – Mạng lưới nhà hàng ngon để nhận thêm nhiều ưu đãi bất ngờ!</p><h4>Địa chỉ Nhà hàng:</h4><h4>Nhà hàng King BBQ Buffet Lotte Mart Nam Sài Gòn: Tầng 3F – Lotte Mart Nam Sài Gòn, số 469 Nguyễn Hữu Thọ, Phường Tân Hưng, Quận 7, TP.HCM</h4>
                </div>
            </div>
            <a class="btn-xemthem" role="button" data-toggle="collapse" href="#gioithieu-more" aria-expanded="false" aria-controls="gioithieu-more" style="display: none;">
                Xem thêm
            </a>
        </div>
    <div class="col-xs-12 col-md-12">
        <div class="col-md-3">
            <div class="social-like">
                <div class="fb-like fb_iframe_widget" data-href="https://pasgo.vn/nha-hang/king-bbq-lotte-mart-nam-sai-gon-2478" data-layout="button_count" data-action="like" data-share="true" fb-xfbml-state="rendered" fb-iframe-plugin-query="action=like&amp;app_id=584525768323186&amp;container_width=217&amp;href=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true"><span style="vertical-align: bottom; width: 150px; height: 28px;"><iframe name="f3ef37f6bb72ce4" width="1000px" height="1000px" data-testid="fb:like Facebook Social Plugin" title="fb:like Facebook Social Plugin" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" allow="encrypted-media" src="https://www.facebook.com/v5.0/plugins/like.php?action=like&amp;app_id=584525768323186&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fx%2Fconnect%2Fxd_arbiter%2F%3Fversion%3D46%23cb%3Df1d25b142847adc%26domain%3Dpasgo.vn%26origin%3Dhttps%253A%252F%252Fpasgo.vn%252Ff160d5dc831f6ac%26relation%3Dparent.parent&amp;container_width=217&amp;href=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true" style="border: none; visibility: visible; width: 150px; height: 28px;" class=""></iframe></span></div>
            </div>
        </div>
        <div class="col-md-2">
            <div id="___plusone_0" style="position: absolute; width: 450px; left: -10000px;"><iframe ng-non-bindable="" frameborder="0" hspace="0" marginheight="0" marginwidth="0" scrolling="no" style="position:absolute;top:-10000px;width:450px;margin:0px;border-style:none" tabindex="0" vspace="0" width="100%" id="I0_1620214350994" name="I0_1620214350994" src="https://apis.google.com/u/0/se/0/_/+1/fastbutton?usegapi=1&amp;origin=https%3A%2F%2Fpasgo.vn&amp;url=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;gsrc=3p&amp;ic=1&amp;jsh=m%3B%2F_%2Fscs%2Fapps-static%2F_%2Fjs%2Fk%3Doz.gapi.vi.Np5UIK_lCuw.O%2Fm%3D__features__%2Fam%3DAQE%2Frt%3Dj%2Fd%3D1%2Frs%3DAGLTcCMfAte-OUXlAWpDj4LziXXJDdgBFA#_methods=onPlusOne%2C_ready%2C_close%2C_open%2C_resizeMe%2C_renderstart%2Concircled%2Cdrefresh%2Cerefresh%2Conload&amp;id=I0_1620214350994&amp;_gfid=I0_1620214350994&amp;parent=https%3A%2F%2Fpasgo.vn&amp;pfname=&amp;rpctoken=28530923"></iframe></div><div class="g-plusone" data-href="https://pasgo.vn/nha-hang/king-bbq-lotte-mart-nam-sai-gon-2478" data-gapiscan="true" data-onload="true" data-gapistub="true"></div>
        </div>
        <div class="col-md-7">
            Nếu bạn thấy bài viết này hữu ích, hãy chia sẻ và bình luận ngay nhé!
        </div>
    </div>
</div>', CAST(N'2019-10-08T00:00:00.000' AS DateTime), CAST(N'07:00:00' AS Time), CAST(N'23:00:00' AS Time), N'image/brand/7.jpg', 7, N'77 Nguyễn Huệ, Huế', 16.4598068, 107.5926476, N'00000000008', NULL, 1)
INSERT [dbo].[brand] ([brand_id], [brand_name], [info], [date_created], [open_time], [close_time], [avatar], [service_type_id], [address], [position_lat], [position_lng], [phone], [tel], [status]) VALUES (9, N'Samurai BBQ', N'<div class="content">
    <h2 class="text-header"><span>Giới thiệu King BBQ Buffet – Lotte Mart Nam Sài Gòn </span></h2>
    <link href="https://pastaxi-manager.onepas.vn/content/style-special.css" rel="stylesheet" type="text/css"><div class="row-app"><div class="col-xs-app-7"><div class="txt-title">Phù hợp:</div><div class="text-description">Đặt tiệc, tụ họp, gặp mặt, liên hoan, họp nhóm, gia đình…</div><div class="txt-title">Món đặc sắc:</div><div class="text-description">Dẻ Sườn bò mỹ, Cổ bò mỹ sốt King BBQ, Bắp bò sốt muối ớt, Nầm heo nướng chao đỏ, Sườn heo, Ba chỉ bò Mỹ sốt King BBQ, Bạch tuộc sốt cay, Bò xào Bulgogi nồi đất, Cơm trộn Hàn Quốc, …
</div><div class="txt-title">Không gian:</div><div class="text-description"><p>- Hàn Quốc. Hiện đại </p><p>- Sức chứa: 150 Khách</p></div><div class="txt-title">Để ô tô:</div><div class="text-description">Có (Phí phụ thuộc đơn vị trông giữ xe)</div><div class="txt-title">Điểm đặc trưng:</div><div class="text-description"><p>- <span style="color:#1b1b1b;font-size:15px;">King BBQ thuộc sở hữu của Tập đoàn RedSun ITI – Một trong những tập đoàn ẩm thực lớn mạnh bậc nhất Việt Nam, sở hữu nhiều thương hiệu ẩm thực nổi tiếng khác như: ThaiExpress, Hotpot Story, Seoul Garden, Sushi Kei, Buk Buk, Capricciosa, Khao Lao, Tasaki BBQ, Meiwei, Truly Việt, Dolpan Sam</span>
</p><p>- Công thức độc quyền của “nước sốt King” – được chính Bếp trưởng Park Sung Min, một trong những đầu bếp nổi tiếng nhất Hàn Quốc, với kinh nghiệm hơn 40 năm trong ngành ẩm thực, trực tiếp nghiên cứu và chế biến. 
</p></div></div><div class="col-xs-app-5"><div class="txt-title">Thông tin thêm</div><ul><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Ghế trẻ em</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Wifi</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Điều hòa</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Visa / Master card</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Hóa đơn VAT</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Chỗ hút thuốc</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Phòng riêng</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Bàn ngoài trời</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Chỗ chơi trẻ em</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">HĐ trực tiếp</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Đặt ship PasGo</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Karaoke</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Máy chiếu</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Trang trí sự kiện</div></li></ul></div></div>
    <h3>King BBQ Buffet Lotte Mart Nam Sài Gòn - Bài ca thịt nướng cuốn hút và vô cùng hấp dẫn</h3><p>Món nướng kiểu Hàn tuy không quá xa lạ đối với thực khách Việt, nhưng không phải ở bất cứ đâu bạn cũng có thể thưởng thức “vị ngon đúng điệu” đậm chất Hàn. Và nếu bạn là một “tín đồ” sành về <a href="https://pasgo.vn/ho-chi-minh/nha-hang/nuong-25" target="_blank">ẩm thực nướng</a> thì chắc hẳn đã từng ghé qua King BBQ Buffet. Đến đây, bạn sẽ có cơ hội trải nghiệm một bữa tiệc buffet với các món ăn không chỉ thơm ngon, hấp dẫn mà còn rất tốt cho sức khỏ, đặc biệt là các món nướng ngon tuyệt hảo.</p><p><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584"><!--cho ?nh vào dây -->
 <img alt="King BBQ Lotte Mart Nam Sài Gòn 1" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-1.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-1.jpg">
        </a></p><div class="custom-box"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
            </a><div class="in" id="gioithieu-more" style="height: auto;"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
                </a><div class="box-list"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
                    </a>
<p></p><h5>Bàn tiệc nướng đủ vị khiến thực khách khó tính nhất cũng phải xiêu lòng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 2" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-2.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-2.jpg"></p><h5>Từng món ăn đều được chăm chút và chuẩn bị rất kĩ lưỡng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 3" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-3.jpg"><br></p><h5>Không chỉ có thịt nướng đơn thuần, King BBQ Buffet còn biến tấu thành rất nhiều những hương vị khác nhau cho thực khách dễ dàng lựa chọn</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 4" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-4.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-4.jpg"></p><h5>Mỗi món ăn đều chứa đựng bao tâm huyết và đam mê của người đầu bếp</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 5" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-5.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-5.jpg"></p><h5>Không chỉ ngon miệng mà còn được bài trí rất đẹp mắt đó nha</h5><p>Ở King BBQ Buffet Lotte Mart Nam Sài Gòn, bạn chắc hẳn sẽ bị chinh phục ngay bởi cách bày trí món ăn vô cùng cuốn hút. Trong đó, điểm nhấn vẫn là thịt nướng bao gồm thịt bò, thịt heo, thịt gà, có thể kế đến như: Cổ bò Mỹ sốt King BBQ, Ba chỉ bò Mỹ sốt King BBQ, Ba chỉ bò Mỹ sốt GuangYang, Bắp bò Úc sốt ớt chuông đỏ, Ba chỉ heo sốt cay Hàn Quốc, Ba chỉ heo ướp muối, Sườn heo bản lớn, Nạc vai heo sốt tỏi, Đùi gà rút xương sốt King BBQ,... tất cả đều được thái lát mỏng đẹp mắt, rải đều sốt đậm đà, thơm lừng. Ngoài ra, hải sản tươi ngon như: Bạch tuộc nướng, Mực trứng sốt cay,… cũng sẽ khiến bạn ngây ngất bởi dư vị mặn mòi, rất khác biệt.</p><p>Đặc biệt, bạn cũng có thể thưởng thức các món lẩu thơm ngọt để tăng thêm dư vị cho bữa tiệc ở King BBQ Buffet nha. Nước dùng được ninh hoàn toàn từ xương ống, nói không với mì chính, King BBQ Buffet luôn đặt sức khỏe của thực khách lên hàng đầu.</p><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 7" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-7.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-7.jpg"></p><h5>Với 10 vị sốt tẩm ướp khác nhau, thực khách có thể dễ dàng chọn được hương vị mà mình yêu thích</h5><p></p><img alt="King BBQ Lotte Mart Nam Sài Gòn 8" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-8.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-8.jpg"><h5>Nước sốt chấm được pha chế độc quyền bởi bếp trưởng Park Sung Min, bạn sẽ không thể tìm thấy ở bất kì n<a href="https://pasgo.vn/ho-chi-minh/nha-hang" target="_blank">hà hàng</a> nào</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 9" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-9.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-9.jpg"></p><h5>Nguyên liệu tươi ngon được nhập từ các nhà cung cấp uy tín làm nên chất lượng món ăn tuyệt hảo</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 10" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-10.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-10.jpg"></p><h5>Bên cạnh sốt tẩm ướp thì King BBQ Buffet Lotte Mart Nam Sài Gòn còn có cả sốt chấm cực kì ngon đó nha!</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 11" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-11.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-11.jpg"></p><h5>Không chỉ có các loại thịt, hải sản cũng là món được rất nhiều người yêu thích</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 12" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-12.jpg"></p><h5>Nào mực, nào cá với dư vị biển khơi mặn mòi đầy mời gọi</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 13" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-13.jpg"></p><h5>Bạn đừng quên thưởng thức các hương vị lẩu ấm nóng ở King BBQ Buffet Lotte Mart Nam Sài Gòn nha</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 14" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-14.jpg"></p><p>Với không gian ấm cúng và thân thiện, quầy buffet rộng với nhiều đồ ăn phong phú thay đổi theo từng ngày, King BBQ Buffet Lotte Mart Nam Sài Gòn sẽ là lựa chọn không thể thiếu cho các bữa tiệc gia đình hay tụ tập bạn bè, đồng nghiệp ngày cuối tuần. Hệ thống bếp nướng không khói thuận tiện, vừa giúp giữ nguyên hương vị món ăn, vừa mang lại một không gian thoải mái, thực khách thỏa sức thưởng thức các món nướng mà không lo bị ám mùi khó chịu.</p><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 15" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-15.jpg"></p><h5>Không gian King BBQ Buffet không quá rộng nhưng sắp xếp hợp lý nên rất thoáng đãng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 16" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-16.jpg"></p><h5>Dù là bữa tiệc đông người hay một nhóm nhỏ thì King BBQ Buffet Lotte Mart Nam Sài Gòn vẫn rất phù hợp</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 17" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-17.jpg"></p><h5>Bạn có thể thoải mái lựa chọn chỗ ngồi thích hợp khi đến đây</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 18" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-18.jpg"></p><h5>Quầy line được sắp xếp rất hợp lý, thông minh để phục vụ thực khách được tốt nhất</h5><p></p><img alt="King BBQ Lotte Mart Nam Sài Gòn 19" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-19.jpg"><h5>Điểm cộng của nhà hàng đó chính là thái độ phụ vụ rất chuyên nghiệp của nhân viên</h5><p>Hãy đến ngay với King BBQ Buffet Lotte Mart Nam Sài Gòn thưởng thức bữa tiệc buffet đặc sắc trong không gian ấm cúng và vô cùng gần gũi nha. Đừng quên đặt bàn qua PasGo – Mạng lưới nhà hàng ngon để nhận thêm nhiều ưu đãi bất ngờ!</p><h4>Địa chỉ Nhà hàng:</h4><h4>Nhà hàng King BBQ Buffet Lotte Mart Nam Sài Gòn: Tầng 3F – Lotte Mart Nam Sài Gòn, số 469 Nguyễn Hữu Thọ, Phường Tân Hưng, Quận 7, TP.HCM</h4>
                </div>
            </div>
            <a class="btn-xemthem" role="button" data-toggle="collapse" href="#gioithieu-more" aria-expanded="false" aria-controls="gioithieu-more" style="display: none;">
                Xem thêm
            </a>
        </div>
    <div class="col-xs-12 col-md-12">
        <div class="col-md-3">
            <div class="social-like">
                <div class="fb-like fb_iframe_widget" data-href="https://pasgo.vn/nha-hang/king-bbq-lotte-mart-nam-sai-gon-2478" data-layout="button_count" data-action="like" data-share="true" fb-xfbml-state="rendered" fb-iframe-plugin-query="action=like&amp;app_id=584525768323186&amp;container_width=217&amp;href=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true"><span style="vertical-align: bottom; width: 150px; height: 28px;"><iframe name="f3ef37f6bb72ce4" width="1000px" height="1000px" data-testid="fb:like Facebook Social Plugin" title="fb:like Facebook Social Plugin" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" allow="encrypted-media" src="https://www.facebook.com/v5.0/plugins/like.php?action=like&amp;app_id=584525768323186&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fx%2Fconnect%2Fxd_arbiter%2F%3Fversion%3D46%23cb%3Df1d25b142847adc%26domain%3Dpasgo.vn%26origin%3Dhttps%253A%252F%252Fpasgo.vn%252Ff160d5dc831f6ac%26relation%3Dparent.parent&amp;container_width=217&amp;href=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true" style="border: none; visibility: visible; width: 150px; height: 28px;" class=""></iframe></span></div>
            </div>
        </div>
        <div class="col-md-2">
            <div id="___plusone_0" style="position: absolute; width: 450px; left: -10000px;"><iframe ng-non-bindable="" frameborder="0" hspace="0" marginheight="0" marginwidth="0" scrolling="no" style="position:absolute;top:-10000px;width:450px;margin:0px;border-style:none" tabindex="0" vspace="0" width="100%" id="I0_1620214350994" name="I0_1620214350994" src="https://apis.google.com/u/0/se/0/_/+1/fastbutton?usegapi=1&amp;origin=https%3A%2F%2Fpasgo.vn&amp;url=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;gsrc=3p&amp;ic=1&amp;jsh=m%3B%2F_%2Fscs%2Fapps-static%2F_%2Fjs%2Fk%3Doz.gapi.vi.Np5UIK_lCuw.O%2Fm%3D__features__%2Fam%3DAQE%2Frt%3Dj%2Fd%3D1%2Frs%3DAGLTcCMfAte-OUXlAWpDj4LziXXJDdgBFA#_methods=onPlusOne%2C_ready%2C_close%2C_open%2C_resizeMe%2C_renderstart%2Concircled%2Cdrefresh%2Cerefresh%2Conload&amp;id=I0_1620214350994&amp;_gfid=I0_1620214350994&amp;parent=https%3A%2F%2Fpasgo.vn&amp;pfname=&amp;rpctoken=28530923"></iframe></div><div class="g-plusone" data-href="https://pasgo.vn/nha-hang/king-bbq-lotte-mart-nam-sai-gon-2478" data-gapiscan="true" data-onload="true" data-gapistub="true"></div>
        </div>
        <div class="col-md-7">
            Nếu bạn thấy bài viết này hữu ích, hãy chia sẻ và bình luận ngay nhé!
        </div>
    </div>
</div>', CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'16:00:00' AS Time), CAST(N'23:00:00' AS Time), N'image/brand/8.jpg', 8, N'78 Nguyễn Huệ, Huế', 16.4598068, 107.5926476, N'00000000009', NULL, 1)
INSERT [dbo].[brand] ([brand_id], [brand_name], [info], [date_created], [open_time], [close_time], [avatar], [service_type_id], [address], [position_lat], [position_lng], [phone], [tel], [status]) VALUES (10, N'Lạc Thái', N'<div class="content">
    <h2 class="text-header"><span>Giới thiệu King BBQ Buffet – Lotte Mart Nam Sài Gòn </span></h2>
    <link href="https://pastaxi-manager.onepas.vn/content/style-special.css" rel="stylesheet" type="text/css"><div class="row-app"><div class="col-xs-app-7"><div class="txt-title">Phù hợp:</div><div class="text-description">Đặt tiệc, tụ họp, gặp mặt, liên hoan, họp nhóm, gia đình…</div><div class="txt-title">Món đặc sắc:</div><div class="text-description">Dẻ Sườn bò mỹ, Cổ bò mỹ sốt King BBQ, Bắp bò sốt muối ớt, Nầm heo nướng chao đỏ, Sườn heo, Ba chỉ bò Mỹ sốt King BBQ, Bạch tuộc sốt cay, Bò xào Bulgogi nồi đất, Cơm trộn Hàn Quốc, …
</div><div class="txt-title">Không gian:</div><div class="text-description"><p>- Hàn Quốc. Hiện đại </p><p>- Sức chứa: 150 Khách</p></div><div class="txt-title">Để ô tô:</div><div class="text-description">Có (Phí phụ thuộc đơn vị trông giữ xe)</div><div class="txt-title">Điểm đặc trưng:</div><div class="text-description"><p>- <span style="color:#1b1b1b;font-size:15px;">King BBQ thuộc sở hữu của Tập đoàn RedSun ITI – Một trong những tập đoàn ẩm thực lớn mạnh bậc nhất Việt Nam, sở hữu nhiều thương hiệu ẩm thực nổi tiếng khác như: ThaiExpress, Hotpot Story, Seoul Garden, Sushi Kei, Buk Buk, Capricciosa, Khao Lao, Tasaki BBQ, Meiwei, Truly Việt, Dolpan Sam</span>
</p><p>- Công thức độc quyền của “nước sốt King” – được chính Bếp trưởng Park Sung Min, một trong những đầu bếp nổi tiếng nhất Hàn Quốc, với kinh nghiệm hơn 40 năm trong ngành ẩm thực, trực tiếp nghiên cứu và chế biến. 
</p></div></div><div class="col-xs-app-5"><div class="txt-title">Thông tin thêm</div><ul><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Ghế trẻ em</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Wifi</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Điều hòa</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Visa / Master card</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Hóa đơn VAT</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Chỗ hút thuốc</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Phòng riêng</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Bàn ngoài trời</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Chỗ chơi trẻ em</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">HĐ trực tiếp</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Đặt ship PasGo</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Karaoke</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Máy chiếu</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Trang trí sự kiện</div></li></ul></div></div>
    <h3>King BBQ Buffet Lotte Mart Nam Sài Gòn - Bài ca thịt nướng cuốn hút và vô cùng hấp dẫn</h3><p>Món nướng kiểu Hàn tuy không quá xa lạ đối với thực khách Việt, nhưng không phải ở bất cứ đâu bạn cũng có thể thưởng thức “vị ngon đúng điệu” đậm chất Hàn. Và nếu bạn là một “tín đồ” sành về <a href="https://pasgo.vn/ho-chi-minh/nha-hang/nuong-25" target="_blank">ẩm thực nướng</a> thì chắc hẳn đã từng ghé qua King BBQ Buffet. Đến đây, bạn sẽ có cơ hội trải nghiệm một bữa tiệc buffet với các món ăn không chỉ thơm ngon, hấp dẫn mà còn rất tốt cho sức khỏ, đặc biệt là các món nướng ngon tuyệt hảo.</p><p><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584"><!--cho ?nh vào dây -->
 <img alt="King BBQ Lotte Mart Nam Sài Gòn 1" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-1.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-1.jpg">
        </a></p><div class="custom-box"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
            </a><div class="in" id="gioithieu-more" style="height: auto;"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
                </a><div class="box-list"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
                    </a>
<p></p><h5>Bàn tiệc nướng đủ vị khiến thực khách khó tính nhất cũng phải xiêu lòng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 2" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-2.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-2.jpg"></p><h5>Từng món ăn đều được chăm chút và chuẩn bị rất kĩ lưỡng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 3" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-3.jpg"><br></p><h5>Không chỉ có thịt nướng đơn thuần, King BBQ Buffet còn biến tấu thành rất nhiều những hương vị khác nhau cho thực khách dễ dàng lựa chọn</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 4" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-4.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-4.jpg"></p><h5>Mỗi món ăn đều chứa đựng bao tâm huyết và đam mê của người đầu bếp</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 5" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-5.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-5.jpg"></p><h5>Không chỉ ngon miệng mà còn được bài trí rất đẹp mắt đó nha</h5><p>Ở King BBQ Buffet Lotte Mart Nam Sài Gòn, bạn chắc hẳn sẽ bị chinh phục ngay bởi cách bày trí món ăn vô cùng cuốn hút. Trong đó, điểm nhấn vẫn là thịt nướng bao gồm thịt bò, thịt heo, thịt gà, có thể kế đến như: Cổ bò Mỹ sốt King BBQ, Ba chỉ bò Mỹ sốt King BBQ, Ba chỉ bò Mỹ sốt GuangYang, Bắp bò Úc sốt ớt chuông đỏ, Ba chỉ heo sốt cay Hàn Quốc, Ba chỉ heo ướp muối, Sườn heo bản lớn, Nạc vai heo sốt tỏi, Đùi gà rút xương sốt King BBQ,... tất cả đều được thái lát mỏng đẹp mắt, rải đều sốt đậm đà, thơm lừng. Ngoài ra, hải sản tươi ngon như: Bạch tuộc nướng, Mực trứng sốt cay,… cũng sẽ khiến bạn ngây ngất bởi dư vị mặn mòi, rất khác biệt.</p><p>Đặc biệt, bạn cũng có thể thưởng thức các món lẩu thơm ngọt để tăng thêm dư vị cho bữa tiệc ở King BBQ Buffet nha. Nước dùng được ninh hoàn toàn từ xương ống, nói không với mì chính, King BBQ Buffet luôn đặt sức khỏe của thực khách lên hàng đầu.</p><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 7" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-7.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-7.jpg"></p><h5>Với 10 vị sốt tẩm ướp khác nhau, thực khách có thể dễ dàng chọn được hương vị mà mình yêu thích</h5><p></p><img alt="King BBQ Lotte Mart Nam Sài Gòn 8" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-8.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-8.jpg"><h5>Nước sốt chấm được pha chế độc quyền bởi bếp trưởng Park Sung Min, bạn sẽ không thể tìm thấy ở bất kì n<a href="https://pasgo.vn/ho-chi-minh/nha-hang" target="_blank">hà hàng</a> nào</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 9" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-9.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-9.jpg"></p><h5>Nguyên liệu tươi ngon được nhập từ các nhà cung cấp uy tín làm nên chất lượng món ăn tuyệt hảo</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 10" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-10.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-10.jpg"></p><h5>Bên cạnh sốt tẩm ướp thì King BBQ Buffet Lotte Mart Nam Sài Gòn còn có cả sốt chấm cực kì ngon đó nha!</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 11" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-11.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-11.jpg"></p><h5>Không chỉ có các loại thịt, hải sản cũng là món được rất nhiều người yêu thích</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 12" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-12.jpg"></p><h5>Nào mực, nào cá với dư vị biển khơi mặn mòi đầy mời gọi</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 13" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-13.jpg"></p><h5>Bạn đừng quên thưởng thức các hương vị lẩu ấm nóng ở King BBQ Buffet Lotte Mart Nam Sài Gòn nha</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 14" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-14.jpg"></p><p>Với không gian ấm cúng và thân thiện, quầy buffet rộng với nhiều đồ ăn phong phú thay đổi theo từng ngày, King BBQ Buffet Lotte Mart Nam Sài Gòn sẽ là lựa chọn không thể thiếu cho các bữa tiệc gia đình hay tụ tập bạn bè, đồng nghiệp ngày cuối tuần. Hệ thống bếp nướng không khói thuận tiện, vừa giúp giữ nguyên hương vị món ăn, vừa mang lại một không gian thoải mái, thực khách thỏa sức thưởng thức các món nướng mà không lo bị ám mùi khó chịu.</p><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 15" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-15.jpg"></p><h5>Không gian King BBQ Buffet không quá rộng nhưng sắp xếp hợp lý nên rất thoáng đãng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 16" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-16.jpg"></p><h5>Dù là bữa tiệc đông người hay một nhóm nhỏ thì King BBQ Buffet Lotte Mart Nam Sài Gòn vẫn rất phù hợp</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 17" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-17.jpg"></p><h5>Bạn có thể thoải mái lựa chọn chỗ ngồi thích hợp khi đến đây</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 18" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-18.jpg"></p><h5>Quầy line được sắp xếp rất hợp lý, thông minh để phục vụ thực khách được tốt nhất</h5><p></p><img alt="King BBQ Lotte Mart Nam Sài Gòn 19" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-19.jpg"><h5>Điểm cộng của nhà hàng đó chính là thái độ phụ vụ rất chuyên nghiệp của nhân viên</h5><p>Hãy đến ngay với King BBQ Buffet Lotte Mart Nam Sài Gòn thưởng thức bữa tiệc buffet đặc sắc trong không gian ấm cúng và vô cùng gần gũi nha. Đừng quên đặt bàn qua PasGo – Mạng lưới nhà hàng ngon để nhận thêm nhiều ưu đãi bất ngờ!</p><h4>Địa chỉ Nhà hàng:</h4><h4>Nhà hàng King BBQ Buffet Lotte Mart Nam Sài Gòn: Tầng 3F – Lotte Mart Nam Sài Gòn, số 469 Nguyễn Hữu Thọ, Phường Tân Hưng, Quận 7, TP.HCM</h4>
                </div>
            </div>
            <a class="btn-xemthem" role="button" data-toggle="collapse" href="#gioithieu-more" aria-expanded="false" aria-controls="gioithieu-more" style="display: none;">
                Xem thêm
            </a>
        </div>
    <div class="col-xs-12 col-md-12">
        <div class="col-md-3">
            <div class="social-like">
                <div class="fb-like fb_iframe_widget" data-href="https://pasgo.vn/nha-hang/king-bbq-lotte-mart-nam-sai-gon-2478" data-layout="button_count" data-action="like" data-share="true" fb-xfbml-state="rendered" fb-iframe-plugin-query="action=like&amp;app_id=584525768323186&amp;container_width=217&amp;href=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true"><span style="vertical-align: bottom; width: 150px; height: 28px;"><iframe name="f3ef37f6bb72ce4" width="1000px" height="1000px" data-testid="fb:like Facebook Social Plugin" title="fb:like Facebook Social Plugin" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" allow="encrypted-media" src="https://www.facebook.com/v5.0/plugins/like.php?action=like&amp;app_id=584525768323186&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fx%2Fconnect%2Fxd_arbiter%2F%3Fversion%3D46%23cb%3Df1d25b142847adc%26domain%3Dpasgo.vn%26origin%3Dhttps%253A%252F%252Fpasgo.vn%252Ff160d5dc831f6ac%26relation%3Dparent.parent&amp;container_width=217&amp;href=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true" style="border: none; visibility: visible; width: 150px; height: 28px;" class=""></iframe></span></div>
            </div>
        </div>
        <div class="col-md-2">
            <div id="___plusone_0" style="position: absolute; width: 450px; left: -10000px;"><iframe ng-non-bindable="" frameborder="0" hspace="0" marginheight="0" marginwidth="0" scrolling="no" style="position:absolute;top:-10000px;width:450px;margin:0px;border-style:none" tabindex="0" vspace="0" width="100%" id="I0_1620214350994" name="I0_1620214350994" src="https://apis.google.com/u/0/se/0/_/+1/fastbutton?usegapi=1&amp;origin=https%3A%2F%2Fpasgo.vn&amp;url=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;gsrc=3p&amp;ic=1&amp;jsh=m%3B%2F_%2Fscs%2Fapps-static%2F_%2Fjs%2Fk%3Doz.gapi.vi.Np5UIK_lCuw.O%2Fm%3D__features__%2Fam%3DAQE%2Frt%3Dj%2Fd%3D1%2Frs%3DAGLTcCMfAte-OUXlAWpDj4LziXXJDdgBFA#_methods=onPlusOne%2C_ready%2C_close%2C_open%2C_resizeMe%2C_renderstart%2Concircled%2Cdrefresh%2Cerefresh%2Conload&amp;id=I0_1620214350994&amp;_gfid=I0_1620214350994&amp;parent=https%3A%2F%2Fpasgo.vn&amp;pfname=&amp;rpctoken=28530923"></iframe></div><div class="g-plusone" data-href="https://pasgo.vn/nha-hang/king-bbq-lotte-mart-nam-sai-gon-2478" data-gapiscan="true" data-onload="true" data-gapistub="true"></div>
        </div>
        <div class="col-md-7">
            Nếu bạn thấy bài viết này hữu ích, hãy chia sẻ và bình luận ngay nhé!
        </div>
    </div>
</div>', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'08:00:00' AS Time), CAST(N'23:00:00' AS Time), N'image/brand/9.jpg', 9, N'79 Nguyễn Huệ, Huế', 16.4598068, 107.5926476, N'00000000010', NULL, 1)
INSERT [dbo].[brand] ([brand_id], [brand_name], [info], [date_created], [open_time], [close_time], [avatar], [service_type_id], [address], [position_lat], [position_lng], [phone], [tel], [status]) VALUES (11, N'Lẩu Băng Chuyền OSAKA', N'<div class="content">
    <h2 class="text-header"><span>Giới thiệu King BBQ Buffet – Lotte Mart Nam Sài Gòn </span></h2>
    <link href="https://pastaxi-manager.onepas.vn/content/style-special.css" rel="stylesheet" type="text/css"><div class="row-app"><div class="col-xs-app-7"><div class="txt-title">Phù hợp:</div><div class="text-description">Đặt tiệc, tụ họp, gặp mặt, liên hoan, họp nhóm, gia đình…</div><div class="txt-title">Món đặc sắc:</div><div class="text-description">Dẻ Sườn bò mỹ, Cổ bò mỹ sốt King BBQ, Bắp bò sốt muối ớt, Nầm heo nướng chao đỏ, Sườn heo, Ba chỉ bò Mỹ sốt King BBQ, Bạch tuộc sốt cay, Bò xào Bulgogi nồi đất, Cơm trộn Hàn Quốc, …
</div><div class="txt-title">Không gian:</div><div class="text-description"><p>- Hàn Quốc. Hiện đại </p><p>- Sức chứa: 150 Khách</p></div><div class="txt-title">Để ô tô:</div><div class="text-description">Có (Phí phụ thuộc đơn vị trông giữ xe)</div><div class="txt-title">Điểm đặc trưng:</div><div class="text-description"><p>- <span style="color:#1b1b1b;font-size:15px;">King BBQ thuộc sở hữu của Tập đoàn RedSun ITI – Một trong những tập đoàn ẩm thực lớn mạnh bậc nhất Việt Nam, sở hữu nhiều thương hiệu ẩm thực nổi tiếng khác như: ThaiExpress, Hotpot Story, Seoul Garden, Sushi Kei, Buk Buk, Capricciosa, Khao Lao, Tasaki BBQ, Meiwei, Truly Việt, Dolpan Sam</span>
</p><p>- Công thức độc quyền của “nước sốt King” – được chính Bếp trưởng Park Sung Min, một trong những đầu bếp nổi tiếng nhất Hàn Quốc, với kinh nghiệm hơn 40 năm trong ngành ẩm thực, trực tiếp nghiên cứu và chế biến. 
</p></div></div><div class="col-xs-app-5"><div class="txt-title">Thông tin thêm</div><ul><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Ghế trẻ em</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Wifi</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Điều hòa</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Visa / Master card</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Hóa đơn VAT</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Chỗ hút thuốc</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Phòng riêng</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Bàn ngoài trời</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Chỗ chơi trẻ em</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">HĐ trực tiếp</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Đặt ship PasGo</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Karaoke</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Máy chiếu</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Trang trí sự kiện</div></li></ul></div></div>
    <h3>King BBQ Buffet Lotte Mart Nam Sài Gòn - Bài ca thịt nướng cuốn hút và vô cùng hấp dẫn</h3><p>Món nướng kiểu Hàn tuy không quá xa lạ đối với thực khách Việt, nhưng không phải ở bất cứ đâu bạn cũng có thể thưởng thức “vị ngon đúng điệu” đậm chất Hàn. Và nếu bạn là một “tín đồ” sành về <a href="https://pasgo.vn/ho-chi-minh/nha-hang/nuong-25" target="_blank">ẩm thực nướng</a> thì chắc hẳn đã từng ghé qua King BBQ Buffet. Đến đây, bạn sẽ có cơ hội trải nghiệm một bữa tiệc buffet với các món ăn không chỉ thơm ngon, hấp dẫn mà còn rất tốt cho sức khỏ, đặc biệt là các món nướng ngon tuyệt hảo.</p><p><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584"><!--cho ?nh vào dây -->
 <img alt="King BBQ Lotte Mart Nam Sài Gòn 1" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-1.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-1.jpg">
        </a></p><div class="custom-box"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
            </a><div class="in" id="gioithieu-more" style="height: auto;"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
                </a><div class="box-list"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
                    </a>
<p></p><h5>Bàn tiệc nướng đủ vị khiến thực khách khó tính nhất cũng phải xiêu lòng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 2" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-2.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-2.jpg"></p><h5>Từng món ăn đều được chăm chút và chuẩn bị rất kĩ lưỡng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 3" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-3.jpg"><br></p><h5>Không chỉ có thịt nướng đơn thuần, King BBQ Buffet còn biến tấu thành rất nhiều những hương vị khác nhau cho thực khách dễ dàng lựa chọn</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 4" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-4.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-4.jpg"></p><h5>Mỗi món ăn đều chứa đựng bao tâm huyết và đam mê của người đầu bếp</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 5" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-5.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-5.jpg"></p><h5>Không chỉ ngon miệng mà còn được bài trí rất đẹp mắt đó nha</h5><p>Ở King BBQ Buffet Lotte Mart Nam Sài Gòn, bạn chắc hẳn sẽ bị chinh phục ngay bởi cách bày trí món ăn vô cùng cuốn hút. Trong đó, điểm nhấn vẫn là thịt nướng bao gồm thịt bò, thịt heo, thịt gà, có thể kế đến như: Cổ bò Mỹ sốt King BBQ, Ba chỉ bò Mỹ sốt King BBQ, Ba chỉ bò Mỹ sốt GuangYang, Bắp bò Úc sốt ớt chuông đỏ, Ba chỉ heo sốt cay Hàn Quốc, Ba chỉ heo ướp muối, Sườn heo bản lớn, Nạc vai heo sốt tỏi, Đùi gà rút xương sốt King BBQ,... tất cả đều được thái lát mỏng đẹp mắt, rải đều sốt đậm đà, thơm lừng. Ngoài ra, hải sản tươi ngon như: Bạch tuộc nướng, Mực trứng sốt cay,… cũng sẽ khiến bạn ngây ngất bởi dư vị mặn mòi, rất khác biệt.</p><p>Đặc biệt, bạn cũng có thể thưởng thức các món lẩu thơm ngọt để tăng thêm dư vị cho bữa tiệc ở King BBQ Buffet nha. Nước dùng được ninh hoàn toàn từ xương ống, nói không với mì chính, King BBQ Buffet luôn đặt sức khỏe của thực khách lên hàng đầu.</p><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 7" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-7.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-7.jpg"></p><h5>Với 10 vị sốt tẩm ướp khác nhau, thực khách có thể dễ dàng chọn được hương vị mà mình yêu thích</h5><p></p><img alt="King BBQ Lotte Mart Nam Sài Gòn 8" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-8.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-8.jpg"><h5>Nước sốt chấm được pha chế độc quyền bởi bếp trưởng Park Sung Min, bạn sẽ không thể tìm thấy ở bất kì n<a href="https://pasgo.vn/ho-chi-minh/nha-hang" target="_blank">hà hàng</a> nào</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 9" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-9.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-9.jpg"></p><h5>Nguyên liệu tươi ngon được nhập từ các nhà cung cấp uy tín làm nên chất lượng món ăn tuyệt hảo</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 10" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-10.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-10.jpg"></p><h5>Bên cạnh sốt tẩm ướp thì King BBQ Buffet Lotte Mart Nam Sài Gòn còn có cả sốt chấm cực kì ngon đó nha!</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 11" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-11.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-11.jpg"></p><h5>Không chỉ có các loại thịt, hải sản cũng là món được rất nhiều người yêu thích</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 12" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-12.jpg"></p><h5>Nào mực, nào cá với dư vị biển khơi mặn mòi đầy mời gọi</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 13" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-13.jpg"></p><h5>Bạn đừng quên thưởng thức các hương vị lẩu ấm nóng ở King BBQ Buffet Lotte Mart Nam Sài Gòn nha</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 14" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-14.jpg"></p><p>Với không gian ấm cúng và thân thiện, quầy buffet rộng với nhiều đồ ăn phong phú thay đổi theo từng ngày, King BBQ Buffet Lotte Mart Nam Sài Gòn sẽ là lựa chọn không thể thiếu cho các bữa tiệc gia đình hay tụ tập bạn bè, đồng nghiệp ngày cuối tuần. Hệ thống bếp nướng không khói thuận tiện, vừa giúp giữ nguyên hương vị món ăn, vừa mang lại một không gian thoải mái, thực khách thỏa sức thưởng thức các món nướng mà không lo bị ám mùi khó chịu.</p><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 15" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-15.jpg"></p><h5>Không gian King BBQ Buffet không quá rộng nhưng sắp xếp hợp lý nên rất thoáng đãng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 16" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-16.jpg"></p><h5>Dù là bữa tiệc đông người hay một nhóm nhỏ thì King BBQ Buffet Lotte Mart Nam Sài Gòn vẫn rất phù hợp</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 17" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-17.jpg"></p><h5>Bạn có thể thoải mái lựa chọn chỗ ngồi thích hợp khi đến đây</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 18" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-18.jpg"></p><h5>Quầy line được sắp xếp rất hợp lý, thông minh để phục vụ thực khách được tốt nhất</h5><p></p><img alt="King BBQ Lotte Mart Nam Sài Gòn 19" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-19.jpg"><h5>Điểm cộng của nhà hàng đó chính là thái độ phụ vụ rất chuyên nghiệp của nhân viên</h5><p>Hãy đến ngay với King BBQ Buffet Lotte Mart Nam Sài Gòn thưởng thức bữa tiệc buffet đặc sắc trong không gian ấm cúng và vô cùng gần gũi nha. Đừng quên đặt bàn qua PasGo – Mạng lưới nhà hàng ngon để nhận thêm nhiều ưu đãi bất ngờ!</p><h4>Địa chỉ Nhà hàng:</h4><h4>Nhà hàng King BBQ Buffet Lotte Mart Nam Sài Gòn: Tầng 3F – Lotte Mart Nam Sài Gòn, số 469 Nguyễn Hữu Thọ, Phường Tân Hưng, Quận 7, TP.HCM</h4>
                </div>
            </div>
            <a class="btn-xemthem" role="button" data-toggle="collapse" href="#gioithieu-more" aria-expanded="false" aria-controls="gioithieu-more" style="display: none;">
                Xem thêm
            </a>
        </div>
    <div class="col-xs-12 col-md-12">
        <div class="col-md-3">
            <div class="social-like">
                <div class="fb-like fb_iframe_widget" data-href="https://pasgo.vn/nha-hang/king-bbq-lotte-mart-nam-sai-gon-2478" data-layout="button_count" data-action="like" data-share="true" fb-xfbml-state="rendered" fb-iframe-plugin-query="action=like&amp;app_id=584525768323186&amp;container_width=217&amp;href=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true"><span style="vertical-align: bottom; width: 150px; height: 28px;"><iframe name="f3ef37f6bb72ce4" width="1000px" height="1000px" data-testid="fb:like Facebook Social Plugin" title="fb:like Facebook Social Plugin" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" allow="encrypted-media" src="https://www.facebook.com/v5.0/plugins/like.php?action=like&amp;app_id=584525768323186&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fx%2Fconnect%2Fxd_arbiter%2F%3Fversion%3D46%23cb%3Df1d25b142847adc%26domain%3Dpasgo.vn%26origin%3Dhttps%253A%252F%252Fpasgo.vn%252Ff160d5dc831f6ac%26relation%3Dparent.parent&amp;container_width=217&amp;href=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true" style="border: none; visibility: visible; width: 150px; height: 28px;" class=""></iframe></span></div>
            </div>
        </div>
        <div class="col-md-2">
            <div id="___plusone_0" style="position: absolute; width: 450px; left: -10000px;"><iframe ng-non-bindable="" frameborder="0" hspace="0" marginheight="0" marginwidth="0" scrolling="no" style="position:absolute;top:-10000px;width:450px;margin:0px;border-style:none" tabindex="0" vspace="0" width="100%" id="I0_1620214350994" name="I0_1620214350994" src="https://apis.google.com/u/0/se/0/_/+1/fastbutton?usegapi=1&amp;origin=https%3A%2F%2Fpasgo.vn&amp;url=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;gsrc=3p&amp;ic=1&amp;jsh=m%3B%2F_%2Fscs%2Fapps-static%2F_%2Fjs%2Fk%3Doz.gapi.vi.Np5UIK_lCuw.O%2Fm%3D__features__%2Fam%3DAQE%2Frt%3Dj%2Fd%3D1%2Frs%3DAGLTcCMfAte-OUXlAWpDj4LziXXJDdgBFA#_methods=onPlusOne%2C_ready%2C_close%2C_open%2C_resizeMe%2C_renderstart%2Concircled%2Cdrefresh%2Cerefresh%2Conload&amp;id=I0_1620214350994&amp;_gfid=I0_1620214350994&amp;parent=https%3A%2F%2Fpasgo.vn&amp;pfname=&amp;rpctoken=28530923"></iframe></div><div class="g-plusone" data-href="https://pasgo.vn/nha-hang/king-bbq-lotte-mart-nam-sai-gon-2478" data-gapiscan="true" data-onload="true" data-gapistub="true"></div>
        </div>
        <div class="col-md-7">
            Nếu bạn thấy bài viết này hữu ích, hãy chia sẻ và bình luận ngay nhé!
        </div>
    </div>
</div>', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'16:00:00' AS Time), CAST(N'23:00:00' AS Time), N'image/brand/10.jpg', 10, N'80 Nguyễn Huệ, Huế', 16.4598068, 107.5926476, N'00000000011', NULL, 1)
INSERT [dbo].[brand] ([brand_id], [brand_name], [info], [date_created], [open_time], [close_time], [avatar], [service_type_id], [address], [position_lat], [position_lng], [phone], [tel], [status]) VALUES (12, N'Stix', N'<div class="content">
    <h2 class="text-header"><span>Giới thiệu King BBQ Buffet – Lotte Mart Nam Sài Gòn </span></h2>
    <link href="https://pastaxi-manager.onepas.vn/content/style-special.css" rel="stylesheet" type="text/css"><div class="row-app"><div class="col-xs-app-7"><div class="txt-title">Phù hợp:</div><div class="text-description">Đặt tiệc, tụ họp, gặp mặt, liên hoan, họp nhóm, gia đình…</div><div class="txt-title">Món đặc sắc:</div><div class="text-description">Dẻ Sườn bò mỹ, Cổ bò mỹ sốt King BBQ, Bắp bò sốt muối ớt, Nầm heo nướng chao đỏ, Sườn heo, Ba chỉ bò Mỹ sốt King BBQ, Bạch tuộc sốt cay, Bò xào Bulgogi nồi đất, Cơm trộn Hàn Quốc, …
</div><div class="txt-title">Không gian:</div><div class="text-description"><p>- Hàn Quốc. Hiện đại </p><p>- Sức chứa: 150 Khách</p></div><div class="txt-title">Để ô tô:</div><div class="text-description">Có (Phí phụ thuộc đơn vị trông giữ xe)</div><div class="txt-title">Điểm đặc trưng:</div><div class="text-description"><p>- <span style="color:#1b1b1b;font-size:15px;">King BBQ thuộc sở hữu của Tập đoàn RedSun ITI – Một trong những tập đoàn ẩm thực lớn mạnh bậc nhất Việt Nam, sở hữu nhiều thương hiệu ẩm thực nổi tiếng khác như: ThaiExpress, Hotpot Story, Seoul Garden, Sushi Kei, Buk Buk, Capricciosa, Khao Lao, Tasaki BBQ, Meiwei, Truly Việt, Dolpan Sam</span>
</p><p>- Công thức độc quyền của “nước sốt King” – được chính Bếp trưởng Park Sung Min, một trong những đầu bếp nổi tiếng nhất Hàn Quốc, với kinh nghiệm hơn 40 năm trong ngành ẩm thực, trực tiếp nghiên cứu và chế biến. 
</p></div></div><div class="col-xs-app-5"><div class="txt-title">Thông tin thêm</div><ul><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Ghế trẻ em</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Wifi</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Điều hòa</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Visa / Master card</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Hóa đơn VAT</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Chỗ hút thuốc</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Phòng riêng</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Bàn ngoài trời</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Chỗ chơi trẻ em</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">HĐ trực tiếp</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Đặt ship PasGo</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Karaoke</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Máy chiếu</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Trang trí sự kiện</div></li></ul></div></div>
    <h3>King BBQ Buffet Lotte Mart Nam Sài Gòn - Bài ca thịt nướng cuốn hút và vô cùng hấp dẫn</h3><p>Món nướng kiểu Hàn tuy không quá xa lạ đối với thực khách Việt, nhưng không phải ở bất cứ đâu bạn cũng có thể thưởng thức “vị ngon đúng điệu” đậm chất Hàn. Và nếu bạn là một “tín đồ” sành về <a href="https://pasgo.vn/ho-chi-minh/nha-hang/nuong-25" target="_blank">ẩm thực nướng</a> thì chắc hẳn đã từng ghé qua King BBQ Buffet. Đến đây, bạn sẽ có cơ hội trải nghiệm một bữa tiệc buffet với các món ăn không chỉ thơm ngon, hấp dẫn mà còn rất tốt cho sức khỏ, đặc biệt là các món nướng ngon tuyệt hảo.</p><p><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584"><!--cho ?nh vào dây -->
 <img alt="King BBQ Lotte Mart Nam Sài Gòn 1" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-1.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-1.jpg">
        </a></p><div class="custom-box"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
            </a><div class="in" id="gioithieu-more" style="height: auto;"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
                </a><div class="box-list"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
                    </a>
<p></p><h5>Bàn tiệc nướng đủ vị khiến thực khách khó tính nhất cũng phải xiêu lòng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 2" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-2.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-2.jpg"></p><h5>Từng món ăn đều được chăm chút và chuẩn bị rất kĩ lưỡng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 3" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-3.jpg"><br></p><h5>Không chỉ có thịt nướng đơn thuần, King BBQ Buffet còn biến tấu thành rất nhiều những hương vị khác nhau cho thực khách dễ dàng lựa chọn</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 4" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-4.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-4.jpg"></p><h5>Mỗi món ăn đều chứa đựng bao tâm huyết và đam mê của người đầu bếp</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 5" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-5.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-5.jpg"></p><h5>Không chỉ ngon miệng mà còn được bài trí rất đẹp mắt đó nha</h5><p>Ở King BBQ Buffet Lotte Mart Nam Sài Gòn, bạn chắc hẳn sẽ bị chinh phục ngay bởi cách bày trí món ăn vô cùng cuốn hút. Trong đó, điểm nhấn vẫn là thịt nướng bao gồm thịt bò, thịt heo, thịt gà, có thể kế đến như: Cổ bò Mỹ sốt King BBQ, Ba chỉ bò Mỹ sốt King BBQ, Ba chỉ bò Mỹ sốt GuangYang, Bắp bò Úc sốt ớt chuông đỏ, Ba chỉ heo sốt cay Hàn Quốc, Ba chỉ heo ướp muối, Sườn heo bản lớn, Nạc vai heo sốt tỏi, Đùi gà rút xương sốt King BBQ,... tất cả đều được thái lát mỏng đẹp mắt, rải đều sốt đậm đà, thơm lừng. Ngoài ra, hải sản tươi ngon như: Bạch tuộc nướng, Mực trứng sốt cay,… cũng sẽ khiến bạn ngây ngất bởi dư vị mặn mòi, rất khác biệt.</p><p>Đặc biệt, bạn cũng có thể thưởng thức các món lẩu thơm ngọt để tăng thêm dư vị cho bữa tiệc ở King BBQ Buffet nha. Nước dùng được ninh hoàn toàn từ xương ống, nói không với mì chính, King BBQ Buffet luôn đặt sức khỏe của thực khách lên hàng đầu.</p><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 7" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-7.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-7.jpg"></p><h5>Với 10 vị sốt tẩm ướp khác nhau, thực khách có thể dễ dàng chọn được hương vị mà mình yêu thích</h5><p></p><img alt="King BBQ Lotte Mart Nam Sài Gòn 8" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-8.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-8.jpg"><h5>Nước sốt chấm được pha chế độc quyền bởi bếp trưởng Park Sung Min, bạn sẽ không thể tìm thấy ở bất kì n<a href="https://pasgo.vn/ho-chi-minh/nha-hang" target="_blank">hà hàng</a> nào</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 9" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-9.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-9.jpg"></p><h5>Nguyên liệu tươi ngon được nhập từ các nhà cung cấp uy tín làm nên chất lượng món ăn tuyệt hảo</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 10" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-10.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-10.jpg"></p><h5>Bên cạnh sốt tẩm ướp thì King BBQ Buffet Lotte Mart Nam Sài Gòn còn có cả sốt chấm cực kì ngon đó nha!</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 11" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-11.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-11.jpg"></p><h5>Không chỉ có các loại thịt, hải sản cũng là món được rất nhiều người yêu thích</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 12" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-12.jpg"></p><h5>Nào mực, nào cá với dư vị biển khơi mặn mòi đầy mời gọi</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 13" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-13.jpg"></p><h5>Bạn đừng quên thưởng thức các hương vị lẩu ấm nóng ở King BBQ Buffet Lotte Mart Nam Sài Gòn nha</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 14" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-14.jpg"></p><p>Với không gian ấm cúng và thân thiện, quầy buffet rộng với nhiều đồ ăn phong phú thay đổi theo từng ngày, King BBQ Buffet Lotte Mart Nam Sài Gòn sẽ là lựa chọn không thể thiếu cho các bữa tiệc gia đình hay tụ tập bạn bè, đồng nghiệp ngày cuối tuần. Hệ thống bếp nướng không khói thuận tiện, vừa giúp giữ nguyên hương vị món ăn, vừa mang lại một không gian thoải mái, thực khách thỏa sức thưởng thức các món nướng mà không lo bị ám mùi khó chịu.</p><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 15" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-15.jpg"></p><h5>Không gian King BBQ Buffet không quá rộng nhưng sắp xếp hợp lý nên rất thoáng đãng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 16" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-16.jpg"></p><h5>Dù là bữa tiệc đông người hay một nhóm nhỏ thì King BBQ Buffet Lotte Mart Nam Sài Gòn vẫn rất phù hợp</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 17" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-17.jpg"></p><h5>Bạn có thể thoải mái lựa chọn chỗ ngồi thích hợp khi đến đây</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 18" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-18.jpg"></p><h5>Quầy line được sắp xếp rất hợp lý, thông minh để phục vụ thực khách được tốt nhất</h5><p></p><img alt="King BBQ Lotte Mart Nam Sài Gòn 19" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-19.jpg"><h5>Điểm cộng của nhà hàng đó chính là thái độ phụ vụ rất chuyên nghiệp của nhân viên</h5><p>Hãy đến ngay với King BBQ Buffet Lotte Mart Nam Sài Gòn thưởng thức bữa tiệc buffet đặc sắc trong không gian ấm cúng và vô cùng gần gũi nha. Đừng quên đặt bàn qua PasGo – Mạng lưới nhà hàng ngon để nhận thêm nhiều ưu đãi bất ngờ!</p><h4>Địa chỉ Nhà hàng:</h4><h4>Nhà hàng King BBQ Buffet Lotte Mart Nam Sài Gòn: Tầng 3F – Lotte Mart Nam Sài Gòn, số 469 Nguyễn Hữu Thọ, Phường Tân Hưng, Quận 7, TP.HCM</h4>
                </div>
            </div>
            <a class="btn-xemthem" role="button" data-toggle="collapse" href="#gioithieu-more" aria-expanded="false" aria-controls="gioithieu-more" style="display: none;">
                Xem thêm
            </a>
        </div>
    <div class="col-xs-12 col-md-12">
        <div class="col-md-3">
            <div class="social-like">
                <div class="fb-like fb_iframe_widget" data-href="https://pasgo.vn/nha-hang/king-bbq-lotte-mart-nam-sai-gon-2478" data-layout="button_count" data-action="like" data-share="true" fb-xfbml-state="rendered" fb-iframe-plugin-query="action=like&amp;app_id=584525768323186&amp;container_width=217&amp;href=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true"><span style="vertical-align: bottom; width: 150px; height: 28px;"><iframe name="f3ef37f6bb72ce4" width="1000px" height="1000px" data-testid="fb:like Facebook Social Plugin" title="fb:like Facebook Social Plugin" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" allow="encrypted-media" src="https://www.facebook.com/v5.0/plugins/like.php?action=like&amp;app_id=584525768323186&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fx%2Fconnect%2Fxd_arbiter%2F%3Fversion%3D46%23cb%3Df1d25b142847adc%26domain%3Dpasgo.vn%26origin%3Dhttps%253A%252F%252Fpasgo.vn%252Ff160d5dc831f6ac%26relation%3Dparent.parent&amp;container_width=217&amp;href=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true" style="border: none; visibility: visible; width: 150px; height: 28px;" class=""></iframe></span></div>
            </div>
        </div>
        <div class="col-md-2">
            <div id="___plusone_0" style="position: absolute; width: 450px; left: -10000px;"><iframe ng-non-bindable="" frameborder="0" hspace="0" marginheight="0" marginwidth="0" scrolling="no" style="position:absolute;top:-10000px;width:450px;margin:0px;border-style:none" tabindex="0" vspace="0" width="100%" id="I0_1620214350994" name="I0_1620214350994" src="https://apis.google.com/u/0/se/0/_/+1/fastbutton?usegapi=1&amp;origin=https%3A%2F%2Fpasgo.vn&amp;url=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;gsrc=3p&amp;ic=1&amp;jsh=m%3B%2F_%2Fscs%2Fapps-static%2F_%2Fjs%2Fk%3Doz.gapi.vi.Np5UIK_lCuw.O%2Fm%3D__features__%2Fam%3DAQE%2Frt%3Dj%2Fd%3D1%2Frs%3DAGLTcCMfAte-OUXlAWpDj4LziXXJDdgBFA#_methods=onPlusOne%2C_ready%2C_close%2C_open%2C_resizeMe%2C_renderstart%2Concircled%2Cdrefresh%2Cerefresh%2Conload&amp;id=I0_1620214350994&amp;_gfid=I0_1620214350994&amp;parent=https%3A%2F%2Fpasgo.vn&amp;pfname=&amp;rpctoken=28530923"></iframe></div><div class="g-plusone" data-href="https://pasgo.vn/nha-hang/king-bbq-lotte-mart-nam-sai-gon-2478" data-gapiscan="true" data-onload="true" data-gapistub="true"></div>
        </div>
        <div class="col-md-7">
            Nếu bạn thấy bài viết này hữu ích, hãy chia sẻ và bình luận ngay nhé!
        </div>
    </div>
</div>', CAST(N'2020-12-12T00:00:00.000' AS DateTime), CAST(N'07:00:00' AS Time), CAST(N'23:00:00' AS Time), N'image/brand/11.jpg', 11, N'81 Nguyễn Huệ, Huế', 16.4598068, 107.5926476, N'00000000012', NULL, 1)
INSERT [dbo].[brand] ([brand_id], [brand_name], [info], [date_created], [open_time], [close_time], [avatar], [service_type_id], [address], [position_lat], [position_lng], [phone], [tel], [status]) VALUES (13, N'Việt Phố', N'<div class="content">
    <h2 class="text-header"><span>Giới thiệu King BBQ Buffet – Lotte Mart Nam Sài Gòn </span></h2>
    <link href="https://pastaxi-manager.onepas.vn/content/style-special.css" rel="stylesheet" type="text/css"><div class="row-app"><div class="col-xs-app-7"><div class="txt-title">Phù hợp:</div><div class="text-description">Đặt tiệc, tụ họp, gặp mặt, liên hoan, họp nhóm, gia đình…</div><div class="txt-title">Món đặc sắc:</div><div class="text-description">Dẻ Sườn bò mỹ, Cổ bò mỹ sốt King BBQ, Bắp bò sốt muối ớt, Nầm heo nướng chao đỏ, Sườn heo, Ba chỉ bò Mỹ sốt King BBQ, Bạch tuộc sốt cay, Bò xào Bulgogi nồi đất, Cơm trộn Hàn Quốc, …
</div><div class="txt-title">Không gian:</div><div class="text-description"><p>- Hàn Quốc. Hiện đại </p><p>- Sức chứa: 150 Khách</p></div><div class="txt-title">Để ô tô:</div><div class="text-description">Có (Phí phụ thuộc đơn vị trông giữ xe)</div><div class="txt-title">Điểm đặc trưng:</div><div class="text-description"><p>- <span style="color:#1b1b1b;font-size:15px;">King BBQ thuộc sở hữu của Tập đoàn RedSun ITI – Một trong những tập đoàn ẩm thực lớn mạnh bậc nhất Việt Nam, sở hữu nhiều thương hiệu ẩm thực nổi tiếng khác như: ThaiExpress, Hotpot Story, Seoul Garden, Sushi Kei, Buk Buk, Capricciosa, Khao Lao, Tasaki BBQ, Meiwei, Truly Việt, Dolpan Sam</span>
</p><p>- Công thức độc quyền của “nước sốt King” – được chính Bếp trưởng Park Sung Min, một trong những đầu bếp nổi tiếng nhất Hàn Quốc, với kinh nghiệm hơn 40 năm trong ngành ẩm thực, trực tiếp nghiên cứu và chế biến. 
</p></div></div><div class="col-xs-app-5"><div class="txt-title">Thông tin thêm</div><ul><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Ghế trẻ em</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Wifi</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Điều hòa</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Visa / Master card</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Hóa đơn VAT</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Chỗ hút thuốc</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Phòng riêng</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Bàn ngoài trời</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Chỗ chơi trẻ em</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">HĐ trực tiếp</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Đặt ship PasGo</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Karaoke</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Máy chiếu</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Trang trí sự kiện</div></li></ul></div></div>
    <h3>King BBQ Buffet Lotte Mart Nam Sài Gòn - Bài ca thịt nướng cuốn hút và vô cùng hấp dẫn</h3><p>Món nướng kiểu Hàn tuy không quá xa lạ đối với thực khách Việt, nhưng không phải ở bất cứ đâu bạn cũng có thể thưởng thức “vị ngon đúng điệu” đậm chất Hàn. Và nếu bạn là một “tín đồ” sành về <a href="https://pasgo.vn/ho-chi-minh/nha-hang/nuong-25" target="_blank">ẩm thực nướng</a> thì chắc hẳn đã từng ghé qua King BBQ Buffet. Đến đây, bạn sẽ có cơ hội trải nghiệm một bữa tiệc buffet với các món ăn không chỉ thơm ngon, hấp dẫn mà còn rất tốt cho sức khỏ, đặc biệt là các món nướng ngon tuyệt hảo.</p><p><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584"><!--cho ?nh vào dây -->
 <img alt="King BBQ Lotte Mart Nam Sài Gòn 1" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-1.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-1.jpg">
        </a></p><div class="custom-box"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
            </a><div class="in" id="gioithieu-more" style="height: auto;"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
                </a><div class="box-list"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
                    </a>
<p></p><h5>Bàn tiệc nướng đủ vị khiến thực khách khó tính nhất cũng phải xiêu lòng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 2" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-2.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-2.jpg"></p><h5>Từng món ăn đều được chăm chút và chuẩn bị rất kĩ lưỡng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 3" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-3.jpg"><br></p><h5>Không chỉ có thịt nướng đơn thuần, King BBQ Buffet còn biến tấu thành rất nhiều những hương vị khác nhau cho thực khách dễ dàng lựa chọn</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 4" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-4.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-4.jpg"></p><h5>Mỗi món ăn đều chứa đựng bao tâm huyết và đam mê của người đầu bếp</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 5" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-5.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-5.jpg"></p><h5>Không chỉ ngon miệng mà còn được bài trí rất đẹp mắt đó nha</h5><p>Ở King BBQ Buffet Lotte Mart Nam Sài Gòn, bạn chắc hẳn sẽ bị chinh phục ngay bởi cách bày trí món ăn vô cùng cuốn hút. Trong đó, điểm nhấn vẫn là thịt nướng bao gồm thịt bò, thịt heo, thịt gà, có thể kế đến như: Cổ bò Mỹ sốt King BBQ, Ba chỉ bò Mỹ sốt King BBQ, Ba chỉ bò Mỹ sốt GuangYang, Bắp bò Úc sốt ớt chuông đỏ, Ba chỉ heo sốt cay Hàn Quốc, Ba chỉ heo ướp muối, Sườn heo bản lớn, Nạc vai heo sốt tỏi, Đùi gà rút xương sốt King BBQ,... tất cả đều được thái lát mỏng đẹp mắt, rải đều sốt đậm đà, thơm lừng. Ngoài ra, hải sản tươi ngon như: Bạch tuộc nướng, Mực trứng sốt cay,… cũng sẽ khiến bạn ngây ngất bởi dư vị mặn mòi, rất khác biệt.</p><p>Đặc biệt, bạn cũng có thể thưởng thức các món lẩu thơm ngọt để tăng thêm dư vị cho bữa tiệc ở King BBQ Buffet nha. Nước dùng được ninh hoàn toàn từ xương ống, nói không với mì chính, King BBQ Buffet luôn đặt sức khỏe của thực khách lên hàng đầu.</p><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 7" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-7.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-7.jpg"></p><h5>Với 10 vị sốt tẩm ướp khác nhau, thực khách có thể dễ dàng chọn được hương vị mà mình yêu thích</h5><p></p><img alt="King BBQ Lotte Mart Nam Sài Gòn 8" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-8.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-8.jpg"><h5>Nước sốt chấm được pha chế độc quyền bởi bếp trưởng Park Sung Min, bạn sẽ không thể tìm thấy ở bất kì n<a href="https://pasgo.vn/ho-chi-minh/nha-hang" target="_blank">hà hàng</a> nào</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 9" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-9.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-9.jpg"></p><h5>Nguyên liệu tươi ngon được nhập từ các nhà cung cấp uy tín làm nên chất lượng món ăn tuyệt hảo</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 10" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-10.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-10.jpg"></p><h5>Bên cạnh sốt tẩm ướp thì King BBQ Buffet Lotte Mart Nam Sài Gòn còn có cả sốt chấm cực kì ngon đó nha!</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 11" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-11.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-11.jpg"></p><h5>Không chỉ có các loại thịt, hải sản cũng là món được rất nhiều người yêu thích</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 12" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-12.jpg"></p><h5>Nào mực, nào cá với dư vị biển khơi mặn mòi đầy mời gọi</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 13" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-13.jpg"></p><h5>Bạn đừng quên thưởng thức các hương vị lẩu ấm nóng ở King BBQ Buffet Lotte Mart Nam Sài Gòn nha</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 14" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-14.jpg"></p><p>Với không gian ấm cúng và thân thiện, quầy buffet rộng với nhiều đồ ăn phong phú thay đổi theo từng ngày, King BBQ Buffet Lotte Mart Nam Sài Gòn sẽ là lựa chọn không thể thiếu cho các bữa tiệc gia đình hay tụ tập bạn bè, đồng nghiệp ngày cuối tuần. Hệ thống bếp nướng không khói thuận tiện, vừa giúp giữ nguyên hương vị món ăn, vừa mang lại một không gian thoải mái, thực khách thỏa sức thưởng thức các món nướng mà không lo bị ám mùi khó chịu.</p><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 15" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-15.jpg"></p><h5>Không gian King BBQ Buffet không quá rộng nhưng sắp xếp hợp lý nên rất thoáng đãng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 16" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-16.jpg"></p><h5>Dù là bữa tiệc đông người hay một nhóm nhỏ thì King BBQ Buffet Lotte Mart Nam Sài Gòn vẫn rất phù hợp</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 17" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-17.jpg"></p><h5>Bạn có thể thoải mái lựa chọn chỗ ngồi thích hợp khi đến đây</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 18" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-18.jpg"></p><h5>Quầy line được sắp xếp rất hợp lý, thông minh để phục vụ thực khách được tốt nhất</h5><p></p><img alt="King BBQ Lotte Mart Nam Sài Gòn 19" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-19.jpg"><h5>Điểm cộng của nhà hàng đó chính là thái độ phụ vụ rất chuyên nghiệp của nhân viên</h5><p>Hãy đến ngay với King BBQ Buffet Lotte Mart Nam Sài Gòn thưởng thức bữa tiệc buffet đặc sắc trong không gian ấm cúng và vô cùng gần gũi nha. Đừng quên đặt bàn qua PasGo – Mạng lưới nhà hàng ngon để nhận thêm nhiều ưu đãi bất ngờ!</p><h4>Địa chỉ Nhà hàng:</h4><h4>Nhà hàng King BBQ Buffet Lotte Mart Nam Sài Gòn: Tầng 3F – Lotte Mart Nam Sài Gòn, số 469 Nguyễn Hữu Thọ, Phường Tân Hưng, Quận 7, TP.HCM</h4>
                </div>
            </div>
            <a class="btn-xemthem" role="button" data-toggle="collapse" href="#gioithieu-more" aria-expanded="false" aria-controls="gioithieu-more" style="display: none;">
                Xem thêm
            </a>
        </div>
    <div class="col-xs-12 col-md-12">
        <div class="col-md-3">
            <div class="social-like">
                <div class="fb-like fb_iframe_widget" data-href="https://pasgo.vn/nha-hang/king-bbq-lotte-mart-nam-sai-gon-2478" data-layout="button_count" data-action="like" data-share="true" fb-xfbml-state="rendered" fb-iframe-plugin-query="action=like&amp;app_id=584525768323186&amp;container_width=217&amp;href=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true"><span style="vertical-align: bottom; width: 150px; height: 28px;"><iframe name="f3ef37f6bb72ce4" width="1000px" height="1000px" data-testid="fb:like Facebook Social Plugin" title="fb:like Facebook Social Plugin" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" allow="encrypted-media" src="https://www.facebook.com/v5.0/plugins/like.php?action=like&amp;app_id=584525768323186&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fx%2Fconnect%2Fxd_arbiter%2F%3Fversion%3D46%23cb%3Df1d25b142847adc%26domain%3Dpasgo.vn%26origin%3Dhttps%253A%252F%252Fpasgo.vn%252Ff160d5dc831f6ac%26relation%3Dparent.parent&amp;container_width=217&amp;href=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true" style="border: none; visibility: visible; width: 150px; height: 28px;" class=""></iframe></span></div>
            </div>
        </div>
        <div class="col-md-2">
            <div id="___plusone_0" style="position: absolute; width: 450px; left: -10000px;"><iframe ng-non-bindable="" frameborder="0" hspace="0" marginheight="0" marginwidth="0" scrolling="no" style="position:absolute;top:-10000px;width:450px;margin:0px;border-style:none" tabindex="0" vspace="0" width="100%" id="I0_1620214350994" name="I0_1620214350994" src="https://apis.google.com/u/0/se/0/_/+1/fastbutton?usegapi=1&amp;origin=https%3A%2F%2Fpasgo.vn&amp;url=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;gsrc=3p&amp;ic=1&amp;jsh=m%3B%2F_%2Fscs%2Fapps-static%2F_%2Fjs%2Fk%3Doz.gapi.vi.Np5UIK_lCuw.O%2Fm%3D__features__%2Fam%3DAQE%2Frt%3Dj%2Fd%3D1%2Frs%3DAGLTcCMfAte-OUXlAWpDj4LziXXJDdgBFA#_methods=onPlusOne%2C_ready%2C_close%2C_open%2C_resizeMe%2C_renderstart%2Concircled%2Cdrefresh%2Cerefresh%2Conload&amp;id=I0_1620214350994&amp;_gfid=I0_1620214350994&amp;parent=https%3A%2F%2Fpasgo.vn&amp;pfname=&amp;rpctoken=28530923"></iframe></div><div class="g-plusone" data-href="https://pasgo.vn/nha-hang/king-bbq-lotte-mart-nam-sai-gon-2478" data-gapiscan="true" data-onload="true" data-gapistub="true"></div>
        </div>
        <div class="col-md-7">
            Nếu bạn thấy bài viết này hữu ích, hãy chia sẻ và bình luận ngay nhé!
        </div>
    </div>
</div>', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'07:00:00' AS Time), CAST(N'23:00:00' AS Time), N'image/brand/12.jpg', 12, N'82 Nguyễn Huệ, Huế', 16.4598068, 107.5926476, N'00000000013', NULL, 1)
INSERT [dbo].[brand] ([brand_id], [brand_name], [info], [date_created], [open_time], [close_time], [avatar], [service_type_id], [address], [position_lat], [position_lng], [phone], [tel], [status]) VALUES (14, N'Ân Nam Quán', N'<div class="content">
    <h2 class="text-header"><span>Giới thiệu King BBQ Buffet – Lotte Mart Nam Sài Gòn </span></h2>
    <link href="https://pastaxi-manager.onepas.vn/content/style-special.css" rel="stylesheet" type="text/css"><div class="row-app"><div class="col-xs-app-7"><div class="txt-title">Phù hợp:</div><div class="text-description">Đặt tiệc, tụ họp, gặp mặt, liên hoan, họp nhóm, gia đình…</div><div class="txt-title">Món đặc sắc:</div><div class="text-description">Dẻ Sườn bò mỹ, Cổ bò mỹ sốt King BBQ, Bắp bò sốt muối ớt, Nầm heo nướng chao đỏ, Sườn heo, Ba chỉ bò Mỹ sốt King BBQ, Bạch tuộc sốt cay, Bò xào Bulgogi nồi đất, Cơm trộn Hàn Quốc, …
</div><div class="txt-title">Không gian:</div><div class="text-description"><p>- Hàn Quốc. Hiện đại </p><p>- Sức chứa: 150 Khách</p></div><div class="txt-title">Để ô tô:</div><div class="text-description">Có (Phí phụ thuộc đơn vị trông giữ xe)</div><div class="txt-title">Điểm đặc trưng:</div><div class="text-description"><p>- <span style="color:#1b1b1b;font-size:15px;">King BBQ thuộc sở hữu của Tập đoàn RedSun ITI – Một trong những tập đoàn ẩm thực lớn mạnh bậc nhất Việt Nam, sở hữu nhiều thương hiệu ẩm thực nổi tiếng khác như: ThaiExpress, Hotpot Story, Seoul Garden, Sushi Kei, Buk Buk, Capricciosa, Khao Lao, Tasaki BBQ, Meiwei, Truly Việt, Dolpan Sam</span>
</p><p>- Công thức độc quyền của “nước sốt King” – được chính Bếp trưởng Park Sung Min, một trong những đầu bếp nổi tiếng nhất Hàn Quốc, với kinh nghiệm hơn 40 năm trong ngành ẩm thực, trực tiếp nghiên cứu và chế biến. 
</p></div></div><div class="col-xs-app-5"><div class="txt-title">Thông tin thêm</div><ul><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Ghế trẻ em</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Wifi</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Điều hòa</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Visa / Master card</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Hóa đơn VAT</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Chỗ hút thuốc</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Phòng riêng</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Bàn ngoài trời</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Chỗ chơi trẻ em</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">HĐ trực tiếp</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Đặt ship PasGo</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Karaoke</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Máy chiếu</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Trang trí sự kiện</div></li></ul></div></div>
    <h3>King BBQ Buffet Lotte Mart Nam Sài Gòn - Bài ca thịt nướng cuốn hút và vô cùng hấp dẫn</h3><p>Món nướng kiểu Hàn tuy không quá xa lạ đối với thực khách Việt, nhưng không phải ở bất cứ đâu bạn cũng có thể thưởng thức “vị ngon đúng điệu” đậm chất Hàn. Và nếu bạn là một “tín đồ” sành về <a href="https://pasgo.vn/ho-chi-minh/nha-hang/nuong-25" target="_blank">ẩm thực nướng</a> thì chắc hẳn đã từng ghé qua King BBQ Buffet. Đến đây, bạn sẽ có cơ hội trải nghiệm một bữa tiệc buffet với các món ăn không chỉ thơm ngon, hấp dẫn mà còn rất tốt cho sức khỏ, đặc biệt là các món nướng ngon tuyệt hảo.</p><p><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584"><!--cho ?nh vào dây -->
 <img alt="King BBQ Lotte Mart Nam Sài Gòn 1" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-1.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-1.jpg">
        </a></p><div class="custom-box"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
            </a><div class="in" id="gioithieu-more" style="height: auto;"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
                </a><div class="box-list"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
                    </a>
<p></p><h5>Bàn tiệc nướng đủ vị khiến thực khách khó tính nhất cũng phải xiêu lòng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 2" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-2.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-2.jpg"></p><h5>Từng món ăn đều được chăm chút và chuẩn bị rất kĩ lưỡng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 3" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-3.jpg"><br></p><h5>Không chỉ có thịt nướng đơn thuần, King BBQ Buffet còn biến tấu thành rất nhiều những hương vị khác nhau cho thực khách dễ dàng lựa chọn</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 4" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-4.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-4.jpg"></p><h5>Mỗi món ăn đều chứa đựng bao tâm huyết và đam mê của người đầu bếp</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 5" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-5.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-5.jpg"></p><h5>Không chỉ ngon miệng mà còn được bài trí rất đẹp mắt đó nha</h5><p>Ở King BBQ Buffet Lotte Mart Nam Sài Gòn, bạn chắc hẳn sẽ bị chinh phục ngay bởi cách bày trí món ăn vô cùng cuốn hút. Trong đó, điểm nhấn vẫn là thịt nướng bao gồm thịt bò, thịt heo, thịt gà, có thể kế đến như: Cổ bò Mỹ sốt King BBQ, Ba chỉ bò Mỹ sốt King BBQ, Ba chỉ bò Mỹ sốt GuangYang, Bắp bò Úc sốt ớt chuông đỏ, Ba chỉ heo sốt cay Hàn Quốc, Ba chỉ heo ướp muối, Sườn heo bản lớn, Nạc vai heo sốt tỏi, Đùi gà rút xương sốt King BBQ,... tất cả đều được thái lát mỏng đẹp mắt, rải đều sốt đậm đà, thơm lừng. Ngoài ra, hải sản tươi ngon như: Bạch tuộc nướng, Mực trứng sốt cay,… cũng sẽ khiến bạn ngây ngất bởi dư vị mặn mòi, rất khác biệt.</p><p>Đặc biệt, bạn cũng có thể thưởng thức các món lẩu thơm ngọt để tăng thêm dư vị cho bữa tiệc ở King BBQ Buffet nha. Nước dùng được ninh hoàn toàn từ xương ống, nói không với mì chính, King BBQ Buffet luôn đặt sức khỏe của thực khách lên hàng đầu.</p><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 7" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-7.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-7.jpg"></p><h5>Với 10 vị sốt tẩm ướp khác nhau, thực khách có thể dễ dàng chọn được hương vị mà mình yêu thích</h5><p></p><img alt="King BBQ Lotte Mart Nam Sài Gòn 8" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-8.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-8.jpg"><h5>Nước sốt chấm được pha chế độc quyền bởi bếp trưởng Park Sung Min, bạn sẽ không thể tìm thấy ở bất kì n<a href="https://pasgo.vn/ho-chi-minh/nha-hang" target="_blank">hà hàng</a> nào</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 9" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-9.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-9.jpg"></p><h5>Nguyên liệu tươi ngon được nhập từ các nhà cung cấp uy tín làm nên chất lượng món ăn tuyệt hảo</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 10" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-10.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-10.jpg"></p><h5>Bên cạnh sốt tẩm ướp thì King BBQ Buffet Lotte Mart Nam Sài Gòn còn có cả sốt chấm cực kì ngon đó nha!</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 11" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-11.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-11.jpg"></p><h5>Không chỉ có các loại thịt, hải sản cũng là món được rất nhiều người yêu thích</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 12" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-12.jpg"></p><h5>Nào mực, nào cá với dư vị biển khơi mặn mòi đầy mời gọi</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 13" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-13.jpg"></p><h5>Bạn đừng quên thưởng thức các hương vị lẩu ấm nóng ở King BBQ Buffet Lotte Mart Nam Sài Gòn nha</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 14" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-14.jpg"></p><p>Với không gian ấm cúng và thân thiện, quầy buffet rộng với nhiều đồ ăn phong phú thay đổi theo từng ngày, King BBQ Buffet Lotte Mart Nam Sài Gòn sẽ là lựa chọn không thể thiếu cho các bữa tiệc gia đình hay tụ tập bạn bè, đồng nghiệp ngày cuối tuần. Hệ thống bếp nướng không khói thuận tiện, vừa giúp giữ nguyên hương vị món ăn, vừa mang lại một không gian thoải mái, thực khách thỏa sức thưởng thức các món nướng mà không lo bị ám mùi khó chịu.</p><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 15" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-15.jpg"></p><h5>Không gian King BBQ Buffet không quá rộng nhưng sắp xếp hợp lý nên rất thoáng đãng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 16" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-16.jpg"></p><h5>Dù là bữa tiệc đông người hay một nhóm nhỏ thì King BBQ Buffet Lotte Mart Nam Sài Gòn vẫn rất phù hợp</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 17" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-17.jpg"></p><h5>Bạn có thể thoải mái lựa chọn chỗ ngồi thích hợp khi đến đây</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 18" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-18.jpg"></p><h5>Quầy line được sắp xếp rất hợp lý, thông minh để phục vụ thực khách được tốt nhất</h5><p></p><img alt="King BBQ Lotte Mart Nam Sài Gòn 19" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-19.jpg"><h5>Điểm cộng của nhà hàng đó chính là thái độ phụ vụ rất chuyên nghiệp của nhân viên</h5><p>Hãy đến ngay với King BBQ Buffet Lotte Mart Nam Sài Gòn thưởng thức bữa tiệc buffet đặc sắc trong không gian ấm cúng và vô cùng gần gũi nha. Đừng quên đặt bàn qua PasGo – Mạng lưới nhà hàng ngon để nhận thêm nhiều ưu đãi bất ngờ!</p><h4>Địa chỉ Nhà hàng:</h4><h4>Nhà hàng King BBQ Buffet Lotte Mart Nam Sài Gòn: Tầng 3F – Lotte Mart Nam Sài Gòn, số 469 Nguyễn Hữu Thọ, Phường Tân Hưng, Quận 7, TP.HCM</h4>
                </div>
            </div>
            <a class="btn-xemthem" role="button" data-toggle="collapse" href="#gioithieu-more" aria-expanded="false" aria-controls="gioithieu-more" style="display: none;">
                Xem thêm
            </a>
        </div>
    <div class="col-xs-12 col-md-12">
        <div class="col-md-3">
            <div class="social-like">
                <div class="fb-like fb_iframe_widget" data-href="https://pasgo.vn/nha-hang/king-bbq-lotte-mart-nam-sai-gon-2478" data-layout="button_count" data-action="like" data-share="true" fb-xfbml-state="rendered" fb-iframe-plugin-query="action=like&amp;app_id=584525768323186&amp;container_width=217&amp;href=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true"><span style="vertical-align: bottom; width: 150px; height: 28px;"><iframe name="f3ef37f6bb72ce4" width="1000px" height="1000px" data-testid="fb:like Facebook Social Plugin" title="fb:like Facebook Social Plugin" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" allow="encrypted-media" src="https://www.facebook.com/v5.0/plugins/like.php?action=like&amp;app_id=584525768323186&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fx%2Fconnect%2Fxd_arbiter%2F%3Fversion%3D46%23cb%3Df1d25b142847adc%26domain%3Dpasgo.vn%26origin%3Dhttps%253A%252F%252Fpasgo.vn%252Ff160d5dc831f6ac%26relation%3Dparent.parent&amp;container_width=217&amp;href=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true" style="border: none; visibility: visible; width: 150px; height: 28px;" class=""></iframe></span></div>
            </div>
        </div>
        <div class="col-md-2">
            <div id="___plusone_0" style="position: absolute; width: 450px; left: -10000px;"><iframe ng-non-bindable="" frameborder="0" hspace="0" marginheight="0" marginwidth="0" scrolling="no" style="position:absolute;top:-10000px;width:450px;margin:0px;border-style:none" tabindex="0" vspace="0" width="100%" id="I0_1620214350994" name="I0_1620214350994" src="https://apis.google.com/u/0/se/0/_/+1/fastbutton?usegapi=1&amp;origin=https%3A%2F%2Fpasgo.vn&amp;url=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;gsrc=3p&amp;ic=1&amp;jsh=m%3B%2F_%2Fscs%2Fapps-static%2F_%2Fjs%2Fk%3Doz.gapi.vi.Np5UIK_lCuw.O%2Fm%3D__features__%2Fam%3DAQE%2Frt%3Dj%2Fd%3D1%2Frs%3DAGLTcCMfAte-OUXlAWpDj4LziXXJDdgBFA#_methods=onPlusOne%2C_ready%2C_close%2C_open%2C_resizeMe%2C_renderstart%2Concircled%2Cdrefresh%2Cerefresh%2Conload&amp;id=I0_1620214350994&amp;_gfid=I0_1620214350994&amp;parent=https%3A%2F%2Fpasgo.vn&amp;pfname=&amp;rpctoken=28530923"></iframe></div><div class="g-plusone" data-href="https://pasgo.vn/nha-hang/king-bbq-lotte-mart-nam-sai-gon-2478" data-gapiscan="true" data-onload="true" data-gapistub="true"></div>
        </div>
        <div class="col-md-7">
            Nếu bạn thấy bài viết này hữu ích, hãy chia sẻ và bình luận ngay nhé!
        </div>
    </div>
</div>', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'07:00:00' AS Time), CAST(N'23:00:00' AS Time), N'image/brand/1.jpg', 13, N'83 Nguyễn Huệ, Huế', 16.4598068, 107.5926476, N'00000000014', NULL, 1)
INSERT [dbo].[brand] ([brand_id], [brand_name], [info], [date_created], [open_time], [close_time], [avatar], [service_type_id], [address], [position_lat], [position_lng], [phone], [tel], [status]) VALUES (15, N'King BBQ', N'<div class="content">
    <h2 class="text-header"><span>Giới thiệu King BBQ Buffet – Lotte Mart Nam Sài Gòn </span></h2>
    <link href="https://pastaxi-manager.onepas.vn/content/style-special.css" rel="stylesheet" type="text/css"><div class="row-app"><div class="col-xs-app-7"><div class="txt-title">Phù hợp:</div><div class="text-description">Đặt tiệc, tụ họp, gặp mặt, liên hoan, họp nhóm, gia đình…</div><div class="txt-title">Món đặc sắc:</div><div class="text-description">Dẻ Sườn bò mỹ, Cổ bò mỹ sốt King BBQ, Bắp bò sốt muối ớt, Nầm heo nướng chao đỏ, Sườn heo, Ba chỉ bò Mỹ sốt King BBQ, Bạch tuộc sốt cay, Bò xào Bulgogi nồi đất, Cơm trộn Hàn Quốc, …
</div><div class="txt-title">Không gian:</div><div class="text-description"><p>- Hàn Quốc. Hiện đại </p><p>- Sức chứa: 150 Khách</p></div><div class="txt-title">Để ô tô:</div><div class="text-description">Có (Phí phụ thuộc đơn vị trông giữ xe)</div><div class="txt-title">Điểm đặc trưng:</div><div class="text-description"><p>- <span style="color:#1b1b1b;font-size:15px;">King BBQ thuộc sở hữu của Tập đoàn RedSun ITI – Một trong những tập đoàn ẩm thực lớn mạnh bậc nhất Việt Nam, sở hữu nhiều thương hiệu ẩm thực nổi tiếng khác như: ThaiExpress, Hotpot Story, Seoul Garden, Sushi Kei, Buk Buk, Capricciosa, Khao Lao, Tasaki BBQ, Meiwei, Truly Việt, Dolpan Sam</span>
</p><p>- Công thức độc quyền của “nước sốt King” – được chính Bếp trưởng Park Sung Min, một trong những đầu bếp nổi tiếng nhất Hàn Quốc, với kinh nghiệm hơn 40 năm trong ngành ẩm thực, trực tiếp nghiên cứu và chế biến. 
</p></div></div><div class="col-xs-app-5"><div class="txt-title">Thông tin thêm</div><ul><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Ghế trẻ em</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Wifi</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Điều hòa</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Visa / Master card</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Hóa đơn VAT</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Chỗ hút thuốc</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Phòng riêng</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Bàn ngoài trời</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Chỗ chơi trẻ em</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">HĐ trực tiếp</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Đặt ship PasGo</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Karaoke</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Máy chiếu</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Trang trí sự kiện</div></li></ul></div></div>
    <h3>King BBQ Buffet Lotte Mart Nam Sài Gòn - Bài ca thịt nướng cuốn hút và vô cùng hấp dẫn</h3><p>Món nướng kiểu Hàn tuy không quá xa lạ đối với thực khách Việt, nhưng không phải ở bất cứ đâu bạn cũng có thể thưởng thức “vị ngon đúng điệu” đậm chất Hàn. Và nếu bạn là một “tín đồ” sành về <a href="https://pasgo.vn/ho-chi-minh/nha-hang/nuong-25" target="_blank">ẩm thực nướng</a> thì chắc hẳn đã từng ghé qua King BBQ Buffet. Đến đây, bạn sẽ có cơ hội trải nghiệm một bữa tiệc buffet với các món ăn không chỉ thơm ngon, hấp dẫn mà còn rất tốt cho sức khỏ, đặc biệt là các món nướng ngon tuyệt hảo.</p><p><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584"><!--cho ?nh vào dây -->
 <img alt="King BBQ Lotte Mart Nam Sài Gòn 1" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-1.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-1.jpg">
        </a></p><div class="custom-box"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
            </a><div class="in" id="gioithieu-more" style="height: auto;"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
                </a><div class="box-list"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
                    </a>
<p></p><h5>Bàn tiệc nướng đủ vị khiến thực khách khó tính nhất cũng phải xiêu lòng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 2" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-2.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-2.jpg"></p><h5>Từng món ăn đều được chăm chút và chuẩn bị rất kĩ lưỡng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 3" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-3.jpg"><br></p><h5>Không chỉ có thịt nướng đơn thuần, King BBQ Buffet còn biến tấu thành rất nhiều những hương vị khác nhau cho thực khách dễ dàng lựa chọn</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 4" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-4.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-4.jpg"></p><h5>Mỗi món ăn đều chứa đựng bao tâm huyết và đam mê của người đầu bếp</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 5" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-5.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-5.jpg"></p><h5>Không chỉ ngon miệng mà còn được bài trí rất đẹp mắt đó nha</h5><p>Ở King BBQ Buffet Lotte Mart Nam Sài Gòn, bạn chắc hẳn sẽ bị chinh phục ngay bởi cách bày trí món ăn vô cùng cuốn hút. Trong đó, điểm nhấn vẫn là thịt nướng bao gồm thịt bò, thịt heo, thịt gà, có thể kế đến như: Cổ bò Mỹ sốt King BBQ, Ba chỉ bò Mỹ sốt King BBQ, Ba chỉ bò Mỹ sốt GuangYang, Bắp bò Úc sốt ớt chuông đỏ, Ba chỉ heo sốt cay Hàn Quốc, Ba chỉ heo ướp muối, Sườn heo bản lớn, Nạc vai heo sốt tỏi, Đùi gà rút xương sốt King BBQ,... tất cả đều được thái lát mỏng đẹp mắt, rải đều sốt đậm đà, thơm lừng. Ngoài ra, hải sản tươi ngon như: Bạch tuộc nướng, Mực trứng sốt cay,… cũng sẽ khiến bạn ngây ngất bởi dư vị mặn mòi, rất khác biệt.</p><p>Đặc biệt, bạn cũng có thể thưởng thức các món lẩu thơm ngọt để tăng thêm dư vị cho bữa tiệc ở King BBQ Buffet nha. Nước dùng được ninh hoàn toàn từ xương ống, nói không với mì chính, King BBQ Buffet luôn đặt sức khỏe của thực khách lên hàng đầu.</p><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 7" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-7.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-7.jpg"></p><h5>Với 10 vị sốt tẩm ướp khác nhau, thực khách có thể dễ dàng chọn được hương vị mà mình yêu thích</h5><p></p><img alt="King BBQ Lotte Mart Nam Sài Gòn 8" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-8.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-8.jpg"><h5>Nước sốt chấm được pha chế độc quyền bởi bếp trưởng Park Sung Min, bạn sẽ không thể tìm thấy ở bất kì n<a href="https://pasgo.vn/ho-chi-minh/nha-hang" target="_blank">hà hàng</a> nào</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 9" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-9.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-9.jpg"></p><h5>Nguyên liệu tươi ngon được nhập từ các nhà cung cấp uy tín làm nên chất lượng món ăn tuyệt hảo</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 10" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-10.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-10.jpg"></p><h5>Bên cạnh sốt tẩm ướp thì King BBQ Buffet Lotte Mart Nam Sài Gòn còn có cả sốt chấm cực kì ngon đó nha!</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 11" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-11.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-11.jpg"></p><h5>Không chỉ có các loại thịt, hải sản cũng là món được rất nhiều người yêu thích</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 12" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-12.jpg"></p><h5>Nào mực, nào cá với dư vị biển khơi mặn mòi đầy mời gọi</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 13" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-13.jpg"></p><h5>Bạn đừng quên thưởng thức các hương vị lẩu ấm nóng ở King BBQ Buffet Lotte Mart Nam Sài Gòn nha</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 14" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-14.jpg"></p><p>Với không gian ấm cúng và thân thiện, quầy buffet rộng với nhiều đồ ăn phong phú thay đổi theo từng ngày, King BBQ Buffet Lotte Mart Nam Sài Gòn sẽ là lựa chọn không thể thiếu cho các bữa tiệc gia đình hay tụ tập bạn bè, đồng nghiệp ngày cuối tuần. Hệ thống bếp nướng không khói thuận tiện, vừa giúp giữ nguyên hương vị món ăn, vừa mang lại một không gian thoải mái, thực khách thỏa sức thưởng thức các món nướng mà không lo bị ám mùi khó chịu.</p><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 15" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-15.jpg"></p><h5>Không gian King BBQ Buffet không quá rộng nhưng sắp xếp hợp lý nên rất thoáng đãng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 16" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-16.jpg"></p><h5>Dù là bữa tiệc đông người hay một nhóm nhỏ thì King BBQ Buffet Lotte Mart Nam Sài Gòn vẫn rất phù hợp</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 17" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-17.jpg"></p><h5>Bạn có thể thoải mái lựa chọn chỗ ngồi thích hợp khi đến đây</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 18" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-18.jpg"></p><h5>Quầy line được sắp xếp rất hợp lý, thông minh để phục vụ thực khách được tốt nhất</h5><p></p><img alt="King BBQ Lotte Mart Nam Sài Gòn 19" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-19.jpg"><h5>Điểm cộng của nhà hàng đó chính là thái độ phụ vụ rất chuyên nghiệp của nhân viên</h5><p>Hãy đến ngay với King BBQ Buffet Lotte Mart Nam Sài Gòn thưởng thức bữa tiệc buffet đặc sắc trong không gian ấm cúng và vô cùng gần gũi nha. Đừng quên đặt bàn qua PasGo – Mạng lưới nhà hàng ngon để nhận thêm nhiều ưu đãi bất ngờ!</p><h4>Địa chỉ Nhà hàng:</h4><h4>Nhà hàng King BBQ Buffet Lotte Mart Nam Sài Gòn: Tầng 3F – Lotte Mart Nam Sài Gòn, số 469 Nguyễn Hữu Thọ, Phường Tân Hưng, Quận 7, TP.HCM</h4>
                </div>
            </div>
            <a class="btn-xemthem" role="button" data-toggle="collapse" href="#gioithieu-more" aria-expanded="false" aria-controls="gioithieu-more" style="display: none;">
                Xem thêm
            </a>
        </div>
    <div class="col-xs-12 col-md-12">
        <div class="col-md-3">
            <div class="social-like">
                <div class="fb-like fb_iframe_widget" data-href="https://pasgo.vn/nha-hang/king-bbq-lotte-mart-nam-sai-gon-2478" data-layout="button_count" data-action="like" data-share="true" fb-xfbml-state="rendered" fb-iframe-plugin-query="action=like&amp;app_id=584525768323186&amp;container_width=217&amp;href=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true"><span style="vertical-align: bottom; width: 150px; height: 28px;"><iframe name="f3ef37f6bb72ce4" width="1000px" height="1000px" data-testid="fb:like Facebook Social Plugin" title="fb:like Facebook Social Plugin" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" allow="encrypted-media" src="https://www.facebook.com/v5.0/plugins/like.php?action=like&amp;app_id=584525768323186&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fx%2Fconnect%2Fxd_arbiter%2F%3Fversion%3D46%23cb%3Df1d25b142847adc%26domain%3Dpasgo.vn%26origin%3Dhttps%253A%252F%252Fpasgo.vn%252Ff160d5dc831f6ac%26relation%3Dparent.parent&amp;container_width=217&amp;href=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true" style="border: none; visibility: visible; width: 150px; height: 28px;" class=""></iframe></span></div>
            </div>
        </div>
        <div class="col-md-2">
            <div id="___plusone_0" style="position: absolute; width: 450px; left: -10000px;"><iframe ng-non-bindable="" frameborder="0" hspace="0" marginheight="0" marginwidth="0" scrolling="no" style="position:absolute;top:-10000px;width:450px;margin:0px;border-style:none" tabindex="0" vspace="0" width="100%" id="I0_1620214350994" name="I0_1620214350994" src="https://apis.google.com/u/0/se/0/_/+1/fastbutton?usegapi=1&amp;origin=https%3A%2F%2Fpasgo.vn&amp;url=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;gsrc=3p&amp;ic=1&amp;jsh=m%3B%2F_%2Fscs%2Fapps-static%2F_%2Fjs%2Fk%3Doz.gapi.vi.Np5UIK_lCuw.O%2Fm%3D__features__%2Fam%3DAQE%2Frt%3Dj%2Fd%3D1%2Frs%3DAGLTcCMfAte-OUXlAWpDj4LziXXJDdgBFA#_methods=onPlusOne%2C_ready%2C_close%2C_open%2C_resizeMe%2C_renderstart%2Concircled%2Cdrefresh%2Cerefresh%2Conload&amp;id=I0_1620214350994&amp;_gfid=I0_1620214350994&amp;parent=https%3A%2F%2Fpasgo.vn&amp;pfname=&amp;rpctoken=28530923"></iframe></div><div class="g-plusone" data-href="https://pasgo.vn/nha-hang/king-bbq-lotte-mart-nam-sai-gon-2478" data-gapiscan="true" data-onload="true" data-gapistub="true"></div>
        </div>
        <div class="col-md-7">
            Nếu bạn thấy bài viết này hữu ích, hãy chia sẻ và bình luận ngay nhé!
        </div>
    </div>
</div>', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'07:00:00' AS Time), CAST(N'23:00:00' AS Time), N'image/brand/14.jpg', 14, N'84 Nguyễn Huệ, Huế', 16.4598068, 107.5926476, N'00000000015', NULL, 1)
INSERT [dbo].[brand] ([brand_id], [brand_name], [info], [date_created], [open_time], [close_time], [avatar], [service_type_id], [address], [position_lat], [position_lng], [phone], [tel], [status]) VALUES (16, N'Lindy', N'<div class="content">
    <h2 class="text-header"><span>Giới thiệu King BBQ Buffet – Lotte Mart Nam Sài Gòn </span></h2>
    <link href="https://pastaxi-manager.onepas.vn/content/style-special.css" rel="stylesheet" type="text/css"><div class="row-app"><div class="col-xs-app-7"><div class="txt-title">Phù hợp:</div><div class="text-description">Đặt tiệc, tụ họp, gặp mặt, liên hoan, họp nhóm, gia đình…</div><div class="txt-title">Món đặc sắc:</div><div class="text-description">Dẻ Sườn bò mỹ, Cổ bò mỹ sốt King BBQ, Bắp bò sốt muối ớt, Nầm heo nướng chao đỏ, Sườn heo, Ba chỉ bò Mỹ sốt King BBQ, Bạch tuộc sốt cay, Bò xào Bulgogi nồi đất, Cơm trộn Hàn Quốc, …
</div><div class="txt-title">Không gian:</div><div class="text-description"><p>- Hàn Quốc. Hiện đại </p><p>- Sức chứa: 150 Khách</p></div><div class="txt-title">Để ô tô:</div><div class="text-description">Có (Phí phụ thuộc đơn vị trông giữ xe)</div><div class="txt-title">Điểm đặc trưng:</div><div class="text-description"><p>- <span style="color:#1b1b1b;font-size:15px;">King BBQ thuộc sở hữu của Tập đoàn RedSun ITI – Một trong những tập đoàn ẩm thực lớn mạnh bậc nhất Việt Nam, sở hữu nhiều thương hiệu ẩm thực nổi tiếng khác như: ThaiExpress, Hotpot Story, Seoul Garden, Sushi Kei, Buk Buk, Capricciosa, Khao Lao, Tasaki BBQ, Meiwei, Truly Việt, Dolpan Sam</span>
</p><p>- Công thức độc quyền của “nước sốt King” – được chính Bếp trưởng Park Sung Min, một trong những đầu bếp nổi tiếng nhất Hàn Quốc, với kinh nghiệm hơn 40 năm trong ngành ẩm thực, trực tiếp nghiên cứu và chế biến. 
</p></div></div><div class="col-xs-app-5"><div class="txt-title">Thông tin thêm</div><ul><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Ghế trẻ em</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Wifi</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Điều hòa</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Visa / Master card</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Hóa đơn VAT</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-true.png"><div class="text-right">Chỗ hút thuốc</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Phòng riêng</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Bàn ngoài trời</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Chỗ chơi trẻ em</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">HĐ trực tiếp</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Đặt ship PasGo</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Karaoke</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Máy chiếu</div></li><li><img alt="pasgo" class="img-app" src="https://pastaxi-manager.onepas.vn/content/images/icon-false.png"><div class="text-right">Trang trí sự kiện</div></li></ul></div></div>
    <h3>King BBQ Buffet Lotte Mart Nam Sài Gòn - Bài ca thịt nướng cuốn hút và vô cùng hấp dẫn</h3><p>Món nướng kiểu Hàn tuy không quá xa lạ đối với thực khách Việt, nhưng không phải ở bất cứ đâu bạn cũng có thể thưởng thức “vị ngon đúng điệu” đậm chất Hàn. Và nếu bạn là một “tín đồ” sành về <a href="https://pasgo.vn/ho-chi-minh/nha-hang/nuong-25" target="_blank">ẩm thực nướng</a> thì chắc hẳn đã từng ghé qua King BBQ Buffet. Đến đây, bạn sẽ có cơ hội trải nghiệm một bữa tiệc buffet với các món ăn không chỉ thơm ngon, hấp dẫn mà còn rất tốt cho sức khỏ, đặc biệt là các món nướng ngon tuyệt hảo.</p><p><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584"><!--cho ?nh vào dây -->
 <img alt="King BBQ Lotte Mart Nam Sài Gòn 1" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-1.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-1.jpg">
        </a></p><div class="custom-box"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
            </a><div class="in" id="gioithieu-more" style="height: auto;"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
                </a><div class="box-list"><a href="https://pasgo.vn/blog/ho-chi-minh/dia-diem-an-uong/top-20-nha-hang-buffet-ngon-noi-tieng-nhat-o-tphcm-584">
                    </a>
<p></p><h5>Bàn tiệc nướng đủ vị khiến thực khách khó tính nhất cũng phải xiêu lòng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 2" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-2.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-2.jpg"></p><h5>Từng món ăn đều được chăm chút và chuẩn bị rất kĩ lưỡng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 3" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-3.jpg"><br></p><h5>Không chỉ có thịt nướng đơn thuần, King BBQ Buffet còn biến tấu thành rất nhiều những hương vị khác nhau cho thực khách dễ dàng lựa chọn</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 4" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-4.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-4.jpg"></p><h5>Mỗi món ăn đều chứa đựng bao tâm huyết và đam mê của người đầu bếp</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 5" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-5.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-5.jpg"></p><h5>Không chỉ ngon miệng mà còn được bài trí rất đẹp mắt đó nha</h5><p>Ở King BBQ Buffet Lotte Mart Nam Sài Gòn, bạn chắc hẳn sẽ bị chinh phục ngay bởi cách bày trí món ăn vô cùng cuốn hút. Trong đó, điểm nhấn vẫn là thịt nướng bao gồm thịt bò, thịt heo, thịt gà, có thể kế đến như: Cổ bò Mỹ sốt King BBQ, Ba chỉ bò Mỹ sốt King BBQ, Ba chỉ bò Mỹ sốt GuangYang, Bắp bò Úc sốt ớt chuông đỏ, Ba chỉ heo sốt cay Hàn Quốc, Ba chỉ heo ướp muối, Sườn heo bản lớn, Nạc vai heo sốt tỏi, Đùi gà rút xương sốt King BBQ,... tất cả đều được thái lát mỏng đẹp mắt, rải đều sốt đậm đà, thơm lừng. Ngoài ra, hải sản tươi ngon như: Bạch tuộc nướng, Mực trứng sốt cay,… cũng sẽ khiến bạn ngây ngất bởi dư vị mặn mòi, rất khác biệt.</p><p>Đặc biệt, bạn cũng có thể thưởng thức các món lẩu thơm ngọt để tăng thêm dư vị cho bữa tiệc ở King BBQ Buffet nha. Nước dùng được ninh hoàn toàn từ xương ống, nói không với mì chính, King BBQ Buffet luôn đặt sức khỏe của thực khách lên hàng đầu.</p><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 7" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-7.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-7.jpg"></p><h5>Với 10 vị sốt tẩm ướp khác nhau, thực khách có thể dễ dàng chọn được hương vị mà mình yêu thích</h5><p></p><img alt="King BBQ Lotte Mart Nam Sài Gòn 8" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-8.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-8.jpg"><h5>Nước sốt chấm được pha chế độc quyền bởi bếp trưởng Park Sung Min, bạn sẽ không thể tìm thấy ở bất kì n<a href="https://pasgo.vn/ho-chi-minh/nha-hang" target="_blank">hà hàng</a> nào</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 9" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-9.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-9.jpg"></p><h5>Nguyên liệu tươi ngon được nhập từ các nhà cung cấp uy tín làm nên chất lượng món ăn tuyệt hảo</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 10" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-10.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-10.jpg"></p><h5>Bên cạnh sốt tẩm ướp thì King BBQ Buffet Lotte Mart Nam Sài Gòn còn có cả sốt chấm cực kì ngon đó nha!</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 11" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-11.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-11.jpg"></p><h5>Không chỉ có các loại thịt, hải sản cũng là món được rất nhiều người yêu thích</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 12" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-12.jpg"></p><h5>Nào mực, nào cá với dư vị biển khơi mặn mòi đầy mời gọi</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 13" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-13.jpg"></p><h5>Bạn đừng quên thưởng thức các hương vị lẩu ấm nóng ở King BBQ Buffet Lotte Mart Nam Sài Gòn nha</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 14" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-14.jpg"></p><p>Với không gian ấm cúng và thân thiện, quầy buffet rộng với nhiều đồ ăn phong phú thay đổi theo từng ngày, King BBQ Buffet Lotte Mart Nam Sài Gòn sẽ là lựa chọn không thể thiếu cho các bữa tiệc gia đình hay tụ tập bạn bè, đồng nghiệp ngày cuối tuần. Hệ thống bếp nướng không khói thuận tiện, vừa giúp giữ nguyên hương vị món ăn, vừa mang lại một không gian thoải mái, thực khách thỏa sức thưởng thức các món nướng mà không lo bị ám mùi khó chịu.</p><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 15" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-15.jpg"></p><h5>Không gian King BBQ Buffet không quá rộng nhưng sắp xếp hợp lý nên rất thoáng đãng</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 16" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-16.jpg"></p><h5>Dù là bữa tiệc đông người hay một nhóm nhỏ thì King BBQ Buffet Lotte Mart Nam Sài Gòn vẫn rất phù hợp</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 17" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-17.jpg"></p><h5>Bạn có thể thoải mái lựa chọn chỗ ngồi thích hợp khi đến đây</h5><p><img alt="King BBQ Lotte Mart Nam Sài Gòn 18" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-18.jpg"></p><h5>Quầy line được sắp xếp rất hợp lý, thông minh để phục vụ thực khách được tốt nhất</h5><p></p><img alt="King BBQ Lotte Mart Nam Sài Gòn 19" class="lazyload" src="../Assets/Images/holder/img-holder-534x330.png" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/huyen/kingbbqlotte/king-bbq-lotte-mart-nam-sai-gon-19.jpg"><h5>Điểm cộng của nhà hàng đó chính là thái độ phụ vụ rất chuyên nghiệp của nhân viên</h5><p>Hãy đến ngay với King BBQ Buffet Lotte Mart Nam Sài Gòn thưởng thức bữa tiệc buffet đặc sắc trong không gian ấm cúng và vô cùng gần gũi nha. Đừng quên đặt bàn qua PasGo – Mạng lưới nhà hàng ngon để nhận thêm nhiều ưu đãi bất ngờ!</p><h4>Địa chỉ Nhà hàng:</h4><h4>Nhà hàng King BBQ Buffet Lotte Mart Nam Sài Gòn: Tầng 3F – Lotte Mart Nam Sài Gòn, số 469 Nguyễn Hữu Thọ, Phường Tân Hưng, Quận 7, TP.HCM</h4>
                </div>
            </div>
            <a class="btn-xemthem" role="button" data-toggle="collapse" href="#gioithieu-more" aria-expanded="false" aria-controls="gioithieu-more" style="display: none;">
                Xem thêm
            </a>
        </div>
    <div class="col-xs-12 col-md-12">
        <div class="col-md-3">
            <div class="social-like">
                <div class="fb-like fb_iframe_widget" data-href="https://pasgo.vn/nha-hang/king-bbq-lotte-mart-nam-sai-gon-2478" data-layout="button_count" data-action="like" data-share="true" fb-xfbml-state="rendered" fb-iframe-plugin-query="action=like&amp;app_id=584525768323186&amp;container_width=217&amp;href=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true"><span style="vertical-align: bottom; width: 150px; height: 28px;"><iframe name="f3ef37f6bb72ce4" width="1000px" height="1000px" data-testid="fb:like Facebook Social Plugin" title="fb:like Facebook Social Plugin" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" allow="encrypted-media" src="https://www.facebook.com/v5.0/plugins/like.php?action=like&amp;app_id=584525768323186&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fx%2Fconnect%2Fxd_arbiter%2F%3Fversion%3D46%23cb%3Df1d25b142847adc%26domain%3Dpasgo.vn%26origin%3Dhttps%253A%252F%252Fpasgo.vn%252Ff160d5dc831f6ac%26relation%3Dparent.parent&amp;container_width=217&amp;href=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true" style="border: none; visibility: visible; width: 150px; height: 28px;" class=""></iframe></span></div>
            </div>
        </div>
        <div class="col-md-2">
            <div id="___plusone_0" style="position: absolute; width: 450px; left: -10000px;"><iframe ng-non-bindable="" frameborder="0" hspace="0" marginheight="0" marginwidth="0" scrolling="no" style="position:absolute;top:-10000px;width:450px;margin:0px;border-style:none" tabindex="0" vspace="0" width="100%" id="I0_1620214350994" name="I0_1620214350994" src="https://apis.google.com/u/0/se/0/_/+1/fastbutton?usegapi=1&amp;origin=https%3A%2F%2Fpasgo.vn&amp;url=https%3A%2F%2Fpasgo.vn%2Fnha-hang%2Fking-bbq-lotte-mart-nam-sai-gon-2478&amp;gsrc=3p&amp;ic=1&amp;jsh=m%3B%2F_%2Fscs%2Fapps-static%2F_%2Fjs%2Fk%3Doz.gapi.vi.Np5UIK_lCuw.O%2Fm%3D__features__%2Fam%3DAQE%2Frt%3Dj%2Fd%3D1%2Frs%3DAGLTcCMfAte-OUXlAWpDj4LziXXJDdgBFA#_methods=onPlusOne%2C_ready%2C_close%2C_open%2C_resizeMe%2C_renderstart%2Concircled%2Cdrefresh%2Cerefresh%2Conload&amp;id=I0_1620214350994&amp;_gfid=I0_1620214350994&amp;parent=https%3A%2F%2Fpasgo.vn&amp;pfname=&amp;rpctoken=28530923"></iframe></div><div class="g-plusone" data-href="https://pasgo.vn/nha-hang/king-bbq-lotte-mart-nam-sai-gon-2478" data-gapiscan="true" data-onload="true" data-gapistub="true"></div>
        </div>
        <div class="col-md-7">
            Nếu bạn thấy bài viết này hữu ích, hãy chia sẻ và bình luận ngay nhé!
        </div>
    </div>
</div>', CAST(N'2020-12-01T00:00:00.000' AS DateTime), CAST(N'07:00:00' AS Time), CAST(N'23:00:00' AS Time), N'image/brand/15.jpg', 15, N'85 Nguyễn Huệ, Huế', 16.4598068, 107.5926476, N'00000000016', NULL, 1)
INSERT [dbo].[brand] ([brand_id], [brand_name], [info], [date_created], [open_time], [close_time], [avatar], [service_type_id], [address], [position_lat], [position_lng], [phone], [tel], [status]) VALUES (17, N'Jollibee', N'<p>Giới Thiệu Về Jollibee</p>

<p>Jollibee l&agrave; tập đo&agrave;n kinh doanh thức ăn nhanh lớn nhất tại khu vực Ch&acirc;u &Aacute;, sở hữu với 12 thương hiệu v&agrave; gần 3000 cửa h&agrave;ng khắp to&agrave;n cầu, ri&ecirc;ng cửa h&agrave;ng Jollibee th&igrave; đ&atilde; hơn 900 cửa h&agrave;ng. Jollibee được mở lần đầu ti&ecirc;n tại Việt Nam v&agrave;o năm 2005, cho đến nay đ&atilde; c&oacute; hơn 100 cửa h&agrave;ng trải rộng tr&ecirc;n to&agrave;n quốc. Khi trở th&agrave;nh đối t&aacute;c nhượng quyền, Jollibee sẽ cung cấp tất cả c&aacute;c phần mềm, m&aacute;y m&oacute;c thiết bị, dụng cụ để hỗ trợ.</p>

<p><a href="http://bachbao.com/wp-content/uploads/2019/12/56486002_1090697844456594_6579678384174299241_n.jpg"><img alt="" src="http://bachbao.com/wp-content/uploads/2019/12/56486002_1090697844456594_6579678384174299241_n.jpg" style="height:1000px; width:1500px" /></a></p>

<p>H&igrave;nh 1. Đ&acirc;y l&agrave; một bức ảnh chắc lu&ocirc;n</p>

<p><img alt="" src="https://aeonmall-binhduongcanary.com.vn/wp-content/uploads/2020/08/jollibee-1.jpg" style="height:646px; width:970px" /></p>

<p>H&igrave;nh 2. H&igrave;nh như đ&acirc;y cũng l&agrave; một bức ảnh</p>
', CAST(N'2021-05-23T01:59:36.060' AS DateTime), CAST(N'07:00:00' AS Time), CAST(N'23:00:00' AS Time), N'uploads/images/e94ca92d-5c9e-45eb-a421-bfe5dcf4bad4.jpg', 1, N'56 Hùng Vương, Huế', 16.4667, 106.7, N'0389829525', N'0325689626', 1)
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
SET IDENTITY_INSERT [dbo].[brand_comment] ON 

INSERT [dbo].[brand_comment] ([brand_comment_id], [comment_id], [booking_id], [brand_id], [status], [point]) VALUES (1, 14, NULL, 1, 0, 9)
INSERT [dbo].[brand_comment] ([brand_comment_id], [comment_id], [booking_id], [brand_id], [status], [point]) VALUES (2, 15, NULL, 1, 0, 10)
INSERT [dbo].[brand_comment] ([brand_comment_id], [comment_id], [booking_id], [brand_id], [status], [point]) VALUES (3, 16, NULL, 1, 1, 8)
SET IDENTITY_INSERT [dbo].[brand_comment] OFF
GO
SET IDENTITY_INSERT [dbo].[brand_image] ON 

INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (1, N'image/brand/6.jpg', 1)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (2, N'image/brand/2.jpg', 3)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (3, N'image/brand/3.jpg', 4)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (4, N'image/brand/4.jpg', 5)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (5, N'image/brand/5.jpg', 6)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (6, N'image/brand/6.jpg', 7)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (7, N'image/brand/7.jpg', 8)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (8, N'image/brand/8.jpg', 9)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (9, N'image/brand/9.jpg', 10)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (10, N'image/brand/10.jpg', 11)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (11, N'image/brand/11.jpg', 12)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (12, N'image/brand/13.jpg', 13)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (13, N'image/brand/13.jpg', 14)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (14, N'image/brand/14.jpg', 15)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (15, N'image/brand/15.jpg', 16)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (16, N'image/brand/16.jpg', 1)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (17, N'image/brand/12.jpg', 3)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (18, N'image/brand/8.jpg', 4)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (19, N'image/brand/1.jpg', 5)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (20, N'image/brand/9.jpg', 6)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (21, N'image/brand/8.jpg', 7)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (22, N'image/brand/1.jpg', 8)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (23, N'image/brand/3.jpg', 9)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (24, N'image/brand/1.jpg', 10)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (25, N'image/brand/8.jpg', 11)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (26, N'image/brand/9.jpg', 12)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (27, N'image/brand/1.jpg', 13)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (28, N'image/brand/8.jpg', 14)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (29, N'image/brand/3.jpg', 15)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (30, N'image/brand/8.jpg', 16)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (31, N'image/brand/12.jpg', 1)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (32, N'image/brand/1.jpg', 3)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (33, N'image/brand/1.jpg', 4)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (34, N'image/brand/9.jpg', 5)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (35, N'image/brand/8.jpg', 6)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (36, N'image/brand/12.jpg', 7)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (37, N'image/brand/9.jpg', 8)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (38, N'image/brand/8.jpg', 9)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (39, N'image/brand/1.jpg', 10)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (40, N'image/brand/9.jpg', 11)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (41, N'image/brand/1.jpg', 12)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (42, N'image/brand/8.jpg', 13)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (43, N'image/brand/12.jpg', 14)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (44, N'image/brand/8.jpg', 15)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (45, N'image/brand/1.jpg', 16)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (46, N'image/brand/3.jpg', 1)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (47, N'image/brand/9.jpg', 3)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (48, N'image/brand/8.jpg', 4)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (49, N'image/brand/3.jpg', 5)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (50, N'image/brand/1.jpg', 6)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (51, N'image/brand/3.jpg', 7)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (52, N'image/brand/3.jpg', 8)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (53, N'image/brand/1.jpg', 9)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (54, N'image/brand/9.jpg', 10)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (55, N'image/brand/8.jpg', 11)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (56, N'image/brand/12.jpg', 12)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (57, N'image/brand/8.jpg', 13)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (58, N'image/brand/9.jpg', 14)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (59, N'image/brand/8.jpg', 15)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (60, N'image/brand/9.jpg', 16)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (61, N'image/brand/10.jpg', 1)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (62, N'image/brand/1.jpg', 3)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (63, N'image/brand/3.jpg', 4)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (64, N'image/brand/1.jpg', 5)
INSERT [dbo].[brand_image] ([image_id], [image_url], [brand_id]) VALUES (65, N'uploads/images/e94ca92d-5c9e-45eb-a421-bfe5dcf4bad4.jpg', 17)
SET IDENTITY_INSERT [dbo].[brand_image] OFF
GO
SET IDENTITY_INSERT [dbo].[brand_interaction] ON 

INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (1, 1, 1, 1, CAST(N'2021-05-20T17:47:21.053' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (2, 1, 3, 0, CAST(N'2021-05-18T16:17:18.130' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (3, 1, 4, 1, CAST(N'2021-05-14T16:21:06.870' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (4, 1, 5, 0, CAST(N'2021-05-17T11:48:41.877' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (5, 1, 6, 1, CAST(N'2021-05-09T21:41:46.907' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (6, 1, 7, 0, CAST(N'2021-05-17T17:04:09.570' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (7, 1, 8, 0, CAST(N'2021-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (8, 1, 9, 0, CAST(N'2021-05-18T04:06:17.567' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (9, 1, 10, 0, CAST(N'2021-05-20T18:02:12.727' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (10, 1, 11, 0, CAST(N'2021-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (11, 1, 12, 1, CAST(N'2021-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (12, 1, 13, 0, CAST(N'2021-05-21T18:20:44.447' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (13, 1, 14, 1, CAST(N'2021-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (14, 1, 15, 1, CAST(N'2021-05-18T16:16:44.583' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (15, 1, 16, 1, CAST(N'2021-04-29T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (16, 2, 1, 0, CAST(N'2021-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (17, 2, 3, 1, CAST(N'2021-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (18, 2, 4, 0, CAST(N'2021-04-29T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (19, 2, 5, 0, CAST(N'2021-04-28T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (20, 2, 6, 0, CAST(N'2021-05-21T00:55:10.047' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (21, 2, 7, 1, CAST(N'2021-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (22, 2, 8, 0, CAST(N'2021-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (23, 2, 9, 1, CAST(N'2021-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (24, 2, 10, 0, CAST(N'2021-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (25, 2, 11, 1, CAST(N'2021-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (26, 2, 12, 1, CAST(N'2021-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (27, 2, 13, 1, CAST(N'2021-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (28, 2, 14, 0, CAST(N'2021-04-28T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (29, 2, 15, 0, CAST(N'2021-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (30, 2, 16, 1, CAST(N'2021-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (31, 3, 1, 1, CAST(N'2021-05-24T18:54:02.727' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (32, 3, 3, 0, CAST(N'2021-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (33, 3, 4, 1, CAST(N'2021-04-28T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (34, 3, 5, 1, CAST(N'2021-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (35, 3, 6, 1, CAST(N'2021-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (36, 3, 7, 0, CAST(N'2021-04-28T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (37, 3, 8, 1, CAST(N'2021-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (38, 3, 9, 1, CAST(N'2021-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (39, 3, 10, 1, CAST(N'2021-04-28T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (40, 3, 11, 0, CAST(N'2021-05-21T02:44:12.090' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (41, 3, 12, 1, CAST(N'2021-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (42, 3, 13, 1, CAST(N'2021-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (43, 3, 14, 1, CAST(N'2021-04-28T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (44, 3, 15, 1, CAST(N'2021-04-29T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (45, 3, 16, 0, CAST(N'2021-04-28T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (46, 4, 1, 1, CAST(N'2021-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (47, 4, 3, 1, CAST(N'2021-04-28T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (48, 4, 4, 1, CAST(N'2021-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (49, 4, 5, 1, CAST(N'2021-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (50, 4, 6, 0, CAST(N'2021-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (51, 4, 7, 1, CAST(N'2021-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (52, 4, 8, 1, CAST(N'2021-04-29T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (53, 4, 9, 1, CAST(N'2021-04-28T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (54, 4, 10, 0, CAST(N'2021-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (55, 4, 11, 0, CAST(N'2021-04-29T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (56, 4, 12, 0, CAST(N'2021-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (57, 4, 13, 0, CAST(N'2021-04-28T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (58, 4, 14, 1, CAST(N'2021-04-28T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (59, 4, 15, 1, CAST(N'2021-04-29T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (60, 4, 16, 1, CAST(N'2021-04-28T00:00:00.000' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (73, 5, 1, NULL, CAST(N'2021-05-22T00:06:01.090' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (74, 11, 1, NULL, CAST(N'2021-05-22T08:17:59.680' AS DateTime))
INSERT [dbo].[brand_interaction] ([interaction_id], [account_id], [brand_id], [favourite], [last_view_date]) VALUES (75, 1, 17, NULL, CAST(N'2021-05-23T02:12:37.180' AS DateTime))
SET IDENTITY_INSERT [dbo].[brand_interaction] OFF
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
INSERT [dbo].[brand_service_type] ([service_type_id], [service_type_name]) VALUES (20, N'Gọi món, Buffet')
INSERT [dbo].[brand_service_type] ([service_type_id], [service_type_name]) VALUES (21, N'Chuyên món dê')
SET IDENTITY_INSERT [dbo].[brand_service_type] OFF
GO
SET IDENTITY_INSERT [dbo].[comment] ON 

INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (1, N'Ahihi đồ ngok', CAST(N'2021-05-05T16:12:16.233' AS DateTime), 1, 1)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (2, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (3, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 3)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (4, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (5, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), 1, 3)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (6, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (7, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), 3, 3)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (8, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), 4, 1)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (9, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), 4, 1)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (10, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), 3, 2)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (11, N'Ahihi đồ ngok', CAST(N'2021-05-05T15:54:14.800' AS DateTime), 11, 1)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (12, N'nâu', CAST(N'2021-05-05T15:54:53.283' AS DateTime), 12, 1)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (13, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), 5, 1)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (14, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (15, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (16, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (17, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (18, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 3)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (19, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (20, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 3)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (21, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (22, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (23, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (24, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (25, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (26, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (27, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 3)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (28, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 3)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (29, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (30, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 3)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (31, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (32, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 3)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (33, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (34, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (35, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 3)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (36, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (37, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 3)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (38, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (39, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (40, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 3)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (41, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 3)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (42, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (43, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (44, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (45, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 3)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (46, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (47, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 3)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (48, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (49, N'Dịch vụ tốt', CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (50, N'aiza', CAST(N'2021-05-05T16:20:54.307' AS DateTime), 1, 1)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (51, N'Chính xác', CAST(N'2021-05-05T16:24:47.583' AS DateTime), 20, 1)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (52, N'Ahihi đồ ngok', CAST(N'2021-05-05T16:28:22.193' AS DateTime), 20, 1)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (53, N'âu kềy', CAST(N'2021-05-05T16:29:44.970' AS DateTime), 20, 1)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (54, N'ok', CAST(N'2021-05-16T16:50:54.767' AS DateTime), 14, 1)
INSERT [dbo].[comment] ([comment_id], [comment_content], [date_created], [parents_comment_id], [account_id]) VALUES (55, N'hihi', CAST(N'2021-05-19T08:40:39.653' AS DateTime), 14, 1)
SET IDENTITY_INSERT [dbo].[comment] OFF
GO
SET IDENTITY_INSERT [dbo].[discount_code] ON 

INSERT [dbo].[discount_code] ([discount_code_id], [discount_code_name], [code], [info], [brand_id], [min_price], [percent_discount], [max_discount], [date_created], [date_begin], [date_end]) VALUES (1, N'San Fu Lo - Giảm Giá 1', N'GIAMGIA1', N'Đây là mã khuyến mãi giảm giá cho ...', 1, 100000.0000, 10, 100000.0000, CAST(N'2021-04-22T00:00:00.000' AS DateTime), CAST(N'2021-04-22T00:00:00.000' AS DateTime), CAST(N'2025-12-31T00:00:00.000' AS DateTime))
INSERT [dbo].[discount_code] ([discount_code_id], [discount_code_name], [code], [info], [brand_id], [min_price], [percent_discount], [max_discount], [date_created], [date_begin], [date_end]) VALUES (3, N'Brand - Giảm Giá 1', N'GIAMGIA1', N'Đây là mã khuyến mãi giảm giá cho ...', 3, 100000.0000, 10, 100000.0000, CAST(N'2021-04-22T00:00:00.000' AS DateTime), CAST(N'2021-04-22T00:00:00.000' AS DateTime), CAST(N'2025-12-31T00:00:00.000' AS DateTime))
INSERT [dbo].[discount_code] ([discount_code_id], [discount_code_name], [code], [info], [brand_id], [min_price], [percent_discount], [max_discount], [date_created], [date_begin], [date_end]) VALUES (4, N'San Fu Lo - Noel Code', N'NOEL2021', N'Đây là mã khuyến mãi giảm giá cho mùa noel', 1, 100000.0000, 10, 100000.0000, CAST(N'2021-04-22T00:00:00.000' AS DateTime), CAST(N'2021-12-22T00:00:00.000' AS DateTime), CAST(N'2021-12-25T00:00:00.000' AS DateTime))
INSERT [dbo].[discount_code] ([discount_code_id], [discount_code_name], [code], [info], [brand_id], [min_price], [percent_discount], [max_discount], [date_created], [date_begin], [date_end]) VALUES (5, N'San Fu Lo - Tết đến xuân về', N'TET2021', N'Đây là mã khuyến mãi trong đợt tết 2021', 1, 100000.0000, 10, 200000.0000, CAST(N'2021-04-22T00:00:00.000' AS DateTime), CAST(N'2022-02-12T00:00:00.000' AS DateTime), CAST(N'2022-02-15T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[discount_code] OFF
GO
SET IDENTITY_INSERT [dbo].[invoice] ON 

INSERT [dbo].[invoice] ([invoice_id], [booking_id], [txn_ref], [amount], [bank_code], [pay_date], [order_info], [response_code], [transaction_no]) VALUES (1, 48, N'48', 387500.0000, N'NCB', CAST(N'2021-05-18T03:15:47.797' AS DateTime), N'Thanh toan tien dat coc cho don dat ban: #48, thoi diem: Tue May 18 03:14:50 ICT 2021', N'00', N'13506134')
INSERT [dbo].[invoice] ([invoice_id], [booking_id], [txn_ref], [amount], [bank_code], [pay_date], [order_info], [response_code], [transaction_no]) VALUES (2, 50, N'50', 387500.0000, N'NCB', CAST(N'2021-05-18T04:08:56.983' AS DateTime), N'Thanh toan tien dat coc cho don dat ban: #50, thoi diem: 04:08 18/05/2021', N'00', N'13506136')
INSERT [dbo].[invoice] ([invoice_id], [booking_id], [txn_ref], [amount], [bank_code], [pay_date], [order_info], [response_code], [transaction_no]) VALUES (10002, 10051, N'10051', 260000.0000, N'NCB', CAST(N'2021-05-20T17:42:34.587' AS DateTime), N'Thanh toan tien dat coc cho don dat ban: #10051, thoi diem: 17:41 20/05/2021', N'00', N'13508339')
INSERT [dbo].[invoice] ([invoice_id], [booking_id], [txn_ref], [amount], [bank_code], [pay_date], [order_info], [response_code], [transaction_no]) VALUES (10003, 10055, N'10055', 240000.0000, N'NCB', CAST(N'2021-05-20T18:25:22.910' AS DateTime), N'Thanh toan tien dat coc cho don dat ban: #10055, thoi diem: 18:24 20/05/2021', N'00', N'13508372')
INSERT [dbo].[invoice] ([invoice_id], [booking_id], [txn_ref], [amount], [bank_code], [pay_date], [order_info], [response_code], [transaction_no]) VALUES (10004, 10058, N'10058', 2307500.0000, N'NCB', CAST(N'2021-05-22T00:07:45.943' AS DateTime), N'Thanh toan tien dat coc cho don dat ban: #10058, thoi diem: 00:07 22/05/2021', N'00', N'13509140')
INSERT [dbo].[invoice] ([invoice_id], [booking_id], [txn_ref], [amount], [bank_code], [pay_date], [order_info], [response_code], [transaction_no]) VALUES (10005, 10059, N'10059', 480000.0000, N'NCB', CAST(N'2021-05-22T07:15:09.143' AS DateTime), N'Thanh toan tien dat coc cho don dat ban: #10059, thoi diem: 07:14 22/05/2021', N'00', N'13509172')
INSERT [dbo].[invoice] ([invoice_id], [booking_id], [txn_ref], [amount], [bank_code], [pay_date], [order_info], [response_code], [transaction_no]) VALUES (10006, 10060, N'10060', 1142500.0000, N'NCB', CAST(N'2021-05-22T08:21:20.387' AS DateTime), N'Thanh toan tien dat coc cho don dat ban: #10060, thoi diem: 08:20 22/05/2021', N'00', N'13509177')
INSERT [dbo].[invoice] ([invoice_id], [booking_id], [txn_ref], [amount], [bank_code], [pay_date], [order_info], [response_code], [transaction_no]) VALUES (10007, 10061, N'10061', 800000.0000, N'NCB', CAST(N'2021-05-22T08:24:05.133' AS DateTime), N'Thanh toan tien dat coc cho don dat ban: #10061, thoi diem: 08:23 22/05/2021', N'00', N'13509178')
SET IDENTITY_INSERT [dbo].[invoice] OFF
GO
SET IDENTITY_INSERT [dbo].[payment_method] ON 

INSERT [dbo].[payment_method] ([payment_method_id], [payment_method_name], [info], [image_url]) VALUES (1, N'Thanh toán tại nhà hàng', NULL, NULL)
INSERT [dbo].[payment_method] ([payment_method_id], [payment_method_name], [info], [image_url]) VALUES (2, N'Chờ gọi điện xác nhận trước', NULL, NULL)
INSERT [dbo].[payment_method] ([payment_method_id], [payment_method_name], [info], [image_url]) VALUES (3, N'Thẻ ATM nội địa/Internet Banking', NULL, NULL)
SET IDENTITY_INSERT [dbo].[payment_method] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (1, N'Đồ uống 1+1 bằng 2...hihi', N'image/product/42.jpg', 2, 4, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'<h2>Giới thiệu</h2>

<p>Đồ uống 1 c&oacute; chắc l&agrave; ngon đ&acirc;y</p>
', 1, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (3, N'Món khai vị 3', N'image/product/3.jpg', 9, 1, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 1, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (4, N'Món chính 1', N'image/product/4.jpg', 6, 2, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 1, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (5, N'Món tráng miệng 5', N'image/product/5.jpg', 10, 3, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 1, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (6, N'Đồ uống 6', N'image/product/46.jpg', 1, 4, 5, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 3, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (7, N'Món khai vị 7', N'image/product/7.jpg', 9, 1, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 3, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (8, N'Món chính 1', N'image/product/8.jpg', 6, 2, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 3, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (9, N'Món tráng miệng 9', N'image/product/9.jpg', 10, 3, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 3, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (10, N'Đồ uống 10', N'image/product/10.jpg', 1, 4, 5, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 4, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (11, N'Món khai vị 11', N'image/product/11.jpg', 9, 1, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 4, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (12, N'Món chính 1', N'image/product/12.jpg', 6, 2, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 4, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (13, N'Món tráng miệng 13', N'image/product/13.jpg', 10, 3, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 4, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (14, N'Đồ uống 14', N'image/product/14.jpg', 1, 4, 5, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 5, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (15, N'Món khai vị 15', N'image/product/15.jpg', 9, 1, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 5, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (16, N'Món chính 1', N'image/product/16.jpg', 6, 2, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 5, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (17, N'Món tráng miệng 17', N'image/product/17.jpg', 10, 3, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 5, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (18, N'Đồ uống 18', N'image/product/18.jpg', 1, 4, 5, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 6, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (19, N'Món khai vị 19', N'image/product/19.jpg', 9, 1, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 6, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (20, N'Món chính 1', N'image/product/20.jpg', 6, 2, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 6, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (21, N'Món tráng miệng 21', N'image/product/21.jpg', 10, 3, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 6, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (22, N'Đồ uống 22', N'image/product/22.jpg', 1, 4, 5, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 7, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (23, N'Món khai vị 23', N'image/product/23.jpg', 9, 1, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 7, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (24, N'Món chính 1', N'image/product/24.jpg', 6, 2, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 7, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (25, N'Món tráng miệng 25', N'image/product/25.jpg', 10, 3, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 7, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (26, N'Đồ uống 26', N'image/product/26.jpg', 1, 4, 5, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 8, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (27, N'Món khai vị 27', N'image/product/27.jpg', 9, 1, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 8, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (28, N'Món chính 1', N'image/product/28.jpg', 6, 2, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 8, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (29, N'Món tráng miệng 29', N'image/product/29.jpg', 10, 3, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 8, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (30, N'Đồ uống 30', N'image/product/30.jpg', 1, 4, 5, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 9, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (31, N'Món khai vị 31', N'image/product/31.jpg', 9, 1, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 9, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (32, N'Món chính 1', N'image/product/32.jpg', 6, 2, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 9, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (33, N'Món tráng miệng 33', N'image/product/33.jpg', 10, 3, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 9, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (34, N'Đồ uống 34', N'image/product/34.jpg', 1, 4, 5, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 10, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (35, N'Món khai vị 35', N'image/product/35.jpg', 9, 1, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 10, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (36, N'Món chính 1', N'image/product/36.jpg', 6, 2, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 10, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (37, N'Món tráng miệng 37', N'image/product/37.jpg', 10, 3, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 10, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (38, N'Đồ uống 38', N'image/product/38.jpg', 1, 4, 5, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 11, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (39, N'Món khai vị 39', N'image/product/39.jpg', 9, 1, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 11, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (40, N'Món chính 1', N'image/product/40.jpg', 6, 2, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 11, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (41, N'Món tráng miệng 41', N'image/product/41.jpg', 10, 3, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 11, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (42, N'Đồ uống 42', N'image/product/42.jpg', 1, 4, 5, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 12, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (43, N'Món khai vị 43', N'image/product/43.jpg', 9, 1, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 12, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (44, N'Món chính 1', N'image/product/44.jpg', 6, 2, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 12, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (45, N'Món tráng miệng 45', N'image/product/45.jpg', 10, 3, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 12, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (46, N'Đồ uống 46', N'image/product/46.jpg', 1, 4, 5, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 13, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (47, N'Món khai vị 47', N'image/product/47.jpg', 9, 1, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 13, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (48, N'Món chính 1', N'image/product/48.jpg', 6, 2, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 13, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (49, N'Món tráng miệng 49', N'image/product/49.jpg', 10, 3, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 13, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (50, N'Đồ uống 50', N'image/product/50.jpg', 1, 4, 5, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 14, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (51, N'Món khai vị 51', N'image/product/51.jpg', 9, 1, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 14, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (52, N'Món chính 1', N'image/product/52.jpg', 6, 2, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 14, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (53, N'Món tráng miệng 53', N'image/product/53.jpg', 10, 3, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 14, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (54, N'Đồ uống 54', N'image/product/54.jpg', 1, 4, 5, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 15, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (55, N'Món khai vị 55', N'image/product/55.jpg', 9, 1, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 15, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (56, N'Món chính 1', N'image/product/56.jpg', 6, 2, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 15, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (57, N'Món tráng miệng 57', N'image/product/57.jpg', 10, 3, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 15, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (58, N'Đồ uống 58', N'image/product/58.jpg', 1, 4, 5, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 16, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (59, N'Món khai vị 59', N'image/product/59.jpg', 9, 1, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 16, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (60, N'Món chính 1', N'image/product/60.jpg', 6, 2, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 16, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (61, N'Món tráng miệng 61', N'image/product/61.jpg', 10, 3, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 16, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (62, N'Đồ uống 62', N'image/product/47.png', 2, 4, 5, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 1, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (63, N'Món khai vị 63', N'image/product/63.jpg', 9, 1, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 1, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (64, N'Món chính 3', N'image/product/64.jpg', 6, 2, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 1, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (65, N'Món tráng miệng 65', N'image/product/65.jpg', 10, 3, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 1, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (66, N'Đồ uống 66', N'image/product/66.jpg', 1, 4, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 3, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (67, N'Món khai vị 67', N'image/product/67.jpg', 9, 1, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 3, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (68, N'Món chính 3', N'image/product/68.jpg', 6, 2, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 3, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (69, N'Món tráng miệng 69', N'image/product/69.jpg', 10, 3, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 3, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (70, N'Đồ uống 70', N'image/product/70.jpg', 1, 4, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 4, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (71, N'Món khai vị 71', N'image/product/71.jpg', 9, 1, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 4, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (72, N'Món chính 3', N'image/product/72.jpg', 6, 2, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 4, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (73, N'Món tráng miệng 73', N'image/product/73.jpg', 10, 3, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 4, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (74, N'Đồ uống 74', N'image/product/74.jpg', 1, 4, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 5, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (75, N'Món khai vị 75', N'image/product/75.jpg', 9, 1, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 5, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (76, N'Món chính 3', N'image/product/76.jpg', 6, 2, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 5, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (77, N'Món tráng miệng 77', N'image/product/77.jpg', 10, 3, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 5, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (78, N'Đồ uống 78', N'image/product/78.jpg', 1, 4, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 6, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (79, N'Món khai vị 79', N'image/product/79.jpg', 9, 1, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 6, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (80, N'Món chính 3', N'image/product/80.jpg', 6, 2, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 6, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (81, N'Món tráng miệng 81', N'image/product/81.jpg', 10, 3, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 6, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (82, N'Đồ uống 82', N'image/product/82.jpg', 1, 4, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 7, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (83, N'Món khai vị 83', N'image/product/83.jpg', 9, 1, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 7, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (84, N'Món chính 3', N'image/product/84.jpg', 6, 2, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 7, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (85, N'Món tráng miệng 85', N'image/product/85.jpg', 10, 3, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 7, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (86, N'Đồ uống 86', N'image/product/86.jpg', 1, 4, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 8, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (87, N'Món khai vị 87', N'image/product/87.jpg', 9, 1, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 8, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (88, N'Món chính 3', N'image/product/88.jpg', 6, 2, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 8, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (89, N'Món tráng miệng 89', N'image/product/89.jpg', 10, 3, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 8, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (90, N'Đồ uống 90', N'image/product/90.jpg', 1, 4, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 9, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (91, N'Món khai vị 91', N'image/product/91.jpg', 9, 1, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 9, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (92, N'Món chính 3', N'image/product/92.jpg', 6, 2, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 9, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (93, N'Món tráng miệng 93', N'image/product/93.jpg', 10, 3, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 9, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (94, N'Đồ uống 94', N'image/product/94.jpg', 1, 4, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 10, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (95, N'Món khai vị 95', N'image/product/95.jpg', 9, 1, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 10, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (96, N'Món chính 3', N'image/product/96.jpg', 6, 2, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 10, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (97, N'Món tráng miệng 97', N'image/product/97.jpg', 10, 3, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 10, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (98, N'Đồ uống 98', N'image/product/98.jpg', 1, 4, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 11, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (99, N'Món khai vị 99', N'image/product/99.jpg', 9, 1, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 11, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (100, N'Món chính 3', N'image/product/100.jpg', 6, 2, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 11, 150000.0000, 150000.0000, 4, 1)
GO
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (101, N'Món tráng miệng 101', N'image/product/101.jpg', 10, 3, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 11, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (102, N'Đồ uống 102', N'image/product/102.jpg', 1, 4, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 12, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (103, N'Món khai vị 103', N'image/product/103.jpg', 9, 1, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 12, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (104, N'Món chính 3', N'image/product/104.jpg', 6, 2, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 12, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (105, N'Món tráng miệng 105', N'image/product/105.jpg', 10, 3, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 12, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (106, N'Đồ uống 106', N'image/product/106.jpg', 1, 4, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 13, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (107, N'Món khai vị 107', N'image/product/107.jpg', 9, 1, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 13, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (108, N'Món chính 3', N'image/product/108.jpg', 6, 2, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 13, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (109, N'Món tráng miệng 109', N'image/product/109.jpg', 10, 3, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 13, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (110, N'Đồ uống 110', N'image/product/110.jpg', 1, 4, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 14, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (111, N'Món khai vị 111', N'image/product/111.jpg', 9, 1, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 14, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (112, N'Món chính 3', N'image/product/112.jpg', 6, 2, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 14, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (113, N'Món tráng miệng 113', N'image/product/113.jpg', 10, 3, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 14, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (114, N'Đồ uống 114', N'image/product/114.jpg', 1, 4, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 15, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (115, N'Món khai vị 115', N'image/product/115.jpg', 9, 1, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 15, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (116, N'Món chính 3', N'image/product/116.jpg', 6, 2, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 15, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (117, N'Món tráng miệng 117', N'image/product/117.jpg', 10, 3, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 15, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (118, N'Đồ uống 118', N'image/product/118.jpg', 1, 4, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Đồ uống 1', 16, 199000.0000, 175000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (119, N'Món khai vị 119', N'image/product/119.jpg', 9, 1, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món khai vị 1', 16, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (120, N'Món chính 3', N'image/product/120.jpg', 6, 2, 14, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 1', 16, 150000.0000, 150000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (121, N'Món tráng miệng 121', N'image/product/121.jpg', 10, 3, 1, CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Món chính 2', 16, 135000.0000, 135000.0000, 4, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (123, N'Rượu whisky', N'uploads/images/77ca0de2-0c13-4a23-84b9-d5792cec6fcf.jpg', 3, 4, 5, CAST(N'2021-05-19T12:16:43.700' AS DateTime), N'Rượu này chắc là ngon', 1, 1000000.0000, 1000000.0000, NULL, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (124, N'Kem ly', N'uploads/images/f98b0606-ed71-4103-883d-0fb498a5d1ae.jpg', 18, 4, 2, CAST(N'2021-05-19T12:25:38.410' AS DateTime), N'Kem ly này rất ngon', 1, 25000.0000, 25000.0000, 1, 1)
INSERT [dbo].[product] ([product_id], [product_name], [avatar], [category_id], [product_type_id], [product_unit_id], [date_created], [description], [brand_id], [price], [sale_price], [number_of_people], [status]) VALUES (126, N'còn gì nữa đâu mà khóc với sầu update', N'uploads/images/8c09e8ca-41d5-405b-9e64-66cca3d5c44c.jpg', 2, 4, 6, CAST(N'2021-05-19T13:16:37.023' AS DateTime), N'<p><strong>Giới thiệu đồ uống c&ograve;n g&igrave; nữa đ&acirc;u m&agrave; kh&oacute;c với sầu</strong></p>

<p>Đ&acirc;y l&agrave; một loại đồ uống đặc biệt...chắc l&agrave; sẽ kh&ocirc;ng dở đ&acirc;u</p>

<p>C&ugrave;ng xem một v&agrave;i h&igrave;nh ảnh nh&eacute;...hihi</p>

<p><img alt="" src="http://localhost:8080/uploads/images/43.jpg" style="float:left; height:410px; width:500px" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><em>H&igrave;nh 1. Thức uống cực kỳ chất lượng n&egrave;.</em></p>

<p>Ok...vậy th&ocirc;i nh&eacute;. mua th&igrave; mua kh&ocirc;ng mua th&igrave; mua.</p>
', 1, 100000.0000, 100000.0000, 1, 1)
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
INSERT [dbo].[product_category] ([category_id], [category_code], [category_name]) VALUES (18, N'khac', N'Khác')
SET IDENTITY_INSERT [dbo].[product_category] OFF
GO
SET IDENTITY_INSERT [dbo].[product_comment] ON 

INSERT [dbo].[product_comment] ([product_comment_id], [comment_id], [booking_detail_id], [product_id], [status], [point]) VALUES (1, 10, NULL, 1, 0, 8)
INSERT [dbo].[product_comment] ([product_comment_id], [comment_id], [booking_detail_id], [product_id], [status], [point]) VALUES (4, 11, NULL, 1, 0, 9)
INSERT [dbo].[product_comment] ([product_comment_id], [comment_id], [booking_detail_id], [product_id], [status], [point]) VALUES (5, 12, NULL, 1, 0, 8)
SET IDENTITY_INSERT [dbo].[product_comment] OFF
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
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (121, N'uploads/images/77ca0de2-0c13-4a23-84b9-d5792cec6fcf.jpg', 123)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (122, N'uploads/images/f98b0606-ed71-4103-883d-0fb498a5d1ae.jpg', 124)
INSERT [dbo].[product_image] ([image_id], [image_url], [product_id]) VALUES (124, N'uploads/images/8c09e8ca-41d5-405b-9e64-66cca3d5c44c.jpg', 126)
SET IDENTITY_INSERT [dbo].[product_image] OFF
GO
SET IDENTITY_INSERT [dbo].[product_type] ON 

INSERT [dbo].[product_type] ([product_type_id], [product_type_name]) VALUES (4, N'Đồ uống')
INSERT [dbo].[product_type] ([product_type_id], [product_type_name]) VALUES (2, N'Món chính')
INSERT [dbo].[product_type] ([product_type_id], [product_type_name]) VALUES (1, N'Món khai vị')
INSERT [dbo].[product_type] ([product_type_id], [product_type_name]) VALUES (3, N'Món tráng miệng')
SET IDENTITY_INSERT [dbo].[product_type] OFF
GO
SET IDENTITY_INSERT [dbo].[product_unit] ON 

INSERT [dbo].[product_unit] ([product_unit_id], [product_unit_name]) VALUES (8, N'Cái')
INSERT [dbo].[product_unit] ([product_unit_id], [product_unit_name]) VALUES (5, N'Chai')
INSERT [dbo].[product_unit] ([product_unit_id], [product_unit_name]) VALUES (6, N'Cốc')
INSERT [dbo].[product_unit] ([product_unit_id], [product_unit_name]) VALUES (11, N'Con')
INSERT [dbo].[product_unit] ([product_unit_id], [product_unit_name]) VALUES (1, N'Đĩa')
INSERT [dbo].[product_unit] ([product_unit_id], [product_unit_name]) VALUES (12, N'Gói')
INSERT [dbo].[product_unit] ([product_unit_id], [product_unit_name]) VALUES (13, N'Hộp')
INSERT [dbo].[product_unit] ([product_unit_id], [product_unit_name]) VALUES (7, N'Keg')
INSERT [dbo].[product_unit] ([product_unit_id], [product_unit_name]) VALUES (10, N'Ký')
INSERT [dbo].[product_unit] ([product_unit_id], [product_unit_name]) VALUES (3, N'Lon')
INSERT [dbo].[product_unit] ([product_unit_id], [product_unit_name]) VALUES (2, N'Ly')
INSERT [dbo].[product_unit] ([product_unit_id], [product_unit_name]) VALUES (14, N'Món')
INSERT [dbo].[product_unit] ([product_unit_id], [product_unit_name]) VALUES (4, N'Thùng')
INSERT [dbo].[product_unit] ([product_unit_id], [product_unit_name]) VALUES (9, N'Xiên')
SET IDENTITY_INSERT [dbo].[product_unit] OFF
GO
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([role_id], [role_code], [role_name]) VALUES (1, N'USER', N'User')
INSERT [dbo].[role] ([role_id], [role_code], [role_name]) VALUES (2, N'ADMIN', N'Admin')
INSERT [dbo].[role] ([role_id], [role_code], [role_name]) VALUES (3, N'BRAND_ADMIN', N'Brand Admin')
INSERT [dbo].[role] ([role_id], [role_code], [role_name]) VALUES (4, N'AGENCY_ADMIN', N'Agency Admin')
SET IDENTITY_INSERT [dbo].[role] OFF
GO
SET IDENTITY_INSERT [dbo].[service] ON 

INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [category_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (1, N'Buffet Nướng Cay San Fu Lou', N'image/service/1.jpg', 1, 1, 100000.0000, 100000.0000, 75000.0000, 75000.0000, CAST(N'2020-12-15T00:00:00.000' AS DateTime), N'<div class="content"><p>Mở ra với mong muốn là chốn dừng chân an yên, nhẹ nhõm giữa vòng xoay cuộc sống, Quán Chấm Chấm Chấm bình dị và nhẹ nhàng mang tới những món quà từ quê hương, từ quá khứ ngon lành và trọn vẹn.</p><p><img alt="quán Chấm Chấm Chấm" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg"></p></div>', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [category_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (2, N'Buffet 2', N'image/service/2.jpg', 3, 1, 200000.0000, 175000.0000, 150000.0000, 125000.0000, CAST(N'2020-02-15T00:00:00.000' AS DateTime), N'<div class="content"><p>Mở ra với mong muốn là chốn dừng chân an yên, nhẹ nhõm giữa vòng xoay cuộc sống, Quán Chấm Chấm Chấm bình dị và nhẹ nhàng mang tới những món quà từ quê hương, từ quá khứ ngon lành và trọn vẹn.</p><p><img alt="quán Chấm Chấm Chấm" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg"></p></div>', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [category_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (3, N'Buffet 3', N'image/service/3.jpg', 4, 1, 200000.0000, 175000.0000, 150000.0000, 127000.0000, CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'<div class="content"><p>Mở ra với mong muốn là chốn dừng chân an yên, nhẹ nhõm giữa vòng xoay cuộc sống, Quán Chấm Chấm Chấm bình dị và nhẹ nhàng mang tới những món quà từ quê hương, từ quá khứ ngon lành và trọn vẹn.</p><p><img alt="quán Chấm Chấm Chấm" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg"></p></div>', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [category_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (4, N'Buffet 4', N'image/service/4.jpg', 5, 1, 200000.0000, 175000.0000, 150000.0000, 127000.0000, CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'<div class="content"><p>Mở ra với mong muốn là chốn dừng chân an yên, nhẹ nhõm giữa vòng xoay cuộc sống, Quán Chấm Chấm Chấm bình dị và nhẹ nhàng mang tới những món quà từ quê hương, từ quá khứ ngon lành và trọn vẹn.</p><p><img alt="quán Chấm Chấm Chấm" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg"></p></div>', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [category_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (5, N'Buffet 1', N'image/service/5.jpg', 4, 1, 250000.0000, 175000.0000, 185000.0000, 127000.0000, CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'<div class="content"><p>Mở ra với mong muốn là chốn dừng chân an yên, nhẹ nhõm giữa vòng xoay cuộc sống, Quán Chấm Chấm Chấm bình dị và nhẹ nhàng mang tới những món quà từ quê hương, từ quá khứ ngon lành và trọn vẹn.</p><p><img alt="quán Chấm Chấm Chấm" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg"></p></div>', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [category_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (6, N'Buffet 2', N'image/service/6.jpg', 5, 1, 250000.0000, 175000.0000, 185000.0000, 127000.0000, CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'<div class="content"><p>Mở ra với mong muốn là chốn dừng chân an yên, nhẹ nhõm giữa vòng xoay cuộc sống, Quán Chấm Chấm Chấm bình dị và nhẹ nhàng mang tới những món quà từ quê hương, từ quá khứ ngon lành và trọn vẹn.</p><p><img alt="quán Chấm Chấm Chấm" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg"></p></div>', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [category_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (7, N'Buffet 2', N'image/service/7.jpg', 1, 1, 100000.0000, 100000.0000, 75000.0000, 75000.0000, CAST(N'2020-12-15T00:00:00.000' AS DateTime), N'<div class="content"><p>Mở ra với mong muốn là chốn dừng chân an yên, nhẹ nhõm giữa vòng xoay cuộc sống, Quán Chấm Chấm Chấm bình dị và nhẹ nhàng mang tới những món quà từ quê hương, từ quá khứ ngon lành và trọn vẹn.</p><p><img alt="quán Chấm Chấm Chấm" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg"></p></div>', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [category_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (8, N'Buffet 1', N'image/service/8.jpg', 3, 1, 200000.0000, 175000.0000, 150000.0000, 125000.0000, CAST(N'2020-02-15T00:00:00.000' AS DateTime), N'<div class="content"><p>Mở ra với mong muốn là chốn dừng chân an yên, nhẹ nhõm giữa vòng xoay cuộc sống, Quán Chấm Chấm Chấm bình dị và nhẹ nhàng mang tới những món quà từ quê hương, từ quá khứ ngon lành và trọn vẹn.</p><p><img alt="quán Chấm Chấm Chấm" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg"></p></div>', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [category_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (9, N'Buffet 2', N'image/service/9.jpg', 4, 1, 200000.0000, 175000.0000, 150000.0000, 127000.0000, CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'<div class="content"><p>Mở ra với mong muốn là chốn dừng chân an yên, nhẹ nhõm giữa vòng xoay cuộc sống, Quán Chấm Chấm Chấm bình dị và nhẹ nhàng mang tới những món quà từ quê hương, từ quá khứ ngon lành và trọn vẹn.</p><p><img alt="quán Chấm Chấm Chấm" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg"></p></div>', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [category_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (10, N'Buffet 2', N'image/service/10.jpg', 5, 1, 200000.0000, 175000.0000, 150000.0000, 127000.0000, CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'<div class="content"><p>Mở ra với mong muốn là chốn dừng chân an yên, nhẹ nhõm giữa vòng xoay cuộc sống, Quán Chấm Chấm Chấm bình dị và nhẹ nhàng mang tới những món quà từ quê hương, từ quá khứ ngon lành và trọn vẹn.</p><p><img alt="quán Chấm Chấm Chấm" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg"></p></div>', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [category_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (11, N'Buffet 1', N'image/service/11.jpg', 6, 1, 250000.0000, 175000.0000, 185000.0000, 127000.0000, CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'<div class="content"><p>Mở ra với mong muốn là chốn dừng chân an yên, nhẹ nhõm giữa vòng xoay cuộc sống, Quán Chấm Chấm Chấm bình dị và nhẹ nhàng mang tới những món quà từ quê hương, từ quá khứ ngon lành và trọn vẹn.</p><p><img alt="quán Chấm Chấm Chấm" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg"></p></div>', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [category_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (12, N'Buffet 2', N'image/service/12.jpg', 6, 1, 220000.0000, 180000.0000, 150000.0000, 150000.0000, CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'<div class="content"><p>Mở ra với mong muốn là chốn dừng chân an yên, nhẹ nhõm giữa vòng xoay cuộc sống, Quán Chấm Chấm Chấm bình dị và nhẹ nhàng mang tới những món quà từ quê hương, từ quá khứ ngon lành và trọn vẹn.</p><p><img alt="quán Chấm Chấm Chấm" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg"></p></div>', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [category_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (13, N'Buffet 1', N'image/service/13.jpg', 7, 1, 100000.0000, 100000.0000, 75000.0000, 75000.0000, CAST(N'2020-12-15T00:00:00.000' AS DateTime), N'<div class="content"><p>Mở ra với mong muốn là chốn dừng chân an yên, nhẹ nhõm giữa vòng xoay cuộc sống, Quán Chấm Chấm Chấm bình dị và nhẹ nhàng mang tới những món quà từ quê hương, từ quá khứ ngon lành và trọn vẹn.</p><p><img alt="quán Chấm Chấm Chấm" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg"></p></div>', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [category_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (14, N'Buffet 2', N'image/service/14.jpg', 8, 1, 185000.0000, 175000.0000, 150000.0000, 125000.0000, CAST(N'2020-02-15T00:00:00.000' AS DateTime), N'<div class="content"><p>Mở ra với mong muốn là chốn dừng chân an yên, nhẹ nhõm giữa vòng xoay cuộc sống, Quán Chấm Chấm Chấm bình dị và nhẹ nhàng mang tới những món quà từ quê hương, từ quá khứ ngon lành và trọn vẹn.</p><p><img alt="quán Chấm Chấm Chấm" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg"></p></div>', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [category_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (15, N'Buffet 3', N'image/service/15.jpg', 9, 1, 200000.0000, 175000.0000, 150000.0000, 127000.0000, CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'<div class="content"><p>Mở ra với mong muốn là chốn dừng chân an yên, nhẹ nhõm giữa vòng xoay cuộc sống, Quán Chấm Chấm Chấm bình dị và nhẹ nhàng mang tới những món quà từ quê hương, từ quá khứ ngon lành và trọn vẹn.</p><p><img alt="quán Chấm Chấm Chấm" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg"></p></div>', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [category_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (16, N'Buffet 4', N'image/service/16.jpg', 10, 1, 200000.0000, 180000.0000, 150000.0000, 127000.0000, CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'<div class="content"><p>Mở ra với mong muốn là chốn dừng chân an yên, nhẹ nhõm giữa vòng xoay cuộc sống, Quán Chấm Chấm Chấm bình dị và nhẹ nhàng mang tới những món quà từ quê hương, từ quá khứ ngon lành và trọn vẹn.</p><p><img alt="quán Chấm Chấm Chấm" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg"></p></div>', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [category_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (17, N'Buffet 1', N'image/service/17.jpg', 11, 1, 220000.0000, 175000.0000, 185000.0000, 127000.0000, CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'<div class="content"><p>Mở ra với mong muốn là chốn dừng chân an yên, nhẹ nhõm giữa vòng xoay cuộc sống, Quán Chấm Chấm Chấm bình dị và nhẹ nhàng mang tới những món quà từ quê hương, từ quá khứ ngon lành và trọn vẹn.</p><p><img alt="quán Chấm Chấm Chấm" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg"></p></div>', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [category_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (18, N'Buffet 2', N'image/service/18.jpg', 12, 1, 250000.0000, 175000.0000, 185000.0000, 127000.0000, CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'<div class="content"><p>Mở ra với mong muốn là chốn dừng chân an yên, nhẹ nhõm giữa vòng xoay cuộc sống, Quán Chấm Chấm Chấm bình dị và nhẹ nhàng mang tới những món quà từ quê hương, từ quá khứ ngon lành và trọn vẹn.</p><p><img alt="quán Chấm Chấm Chấm" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg"></p></div>', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [category_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (19, N'Buffet 2', N'image/service/19.jpg', 13, 1, 100000.0000, 100000.0000, 75000.0000, 75000.0000, CAST(N'2020-12-15T00:00:00.000' AS DateTime), N'<div class="content"><p>Mở ra với mong muốn là chốn dừng chân an yên, nhẹ nhõm giữa vòng xoay cuộc sống, Quán Chấm Chấm Chấm bình dị và nhẹ nhàng mang tới những món quà từ quê hương, từ quá khứ ngon lành và trọn vẹn.</p><p><img alt="quán Chấm Chấm Chấm" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg"></p></div>', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [category_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (20, N'Buffet 1', N'image/service/20.jpg', 14, 1, 200000.0000, 175000.0000, 150000.0000, 125000.0000, CAST(N'2020-02-15T00:00:00.000' AS DateTime), N'<div class="content"><p>Mở ra với mong muốn là chốn dừng chân an yên, nhẹ nhõm giữa vòng xoay cuộc sống, Quán Chấm Chấm Chấm bình dị và nhẹ nhàng mang tới những món quà từ quê hương, từ quá khứ ngon lành và trọn vẹn.</p><p><img alt="quán Chấm Chấm Chấm" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg"></p></div>', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [category_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (21, N'Buffet 2', N'image/service/21.jpg', 15, 1, 200000.0000, 175000.0000, 150000.0000, 127000.0000, CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'<div class="content"><p>Mở ra với mong muốn là chốn dừng chân an yên, nhẹ nhõm giữa vòng xoay cuộc sống, Quán Chấm Chấm Chấm bình dị và nhẹ nhàng mang tới những món quà từ quê hương, từ quá khứ ngon lành và trọn vẹn.</p><p><img alt="quán Chấm Chấm Chấm" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg"></p></div>', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [category_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (22, N'Buffet 2', N'image/service/22.jpg', 16, 1, 200000.0000, 175000.0000, 150000.0000, 127000.0000, CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'<div class="content"><p>Mở ra với mong muốn là chốn dừng chân an yên, nhẹ nhõm giữa vòng xoay cuộc sống, Quán Chấm Chấm Chấm bình dị và nhẹ nhàng mang tới những món quà từ quê hương, từ quá khứ ngon lành và trọn vẹn.</p><p><img alt="quán Chấm Chấm Chấm" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg"></p></div>', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [category_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (23, N'Buffet 2', N'image/service/23.jpg', 7, 1, 250000.0000, 175000.0000, 185000.0000, 127000.0000, CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'<div class="content"><p>Mở ra với mong muốn là chốn dừng chân an yên, nhẹ nhõm giữa vòng xoay cuộc sống, Quán Chấm Chấm Chấm bình dị và nhẹ nhàng mang tới những món quà từ quê hương, từ quá khứ ngon lành và trọn vẹn.</p><p><img alt="quán Chấm Chấm Chấm" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg"></p></div>', 1)
INSERT [dbo].[service] ([service_id], [service_name], [avatar], [brand_id], [category_id], [price_for_adult], [sale_price_for_adult], [price_for_children], [sale_price_for_children], [date_created], [description], [status]) VALUES (24, N'Buffet 1', N'image/service/24.jpg', 8, 1, 220000.0000, 180000.0000, 150000.0000, 150000.0000, CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'<div class="content"><p>Mở ra với mong muốn là chốn dừng chân an yên, nhẹ nhõm giữa vòng xoay cuộc sống, Quán Chấm Chấm Chấm bình dị và nhẹ nhàng mang tới những món quà từ quê hương, từ quá khứ ngon lành và trọn vẹn.</p><p><img alt="quán Chấm Chấm Chấm" class=" lazyloaded" src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg" data-src="https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/quanbuingovannam/nha-hang-quan-bui-17A-ngo-van-nam-3.jpg"></p></div>', 1)
SET IDENTITY_INSERT [dbo].[service] OFF
GO
SET IDENTITY_INSERT [dbo].[service_category] ON 

INSERT [dbo].[service_category] ([category_id], [category_name], [category_code]) VALUES (1, N'Buffet', N'buffet')
INSERT [dbo].[service_category] ([category_id], [category_name], [category_code]) VALUES (2, N'Sinh Nhật', N'sinh-nhat')
INSERT [dbo].[service_category] ([category_id], [category_name], [category_code]) VALUES (3, N'Cưới Hỏi', N'cuoi-hoi')
SET IDENTITY_INSERT [dbo].[service_category] OFF
GO
SET IDENTITY_INSERT [dbo].[service_comment] ON 

INSERT [dbo].[service_comment] ([service_comment_id], [booking_detail_id], [service_id], [comment_id], [status], [point]) VALUES (1, NULL, 1, 1, 0, 9)
INSERT [dbo].[service_comment] ([service_comment_id], [booking_detail_id], [service_id], [comment_id], [status], [point]) VALUES (2, NULL, 1, 2, 0, 8)
INSERT [dbo].[service_comment] ([service_comment_id], [booking_detail_id], [service_id], [comment_id], [status], [point]) VALUES (3, NULL, 1, 3, 0, 7)
INSERT [dbo].[service_comment] ([service_comment_id], [booking_detail_id], [service_id], [comment_id], [status], [point]) VALUES (4, NULL, 1, 4, 0, 9)
INSERT [dbo].[service_comment] ([service_comment_id], [booking_detail_id], [service_id], [comment_id], [status], [point]) VALUES (5, NULL, 2, 5, 0, 5)
INSERT [dbo].[service_comment] ([service_comment_id], [booking_detail_id], [service_id], [comment_id], [status], [point]) VALUES (6, NULL, 2, 6, 0, 9)
INSERT [dbo].[service_comment] ([service_comment_id], [booking_detail_id], [service_id], [comment_id], [status], [point]) VALUES (7, NULL, 2, 7, 0, 9)
INSERT [dbo].[service_comment] ([service_comment_id], [booking_detail_id], [service_id], [comment_id], [status], [point]) VALUES (8, NULL, 2, 8, 0, 8)
INSERT [dbo].[service_comment] ([service_comment_id], [booking_detail_id], [service_id], [comment_id], [status], [point]) VALUES (9, NULL, 2, 9, 0, 8)
INSERT [dbo].[service_comment] ([service_comment_id], [booking_detail_id], [service_id], [comment_id], [status], [point]) VALUES (10, NULL, 2, 10, 0, 7)
INSERT [dbo].[service_comment] ([service_comment_id], [booking_detail_id], [service_id], [comment_id], [status], [point]) VALUES (11, NULL, 3, 11, 0, 8)
INSERT [dbo].[service_comment] ([service_comment_id], [booking_detail_id], [service_id], [comment_id], [status], [point]) VALUES (12, NULL, 3, 12, 0, 8)
INSERT [dbo].[service_comment] ([service_comment_id], [booking_detail_id], [service_id], [comment_id], [status], [point]) VALUES (13, NULL, 3, 13, 0, 9)
INSERT [dbo].[service_comment] ([service_comment_id], [booking_detail_id], [service_id], [comment_id], [status], [point]) VALUES (14, NULL, 3, 14, 0, 9)
INSERT [dbo].[service_comment] ([service_comment_id], [booking_detail_id], [service_id], [comment_id], [status], [point]) VALUES (15, NULL, 3, 15, 0, 9)
INSERT [dbo].[service_comment] ([service_comment_id], [booking_detail_id], [service_id], [comment_id], [status], [point]) VALUES (16, NULL, 3, 16, 0, 9)
INSERT [dbo].[service_comment] ([service_comment_id], [booking_detail_id], [service_id], [comment_id], [status], [point]) VALUES (17, NULL, 3, 17, 0, 7)
INSERT [dbo].[service_comment] ([service_comment_id], [booking_detail_id], [service_id], [comment_id], [status], [point]) VALUES (18, NULL, 3, 18, 0, 7)
INSERT [dbo].[service_comment] ([service_comment_id], [booking_detail_id], [service_id], [comment_id], [status], [point]) VALUES (19, NULL, 3, 19, 0, 8)
INSERT [dbo].[service_comment] ([service_comment_id], [booking_detail_id], [service_id], [comment_id], [status], [point]) VALUES (20, NULL, 4, 20, 0, 8)
SET IDENTITY_INSERT [dbo].[service_comment] OFF
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
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (49, N'image/service/7.jpg', 1)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (50, N'image/service/10.jpg', 1)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (51, N'image/service/7.jpg', 2)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (52, N'image/service/5.jpg', 2)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (53, N'image/service/9.jpg', 3)
INSERT [dbo].[service_image] ([image_id], [image_url], [service_id]) VALUES (54, N'image/service/11.jpg', 3)
SET IDENTITY_INSERT [dbo].[service_image] OFF
GO
SET IDENTITY_INSERT [dbo].[service_interaction] ON 

INSERT [dbo].[service_interaction] ([interaction_id], [service_id], [account_id], [favourite], [last_view_date]) VALUES (1, 1, 1, 1, CAST(N'2021-05-23T00:18:05.757' AS DateTime))
INSERT [dbo].[service_interaction] ([interaction_id], [service_id], [account_id], [favourite], [last_view_date]) VALUES (2, 2, 1, 1, CAST(N'2021-05-03T02:43:47.913' AS DateTime))
INSERT [dbo].[service_interaction] ([interaction_id], [service_id], [account_id], [favourite], [last_view_date]) VALUES (3, 3, 1, 1, CAST(N'2021-05-17T12:04:53.173' AS DateTime))
INSERT [dbo].[service_interaction] ([interaction_id], [service_id], [account_id], [favourite], [last_view_date]) VALUES (4, 4, 1, 1, CAST(N'2021-05-17T09:37:14.417' AS DateTime))
INSERT [dbo].[service_interaction] ([interaction_id], [service_id], [account_id], [favourite], [last_view_date]) VALUES (6, 5, 1, 0, CAST(N'2021-05-20T17:39:34.850' AS DateTime))
INSERT [dbo].[service_interaction] ([interaction_id], [service_id], [account_id], [favourite], [last_view_date]) VALUES (7, 6, 1, 1, CAST(N'2021-05-05T16:21:38.693' AS DateTime))
INSERT [dbo].[service_interaction] ([interaction_id], [service_id], [account_id], [favourite], [last_view_date]) VALUES (8, 7, 1, 1, CAST(N'2021-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[service_interaction] ([interaction_id], [service_id], [account_id], [favourite], [last_view_date]) VALUES (9, 8, 1, 0, CAST(N'2021-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[service_interaction] ([interaction_id], [service_id], [account_id], [favourite], [last_view_date]) VALUES (10, 9, 1, 1, CAST(N'2021-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[service_interaction] ([interaction_id], [service_id], [account_id], [favourite], [last_view_date]) VALUES (11, 18, 1, NULL, CAST(N'2021-05-05T13:55:51.410' AS DateTime))
INSERT [dbo].[service_interaction] ([interaction_id], [service_id], [account_id], [favourite], [last_view_date]) VALUES (12, 11, 1, NULL, CAST(N'2021-05-20T18:07:26.820' AS DateTime))
INSERT [dbo].[service_interaction] ([interaction_id], [service_id], [account_id], [favourite], [last_view_date]) VALUES (13, 16, 1, NULL, CAST(N'2021-05-05T13:57:19.423' AS DateTime))
INSERT [dbo].[service_interaction] ([interaction_id], [service_id], [account_id], [favourite], [last_view_date]) VALUES (14, 17, 1, NULL, CAST(N'2021-05-23T02:12:31.430' AS DateTime))
INSERT [dbo].[service_interaction] ([interaction_id], [service_id], [account_id], [favourite], [last_view_date]) VALUES (15, 13, 1, NULL, CAST(N'2021-05-17T17:07:29.287' AS DateTime))
INSERT [dbo].[service_interaction] ([interaction_id], [service_id], [account_id], [favourite], [last_view_date]) VALUES (16, 11, 2, NULL, CAST(N'2021-05-20T18:08:11.627' AS DateTime))
INSERT [dbo].[service_interaction] ([interaction_id], [service_id], [account_id], [favourite], [last_view_date]) VALUES (17, 1, 2, NULL, CAST(N'2021-05-20T18:24:03.380' AS DateTime))
INSERT [dbo].[service_interaction] ([interaction_id], [service_id], [account_id], [favourite], [last_view_date]) VALUES (18, 2, 3, NULL, CAST(N'2021-05-21T02:34:28.877' AS DateTime))
INSERT [dbo].[service_interaction] ([interaction_id], [service_id], [account_id], [favourite], [last_view_date]) VALUES (19, 23, 3, NULL, CAST(N'2021-05-21T02:39:33.580' AS DateTime))
INSERT [dbo].[service_interaction] ([interaction_id], [service_id], [account_id], [favourite], [last_view_date]) VALUES (20, 1, 3, NULL, CAST(N'2021-05-22T08:31:08.627' AS DateTime))
INSERT [dbo].[service_interaction] ([interaction_id], [service_id], [account_id], [favourite], [last_view_date]) VALUES (21, 4, 5, 1, CAST(N'2021-05-22T00:26:10.867' AS DateTime))
INSERT [dbo].[service_interaction] ([interaction_id], [service_id], [account_id], [favourite], [last_view_date]) VALUES (22, 1, 11, NULL, CAST(N'2021-05-22T08:24:21.220' AS DateTime))
INSERT [dbo].[service_interaction] ([interaction_id], [service_id], [account_id], [favourite], [last_view_date]) VALUES (23, 12, 11, NULL, CAST(N'2021-05-22T08:14:56.653' AS DateTime))
SET IDENTITY_INSERT [dbo].[service_interaction] OFF
GO
INSERT [dbo].[temp_month] ([month]) VALUES (1)
INSERT [dbo].[temp_month] ([month]) VALUES (2)
INSERT [dbo].[temp_month] ([month]) VALUES (3)
INSERT [dbo].[temp_month] ([month]) VALUES (4)
INSERT [dbo].[temp_month] ([month]) VALUES (5)
INSERT [dbo].[temp_month] ([month]) VALUES (6)
INSERT [dbo].[temp_month] ([month]) VALUES (7)
INSERT [dbo].[temp_month] ([month]) VALUES (8)
INSERT [dbo].[temp_month] ([month]) VALUES (9)
INSERT [dbo].[temp_month] ([month]) VALUES (10)
INSERT [dbo].[temp_month] ([month]) VALUES (11)
INSERT [dbo].[temp_month] ([month]) VALUES (12)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_account]    Script Date: 25/05/2021 09:56:13 SA ******/
ALTER TABLE [dbo].[account] ADD  CONSTRAINT [IX_account] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_account_1]    Script Date: 25/05/2021 09:56:13 SA ******/
ALTER TABLE [dbo].[account] ADD  CONSTRAINT [IX_account_1] UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_account_2]    Script Date: 25/05/2021 09:56:13 SA ******/
ALTER TABLE [dbo].[account] ADD  CONSTRAINT [IX_account_2] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_booking_status]    Script Date: 25/05/2021 09:56:13 SA ******/
ALTER TABLE [dbo].[booking_status] ADD  CONSTRAINT [IX_booking_status] UNIQUE NONCLUSTERED 
(
	[booking_status_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_agency_capacity]    Script Date: 25/05/2021 09:56:13 SA ******/
ALTER TABLE [dbo].[brand_capacity] ADD  CONSTRAINT [IX_agency_capacity] UNIQUE NONCLUSTERED 
(
	[brand_id] ASC,
	[floor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_payment_method]    Script Date: 25/05/2021 09:56:13 SA ******/
ALTER TABLE [dbo].[payment_method] ADD  CONSTRAINT [IX_payment_method] UNIQUE NONCLUSTERED 
(
	[payment_method_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_product_category]    Script Date: 25/05/2021 09:56:13 SA ******/
ALTER TABLE [dbo].[product_category] ADD  CONSTRAINT [IX_product_category] UNIQUE NONCLUSTERED 
(
	[category_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_product_category_1]    Script Date: 25/05/2021 09:56:13 SA ******/
ALTER TABLE [dbo].[product_category] ADD  CONSTRAINT [IX_product_category_1] UNIQUE NONCLUSTERED 
(
	[category_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_product_type]    Script Date: 25/05/2021 09:56:13 SA ******/
ALTER TABLE [dbo].[product_type] ADD  CONSTRAINT [IX_product_type] UNIQUE NONCLUSTERED 
(
	[product_type_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_product_unit]    Script Date: 25/05/2021 09:56:13 SA ******/
ALTER TABLE [dbo].[product_unit] ADD  CONSTRAINT [IX_product_unit] UNIQUE NONCLUSTERED 
(
	[product_unit_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_role]    Script Date: 25/05/2021 09:56:13 SA ******/
ALTER TABLE [dbo].[role] ADD  CONSTRAINT [IX_role] UNIQUE NONCLUSTERED 
(
	[role_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_role_1]    Script Date: 25/05/2021 09:56:13 SA ******/
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
ALTER TABLE [dbo].[booking] ADD  CONSTRAINT [DF_booking_deposit]  DEFAULT ((0)) FOR [deposit]
GO
ALTER TABLE [dbo].[booking] ADD  CONSTRAINT [DF_booking_discount]  DEFAULT ((0)) FOR [discount]
GO
ALTER TABLE [dbo].[brand] ADD  CONSTRAINT [DF_brand_date_created]  DEFAULT (getdate()) FOR [date_created]
GO
ALTER TABLE [dbo].[brand] ADD  CONSTRAINT [DF_brand_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[brand_comment] ADD  CONSTRAINT [DF_brand_comment_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[comment] ADD  CONSTRAINT [DF_comment_date_created]  DEFAULT (getdate()) FOR [date_created]
GO
ALTER TABLE [dbo].[discount_code] ADD  CONSTRAINT [DF_discount_code_date_created]  DEFAULT (getdate()) FOR [date_created]
GO
ALTER TABLE [dbo].[product] ADD  CONSTRAINT [DF_product_date_created]  DEFAULT (getdate()) FOR [date_created]
GO
ALTER TABLE [dbo].[product] ADD  CONSTRAINT [DF_product_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[product_comment] ADD  CONSTRAINT [DF_product_comment_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[service] ADD  CONSTRAINT [DF_service_date_created]  DEFAULT (getdate()) FOR [date_created]
GO
ALTER TABLE [dbo].[service_comment] ADD  CONSTRAINT [DF_service_comment_status]  DEFAULT ((0)) FOR [status]
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
ALTER TABLE [dbo].[brand_comment]  WITH CHECK ADD  CONSTRAINT [FK_brand_comment_booking] FOREIGN KEY([booking_id])
REFERENCES [dbo].[booking] ([booking_id])
GO
ALTER TABLE [dbo].[brand_comment] CHECK CONSTRAINT [FK_brand_comment_booking]
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
ALTER TABLE [dbo].[brand_image]  WITH CHECK ADD  CONSTRAINT [FK_brand_image_brand] FOREIGN KEY([brand_id])
REFERENCES [dbo].[brand] ([brand_id])
GO
ALTER TABLE [dbo].[brand_image] CHECK CONSTRAINT [FK_brand_image_brand]
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
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK_comment_comment] FOREIGN KEY([parents_comment_id])
REFERENCES [dbo].[comment] ([comment_id])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK_comment_comment]
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
ALTER TABLE [dbo].[invoice]  WITH CHECK ADD  CONSTRAINT [FK_invoice_booking] FOREIGN KEY([booking_id])
REFERENCES [dbo].[booking] ([booking_id])
GO
ALTER TABLE [dbo].[invoice] CHECK CONSTRAINT [FK_invoice_booking]
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
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_product_unit] FOREIGN KEY([product_unit_id])
REFERENCES [dbo].[product_unit] ([product_unit_id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_product_unit]
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
ALTER TABLE [dbo].[service]  WITH CHECK ADD  CONSTRAINT [FK_service_service_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[service_category] ([category_id])
GO
ALTER TABLE [dbo].[service] CHECK CONSTRAINT [FK_service_service_category]
GO
ALTER TABLE [dbo].[service_comment]  WITH CHECK ADD  CONSTRAINT [FK_service_comment_booking_service_detail] FOREIGN KEY([booking_detail_id])
REFERENCES [dbo].[booking_service_detail] ([booking_detail_id])
GO
ALTER TABLE [dbo].[service_comment] CHECK CONSTRAINT [FK_service_comment_booking_service_detail]
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
