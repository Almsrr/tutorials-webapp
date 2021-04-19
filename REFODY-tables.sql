-- Create a new database called 'REFODYDB'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT [name]
        FROM sys.databases
        WHERE [name] = N'REFODYDB'
)
CREATE DATABASE REFODYDB
GO 

USE REFODYDB
GO

-- Create a new table called '[Country]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Country]', 'U') IS NOT NULL
DROP TABLE [dbo].[Country]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Country]
(
    [Id] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [Name] NVARCHAR(50) NOT NULL,
    -- Specify more columns here
);
GO


-- Create a new table called '[Province]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Province]', 'U') IS NOT NULL
DROP TABLE [dbo].[Province]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Province]
(
    [Id] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [Name] NVARCHAR(50) NOT NULL,
    [CountryID] INT NOT NULL FOREIGN KEY REFERENCES Country(Id)
    -- Specify more columns here
);
GO


-- Create a new table called '[City]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Town]', 'U') IS NOT NULL
DROP TABLE [dbo].[City]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[City]
(
    [Id] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [Name] NVARCHAR(50) NOT NULL,
    [ProvinceId] INT NOT NULL FOREIGN KEY REFERENCES Province(Id)
    -- Specify more columns here
);
GO


-- Create a new table called '[Town]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Town]', 'U') IS NOT NULL
DROP TABLE [dbo].[Town]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Town]
(
    [Id] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [Name] NVARCHAR(50) NOT NULL,
    [ProvinceId] INT NOT NULL FOREIGN KEY REFERENCES City(Id)
    -- Specify more columns here
);
GO


-- Create a new table called '[Students]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Students]', 'U') IS NOT NULL
DROP TABLE [dbo].[Students]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Students]
(
    [Id] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [Name] NVARCHAR(100) NOT NULL,
    [LastName] NVARCHAR(100) NOT NULL,
    [BirthDate] DATE NOT NULL,
    [Genre] CHAR(1) NOT NULL,
    [Email] NVARCHAR(50) NOT NULL,
    [PhoneNumber] CHAR(10) NOT NULL
    -- Specify more columns here
);
GO


-- Create a new table called '[TableName]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[DocumentType]', 'U') IS NOT NULL
DROP TABLE [dbo].[DocumentType]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[DocumentType]
(
    [Id] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [Name] NVARCHAR(50) NOT NULL,
    -- Specify more columns here
);
GO


-- Create a new table called '[Tutor]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Tutor]', 'U') IS NOT NULL
DROP TABLE [dbo].[Tutor]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Tutor]
(
    [Id] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [DocumentTypeId] INT NOT NULL FOREIGN KEY REFERENCES DocumentType(Id),
    [DocumentNo] BIGINT NOT NULL UNIQUE,
    [TownId] INT NOT NULL FOREIGN KEY REFERENCES Town(Id),
    [Street] NVARCHAR(100) NOT NULL,
    [Status] NVARCHAR(25) 
    -- Specify more columns here
);
GO


-- Create a new table called '[Day]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Day]', 'U') IS NOT NULL
DROP TABLE [dbo].[Day]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Day]
(
    [Id] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [Name] NVARCHAR(10) NOT NULL,
    -- Specify more columns here
);
GO


-- Create a new table called '[TutoSchedule]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[TutorSchedule]', 'U') IS NOT NULL
DROP TABLE [dbo].[TutorSchedule]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[TutorSchedule]
(
    [Id] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [TutorId] INT NOT NULL FOREIGN KEY REFERENCES Tutor(Id),
    [Day] INT NOT NULL FOREIGN KEY REFERENCES Day(Id),
    [Status] NVARCHAR(25) NOT NULL
    -- Specify more columns here
);
GO

-- Create a new table called '[ScheduleTime]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[ScheduleTime]', 'U') IS NOT NULL
DROP TABLE [dbo].[ScheduleTime]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[ScheduleTime]
(
    [Id] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [Start] TIME NOT NULL,
    [Finish] TIME NOT NULL,
    [Status] NVARCHAR(25) NOT NULL,
    [TutorScheduleId] INT NOT NULL FOREIGN KEY REFERENCES TutorSchedule(Id)
    -- Specify more columns here
);
GO

-- Create a new table called '[Subject]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Subject]', 'U') IS NOT NULL
DROP TABLE [dbo].[Subject]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Subject]
(
    [Id] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [Code] CHAR(5) NOT NULL,
    [Name] NVARCHAR(50) NOT NULL
    -- Specify more columns here
);
GO

-- Create a new table called '[Topic]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Topic]', 'U') IS NOT NULL
DROP TABLE [dbo].[Topic]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Topic]
(
    [Id] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [Title] NVARCHAR(100) NOT NULL,
    [SubjectId] INT NOT NULL FOREIGN KEY REFERENCES Subject(Id)
    -- Specify more columns here
);
GO

-- Create a new table called '[SubTopic]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[SubTopic]', 'U') IS NOT NULL
DROP TABLE [dbo].[SubTopic]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[SubTopic]
(
    [Id] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [Title] NVARCHAR(100) NOT NULL
    -- Specify more columns here
);
GO

-- Create a new table called '[UserType]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[UserType]', 'U') IS NOT NULL
DROP TABLE [dbo].[UserType]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[UserType]
(
    [Id] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [Name] NVARCHAR(50) NOT NULL,
    -- Specify more columns here
);
GO

-- Create a new table called '[User]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[User]', 'U') IS NOT NULL
DROP TABLE [dbo].[User]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[User]
(
    [Id] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [UserTypeId] INT NOT NULL FOREIGN KEY REFERENCES UserType(Id),
    [Username] NVARCHAR(50) NOT NULL UNIQUE,
    [Password] NVARCHAR(50) NOT NULL,
    [Status] NVARCHAR(25) NOT NULL,
    [RegistrationDate] DATE NOT NULL DEFAULT(GETDATE())
    -- Specify more columns here
);
GO

-- Create a new table called '[Tutorial]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Tutorial]', 'U') IS NOT NULL
DROP TABLE [dbo].[Tutorial]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Tutorial]
(
    [Id] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [TutorId] INT NOT NULL FOREIGN KEY REFERENCES Tutor(Id),
    [Status] NVARCHAR(25) NOT NULL,
    [Duration] INT NOT NULL,
    [Price] DECIMAL(6, 2) NOT NULL,
    [Score] TINYINT NOT NULL,
    [Comment] NVARCHAR(200) NULL
    -- Specify more columns here
);
GO