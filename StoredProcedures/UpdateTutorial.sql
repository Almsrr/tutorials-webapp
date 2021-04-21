IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'UpdateTutorial'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.UpdateTutorial
GO
CREATE PROCEDURE [dbo].[UpdateTutorial]
    @id int,
    @tutorId INT,
    @status NVARCHAR(25),
    @duration INT,
    @price DECIMAL(6, 2),
    @score TINYINT,
    @comment NVARCHAR(200)
AS
BEGIN
    UPDATE [dbo].[Tutorial]
    SET
        [TutorId] = @tutorId,
        [Status] = @status,
        [Duration] = @duration,
        [Price] = @price,
        [Score] = @score,
        [Comment] = @comment
    WHERE Id = @id
END

GO
