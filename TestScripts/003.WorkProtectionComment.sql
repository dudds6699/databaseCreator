use [#dbname]
GO

/****** Object:  Table [dbo].[WorkProtectionComment]    Script Date: 7/13/2014 8:06:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[WorkProtectionComment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WorkNumber] [int] NULL,
	[WorkStatus] [nvarchar](300) NULL,
	[WorkHolder] [nvarchar](300) NULL,
	[WorkTempGrounds] [nvarchar](300) NULL,
	[WorkProtectionType] [int] NOT NULL,
 CONSTRAINT [PK__WorkProe__3214EC274EE23D6B] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[WorkProtectionComment]  WITH CHECK ADD  CONSTRAINT [FK_WorkProtectionComment_WorkProtectionType] FOREIGN KEY([WorkProtectionType])
REFERENCES [dbo].[WorkProtectionType] ([ID])
GO

ALTER TABLE [dbo].[WorkProtectionComment] CHECK CONSTRAINT [FK_WorkProtectionComment_WorkProtectionType]
GO