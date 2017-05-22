/****** Object:  Table [dbo].[DailyLog]    Script Date: 7/13/2014 8:11:59 PM ******/
use [#dbname]
GO

SET ANSI_NULLS ON
GO

/****** Object:  Table [dbo].[DailyLog]    Script Date: 7/13/2014 8:11:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DayLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	--[TimeCreated] [datetime] NOT NULL,
	[Category] [int] NOT NULL,
	[LocationAuthority] [int] NOT NULL,
	[Comments] [text] NOT NULL,
	[WorkProtectionComment] [int] NULL,
	--[CreatedBy] NVARCHAR(200) null,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[DayLog]  WITH CHECK ADD  CONSTRAINT [FK_DayLog_Category] FOREIGN KEY([Category])
REFERENCES [dbo].[Category] ([ID])
GO

ALTER TABLE [dbo].[DayLog] CHECK CONSTRAINT [FK_DayLog_Category]
GO

ALTER TABLE [dbo].[DayLog]  WITH CHECK ADD  CONSTRAINT [FK_DayLog_LocationAuthority] FOREIGN KEY([LocationAuthority])
REFERENCES [dbo].[LocationAuthority] ([ID])
GO

ALTER TABLE [dbo].[DayLog] CHECK CONSTRAINT [FK_DayLog_LocationAuthority]
GO

ALTER TABLE [dbo].[DayLog]  WITH CHECK ADD  CONSTRAINT [FK_DayLog_WorkProtectionComment] FOREIGN KEY([WorkProtectionComment])
REFERENCES [dbo].[WorkProtectionComment] ([ID])
GO

ALTER TABLE [dbo].[DayLog] CHECK CONSTRAINT [FK_DayLog_WorkProtectionComment]
GO