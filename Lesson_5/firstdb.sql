USE [master]
GO
CREATE DATABASE [CopyFirstDB]

GO
USE [CopyFirstDB]
GO
/****** Object:  Table [dbo].[students]    Script Date: 5/31/2020 9:18:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](40) NOT NULL,
	[Age] [int] NULL,
	[DateOfBirth] [date] NOT NULL,
 CONSTRAINT [PK_students] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[students] ON 

INSERT [dbo].[students] ([ID], [Name], [LastName], [Age], [DateOfBirth]) VALUES (1, N'Andrew', N'Kavyn', 17, CAST(N'2000-12-12' AS Date))
INSERT [dbo].[students] ([ID], [Name], [LastName], [Age], [DateOfBirth]) VALUES (2, N'Andrew', N'Szemha', 17, CAST(N'2000-12-01' AS Date))
INSERT [dbo].[students] ([ID], [Name], [LastName], [Age], [DateOfBirth]) VALUES (3, N'Andrew', N'Veret', 17, CAST(N'2000-06-06' AS Date))
INSERT [dbo].[students] ([ID], [Name], [LastName], [Age], [DateOfBirth]) VALUES (4, N'Oksana', N'Vernuk', 20, CAST(N'2000-01-01' AS Date))
INSERT [dbo].[students] ([ID], [Name], [LastName], [Age], [DateOfBirth]) VALUES (5, N'Olecksandra', N'Shapirko', 17, CAST(N'2002-02-02' AS Date))
INSERT [dbo].[students] ([ID], [Name], [LastName], [Age], [DateOfBirth]) VALUES (6, N'Maks', N'Gurun', 17, CAST(N'2002-04-05' AS Date))
INSERT [dbo].[students] ([ID], [Name], [LastName], [Age], [DateOfBirth]) VALUES (7, N'Mukola', N'Lutko', 22, CAST(N'1991-12-12' AS Date))
INSERT [dbo].[students] ([ID], [Name], [LastName], [Age], [DateOfBirth]) VALUES (8, N'Valentuna', N'Prisaznyk', NULL, CAST(N'1991-12-13' AS Date))
SET IDENTITY_INSERT [dbo].[students] OFF
GO
USE [master]
GO
ALTER DATABASE [FirstDB] SET  READ_WRITE 
GO
