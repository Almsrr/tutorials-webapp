SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'UpdateTutorial'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.UpdateTutorial
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[UpdateTutorial]
    @id int,
    @tutorId INT,
    @status NVARCHAR(25),
    @duration INT,
    @price DECIMAL(6, 2),
    @score TINYINT,
    @comment NVARCHAR(200)
-- add more stored procedure parameters here
AS
BEGIN
    -- body of the stored procedure
    -- Update rows in table '[Tutorial]' in schema '[dbo]'
    UPDATE [dbo].[Tutorial]
    SET
        [TutorId] = @tutorId,
        [Status] = @status,
        [Duration] = @duration,
        [Price] = @price,
        [Score] = @score,
        [Comment] = @comment
        -- Add more columns and values here
    WHERE Id = @id/* add search conditions here */
END

GO
