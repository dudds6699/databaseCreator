
use [#dbname]
GO

/****** Object:  Table [dbo].[Revision]    Script Date: 7/22/2014 4:43:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Revision](
	[ID] [int] NOT NULL,
	[CreatedBy] [nchar](200) NOT NULL,
	[LogID] [int] NOT NULL,
	[DayLogID] [int] NOT NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Revision]  WITH CHECK ADD  CONSTRAINT [FK_Revision_DayLog] FOREIGN KEY([DayLogID])
REFERENCES [dbo].[DayLog] ([ID])
GO

ALTER TABLE [dbo].[Revision] CHECK CONSTRAINT [FK_Revision_DayLog]
GO

ALTER TABLE [dbo].[Revision]  WITH CHECK ADD  CONSTRAINT [FK_Revision_Log] FOREIGN KEY([LogID])
REFERENCES [dbo].[Log] ([ID])
GO

ALTER TABLE [dbo].[Revision] CHECK CONSTRAINT [FK_Revision_Log]
GO
