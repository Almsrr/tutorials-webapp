SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetStudentById]
    @id int = 0
AS
BEGIN
    SELECT * FROM Students where Id = @id
END

GO
