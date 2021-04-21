-- Create a new stored procedure called 'CreateTutor' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'CreateTutor'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.CreateTutor
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.CreateTutor
    (
        @Id int,
        @Name /*parameter name*/ NVARCHAR(100) /*datatype_for_param1*/,
    /*default_value_for_param1*/
    @LastName /*parameter name*/ NVARCHAR(100) /*datatype_for_param1*/,
    @BirthDate date,
    @Genre char(1),
    @Email NVARCHAR(50),
    @Address NVARCHAR(100),
    @Status NVARCHAR(25)
    )
/*default_value_for_param2*/
-- add more stored procedure parameters here
AS
BEGIN
    -- body of the stored procedure
    INSERT INTO Tutor(Name, LastName, BirthDate, Genre, Email, Address, Status)
VALUES (
    @Name ,@LastName ,@BirthDate 
    ,@Genre ,@Email ,@Address, @Status)

SET @Id = SCOPE_IDENTITY()

SELECT Name = @Name, LastName=@LastName, Email=@Email, 
BirthDate=@BirthDate, Genre=@Genre, Address=@Address, Status=@Status
from Tutor where Id=@Id
END