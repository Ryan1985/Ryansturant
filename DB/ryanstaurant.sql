USE [master]
GO
/****** Object:  Database [ryanstaurant]    Script Date: 09/30/2015 18:08:24 ******/
CREATE DATABASE [ryanstaurant] ON  PRIMARY 
( NAME = N'ryanstaurant', FILENAME = N'G:\DB\ryanstaurant.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ryanstaurant_log', FILENAME = N'G:\DB\ryanstaurant_log.ldf' , SIZE = 3840KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ryanstaurant] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ryanstaurant].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ryanstaurant] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ryanstaurant] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ryanstaurant] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ryanstaurant] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ryanstaurant] SET ARITHABORT OFF
GO
ALTER DATABASE [ryanstaurant] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ryanstaurant] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ryanstaurant] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ryanstaurant] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ryanstaurant] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ryanstaurant] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ryanstaurant] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ryanstaurant] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ryanstaurant] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ryanstaurant] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ryanstaurant] SET  DISABLE_BROKER
GO
ALTER DATABASE [ryanstaurant] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ryanstaurant] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ryanstaurant] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ryanstaurant] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ryanstaurant] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ryanstaurant] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ryanstaurant] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ryanstaurant] SET  READ_WRITE
GO
ALTER DATABASE [ryanstaurant] SET RECOVERY FULL
GO
ALTER DATABASE [ryanstaurant] SET  MULTI_USER
GO
ALTER DATABASE [ryanstaurant] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ryanstaurant] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'ryanstaurant', N'ON'
GO
USE [ryanstaurant]
GO
/****** Object:  Table [dbo].[UMS_Token]    Script Date: 09/30/2015 18:08:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UMS_Token](
	[TokenKey] [uniqueidentifier] NOT NULL,
	[ExpireTime] [datetime] NOT NULL,
 CONSTRAINT [PK_UMS_Token] PRIMARY KEY CLUSTERED 
(
	[TokenKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UMS_Roles]    Script Date: 09/30/2015 18:08:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UMS_Roles](
	[id] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](500) NULL,
	[Authority] [bigint] NULL,
 CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UMS_EmpRoles]    Script Date: 09/30/2015 18:08:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UMS_EmpRoles](
	[emp_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK_emp_role] PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC,
	[role_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UMS_Employees]    Script Date: 09/30/2015 18:08:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UMS_Employees](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[LoginName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NULL,
	[Description] [varchar](500) NULL,
	[Authority] [bigint] NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_employee] ON [dbo].[UMS_Employees] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UMS_Authorities]    Script Date: 09/30/2015 18:08:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UMS_Authorities](
	[id] [bigint] NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](500) NULL,
 CONSTRAINT [PK_authority] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OMS_Token]    Script Date: 09/30/2015 18:08:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OMS_Token](
	[TokenKey] [uniqueidentifier] NOT NULL,
	[ExpireTime] [datetime] NOT NULL,
 CONSTRAINT [PK_OMS_Token] PRIMARY KEY CLUSTERED 
(
	[TokenKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OMS_Tables]    Script Date: 09/30/2015 18:08:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OMS_Tables](
	[ID] [uniqueidentifier] NOT NULL,
	[DisplayNo] [varchar](50) NOT NULL,
	[PosX] [int] NOT NULL,
	[PosY] [int] NOT NULL,
	[Width] [int] NOT NULL,
	[Length] [int] NOT NULL,
	[CurrentStatus] [int] NOT NULL,
	[Disabled] [int] NOT NULL,
 CONSTRAINT [PK_Tables] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态(0:空闲,1:有人,2:预定,3:被合并,4:被拆分,5:损坏)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_Tables', @level2type=N'COLUMN',@level2name=N'CurrentStatus'
GO
/****** Object:  Table [dbo].[OMS_TableRelations]    Script Date: 09/30/2015 18:08:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OMS_TableRelations](
	[TableID] [uniqueidentifier] NOT NULL,
	[RelateTableID] [uniqueidentifier] NOT NULL,
	[Disabled] [int] NOT NULL,
 CONSTRAINT [PK_TableRelations] PRIMARY KEY CLUSTERED 
(
	[TableID] ASC,
	[RelateTableID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OMS_SpecialRequests]    Script Date: 09/30/2015 18:08:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OMS_SpecialRequests](
	[ID] [int] NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[RequestGroup] [varchar](50) NOT NULL,
	[Disabled] [int] NOT NULL,
 CONSTRAINT [PK_SpecialRequests] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OMS_Orders]    Script Date: 09/30/2015 18:08:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OMS_Orders](
	[ID] [uniqueidentifier] NOT NULL,
	[DiscountID] [uniqueidentifier] NOT NULL,
	[DerateID] [uniqueidentifier] NOT NULL,
	[SubTotal] [money] NOT NULL,
	[Total] [money] NOT NULL,
	[ChargeID] [uniqueidentifier] NOT NULL,
	[ChangeID] [uniqueidentifier] NOT NULL,
	[TableID] [uniqueidentifier] NOT NULL,
	[IsReserved] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[PendingReason] [varchar](250) NULL,
	[RevokeReason] [varchar](250) NULL,
	[CancelReason] [varchar](250) NULL,
	[Disabled] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否为预定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_Orders', @level2type=N'COLUMN',@level2name=N'IsReserved'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单状态:0预定1点单2送单3印单4结账5暂停6退单7取消' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_Orders', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作废标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_Orders', @level2type=N'COLUMN',@level2name=N'Disabled'
GO
/****** Object:  Table [dbo].[OMS_OrderDetail]    Script Date: 09/30/2015 18:08:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OMS_OrderDetail](
	[OrderID] [uniqueidentifier] NOT NULL,
	[ItemID] [uniqueidentifier] NOT NULL,
	[OraginPrice] [money] NOT NULL,
	[DiscountID] [uniqueidentifier] NULL,
	[DerateID] [uniqueidentifier] NULL,
	[Price] [money] NOT NULL,
	[Disabled] [int] NOT NULL,
	[SpecialRequest] [int] NOT NULL,
	[Quantity] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'特殊要求(按位存放)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_OrderDetail', @level2type=N'COLUMN',@level2name=N'SpecialRequest'
GO
/****** Object:  Table [dbo].[OMS_MenuDetail]    Script Date: 09/30/2015 18:08:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OMS_MenuDetail](
	[MenuID] [uniqueidentifier] NOT NULL,
	[ItemID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_MenuItem] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC,
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OMS_Menu]    Script Date: 09/30/2015 18:08:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OMS_Menu](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](100) NULL,
	[Description] [varchar](200) NULL,
	[SubDescription] [varchar](500) NULL,
	[ParentID] [uniqueidentifier] NULL,
	[SortOrder] [int] NULL,
 CONSTRAINT [PK_menu_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OMS_Items]    Script Date: 09/30/2015 18:08:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OMS_Items](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Price] [money] NOT NULL,
	[Cost] [money] NOT NULL,
	[Description] [varchar](250) NULL,
	[ItemType] [int] NOT NULL,
	[Disabled] [int] NOT NULL,
	[ChildIdList] [varchar](max) NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品类型(以位做标示)：1:其他,2:饮料，3主餐，4前菜，5甜品，6，点心，7套餐' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_Items', @level2type=N'COLUMN',@level2name=N'ItemType'
GO
/****** Object:  Table [dbo].[OMS_ItemDerates]    Script Date: 09/30/2015 18:08:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OMS_ItemDerates](
	[ItemID] [uniqueidentifier] NOT NULL,
	[DerateID] [uniqueidentifier] NOT NULL,
	[DerateLevel] [int] NOT NULL,
	[Disabled] [int] NOT NULL,
	[Prior] [int] NOT NULL,
 CONSTRAINT [PK_ItemDerates] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC,
	[DerateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'折扣等级(按位存放的方式,位冲突代表只能选一)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_ItemDerates', @level2type=N'COLUMN',@level2name=N'DerateLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'折扣优先级(在同一等级中，只能选其一的情况下的优先级)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_ItemDerates', @level2type=N'COLUMN',@level2name=N'Prior'
GO
/****** Object:  Table [dbo].[OMS_Derates]    Script Date: 09/30/2015 18:08:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OMS_Derates](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Amount] [money] NULL,
	[DerateType] [int] NULL,
	[AimType] [int] NULL,
	[Description] [varchar](250) NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[DerateLine] [money] NULL,
	[Disabled] [int] NOT NULL,
 CONSTRAINT [PK_Derates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'额度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_Derates', @level2type=N'COLUMN',@level2name=N'Amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'打折类型(0:减免,1:比例折扣)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_Derates', @level2type=N'COLUMN',@level2name=N'DerateType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'打折类型(1:整单,2:单品)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_Derates', @level2type=N'COLUMN',@level2name=N'AimType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_Derates', @level2type=N'COLUMN',@level2name=N'StartTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_Derates', @level2type=N'COLUMN',@level2name=N'EndTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'减免起线' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_Derates', @level2type=N'COLUMN',@level2name=N'DerateLine'
GO
/****** Object:  Table [dbo].[GMS_TokenLocation]    Script Date: 09/30/2015 18:08:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GMS_TokenLocation](
	[SystemName] [varchar](50) NOT NULL,
	[ConnectionString] [varchar](250) NULL,
	[IsLoginSystem] [int] NOT NULL,
	[ClientToken] [uniqueidentifier] NULL,
 CONSTRAINT [PK_GMS_TokenLocation] PRIMARY KEY CLUSTERED 
(
	[SystemName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GMS_Token]    Script Date: 09/30/2015 18:08:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GMS_Token](
	[TokenKey] [uniqueidentifier] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[ExpireTime] [datetime] NOT NULL,
 CONSTRAINT [PK_GMS_Token] PRIMARY KEY CLUSTERED 
(
	[TokenKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GMS_Sysconfig]    Script Date: 09/30/2015 18:08:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GMS_Sysconfig](
	[ShortCall] [varchar](200) NOT NULL,
	[Description] [varchar](500) NULL,
	[ConfigValue] [varchar](500) NULL,
 CONSTRAINT [PK_sysconfig] PRIMARY KEY CLUSTERED 
(
	[ShortCall] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF_role_Authority]    Script Date: 09/30/2015 18:08:24 ******/
ALTER TABLE [dbo].[UMS_Roles] ADD  CONSTRAINT [DF_role_Authority]  DEFAULT ((0)) FOR [Authority]
GO
/****** Object:  Default [DF_employee_Authority]    Script Date: 09/30/2015 18:08:24 ******/
ALTER TABLE [dbo].[UMS_Employees] ADD  CONSTRAINT [DF_employee_Authority]  DEFAULT ((0)) FOR [Authority]
GO
/****** Object:  Default [DF_Tables_PosX]    Script Date: 09/30/2015 18:08:24 ******/
ALTER TABLE [dbo].[OMS_Tables] ADD  CONSTRAINT [DF_Tables_PosX]  DEFAULT ((0)) FOR [PosX]
GO
/****** Object:  Default [DF_Tables_PosY]    Script Date: 09/30/2015 18:08:24 ******/
ALTER TABLE [dbo].[OMS_Tables] ADD  CONSTRAINT [DF_Tables_PosY]  DEFAULT ((0)) FOR [PosY]
GO
/****** Object:  Default [DF_Tables_Width]    Script Date: 09/30/2015 18:08:24 ******/
ALTER TABLE [dbo].[OMS_Tables] ADD  CONSTRAINT [DF_Tables_Width]  DEFAULT ((50)) FOR [Width]
GO
/****** Object:  Default [DF_Tables_Length]    Script Date: 09/30/2015 18:08:24 ******/
ALTER TABLE [dbo].[OMS_Tables] ADD  CONSTRAINT [DF_Tables_Length]  DEFAULT ((50)) FOR [Length]
GO
/****** Object:  Default [DF_Tables_CurrentStatus]    Script Date: 09/30/2015 18:08:24 ******/
ALTER TABLE [dbo].[OMS_Tables] ADD  CONSTRAINT [DF_Tables_CurrentStatus]  DEFAULT ((0)) FOR [CurrentStatus]
GO
/****** Object:  Default [DF_TableRelations_Disabled]    Script Date: 09/30/2015 18:08:24 ******/
ALTER TABLE [dbo].[OMS_TableRelations] ADD  CONSTRAINT [DF_TableRelations_Disabled]  DEFAULT ((0)) FOR [Disabled]
GO
/****** Object:  Default [DF_SpecialRequests_Disabled]    Script Date: 09/30/2015 18:08:24 ******/
ALTER TABLE [dbo].[OMS_SpecialRequests] ADD  CONSTRAINT [DF_SpecialRequests_Disabled]  DEFAULT ((0)) FOR [Disabled]
GO
/****** Object:  Default [DF_Orders_SubTotal]    Script Date: 09/30/2015 18:08:24 ******/
ALTER TABLE [dbo].[OMS_Orders] ADD  CONSTRAINT [DF_Orders_SubTotal]  DEFAULT ((0)) FOR [SubTotal]
GO
/****** Object:  Default [DF_Orders_Total]    Script Date: 09/30/2015 18:08:24 ******/
ALTER TABLE [dbo].[OMS_Orders] ADD  CONSTRAINT [DF_Orders_Total]  DEFAULT ((0)) FOR [Total]
GO
/****** Object:  Default [DF_Orders_IsReserved]    Script Date: 09/30/2015 18:08:24 ******/
ALTER TABLE [dbo].[OMS_Orders] ADD  CONSTRAINT [DF_Orders_IsReserved]  DEFAULT ((0)) FOR [IsReserved]
GO
/****** Object:  Default [DF_Orders_Status]    Script Date: 09/30/2015 18:08:24 ******/
ALTER TABLE [dbo].[OMS_Orders] ADD  CONSTRAINT [DF_Orders_Status]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  Default [DF_Orders_Disabled]    Script Date: 09/30/2015 18:08:24 ******/
ALTER TABLE [dbo].[OMS_Orders] ADD  CONSTRAINT [DF_Orders_Disabled]  DEFAULT ((0)) FOR [Disabled]
GO
/****** Object:  Default [DF_OrderDetail_OraginPrice]    Script Date: 09/30/2015 18:08:24 ******/
ALTER TABLE [dbo].[OMS_OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_OraginPrice]  DEFAULT ((0)) FOR [OraginPrice]
GO
/****** Object:  Default [DF_OrderDetail_Price]    Script Date: 09/30/2015 18:08:24 ******/
ALTER TABLE [dbo].[OMS_OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_Price]  DEFAULT ((0)) FOR [Price]
GO
/****** Object:  Default [DF_OrderItems_Disabled]    Script Date: 09/30/2015 18:08:24 ******/
ALTER TABLE [dbo].[OMS_OrderDetail] ADD  CONSTRAINT [DF_OrderItems_Disabled]  DEFAULT ((0)) FOR [Disabled]
GO
/****** Object:  Default [DF_OrderDetail_SpecialRequest]    Script Date: 09/30/2015 18:08:24 ******/
ALTER TABLE [dbo].[OMS_OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_SpecialRequest]  DEFAULT ((0)) FOR [SpecialRequest]
GO
/****** Object:  Default [DF_OrderDetail_Quantity]    Script Date: 09/30/2015 18:08:24 ******/
ALTER TABLE [dbo].[OMS_OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
/****** Object:  Default [DF_Items_Price]    Script Date: 09/30/2015 18:08:24 ******/
ALTER TABLE [dbo].[OMS_Items] ADD  CONSTRAINT [DF_Items_Price]  DEFAULT ((0)) FOR [Price]
GO
/****** Object:  Default [DF_Items_Cost]    Script Date: 09/30/2015 18:08:24 ******/
ALTER TABLE [dbo].[OMS_Items] ADD  CONSTRAINT [DF_Items_Cost]  DEFAULT ((0)) FOR [Cost]
GO
/****** Object:  Default [DF_Items_Disabled]    Script Date: 09/30/2015 18:08:24 ******/
ALTER TABLE [dbo].[OMS_Items] ADD  CONSTRAINT [DF_Items_Disabled]  DEFAULT ((0)) FOR [Disabled]
GO
/****** Object:  Default [DF_ItemDerates_Prior]    Script Date: 09/30/2015 18:08:24 ******/
ALTER TABLE [dbo].[OMS_ItemDerates] ADD  CONSTRAINT [DF_ItemDerates_Prior]  DEFAULT ((0)) FOR [DerateLevel]
GO
/****** Object:  Default [DF_ItemDerates_Disabled]    Script Date: 09/30/2015 18:08:24 ******/
ALTER TABLE [dbo].[OMS_ItemDerates] ADD  CONSTRAINT [DF_ItemDerates_Disabled]  DEFAULT ((0)) FOR [Disabled]
GO
/****** Object:  Default [DF_ItemDerates_Prior_1]    Script Date: 09/30/2015 18:08:24 ******/
ALTER TABLE [dbo].[OMS_ItemDerates] ADD  CONSTRAINT [DF_ItemDerates_Prior_1]  DEFAULT ((0)) FOR [Prior]
GO
/****** Object:  Default [DF_Derates_Amount]    Script Date: 09/30/2015 18:08:24 ******/
ALTER TABLE [dbo].[OMS_Derates] ADD  CONSTRAINT [DF_Derates_Amount]  DEFAULT ((0)) FOR [Amount]
GO
/****** Object:  Default [DF_Derates_StartTime]    Script Date: 09/30/2015 18:08:24 ******/
ALTER TABLE [dbo].[OMS_Derates] ADD  CONSTRAINT [DF_Derates_StartTime]  DEFAULT (getdate()) FOR [StartTime]
GO
/****** Object:  Default [DF_Derates_Disabled]    Script Date: 09/30/2015 18:08:24 ******/
ALTER TABLE [dbo].[OMS_Derates] ADD  CONSTRAINT [DF_Derates_Disabled]  DEFAULT ((0)) FOR [Disabled]
GO
/****** Object:  Default [DF_GMS_TokenLocation_IsLoginSystem]    Script Date: 09/30/2015 18:08:24 ******/
ALTER TABLE [dbo].[GMS_TokenLocation] ADD  CONSTRAINT [DF_GMS_TokenLocation_IsLoginSystem]  DEFAULT ((0)) FOR [IsLoginSystem]
GO
/****** Object:  Default [DF_GMS_Token_CreateTime]    Script Date: 09/30/2015 18:08:24 ******/
ALTER TABLE [dbo].[GMS_Token] ADD  CONSTRAINT [DF_GMS_Token_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
