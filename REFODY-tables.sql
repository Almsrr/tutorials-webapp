USE master
GO
IF NOT EXISTS (
    SELECT [name]
        FROM sys.databases
        WHERE [name] = N'REFODYDB'
)
CREATE DATABASE REFODYDB
GO 

USE REFODYDB
GO

IF OBJECT_ID('[dbo].[Students]', 'U') IS NOT NULL
DROP TABLE [dbo].[Students]
GO
CREATE TABLE [dbo].[Students]
(
    [Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [Name] NVARCHAR(100) NOT NULL,
    [LastName] NVARCHAR(100) NOT NULL,
    [BirthDate] DATE NOT NULL,
    [Genre] CHAR(1) NOT NULL,
    [Email] NVARCHAR(50) NOT NULL,
    [PhoneNumber] CHAR(10) NOT NULL
);
GO

IF OBJECT_ID('[dbo].[Tutor]', 'U') IS NOT NULL
DROP TABLE [dbo].[Tutor]
GO
CREATE TABLE [dbo].[Tutor]
(
    [Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [Name] NVARCHAR(100) NOT NULL,
    [LastName] NVARCHAR(100) NOT NULL,
    [BirthDate] DATE NOT NULL,
    [Genre] CHAR(1) NOT NULL,
    [Email] NVARCHAR(50) NOT NULL,
    [Address] NVARCHAR(100) NOT NULL,
    [Status] NVARCHAR(25)
);
GO

IF OBJECT_ID('[dbo].[Tutorial]', 'U') IS NOT NULL
DROP TABLE [dbo].[Tutorial]
GO
CREATE TABLE [dbo].[Tutorial]
(
    [Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [TutorId] INT NOT NULL FOREIGN KEY REFERENCES Tutor(Id),
    [Status] NVARCHAR(25) NOT NULL,
    [Duration] INT NOT NULL,
    [Price] DECIMAL(6, 2) NOT NULL,
    [Score] TINYINT NOT NULL,
    [Comment] NVARCHAR(200) NULL
);
GO