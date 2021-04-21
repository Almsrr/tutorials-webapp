USE DB_REFODY

GO
/*
CREATE FUNCTION F_CIFRAR (@PASS VARCHAR(20)) 
RETURNS VARCHAR(20)
AS
BEGIN
	DECLARE @CIFRADO VARCHAR(20)
	SET @CIFRADO = @PASS
	RETURN @CIFRADO
END
*/
CREATE PROCEDURE SP_USUARIO_INSERT @IdTipo INT, @idDatosP INT, @Usuario VARCHAR(15),@pass VARCHAR(20)
AS 
BEGIN 
	INSERT INTO  TblUsuario (IdTipoU,IdDatosP,Usuario,Contraseña) 
		VALUES(@IdTipo,@idDatosP,@Usuario,@pass)
END
GO
CREATE PROCEDURE SP_USUARIO_UPDATE
	  @IdUser		INT
	, @IdTipo		INT		
	, @idDatosP		INT		
	, @Usuario VARCHAR(15)	
	, @pass		VARCHAR(20)	
AS 
BEGIN 
	UPDATE TblUsuario
	SET 
		IdDatosP = @idDatosp
		,IdTipoU =@IdTipo
		,Usuario = @Usuario
		,Contraseña = @pass
	WHERE 
		IdUsuario= @IdUser
END
GO
CREATE PROCEDURE SP_USUARIO_DELETE @IdUser	INT
	AS
	BEGIN
		UPDATE TblUsuario
		SET
			Estado = 0
		WHERE 
			IdUsuario = @IdUser
	END
GO
