USE REFODYDB
GO

-- Create a new stored procedure called 'CreateStudent' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'CreateStudent'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.CreateStudent
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.CreateStudent
    (
        @Id int,
        @Name /*parameter name*/ NVARCHAR(100) /*datatype_for_param1*/,
    /*default_value_for_param1*/
    @LastName /*parameter name*/ NVARCHAR(100) /*datatype_for_param1*/,
    @BirthDate date,
    @Genre char(1),
    @Email NVARCHAR(50),
    @PhoneNumber char(10)
    )
/*default_value_for_param2*/
-- add more stored procedure parameters here
AS
BEGIN
    -- body of the stored procedure
    INSERT INTO Students(Name, LastName, BirthDate, Genre, Email, PhoneNumber)
VALUES (
    @Name ,@LastName ,@BirthDate 
    ,@Genre ,@Email ,@PhoneNumber)

SET @Id = SCOPE_IDENTITY()

SELECT Name = @Name, LastName=@LastName, Email=@Email, 
BirthDate=@BirthDate, Genre=@Genre, PhoneNumber=@PhoneNumber 
from Students where Id=@Id
END