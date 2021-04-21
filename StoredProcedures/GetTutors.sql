-- Create a new stored procedure called 'GetTutors' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'GetTutors'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.GetTutors
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.GetTutors
-- add more stored procedure parameters here
AS
BEGIN
    -- body of the stored procedure
    SELECT * FROM Tutor;
END
GO