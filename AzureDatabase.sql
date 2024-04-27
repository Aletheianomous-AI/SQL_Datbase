-- Creating Login Table
CREATE TABLE dbo.Login (
    UserID INT PRIMARY KEY,
    Email VARCHAR(255) NOT NULL,
    Age INT,
    Password VARBINARY(MAX)
);

-- Creating Citation Table
CREATE TABLE dbo.Citation (
    CitationID INT PRIMARY KEY,
    Link VARCHAR(MAX) NOT NULL
);

-- Creating Chat_History Table
CREATE TABLE dbo.Chat_History (
    ChatID INT PRIMARY KEY,
    Chat_Content TEXT NOT NULL,
    Belongs_To_Bot BIT NOT NULL,
    Time_Of_Output DATETIME NOT NULL
);

-- Creating Conversations Table
CREATE TABLE dbo.Conversation (
    ConversationID INT PRIMARY KEY,
    ConversationName NVARCHAR(255) NOT NULL,
    UserID INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES dbo.Login(UserID)
);

-- Creating Chat_Conversation Table
CREATE TABLE dbo.Chat_Conversation (
    ChatID INT NOT NULL,
    UserID INT NOT NULL,
    ConversationID INT,
    PRIMARY KEY (ChatID, UserID),
    FOREIGN KEY (ChatID) REFERENCES dbo.Chat_History(ChatID),
    FOREIGN KEY (UserID) REFERENCES dbo.Login(UserID),
    FOREIGN KEY (ConversationID) REFERENCES dbo.Conversation(ConversationID)
);

-- Creating Citation_Chat_History Table
CREATE TABLE dbo.Citation_Chat_History (
    CitationID INT,
    ChatID INT,
    Surrogate_Key INT PRIMARY KEY,
    FOREIGN KEY (CitationID) REFERENCES dbo.Citation(CitationID),
    FOREIGN KEY (ChatID) REFERENCES dbo.Chat_History(ChatID)
);

-- Creating Email2FA Table
CREATE TABLE dbo.Email2FA (
	UserID INT NOT NULL UNIQUE,
	EncryptedAuthCode VARCHAR(30) NOT NULL,
	TimeGenerated DATETIME NOT NULL,
	FOREIGN KEY (UserID) REFERENCES dbo.Login(UserID)
)
