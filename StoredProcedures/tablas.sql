USE DB_REFODY


GO
CREATE TABLE TblPais (
	IdPais		INT		NOT NULL PRIMARY KEY IDENTITY
	,Nombre	VARCHAR(50)	NOT NULL
)

GO
CREATE TABLE TblProvincia(
	IdProvincia		INT		NOT NULL PRIMARY KEY IDENTITY
	,Nombre		VARCHAR(50)	NOT NULL
	,idPais			INT		NOT NULL	REFERENCES TblPais(idPais)
)
GO
CREATE TABLE TblMunicipio(
	IdMunicipio		INT		NOT NULL PRIMARY KEY IDENTITY
	,Nombre		VARCHAR(50)	NOT NULL
	,idProvincia	INT		NOT NULL	REFERENCES TblProvincia(idProvincia)	
)
GO
CREATE TABLE TblSector(
	IdSector		INT		NOT NULL PRIMARY KEY IDENTITY
	,Nombre		VARCHAR(50)	NOT NULL
	,idMunicipio	INT		NOT NULL	REFERENCES TblMunicipio(idMunicipio)	
)
GO
CREATE TABLE TblDatosP(
	idDatosP		INT		NOT NULL	PRIMARY KEY IDENTITY
	,Nombre		VARCHAR(50)	NOT NULL
	,Apellido	VARCHAR(30)	NOT NULL
	,FN				DATE	NULL	
	,Sexo		CHAR(1)		NOT NULL
	,Correo		VARCHAR(50)	NOT NULL	
	,Telefono	CHAR(10)	NOT NULL
)
GO
CREATE TABLE TblTipoDoc (
	IdTipoD			INT		NOT NULL PRIMARY KEY IDENTITY
	,NombreDoc	VARCHAR(30)	NOT NULL
)
GO
CREATE TABLE TblTutor(
	IdTutor		INT		NOT NULL	PRIMARY KEY IDENTITY
	,IdTipoD	INT		NOT NULL	REFERENCES TblTipoDoc(IdTipoD)
	,NumeroDoc	BIGINT	NOT NULL	UNIQUE
	,IdSector	INT		NOT NULL	REFERENCES TblSector(IdSector)
	,Calle	VARCHAR(100)	NOT NULL	
	,Estado		BIT		NOT NULL	DEFAULT(1)
)
GO

CREATE TABLE TblDia(
	idDia 			INT		NOT NULL	PRIMARY KEY IDENTITY
	,Dia		VARCHAR(10)	NOT NULL
	)
GO
CREATE TABLE TblTutorHorario (
	IdTH		INT		NOT NULL	PRIMARY KEY IDENTITY
	,IdTutor	INT		NOT NULL	REFERENCES TblTutor(IdTutor)
	,Dia		INT		NOT NULL	REFERENCES TblDia(IdDia)
	,Estado		BIT		NOT NULL	DEFAULT(1)
)
GO

CREATE TABLE TblHorarioHora (
	IdHH		INT		NOT NULL	PRIMARY KEY IDENTITY
	,IdTH		INT		NOT NULL	REFERENCES TblTutorHorario(IdTH)
	,Estado		BIT		NOT NULL	DEFAULT(1)
	,inicio		TIME	NOT NULL
	,fin		TIME	NOT NULL
)
GO
CREATE TABLE	TblMateria(
	IdMateria		INT		NOT NULL PRIMARY KEY IDENTITY
	,Materia	VARCHAR(50)	NOT NULL
)
GO
CREATE TABLE TblTema(
	Idtema			INT		NOT NULL PRIMARY KEY IDENTITY
	,Tema		VARCHAR(100)	NOT NULL
	,idMateria		INT		NOT NULL	REFERENCES TblMateria(idMateria)	
)
GO
CREATE TABLE TblSubTema(
	IdSubTema		INT		NOT NULL PRIMARY KEY IDENTITY
	,SubTema	VARCHAR(100)	NOT NULL
	,idTema			INT		NOT NULL	REFERENCES TblTema(idTema)	
)
GO
CREATE TABLE	TblTipoEstado(
	IdtipoE		INT		NOT NULL PRIMARY KEY IDENTITY
	,Tipo	VARCHAR(20)	NOT NULL
)
GO
CREATE TABLE TblEstado(
	IdEstado		INT		NOT NULL PRIMARY KEY IDENTITY
	,Estado		VARCHAR(20)	NOT NULL
	,idTipoE		INT		NOT NULL	REFERENCES TblTipoEstado(idTipoE)	
)
GO

CREATE TABLE TblTutorTema  (
	idTT		INT		NOT NULL	PRIMARY KEY IDENTITY
	,IdTema		INT		NOT NULL	REFERENCES TblTema(IdTema)
	,IdEstado	INT		NOT NULL	REFERENCES TblEstado(IdEstado)
	,Precio	DECIMAL(6,2)	NOT NULL	
	,Fecha	DATETIME	NOT NULL	
	)
GO
CREATE TABLE TblTipoUsuario(
	IdTipoU		INT		NOT NULL	PRIMARY KEY	IDENTITY 
	,tipo	VARCHAR(30)	NOT NULL	
)
GO
CREATE TABLE	TblUsuario(
	IdUsuario		INT		NOT NULL	PRIMARY KEY IDENTITY
	,IdTipoU		INT		NOT NULL	REFERENCES TblTipoUsuario(IdtipoU)
	,IdDatosP		INT		NOT NULL	REFERENCES TblDatosP(IdDatosP) UNIQUE(IdTipoU)
	,Usuario	VARCHAR(15)	NOT NULL	UNIQUE
	,Contrase?a	VARCHAR(20)	NOT NULL	
	,Estado			BIT		NOT NULL	DEFAULT(1)
	,FechaRegistro	DATE	NOT NULL	DEFAULT(GETDATE())
)
GO
CREATE TABLE Tbltutoria(
	IdTutoria		INT		NOT NULL	PRIMARY KEY IDENTITY
	,IdUsuario		INT		NOT NULL	REFERENCES TblUsuario(IdUsuario)
	,IdTT			INT		NOT NULL	REFERENCES	tblTutorTema(IdTT)
	,IdEstado		INT		NOT NULL	REFERENCES	TblEstado(IdEstado)
	,Fecha		DATETIME	NOT NULL	
	,Duracion		INT		NOT NULL	DEFAULT(45) ---
	,Precio	   DECIMAL(6,2)	NOT NULL
	,Calificacion	TINYINT		NULL
	,Rese?a		VARCHAR(500)	NULL
)
GO
CREATE TABLE TblTutoriaDetalle  (
	IdTD			INT		NOT NULL	PRIMARY KEY IDENTITY
	,IdTutoria		INT		NOT NULL	REFERENCES TblTutoria(IdTutoria)
	,IdSubTema		INT		NOT NULL	REFERENCES	TblSubTema(IdSubTema)
	,IdEstado		BIT		NOT NULL	DEFAULT(1)
)
GO
