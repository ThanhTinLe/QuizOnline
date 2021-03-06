USE [Assignment2_LethanhTin]
GO
/****** Object:  Table [dbo].[answer]    Script Date: 4/22/2021 10:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[answer](
	[ansId] [int] IDENTITY(1,1) NOT NULL,
	[ansContent] [varchar](8000) NULL,
	[ansCorrect] [bit] NULL,
	[quesId] [int] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ansId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[question]    Script Date: 4/22/2021 10:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question](
	[quesId] [int] IDENTITY(1,1) NOT NULL,
	[quesContent] [varchar](8000) NULL,
	[createDate] [date] NULL,
	[subId] [varchar](50) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[quesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subject]    Script Date: 4/22/2021 10:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subject](
	[subId] [varchar](50) NOT NULL,
	[subName] [varchar](500) NULL,
	[numQues] [int] NULL,
	[numTime] [int] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[subId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHistory]    Script Date: 4/22/2021 10:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHistory](
	[hisID] [int] IDENTITY(1,1) NOT NULL,
	[score] [float] NULL,
	[createDate] [date] NULL,
	[subID] [varchar](50) NULL,
	[email] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[hisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHistoryDetail]    Script Date: 4/22/2021 10:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHistoryDetail](
	[hisID] [int] NOT NULL,
	[quesID] [int] NOT NULL,
	[correctAns] [int] NULL,
	[userAns] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[hisID] ASC,
	[quesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 4/22/2021 10:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [int] NOT NULL,
	[roleName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 4/22/2021 10:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[email] [varchar](100) NOT NULL,
	[fullname] [nvarchar](100) NULL,
	[password] [varchar](max) NULL,
	[status] [varchar](50) NULL,
	[roleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[answer] ON 

INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (1, N' ICMP', 0, 1, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (2, N'ARP', 0, 1, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (3, N'IGMP', 0, 1, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (4, N' All of the above', 1, 1, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (5, N'20 Bytes', 0, 2, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (6, N'30 Bytes', 1, 2, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (7, N'60 Bytes', 0, 2, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (8, N'64 Bytes', 0, 2, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (9, N'128.135.65.5', 0, 3, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (10, N'128.135.65.5', 0, 3, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (11, N'128.135.68.5', 1, 3, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (12, N'128.133.68.5', 0, 3, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (13, N'172.16.48.0', 0, 4, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (14, N'172.16.64.0', 1, 4, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (15, N'172.16.0.0', 0, 4, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (16, N'172.16.36.0', 0, 4, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (17, N'1.0.0.0 to 127.255.255.255', 0, 5, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (18, N'128.0.0.0 to 191.255.255.255', 0, 5, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (19, N'192.0.0.0 to 223.255.255.255', 1, 5, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (20, N'None of the above', 0, 5, 0)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (21, N'16', 0, 6, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (22, N'254', 0, 6, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (23, N'65536', 0, 6, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (24, N'65534', 1, 6, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (25, N'Class D', 0, 7, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (26, N'Class A', 0, 7, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (27, N'Class B', 0, 7, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (28, N'Class C', 1, 7, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (29, N'128.58.28.0/22', 0, 8, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (30, N'128.58.24.0/22', 1, 8, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (31, N'128.58.28.0/24', 0, 8, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (32, N'None of the above', 0, 8, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (33, N'572', 0, 9, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (34, N'562', 0, 9, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (35, N'568', 1, 9, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (36, N' 592', 0, 9, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (37, N'UDP port number', 0, 10, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (38, N' IP address', 0, 10, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (39, N'All of the above', 1, 10, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (40, N'TCP port number', 0, 10, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (41, N'Header length', 0, 11, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (42, N'Header checksum', 0, 11, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (43, N'All of the above', 1, 11, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (44, N'ID/flags/frag offset', 0, 11, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (45, N'Used extensively to assign temporary IP addresses to hosts', 0, 12, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (46, N'Allows ISP to maximize usage of their limited IP addresses', 0, 12, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (47, N' Time threshold to enforce lease time', 0, 12, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (48, N'All of the above', 1, 12, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (49, N'SYN', 1, 13, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (50, N'ACK', 0, 13, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (51, N'RST', 0, 13, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (52, N'None of the above', 0, 13, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (53, N'IP', 0, 14, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (54, N'De-multiplexing', 0, 14, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (55, N'Error Checking', 0, 14, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (56, N'All of the above', 1, 14, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (57, N'x', 0, 15, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (58, N'x + 1', 1, 15, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (59, N' x + y (where y is the sequence number proposed by TCP server)', 0, 15, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (60, N'None of the above', 0, 15, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (61, N'Network under-utilization', 0, 16, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (62, N'Host flooding', 0, 16, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (63, N'Network congestion', 1, 16, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (64, N'None of the above', 0, 16, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (65, N'ICMP', 0, 17, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (66, N'OPSF', 0, 17, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (67, N'IGMP', 1, 17, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (68, N' None of the above', 0, 17, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (69, N'Client imposter', 1, 18, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (70, N'Server imposter', 0, 18, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (71, N'Man-in-Middle', 0, 18, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (72, N'None of the above', 0, 18, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (73, N'Handover address', 0, 19, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (74, N'Care of address', 0, 19, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (75, N'Home link', 1, 19, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (76, N' Home address', 0, 19, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (77, N'one to one', 0, 20, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (78, N'many to one', 0, 20, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (79, N'one to many', 1, 20, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (80, N'one to all', 0, 20, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (81, N'Privacy', 0, 21, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (82, N'Availability', 1, 21, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (83, N'Integrity', 0, 21, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (84, N'None of the above', 0, 21, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (85, N'Privacy', 0, 22, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (86, N'Availability', 0, 22, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (87, N'Integrity', 0, 22, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (88, N'All of the above', 1, 22, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (89, N'Foreign agent', 0, 23, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (90, N'Mobile node', 0, 23, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (91, N'Correspondent node', 1, 23, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (92, N'Home agent', 0, 23, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (93, N' Efficiency', 1, 24, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (94, N'Performance', 0, 24, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (95, N'Accuracy', 0, 24, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (96, N'Strength', 0, 24, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (97, N'Source address', 1, 25, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (98, N'Protocol address', 0, 25, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (99, N'IP address', 0, 25, 1)
GO
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (100, N'Standard address
', 0, 25, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (101, N'8 bits', 0, 26, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (102, N'16 bits', 1, 26, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (103, N'32 bits', 0, 26, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (104, N'None of the above', 0, 26, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (105, N'Class A', 0, 27, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (106, N'Class B', 1, 27, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (107, N'Class C', 0, 27, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (108, N'None of the above', 0, 27, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (109, N' Connectionless', 0, 28, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (110, N'Best effort delivery service', 0, 28, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (111, N' Both of the above', 1, 28, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (112, N'None of the above', 0, 28, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (113, N'255.255.255.224', 1, 29, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (114, N'255.255.255.192', 0, 29, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (115, N' 255.255.255.240', 0, 29, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (116, N'255.255.255.248', 0, 29, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (117, N'172.30.190.0', 0, 30, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (118, N' 172.30.190.1', 1, 30, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (119, N' 172.30.190.100', 0, 30, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (120, N'None of the above', 0, 30, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (121, N'Class A', 1, 31, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (122, N'Class B', 0, 31, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (123, N'Class C', 0, 31, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (124, N'Class D', 0, 31, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (125, N'8', 0, 32, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (126, N'5', 0, 32, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (127, N'7', 0, 32, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (128, N' 9', 1, 32, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (129, N'11111111 11111111 11111110 00000000', 0, 33, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (130, N'11111111 11111111 11111111 10000000', 1, 33, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (131, N'11111111 11111111 00000000 00000000', 0, 33, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (132, N'None of the above', 0, 33, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (133, N'14', 1, 34, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (134, N'30', 0, 34, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (135, N'62', 0, 34, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (136, N'None of the above', 0, 34, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (137, N'150.32.64.0', 1, 35, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (138, N'150.32.64.24', 0, 35, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (139, N' 150.32.64.32', 0, 35, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (140, N'150.32.64.16', 0, 35, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (141, N'14', 0, 36, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (142, N' 15', 0, 36, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (143, N'30', 1, 36, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (144, N'62', 0, 36, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (145, N'191.254.0.96', 0, 37, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (146, N' 191.254.0.32', 0, 37, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (147, N'191.254.1.29', 1, 37, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (148, N'191.54.1.64', 0, 37, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (149, N'255.255.240.0', 1, 38, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (150, N'255.255.224.0', 0, 38, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (151, N'255.255.248.0', 0, 38, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (152, N'255.255.192.0', 0, 38, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (153, N'205.255.255.0', 0, 39, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (154, N'255.255.252.0', 1, 39, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (155, N'255.255.22.0', 0, 39, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (156, N'None of the above', 0, 39, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (157, N'DNS', 0, 40, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (158, N'ARP', 1, 40, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (159, N'ICMP', 0, 40, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (160, N'IGRP', 0, 40, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (161, N'1', 0, 41, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (162, N'2', 1, 41, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (163, N'3', 0, 41, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (164, N'4', 0, 41, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (165, N'A', 0, 42, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (166, N'B', 0, 42, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (167, N'C', 0, 42, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (168, N'D', 1, 42, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (169, N'1', 0, 43, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (170, N'2', 0, 43, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (171, N'3', 0, 43, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (172, N'4', 1, 43, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (173, N'2', 0, 44, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (174, N'3', 0, 44, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (175, N'7', 1, 44, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (176, N'21', 0, 44, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (177, N'2', 0, 45, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (178, N'1', 1, 45, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (179, N'4', 0, 45, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (180, N'3', 0, 45, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (185, N'2', 0, 49, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (186, N'3', 0, 49, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (187, N'7', 1, 49, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (188, N'5', 0, 49, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (189, N'2', 0, 50, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (190, N'4', 0, 50, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (191, N'5', 0, 50, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (192, N'9', 1, 50, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (193, N'22', 1, 51, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (194, N'21', 0, 51, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (195, N'23', 0, 51, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (196, N'24', 0, 51, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (197, N'150.32.64.0', 1, 52, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (198, N'150.32.64.24', 0, 52, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (199, N' 150.32.64.32', 0, 52, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (200, N'150.32.64.16', 0, 52, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (201, N'3', 0, 53, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (202, N'4', 0, 53, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (203, N'6', 0, 53, 1)
GO
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (204, N'8', 1, 53, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (205, N'4', 1, 54, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (206, N'3', 0, 54, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (207, N'5', 0, 54, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (208, N'6', 0, 54, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (209, N'a', 0, 55, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (210, N'z', 0, 55, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (211, N'c', 1, 55, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (212, N'v', 0, 55, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (213, N'a', 1, 56, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (214, N'as', 0, 56, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (215, N'afs', 0, 56, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (216, N'asdf', 0, 56, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (217, N'ad', 0, 57, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (218, N'af', 0, 57, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (219, N'b', 1, 57, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (220, N'd', 0, 57, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (221, N's', 0, 58, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (222, N'af', 0, 58, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (223, N't', 0, 58, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (224, N'd', 1, 58, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (225, N's', 0, 59, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (226, N'f', 1, 59, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (227, N's', 0, 59, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (228, N'g', 0, 59, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (229, N'fg', 0, 60, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (230, N'dfgsd', 0, 60, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (231, N'df', 1, 60, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (232, N'dfg', 0, 60, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (233, N'we', 1, 61, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (234, N'wereeee', 0, 61, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (235, N'were', 0, 61, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (236, N'rer', 0, 61, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (237, N'wefwef', 1, 62, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (238, N'wsdf', 0, 62, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (239, N'xczxcz', 0, 62, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (240, N'zcd', 0, 62, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (241, N'1', 1, 63, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (242, N'dfgfgfg', 0, 63, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (243, N'adsf', 0, 63, 1)
INSERT [dbo].[answer] ([ansId], [ansContent], [ansCorrect], [quesId], [status]) VALUES (244, N'segfb', 0, 63, 1)
SET IDENTITY_INSERT [dbo].[answer] OFF
SET IDENTITY_INSERT [dbo].[question] ON 

INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (1, N'Which of the following protocols work at IP layer?', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (2, N'Which of the following packet header length cannot be used in an IPv4 packet header?', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (3, N'What is the dotted notation of an IP address of 10000000 10000111 01000100 00000101 ?', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (4, N'What is the subnetwork number of a host with an IP address of 172.16.66.0/21', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (5, N'Which of following is the range of IPv4 addresses spanned by Class C?', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (6, N'How many hosts can be addressed on 10.0.0.0/16?', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (7, N'Which class of IP addresses does CIDR performs aggregation on?', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (8, N'Perform CIDR aggregation on the following /24 IP addresses: 128.58.24.0/24, 128.58.25.0/24, 128.58.26.0/24, 128.58.27.0/24. What is the CIDR outcome?', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (9, N'Packet is to be forwarded to a network with MTU of 592 bytes. The packet has an IP header of 20 bytes and a data part of 1484 bytes. Which of following maximum data length per fragment is legitimate?', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (10, N'What information is used as the entry of the lookup table in a Network Address Translation box?', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (11, N'Which of following fields that IPv6 dropped from IPv4?', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (12, N'Which of the following statement is true for DHCP', CAST(N'2021-01-31' AS Date), N'SJ001', 0)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (13, N'Which flag bit in TCP header must be set when a TCP client initiates a three-way handshake?', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (14, N'Which of the following services are provided by UDP', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (15, N'When a TCP client initiates a three-way handshake with a sequence number x, what will be the acknowledgement number when the TCP server replies?', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (16, N'In a router, the control of the transmission rate at the sender''s side such that the router''s buffer will not be over-filled is called _________ if sender is transmitting too fast', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (17, N'Which of following protocol allows a host to signal its multicast group membership to its attached routers?', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (18, N'Attackers attempt to gain unauthorized access to server. What type of network security threat it imposes?', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (19, N'An IP address associated with a mobile node while visiting a foreign link', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (20, N'In multicast communication, relationship is', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (21, N'What is the security requirement in case of Denial of Service?', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (22, N'What is the security requirement in case of Malicious Code?', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (23, N'A peer with which a mobile node is communicating is called', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (24, N'Reverse Path Multicasting (RPM) is used to increase', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (25, N'In Reverse Path Forwarding, router receives a packet and extracts the', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (26, N'How many bits used for header checksum in IPv4 packets?', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (27, N'Given a network address 128.100.0.0, what is its network class type?', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (28, N'Which of the following is provided at the IP layer', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (29, N'You need to subnet a network that has 5 subnets, each with at least 16 hosts. Which will be your closest choice', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (30, N'What is the first valid host on the subnetwork that the node 172.30.190.198/24 belongs to?', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (31, N'Based on 1.1.1.0/24, the IP address would be:', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (32, N'If a subnet needs to accommodate up to 500 hosts. How many bits for HostID would be sufficient?', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (33, N'Consider a Class B network, where the subnet ID takes 9 bits. What will be the subnet mask?', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (34, N'Given a subnet mask 255.255.255.240, how many hosts the subnet can support?', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (35, N'A host in an organization has an IP address 150.32.64.34 and a subnet mask 255.255.240.0. What is the address of this subnet?', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (36, N'What is the maximum number of IP addresses that can be assigned to hosts on a local subnet that uses the 255.255.255.224 subnet mask', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (37, N'When calculating usable hosts per subnet, the following formula is used 2^bits - 2. For what reason is two subtracted?', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (38, N'Which of the following is a valid IP host address given the network ID of 191.254.0.0 while using 11 bits for subnetting?', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (39, N'DISCO Corporation has been assigned the Class B network address 165.87.0.0. DISCO needs to divide the network into eight subnets. What subnet mask should be applied to the network to provide the most hosts per subnet?', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (40, N'Using a CIDR notation, a prefix 205.100.0.0 of length 22 is written as 205.100.0.0/22. What network mask that the /22 notation indicates?', CAST(N'2021-01-31' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (41, N'1+1', CAST(N'2021-01-31' AS Date), N'SJ002', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (42, N'ABC', CAST(N'2021-02-01' AS Date), N'SJ003', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (43, N'2+2=', CAST(N'2021-02-04' AS Date), N'SJ003', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (44, N'4+3 = ', CAST(N'2021-02-04' AS Date), N'SJ004', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (45, N'4-3', CAST(N'2021-02-04' AS Date), N'SJ005', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (49, N'2+5=', CAST(N'2021-02-04' AS Date), N'SJ006', 0)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (50, N'5+4=', CAST(N'2021-02-05' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (51, N'3+19', CAST(N'2021-02-05' AS Date), N'SJ003', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (52, N'A host in an organization has an IP address 150.32.64.34 and a subnet mask 255.255.240.0. What is the address of this subnet?', CAST(N'2021-02-05' AS Date), N'SJ001', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (53, N'4+4=', CAST(N'2021-04-18' AS Date), N'SJ005', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (54, N'1+3', CAST(N'2021-04-18' AS Date), N'SJ005', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (55, N'abc', CAST(N'2021-04-18' AS Date), N'SJ003', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (56, N'a', CAST(N'2021-04-22' AS Date), N'SJ003', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (57, N'b', CAST(N'2021-04-22' AS Date), N'SJ005', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (58, N'd', CAST(N'2021-04-22' AS Date), N'SJ005', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (59, N'du', CAST(N'2021-04-22' AS Date), N'SJ003', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (60, N'gfdg', CAST(N'2021-04-22' AS Date), N'SJ003', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (61, N'dfgg', CAST(N'2021-04-22' AS Date), N'SJ003', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (62, N'efwe', CAST(N'2021-04-22' AS Date), N'SJ003', 1)
INSERT [dbo].[question] ([quesId], [quesContent], [createDate], [subId], [status]) VALUES (63, N'sdfsdf', CAST(N'2021-04-22' AS Date), N'SJ003', 1)
SET IDENTITY_INSERT [dbo].[question] OFF
INSERT [dbo].[subject] ([subId], [subName], [numQues], [numTime], [status]) VALUES (N'SJ001', N'Subject 1', 10, 1, 1)
INSERT [dbo].[subject] ([subId], [subName], [numQues], [numTime], [status]) VALUES (N'SJ002', N'Subject 2', 10, 20, 1)
INSERT [dbo].[subject] ([subId], [subName], [numQues], [numTime], [status]) VALUES (N'SJ003', N'Subject 3', 10, 20, 1)
INSERT [dbo].[subject] ([subId], [subName], [numQues], [numTime], [status]) VALUES (N'SJ004', N'Subject 4', 10, 20, 1)
INSERT [dbo].[subject] ([subId], [subName], [numQues], [numTime], [status]) VALUES (N'SJ005', N'Subject 5', 10, 20, 1)
INSERT [dbo].[subject] ([subId], [subName], [numQues], [numTime], [status]) VALUES (N'SJ006', N'Subject 6', 10, 20, 1)
SET IDENTITY_INSERT [dbo].[tblHistory] ON 

INSERT [dbo].[tblHistory] ([hisID], [score], [createDate], [subID], [email]) VALUES (59, 3, CAST(N'2021-04-22' AS Date), N'SJ001', N'student@gmail.com')
INSERT [dbo].[tblHistory] ([hisID], [score], [createDate], [subID], [email]) VALUES (60, 4, CAST(N'2021-04-22' AS Date), N'SJ001', N'student@gmail.com')
INSERT [dbo].[tblHistory] ([hisID], [score], [createDate], [subID], [email]) VALUES (61, 3, CAST(N'2021-04-22' AS Date), N'SJ001', N'student@gmail.com')
INSERT [dbo].[tblHistory] ([hisID], [score], [createDate], [subID], [email]) VALUES (62, 5, CAST(N'2021-04-22' AS Date), N'SJ001', N'student@gmail.com')
INSERT [dbo].[tblHistory] ([hisID], [score], [createDate], [subID], [email]) VALUES (63, 0, CAST(N'2021-04-22' AS Date), N'SJ001', N'student@gmail.com')
INSERT [dbo].[tblHistory] ([hisID], [score], [createDate], [subID], [email]) VALUES (64, 2, CAST(N'2021-04-22' AS Date), N'SJ001', N'student@gmail.com')
INSERT [dbo].[tblHistory] ([hisID], [score], [createDate], [subID], [email]) VALUES (65, 5, CAST(N'2021-04-22' AS Date), N'SJ001', N'student@gmail.com')
INSERT [dbo].[tblHistory] ([hisID], [score], [createDate], [subID], [email]) VALUES (66, 0, CAST(N'2021-04-22' AS Date), N'SJ001', N'student@gmail.com')
INSERT [dbo].[tblHistory] ([hisID], [score], [createDate], [subID], [email]) VALUES (67, 0, CAST(N'2021-04-22' AS Date), N'SJ001', N'student@gmail.com')
INSERT [dbo].[tblHistory] ([hisID], [score], [createDate], [subID], [email]) VALUES (68, 0, CAST(N'2021-04-22' AS Date), N'SJ001', N'student@gmail.com')
INSERT [dbo].[tblHistory] ([hisID], [score], [createDate], [subID], [email]) VALUES (69, 4, CAST(N'2021-04-22' AS Date), N'SJ001', N'student@gmail.com')
INSERT [dbo].[tblHistory] ([hisID], [score], [createDate], [subID], [email]) VALUES (70, 3, CAST(N'2021-04-22' AS Date), N'SJ001', N'tin1@gmail.com')
SET IDENTITY_INSERT [dbo].[tblHistory] OFF
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (59, 2, 6, 8)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (59, 7, 28, 27)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (59, 11, 43, 43)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (59, 14, 56, 55)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (59, 19, 75, 75)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (59, 33, 130, 131)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (59, 35, 137, 138)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (59, 37, 147, 148)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (59, 39, 154, 154)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (59, 40, 158, 159)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (60, 10, 39, 40)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (60, 11, 43, 44)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (60, 15, 58, 59)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (60, 16, 63, 63)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (60, 17, 67, 68)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (60, 19, 75, 75)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (60, 28, 111, 111)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (60, 36, 143, 143)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (60, 39, 154, 155)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (60, 52, 197, 199)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (61, 8, 30, 30)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (61, 10, 39, 37)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (61, 11, 43, 43)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (61, 13, 49, 51)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (61, 14, 56, 55)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (61, 22, 88, 87)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (61, 23, 91, 91)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (61, 26, 102, 104)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (61, 39, 154, 155)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (61, 40, 158, 159)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (62, 1, 4, 4)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (62, 2, 6, 7)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (62, 11, 43, 43)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (62, 13, 49, 51)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (62, 14, 56, 55)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (62, 19, 75, 75)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (62, 22, 88, 88)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (62, 35, 137, 138)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (62, 36, 143, 144)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (62, 37, 147, 147)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (63, 3, 11, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (63, 7, 28, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (63, 13, 49, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (63, 18, 69, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (63, 22, 88, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (63, 28, 111, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (63, 33, 130, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (63, 40, 158, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (63, 50, 192, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (63, 52, 197, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (64, 3, 11, 11)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (64, 4, 14, 15)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (64, 7, 28, 27)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (64, 13, 49, 51)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (64, 24, 93, 95)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (64, 26, 102, 104)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (64, 30, 118, 118)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (64, 32, 128, 127)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (64, 35, 137, 138)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (64, 37, 147, 145)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (65, 2, 6, 7)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (65, 5, 19, 19)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (65, 6, 24, 23)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (65, 13, 49, 51)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (65, 14, 56, 55)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (65, 17, 67, 67)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (65, 19, 75, 75)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (65, 21, 82, 84)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (65, 28, 111, 111)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (65, 30, 118, 118)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (66, 2, 6, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (66, 8, 30, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (66, 18, 69, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (66, 23, 91, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (66, 24, 93, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (66, 28, 111, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (66, 30, 118, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (66, 31, 121, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (66, 33, 130, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (66, 50, 192, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (67, 3, 11, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (67, 4, 14, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (67, 6, 24, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (67, 9, 35, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (67, 10, 39, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (67, 18, 69, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (67, 20, 79, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (67, 22, 88, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (67, 34, 133, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (67, 38, 149, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (68, 5, 19, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (68, 11, 43, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (68, 22, 88, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (68, 25, 97, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (68, 31, 121, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (68, 33, 130, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (68, 34, 133, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (68, 35, 137, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (68, 38, 149, 0)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (68, 50, 192, 0)
GO
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (69, 5, 19, 19)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (69, 14, 56, 56)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (69, 17, 67, 66)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (69, 21, 82, 83)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (69, 25, 97, 99)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (69, 31, 121, 124)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (69, 33, 130, 131)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (69, 37, 147, 147)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (69, 38, 149, 150)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (69, 50, 192, 192)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (70, 3, 11, 11)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (70, 4, 14, 16)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (70, 9, 35, 34)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (70, 10, 39, 40)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (70, 17, 67, 65)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (70, 18, 69, 71)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (70, 19, 75, 75)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (70, 22, 88, 88)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (70, 24, 93, 94)
INSERT [dbo].[tblHistoryDetail] ([hisID], [quesID], [correctAns], [userAns]) VALUES (70, 26, 102, 103)
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (1, N'STUDENT')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (2, N'ADMIN')
INSERT [dbo].[tblUsers] ([email], [fullname], [password], [status], [roleID]) VALUES (N'1@1', N'1', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'new', 1)
INSERT [dbo].[tblUsers] ([email], [fullname], [password], [status], [roleID]) VALUES (N'student@gmail.com', N'student', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'new', 1)
INSERT [dbo].[tblUsers] ([email], [fullname], [password], [status], [roleID]) VALUES (N'teacher@gmail.com', N'teacher', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'new', 2)
INSERT [dbo].[tblUsers] ([email], [fullname], [password], [status], [roleID]) VALUES (N'tin1@gmail.com', N'tin', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'new', 1)
INSERT [dbo].[tblUsers] ([email], [fullname], [password], [status], [roleID]) VALUES (N'tinlt@gmail.com', N'Le Thanh Tin', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'new', 1)
ALTER TABLE [dbo].[answer]  WITH CHECK ADD FOREIGN KEY([quesId])
REFERENCES [dbo].[question] ([quesId])
GO
ALTER TABLE [dbo].[question]  WITH CHECK ADD FOREIGN KEY([subId])
REFERENCES [dbo].[subject] ([subId])
GO
ALTER TABLE [dbo].[tblHistory]  WITH CHECK ADD FOREIGN KEY([email])
REFERENCES [dbo].[tblUsers] ([email])
GO
ALTER TABLE [dbo].[tblHistory]  WITH CHECK ADD FOREIGN KEY([subID])
REFERENCES [dbo].[subject] ([subId])
GO
ALTER TABLE [dbo].[tblHistoryDetail]  WITH CHECK ADD FOREIGN KEY([hisID])
REFERENCES [dbo].[tblHistory] ([hisID])
GO
ALTER TABLE [dbo].[tblHistoryDetail]  WITH CHECK ADD FOREIGN KEY([quesID])
REFERENCES [dbo].[question] ([quesId])
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
