USE [pnttour]
GO
/****** Object:  Table [dbo].[account]    Script Date: 9/11/2020 4:38:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[account](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [varchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
	[name] [varchar](150) NULL,
	[status] [int] NOT NULL,
	[role_id] [bigint] NOT NULL,
	[created_date] [date] NULL,
	[modified_date] [date] NULL,
	[created_by] [varchar](255) NULL,
	[modified_by] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[avail_tour]    Script Date: 9/11/2020 4:38:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[avail_tour](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[thumbnail] [nvarchar](255) NULL,
	[departure] [nvarchar](255) NOT NULL,
	[destination] [nvarchar](255) NOT NULL,
	[category_tour_id] [bigint] NOT NULL,
	[created_date] [date] NULL,
	[modified_date] [date] NULL,
	[created_by] [varchar](255) NULL,
	[modified_by] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[category_tour]    Script Date: 9/11/2020 4:38:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[category_tour](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[code] [varchar](255) NOT NULL,
	[created_date] [date] NULL,
	[modified_date] [date] NULL,
	[created_by] [varchar](255) NULL,
	[modified_by] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[comment]    Script Date: 9/11/2020 4:38:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[comment](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[tour_id] [bigint] NOT NULL,
	[account_id] [bigint] NOT NULL,
	[created_date] [date] NULL,
	[modified_date] [date] NULL,
	[created_by] [varchar](255) NULL,
	[modified_by] [varchar](255) NULL,
	[content] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[role]    Script Date: 9/11/2020 4:38:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[role](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[code] [varchar](255) NOT NULL,
	[created_date] [date] NULL,
	[modified_date] [date] NULL,
	[created_by] [varchar](255) NULL,
	[modified_by] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tour]    Script Date: 9/11/2020 4:38:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tour](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[description] [text] NULL,
	[status] [int] NOT NULL,
	[created_date] [date] NULL,
	[modified_date] [date] NULL,
	[created_by] [varchar](255) NULL,
	[modified_by] [varchar](255) NULL,
	[title] [nvarchar](255) NULL,
	[avail_tour_id] [bigint] NULL,
	[start_time] [date] NULL,
	[end_time] [date] NULL,
	[flight] [nvarchar](50) NULL,
	[max_amount] [int] NULL,
	[current_amount] [int] NULL,
	[price] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user_trip]    Script Date: 9/11/2020 4:38:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user_trip](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[tour_id] [bigint] NOT NULL,
	[account_id] [bigint] NOT NULL,
	[status] [int] NOT NULL,
	[created_date] [date] NULL,
	[modified_date] [date] NULL,
	[created_by] [varchar](255) NULL,
	[modified_by] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([id], [username], [password], [name], [status], [role_id], [created_date], [modified_date], [created_by], [modified_by]) VALUES (1, N'guest123', N'12345678', N'guest', 0, 2, CAST(N'2020-10-28' AS Date), CAST(N'2020-10-28' AS Date), N'guest123', N'guest123')
INSERT [dbo].[account] ([id], [username], [password], [name], [status], [role_id], [created_date], [modified_date], [created_by], [modified_by]) VALUES (2, N'concept123', N'12345678', N'Trung Concept', 0, 2, CAST(N'2020-10-28' AS Date), CAST(N'2020-10-28' AS Date), N'concept123', N'concept123')
INSERT [dbo].[account] ([id], [username], [password], [name], [status], [role_id], [created_date], [modified_date], [created_by], [modified_by]) VALUES (4, N'admin', N'admin', N'TrungPerfect', 1, 2, CAST(N'2020-11-01' AS Date), CAST(N'2020-10-30' AS Date), NULL, NULL)
INSERT [dbo].[account] ([id], [username], [password], [name], [status], [role_id], [created_date], [modified_date], [created_by], [modified_by]) VALUES (5, N'admin2', N'admin2', N'trungdz2', 1, 2, CAST(N'2020-11-01' AS Date), CAST(N'2020-11-01' AS Date), NULL, NULL)
INSERT [dbo].[account] ([id], [username], [password], [name], [status], [role_id], [created_date], [modified_date], [created_by], [modified_by]) VALUES (11, N'admin4', N'admin4', N'trungdz4', 1, 1, CAST(N'2020-11-01' AS Date), CAST(N'2020-11-01' AS Date), NULL, NULL)
INSERT [dbo].[account] ([id], [username], [password], [name], [status], [role_id], [created_date], [modified_date], [created_by], [modified_by]) VALUES (14, N'concept1234', N'12345678', N'Trung Pham', 1, 2, CAST(N'2020-11-02' AS Date), CAST(N'2020-11-02' AS Date), N'concept1234', N'concept1234')
SET IDENTITY_INSERT [dbo].[account] OFF
SET IDENTITY_INSERT [dbo].[avail_tour] ON 

INSERT [dbo].[avail_tour] ([id], [thumbnail], [departure], [destination], [category_tour_id], [created_date], [modified_date], [created_by], [modified_by]) VALUES (18, N'sapa.jpg', N'Đà Nẵng', N'Lào Cai', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[avail_tour] ([id], [thumbnail], [departure], [destination], [category_tour_id], [created_date], [modified_date], [created_by], [modified_by]) VALUES (19, N'caobang.jpg', N'Hà Nội', N'Cao Bằng', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[avail_tour] ([id], [thumbnail], [departure], [destination], [category_tour_id], [created_date], [modified_date], [created_by], [modified_by]) VALUES (20, N'halong.jpg', N'Hà Nội', N'Hạ Long', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[avail_tour] ([id], [thumbnail], [departure], [destination], [category_tour_id], [created_date], [modified_date], [created_by], [modified_by]) VALUES (21, N'hagiang.png', N'Đà Nẵng', N'Hà Giang', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[avail_tour] ([id], [thumbnail], [departure], [destination], [category_tour_id], [created_date], [modified_date], [created_by], [modified_by]) VALUES (22, N'tamdao.jpg', N'Quảng Ninh', N'Tam Đảo', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[avail_tour] ([id], [thumbnail], [departure], [destination], [category_tour_id], [created_date], [modified_date], [created_by], [modified_by]) VALUES (23, N'saigon.jpg', N'Hà Nội', N'Sài Gòn', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[avail_tour] ([id], [thumbnail], [departure], [destination], [category_tour_id], [created_date], [modified_date], [created_by], [modified_by]) VALUES (24, N'daolyson.jpg', N'Hà Nội', N'Quảng Ngãi', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[avail_tour] ([id], [thumbnail], [departure], [destination], [category_tour_id], [created_date], [modified_date], [created_by], [modified_by]) VALUES (25, N'phuquoc.jpg', N'Hà Nội', N'Phú Quốc', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[avail_tour] ([id], [thumbnail], [departure], [destination], [category_tour_id], [created_date], [modified_date], [created_by], [modified_by]) VALUES (26, N'dalat.jpg', N'Hà Nội', N'Đà Lạt', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[avail_tour] ([id], [thumbnail], [departure], [destination], [category_tour_id], [created_date], [modified_date], [created_by], [modified_by]) VALUES (27, N'quynhon.jpg', N'Hà Nội', N'Quy Nhơn', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[avail_tour] ([id], [thumbnail], [departure], [destination], [category_tour_id], [created_date], [modified_date], [created_by], [modified_by]) VALUES (28, N'condao.jpg', N'Hà Nội', N'Bà Rịa Vũng Tàu', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[avail_tour] ([id], [thumbnail], [departure], [destination], [category_tour_id], [created_date], [modified_date], [created_by], [modified_by]) VALUES (29, N'nhatrang.jpg', N'Hà Nội', N'Đà Nẵng', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[avail_tour] ([id], [thumbnail], [departure], [destination], [category_tour_id], [created_date], [modified_date], [created_by], [modified_by]) VALUES (30, N'daolyson.jpg', N'Quảng Ninh', N'Quảng Ngãi', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[avail_tour] ([id], [thumbnail], [departure], [destination], [category_tour_id], [created_date], [modified_date], [created_by], [modified_by]) VALUES (31, N'nhatrang.jpg', N'Quảng Ninh', N'Đà Nẵng', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[avail_tour] ([id], [thumbnail], [departure], [destination], [category_tour_id], [created_date], [modified_date], [created_by], [modified_by]) VALUES (32, N'sapa.jpg', N'Hà Nội', N'Lào Cai', 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[avail_tour] OFF
SET IDENTITY_INSERT [dbo].[category_tour] ON 

INSERT [dbo].[category_tour] ([id], [name], [code], [created_date], [modified_date], [created_by], [modified_by]) VALUES (1, N'Mien Bac', N'MB', NULL, NULL, NULL, NULL)
INSERT [dbo].[category_tour] ([id], [name], [code], [created_date], [modified_date], [created_by], [modified_by]) VALUES (2, N'Mien Nam', N'MN', NULL, NULL, NULL, NULL)
INSERT [dbo].[category_tour] ([id], [name], [code], [created_date], [modified_date], [created_by], [modified_by]) VALUES (3, N'Mien Trung', N'MT', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[category_tour] OFF
SET IDENTITY_INSERT [dbo].[comment] ON 

INSERT [dbo].[comment] ([id], [tour_id], [account_id], [created_date], [modified_date], [created_by], [modified_by], [content]) VALUES (25, 8, 4, CAST(N'2020-11-05' AS Date), CAST(N'2020-11-05' AS Date), NULL, NULL, N'Hello')
INSERT [dbo].[comment] ([id], [tour_id], [account_id], [created_date], [modified_date], [created_by], [modified_by], [content]) VALUES (31, 8, 4, CAST(N'2020-11-05' AS Date), CAST(N'2020-11-05' AS Date), NULL, NULL, N'fast')
INSERT [dbo].[comment] ([id], [tour_id], [account_id], [created_date], [modified_date], [created_by], [modified_by], [content]) VALUES (55, 2, 4, CAST(N'2020-11-06' AS Date), CAST(N'2020-11-06' AS Date), NULL, NULL, N'oi gioi oi')
INSERT [dbo].[comment] ([id], [tour_id], [account_id], [created_date], [modified_date], [created_by], [modified_by], [content]) VALUES (56, 2, 4, CAST(N'2020-11-06' AS Date), CAST(N'2020-11-06' AS Date), NULL, NULL, N'ds')
INSERT [dbo].[comment] ([id], [tour_id], [account_id], [created_date], [modified_date], [created_by], [modified_by], [content]) VALUES (57, 2, 4, CAST(N'2020-11-06' AS Date), CAST(N'2020-11-06' AS Date), NULL, NULL, N'sad')
INSERT [dbo].[comment] ([id], [tour_id], [account_id], [created_date], [modified_date], [created_by], [modified_by], [content]) VALUES (62, 11, 4, CAST(N'2020-11-06' AS Date), CAST(N'2020-11-06' AS Date), NULL, NULL, N'dep traids')
INSERT [dbo].[comment] ([id], [tour_id], [account_id], [created_date], [modified_date], [created_by], [modified_by], [content]) VALUES (64, 7, 4, CAST(N'2020-11-06' AS Date), CAST(N'2020-11-06' AS Date), NULL, NULL, N'cx được đấy')
INSERT [dbo].[comment] ([id], [tour_id], [account_id], [created_date], [modified_date], [created_by], [modified_by], [content]) VALUES (67, 7, 4, CAST(N'2020-11-06' AS Date), CAST(N'2020-11-06' AS Date), NULL, NULL, N'cx kệ')
INSERT [dbo].[comment] ([id], [tour_id], [account_id], [created_date], [modified_date], [created_by], [modified_by], [content]) VALUES (70, 22, 11, CAST(N'2020-11-07' AS Date), CAST(N'2020-11-07' AS Date), NULL, NULL, N'ko ăn thua')
INSERT [dbo].[comment] ([id], [tour_id], [account_id], [created_date], [modified_date], [created_by], [modified_by], [content]) VALUES (71, 4, 4, CAST(N'2020-11-08' AS Date), CAST(N'2020-11-08' AS Date), NULL, NULL, N'Hay đấy')
SET IDENTITY_INSERT [dbo].[comment] OFF
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([id], [name], [code], [created_date], [modified_date], [created_by], [modified_by]) VALUES (1, N'Administrator', N'ad', NULL, NULL, NULL, NULL)
INSERT [dbo].[role] ([id], [name], [code], [created_date], [modified_date], [created_by], [modified_by]) VALUES (2, N'User', N'us', NULL, NULL, NULL, NULL)
INSERT [dbo].[role] ([id], [name], [code], [created_date], [modified_date], [created_by], [modified_by]) VALUES (3, N'Guest', N'gu', NULL, NULL, NULL, NULL)
INSERT [dbo].[role] ([id], [name], [code], [created_date], [modified_date], [created_by], [modified_by]) VALUES (4, N'Premium', N'pr', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[role] OFF
SET IDENTITY_INSERT [dbo].[tour] ON 

INSERT [dbo].[tour] ([id], [description], [status], [created_date], [modified_date], [created_by], [modified_by], [title], [avail_tour_id], [start_time], [end_time], [flight], [max_amount], [current_amount], [price]) VALUES (2, N'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.', 1, NULL, NULL, NULL, NULL, N'Trip du lịch từ Đà Nẵng lên Sapa trong 5 ngày', 18, CAST(N'2020-10-15' AS Date), CAST(N'2020-10-20' AS Date), N'Oto Phuc Xuyen', 50, 0, 1000000)
INSERT [dbo].[tour] ([id], [description], [status], [created_date], [modified_date], [created_by], [modified_by], [title], [avail_tour_id], [start_time], [end_time], [flight], [max_amount], [current_amount], [price]) VALUES (3, N'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.', 1, NULL, NULL, NULL, NULL, N'Du Lịch Hà Nội cao bằng giá rẻ trong 3 ngày', 19, CAST(N'2021-02-13' AS Date), CAST(N'2021-02-16' AS Date), N'Oto Phuc Xuyen', 50, 0, 1000000)
INSERT [dbo].[tour] ([id], [description], [status], [created_date], [modified_date], [created_by], [modified_by], [title], [avail_tour_id], [start_time], [end_time], [flight], [max_amount], [current_amount], [price]) VALUES (4, N'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.', 1, NULL, NULL, NULL, NULL, N'Về Với Vịnh Hạ Long ăn chơi 3 ngày từ Thủ Đô', 20, CAST(N'2021-02-13' AS Date), CAST(N'2021-02-16' AS Date), N'Viet Nam AirLine', 50, 0, 1000000)
INSERT [dbo].[tour] ([id], [description], [status], [created_date], [modified_date], [created_by], [modified_by], [title], [avail_tour_id], [start_time], [end_time], [flight], [max_amount], [current_amount], [price]) VALUES (5, N'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.', 1, NULL, NULL, NULL, NULL, N'Chuyến đi từ Đà Nẵng ra Hà Giang trong dịp tết', 21, CAST(N'2020-12-30' AS Date), CAST(N'2021-01-03' AS Date), N'Viet Nam AirLine', 50, 0, 1000000)
INSERT [dbo].[tour] ([id], [description], [status], [created_date], [modified_date], [created_by], [modified_by], [title], [avail_tour_id], [start_time], [end_time], [flight], [max_amount], [current_amount], [price]) VALUES (6, N'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.', 1, NULL, NULL, NULL, NULL, N'Chuyến đi từ Quảng Ninh ra Tam Đảo trong dịp tết', 22, CAST(N'2020-12-30' AS Date), CAST(N'2021-01-03' AS Date), N'Oto Phuc Xuyen', 50, 0, 1000000)
INSERT [dbo].[tour] ([id], [description], [status], [created_date], [modified_date], [created_by], [modified_by], [title], [avail_tour_id], [start_time], [end_time], [flight], [max_amount], [current_amount], [price]) VALUES (7, N'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.', 1, NULL, NULL, NULL, NULL, N'Chuyến đi từ Hà Nội ra Miền Nam trong dịp tết', 23, CAST(N'2020-12-30' AS Date), CAST(N'2021-01-03' AS Date), N'Viet Jet', 50, 0, 1000000)
INSERT [dbo].[tour] ([id], [description], [status], [created_date], [modified_date], [created_by], [modified_by], [title], [avail_tour_id], [start_time], [end_time], [flight], [max_amount], [current_amount], [price]) VALUES (8, N'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.', 1, NULL, NULL, NULL, NULL, N'Hà Nội Quảng Ngãi chuyến đi rẻ nhất trong năm ', 24, CAST(N'2020-12-30' AS Date), CAST(N'2021-01-03' AS Date), N'Viet Nam AirLine', 50, 0, 1000000)
INSERT [dbo].[tour] ([id], [description], [status], [created_date], [modified_date], [created_by], [modified_by], [title], [avail_tour_id], [start_time], [end_time], [flight], [max_amount], [current_amount], [price]) VALUES (9, N'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.', 1, NULL, NULL, NULL, NULL, N'Từ Hà Nội đến cuối mũi Việt Nam', 25, CAST(N'2020-12-30' AS Date), CAST(N'2021-01-03' AS Date), N'Viet Nam AirLine', 50, 0, 1000000)
INSERT [dbo].[tour] ([id], [description], [status], [created_date], [modified_date], [created_by], [modified_by], [title], [avail_tour_id], [start_time], [end_time], [flight], [max_amount], [current_amount], [price]) VALUES (10, N'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.', 1, NULL, NULL, NULL, NULL, N'Travel around Đà Lạt xuất phát điểm Hà Nội', 26, CAST(N'2020-12-30' AS Date), CAST(N'2021-01-03' AS Date), N'Viet Nam AirLine', 50, 0, 1000000)
INSERT [dbo].[tour] ([id], [description], [status], [created_date], [modified_date], [created_by], [modified_by], [title], [avail_tour_id], [start_time], [end_time], [flight], [max_amount], [current_amount], [price]) VALUES (11, N'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.', 1, NULL, NULL, NULL, NULL, N'Tắm Thứ 1 Lần Quy Nhơn để biết cái sạch ở đây', 27, CAST(N'2020-12-30' AS Date), CAST(N'2021-01-03' AS Date), N'Viet Nam AirLine', 50, 0, 1000000)
INSERT [dbo].[tour] ([id], [description], [status], [created_date], [modified_date], [created_by], [modified_by], [title], [avail_tour_id], [start_time], [end_time], [flight], [max_amount], [current_amount], [price]) VALUES (12, N'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.', 1, NULL, NULL, NULL, NULL, N'Cùng ra côn đảo biển xa (Từ Thủ Đô)', 28, CAST(N'2020-12-30' AS Date), CAST(N'2021-01-03' AS Date), N'Viet Nam AirLine', 50, 0, 1000000)
INSERT [dbo].[tour] ([id], [description], [status], [created_date], [modified_date], [created_by], [modified_by], [title], [avail_tour_id], [start_time], [end_time], [flight], [max_amount], [current_amount], [price]) VALUES (13, N'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.', 1, NULL, NULL, NULL, NULL, N'Đi Nha Trang Hạng Sang từ Hà Nội trong 5 ngày', 29, CAST(N'2020-12-30' AS Date), CAST(N'2021-01-05' AS Date), N'Viet Nam AirLine', 50, 0, 1000000)
INSERT [dbo].[tour] ([id], [description], [status], [created_date], [modified_date], [created_by], [modified_by], [title], [avail_tour_id], [start_time], [end_time], [flight], [max_amount], [current_amount], [price]) VALUES (14, N'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.', 1, NULL, NULL, NULL, NULL, N'Head to Lý Sơn Land For Exotic Penssenger in 3 days', 30, CAST(N'2020-12-30' AS Date), CAST(N'2021-01-03' AS Date), N'Viet Nam AirLine', 50, 0, 1000000)
INSERT [dbo].[tour] ([id], [description], [status], [created_date], [modified_date], [created_by], [modified_by], [title], [avail_tour_id], [start_time], [end_time], [flight], [max_amount], [current_amount], [price]) VALUES (15, N'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.', 1, NULL, NULL, NULL, NULL, N'Từ vùng biển đẹp này sang vùng biển đẹp kia Hạ Long to Nha Trang', 31, CAST(N'2020-12-30' AS Date), CAST(N'2021-01-03' AS Date), N'Viet Nam AirLine', 50, 0, 1000000)
INSERT [dbo].[tour] ([id], [description], [status], [created_date], [modified_date], [created_by], [modified_by], [title], [avail_tour_id], [start_time], [end_time], [flight], [max_amount], [current_amount], [price]) VALUES (16, N'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.', 1, NULL, NULL, NULL, NULL, N'Cảm Nhận Cái Lạnh Ở Sapa ngày mai', 32, CAST(N'2020-12-30' AS Date), CAST(N'2021-01-03' AS Date), N'Viet Nam AirLine', 50, 0, 1000000)
INSERT [dbo].[tour] ([id], [description], [status], [created_date], [modified_date], [created_by], [modified_by], [title], [avail_tour_id], [start_time], [end_time], [flight], [max_amount], [current_amount], [price]) VALUES (22, N'        ? cái gì vào dây cx dc: 
blad bladbladbladbladbladbladblad bladbladbladblad bladbladbladbladbladbladbladbladbladbladbladbladbladbladbladbladbladbladbladbladbladbladbladbladbladbladbladbladbladbl', 4, CAST(N'2020-11-07' AS Date), CAST(N'2020-11-07' AS Date), NULL, N'trungdz4', N'Hôm nay trời đẹp quá anh muốn hôn vào má', 18, CAST(N'2020-11-11' AS Date), CAST(N'2020-11-24' AS Date), N'Viet Jet', 30, 0, 2000000)
INSERT [dbo].[tour] ([id], [description], [status], [created_date], [modified_date], [created_by], [modified_by], [title], [avail_tour_id], [start_time], [end_time], [flight], [max_amount], [current_amount], [price]) VALUES (24, N'        cool', 1, CAST(N'2020-11-07' AS Date), CAST(N'2020-11-07' AS Date), N'trungdz4', N'trungdz4', N'Hít Hà Không Ký', 26, CAST(N'2020-11-18' AS Date), CAST(N'2020-11-23' AS Date), N'Ko Xác Định', 100, 0, 1500000)
SET IDENTITY_INSERT [dbo].[tour] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__account__F3DBC572E9CDE1DD]    Script Date: 9/11/2020 4:38:48 AM ******/
ALTER TABLE [dbo].[account] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([id])
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[avail_tour]  WITH CHECK ADD FOREIGN KEY([category_tour_id])
REFERENCES [dbo].[category_tour] ([id])
GO
ALTER TABLE [dbo].[avail_tour]  WITH CHECK ADD FOREIGN KEY([category_tour_id])
REFERENCES [dbo].[category_tour] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD FOREIGN KEY([tour_id])
REFERENCES [dbo].[tour] ([id])
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD FOREIGN KEY([tour_id])
REFERENCES [dbo].[tour] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tour]  WITH CHECK ADD FOREIGN KEY([avail_tour_id])
REFERENCES [dbo].[avail_tour] ([id])
GO
ALTER TABLE [dbo].[tour]  WITH CHECK ADD FOREIGN KEY([avail_tour_id])
REFERENCES [dbo].[avail_tour] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[user_trip]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[user_trip]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[user_trip]  WITH CHECK ADD FOREIGN KEY([tour_id])
REFERENCES [dbo].[tour] ([id])
GO
ALTER TABLE [dbo].[user_trip]  WITH CHECK ADD FOREIGN KEY([tour_id])
REFERENCES [dbo].[tour] ([id])
ON DELETE CASCADE
GO
