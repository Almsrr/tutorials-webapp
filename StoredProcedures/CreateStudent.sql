USE REFODYDB
GO

IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'CreateStudent'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.CreateStudent
GO
CREATE PROCEDURE dbo.CreateStudent
    (
        @Id int,
        @Name  NVARCHAR(100),
        @LastName  NVARCHAR(100),
        @BirthDate date,
        @Genre char(1),
        @Email NVARCHAR(50),
        @PhoneNumber char(10)
    )
AS
BEGIN
    INSERT INTO Students(Name, LastName, BirthDate, Genre, Email, PhoneNumber)
VALUES (
    @Name ,@LastName ,@BirthDate 
    ,@Genre ,@Email ,@PhoneNumber)

SET @Id = SCOPE_IDENTITY()

SELECT Name = @Name, LastName=@LastName, Email=@Email, 
BirthDate=@BirthDate, Genre=@Genre, PhoneNumber=@PhoneNumber 
from Students where Id=@Id
END