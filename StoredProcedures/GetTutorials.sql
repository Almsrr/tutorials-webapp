-- Create a new stored procedure called 'GetTutorials' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'GetTutorials'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.GetTutorials
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.GetTutorials
-- add more stored procedure parameters here
AS
BEGIN
    -- body of the stored procedure
    SELECT * FROM Tutorial;
END
GO