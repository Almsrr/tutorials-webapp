-- Create a new stored procedure called 'CreateTutorial' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'CreateTutorial'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.CreateTutorial
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.CreateTutorial
    (
        @Id int,
        @TutorId INT,
        @Status NVARCHAR(25),
        @Duration INT,
        @Price DECIMAL(6, 2),
        @Score TINYINT,
        @Comment NVARCHAR(200)
    )
/*default_value_for_param2*/
-- add more stored procedure parameters here
AS
BEGIN
    -- body of the stored procedure
    INSERT INTO Tutorial(TutorId, Status, Duration, Price, Score, Comment)
VALUES (
    @TutorId, @Status, @Duration, @Price, @Score, @Comment)

SET @Id = SCOPE_IDENTITY()

SELECT TutorId=@TutorId, Status=@Status, Duration=@Duration, Price=@Price, Score=@Score, Comment=@Comment
from Tutorial where Id=@Id
END