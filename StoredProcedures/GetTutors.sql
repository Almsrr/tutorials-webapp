IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'GetTutors'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.GetTutors
GO
CREATE PROCEDURE dbo.GetTutors
AS
BEGIN
    SELECT * FROM Tutor;
END
GO