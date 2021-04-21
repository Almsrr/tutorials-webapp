USE TutorialsDB

GO
CREATE PROCEDURE SP_DATOSP_INSERT
	 @Nombre VARCHAR(50)
	 ,@Apellido	VARCHAR(30)
	 ,@FechaNac	DATE
	 ,@Sexo		CHAR(1)
	 ,@Correo VARCHAR(50)
	 ,@Telefono	CHAR(10)
AS
BEGIN
	INSERT INTO TblDatosP (Nombre,FN,Sexo,Correo,Telefono,Apellido)
		VALUES(@Nombre,@FechaNac,@Sexo,@Correo,@Telefono,@Apellido)
END
GO
CREATE PROCEDURE SP_DATOSP_UPDATE
	 @idDatosp	INT
	 ,@Nombre VARCHAR(50)
	 ,@Apellido	VARCHAR(30)
	 ,@FechaNac	DATE
	 ,@Sexo		CHAR(1)
	 ,@Correo VARCHAR(50)
	 ,@Telefono	CHAR(10)
AS
BEGIN
	UPDATE TblDatosP
	SET
		Nombre = @Nombre
		,Apellido = @apellido
		,FN = @fechaNac
		,Sexo = @Sexo
		,Correo = @Correo
		,Telefono = @Telefono
	WHERE
		IdDatosP= @idDatosP
END
GO
------Direccion -------------
CREATE PROCEDURE SP_PAIS_INSERT 
	@Nombre VARCHAR(50)
AS
INSERT INTO TblPais (Nombre) VALUES (@Nombre)
GO

CREATE PROCEDURE SP_PROVINCIA_INSERT 
	@Nombre VARCHAR(50)
	,@Pais	INT
AS
INSERT INTO TblPais (Nombre,idPais)
	VALUES (@Nombre,@Pais)
GO

CREATE PROCEDURE SP_SECTOR_INSERT 
	@Nombre VARCHAR(50)
	,@Municipio	INT
AS
INSERT INTO TblSector (Nombre,idMunicipio) 
	VALUES (@Nombre,@Municipio)
GO

CREATE PROCEDURE SP_MUNICIPIO_INSERT 
	@Nombre VARCHAR(50)
	,@Provincia	INT
AS
INSERT INTO  TblMunicipio (Nombre,idProvincia) 
	VALUES (@Nombre,@Provincia)
GO

CREATE PROCEDURE SP_MATERIA_INSERT 
	@Materia VARCHAR(50)
AS
INSERT INTO TblMateria (Materia) VALUES (@Materia)
GO

CREATE PROCEDURE SP_TEMA_INSERT 
	@Tema VARCHAR(100)
	,@Materia	INT
AS
INSERT INTO TblTema (Tema,idMateria) 
	VALUES (@Tema,@Materia)
GO


CREATE PROCEDURE SP_SUBTEMA_INSERT 
	@Subtema VARCHAR(50)
	,@Tema		INT
AS
INSERT INTO TblSubTema (Subtema,idTema) 
	VALUES (@Subtema,@Tema)
GO

CREATE PROCEDURE SP_ESTADO_INSERT 
	@Estado VARCHAR(50)
	,@TipoE		INT
AS
INSERT INTO TblEstado (Estado,idTipoE) 
	VALUES (@Estado,@TipoE)
GO

CREATE PROCEDURE SP_TIPOE_INSERT 
	@TIPO VARCHAR(20)
AS
INSERT INTO TblTipoEstado(Tipo) VALUES (@TIPO)
GO

CREATE PROCEDURE SP_TIPOU_INSERT 
	@TIPO VARCHAR(30)
AS
INSERT INTO TblTipoUsuario(Tipo) VALUES (@TIPO)
GO

CREATE PROCEDURE SP_TIPOD_INSERT 
	@TIPO VARCHAR(30)
AS
INSERT INTO TblTipoDoc(NombreDoc) VALUES (@TIPO)
GO

CREATE PROCEDURE SP_DIA_INSERT 
	@DIA VARCHAR(10)
AS
INSERT INTO TblDia(Dia) VALUES (@DIA)
GO
