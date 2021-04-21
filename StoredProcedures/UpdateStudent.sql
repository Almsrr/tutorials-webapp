SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateStudent]
    @id INT,
    @name NVARCHAR(100) = 0, 
    @lastName NVARCHAR(100) = 0, 
    @birthDate DATE , 
    @genre CHAR(1) = 0, 
    @email NVARCHAR(50) = 0, 
    @phoneNumber CHAR(11) = 0 
AS
BEGIN
    UPDATE [dbo].[Students]
    SET
        [Name] = @name,
        [LastName] = @lastName,
        [BirthDate] = @birthDate,
        [Genre] = @genre,
        [Email] = @email,
        [PhoneNumber] = @phoneNumber 
    WHERE Id = @id
END

GO
