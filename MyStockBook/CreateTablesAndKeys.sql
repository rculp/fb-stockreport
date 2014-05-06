CREATE TABLE [dbo].[Event](
	[EventID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[RecurringTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[RecurringType](
	[RecurringTypeID] [int] NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RecurringType] PRIMARY KEY CLUSTERED 
(
	[RecurringTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Transaction](
	[TransactionID] [int] NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[TransactionTypeID] [int] NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[Symbol] [nvarchar](50) NOT NULL,
	[Shares] [int] NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[TransactionType](
	[TransactionTypeID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TransactionType] PRIMARY KEY CLUSTERED 
(
	[TransactionTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[User](
	[UserID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[UserEvent](
	[UserEventID] [int] NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[EventID] [int] NOT NULL,
 CONSTRAINT [PK_UserEvent] PRIMARY KEY CLUSTERED 
(
	[UserEventID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_RecurringType] FOREIGN KEY([RecurringTypeID])
REFERENCES [dbo].[RecurringType] ([RecurringTypeID])
GO

ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_RecurringType]
GO

ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_TransactionType] FOREIGN KEY([TransactionTypeID])
REFERENCES [dbo].[TransactionType] ([TransactionTypeID])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_TransactionType]
GO

ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_User]
GO

ALTER TABLE [dbo].[UserEvent]  WITH CHECK ADD  CONSTRAINT [FK_UserEvent_Event] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
GO

ALTER TABLE [dbo].[UserEvent] CHECK CONSTRAINT [FK_UserEvent_Event]
GO

ALTER TABLE [dbo].[UserEvent]  WITH CHECK ADD  CONSTRAINT [FK_UserEvent_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO

ALTER TABLE [dbo].[UserEvent] CHECK CONSTRAINT [FK_UserEvent_User]
GO