IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'CreateTutor'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.CreateTutor
GO

CREATE PROCEDURE dbo.CreateTutor
    (
        @Id int,
        @Name NVARCHAR(100),
        @LastName NVARCHAR(100),
        @BirthDate date,
        @Genre char(1),
        @Email NVARCHAR(50),
        @Address NVARCHAR(100),
        @Status NVARCHAR(25)
    )
AS
BEGIN
    INSERT INTO Tutor(Name, LastName, BirthDate, Genre, Email, Address, Status)
VALUES (
    @Name ,@LastName ,@BirthDate 
    ,@Genre ,@Email ,@Address, @Status)

SET @Id = SCOPE_IDENTITY()

SELECT Name = @Name, LastName=@LastName, Email=@Email, 
BirthDate=@BirthDate, Genre=@Genre, Address=@Address, Status=@Status
from Tutor where Id=@Id
END