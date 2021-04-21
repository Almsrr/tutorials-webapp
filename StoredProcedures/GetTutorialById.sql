SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'GetTutorialById'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.GetTutorialById
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[GetTutorialById]
    @id /*parameter name*/ int /*datatype_for_param1*/ = 0 /*default_value_for_param1*/
-- add more stored procedure parameters here
AS
BEGIN
    -- body of the stored procedure
    SELECT * FROM Tutorial where Id = @id
END

GO
