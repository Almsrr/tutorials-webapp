SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[GetStudentById]
    @id /*parameter name*/ int /*datatype_for_param1*/ = 0 /*default_value_for_param1*/
-- add more stored procedure parameters here
AS
BEGIN
    -- body of the stored procedure
    SELECT * FROM Students where Id = @id
END

GO
