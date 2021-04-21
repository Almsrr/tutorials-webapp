-- Create a new stored procedure called 'GetStudents' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'GetStudents'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.GetStudents
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.GetStudents
-- add more stored procedure parameters here
AS
BEGIN
    -- body of the stored procedure
    SELECT * FROM Students;
END
GO