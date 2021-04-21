SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[UpdateStudent]
    @id INT,
    @name /*parameter name*/ NVARCHAR(100) /*datatype_for_param1*/ = 0, /*default_value_for_param1*/
    @lastName /*parameter name*/ NVARCHAR(100) /*datatype_for_param1*/ = 0, /*default_value_for_param2*/
    @birthDate /*parameter name*/ DATE /*datatype_for_param1*/ , /*default_value_for_param2*/
    @genre /*parameter name*/ CHAR(1) /*datatype_for_param1*/ = 0, /*default_value_for_param2*/
    @email /*parameter name*/ NVARCHAR(50) /*datatype_for_param1*/ = 0, /*default_value_for_param2*/
    @phoneNumber /*parameter name*/ CHAR(11) /*datatype_for_param1*/ = 0 /*default_value_for_param2*/
-- add more stored procedure parameters here
AS
BEGIN
    -- body of the stored procedure
    -- Update rows in table '[Students]' in schema '[dbo]'
    UPDATE [dbo].[Students]
    SET
        [Name] = @name,
        [LastName] = @lastName,
        [BirthDate] = @birthDate,
        [Genre] = @genre,
        [Email] = @email,
        [PhoneNumber] = @phoneNumber 
        -- Add more columns and values here
    WHERE Id = @id/* add search conditions here */
END

GO
