USE Clamaroj
GO

SELECT * FROM dbo.Clientes
GO
CREATE PROCEDURE dbo.ClientesUPD
    @Id int out,
    @IdUsuario int,
    @Nombre varchar(50),
    @Apellido varchar(50),
    @Correo varchar(50),
    @FechaNacimiento datetime,
    @Foto TEXT,
    @Password varchar(MAX),
    @IdStatus int,
    @Rfc varchar(13),
    @Direccion varchar(255),
    @Telefono varchar(10)
AS
BEGIN
    SET NOCOUNT ON;
	DECLARE @IdRoles int = 2
    IF EXISTS(SELECT * FROM dbo.Clientes WHERE IdCliente = @Id)
    BEGIN
        UPDATE dbo.Clientes
        SET Rfc = @Rfc,
            Direccion = @Direccion,
            Telefono = @Telefono
        WHERE IdCliente = @Id

        EXEC dbo.UsuariosUPD @IdUsuario, @Nombre, @Apellido, @Correo, @FechaNacimiento, @Foto, @IdStatus, @Password, @IdRoles
    END
    ELSE
    BEGIN
        EXEC dbo.UsuariosUPD @IdUsuario out, @Nombre, @Apellido, @Correo, @FechaNacimiento, @Foto, @IdStatus, @Password, @IdRoles

		DECLARE @IdUser int = (select MAX(Id) from dbo.Usuarios)

        INSERT INTO dbo.Clientes(Rfc,Direccion,Telefono,IdUsuario)
        VALUES(@Rfc,@Direccion,@Telefono,@IdUser)
    END
END

GO

CREATE PROCEDURE dbo.ClientesDEL
    @Id int
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @IdUsuario int
    SELECT @IdUsuario = IdUsuario FROM dbo.Clientes WHERE IdCliente = @Id
    UPDATE dbo.Usuarios SET IdStatus = 2 WHERE Id = @IdUsuario

    DELETE FROM dbo.Clientes WHERE IdCliente = @Id
END

GO
CREATE FUNCTION dbo.fxGetClientes()
RETURNS TABLE
AS
RETURN
(
    SELECT
        C.IdCliente as idCliente,
        U.Nombre as nombre,
        U.Apellido as apellido,
        U.Correo as correo,
        U.FechaNacimiento as fechaNacimiento,
        U.Foto as foto,
        U.IdStatus as idStatus,
        C.Rfc as rfc,
        C.Direccion as direccion,
        C.Telefono as telefono
    FROM
        dbo.Clientes C
        INNER JOIN dbo.Usuarios U ON C.IdUsuario = U.Id    
)
GO
CREATE FUNCTION dbo.fxGetCliente(@Id int)
RETURNS TABLE
AS
RETURN
(
    SELECT C.IdCliente as idCliente, 
	U.Nombre as nombre, 
	U.Apellido as apellido, 
	U.Correo as correo, 
	U.FechaNacimiento as fechaNacimiento, 
    U.Foto as foto, 
	U.IdStatus as idStatus, 
	C.Rfc as rfc, 
	C.Direccion as direccion, 
	C.Telefono as telefono, 
	U.Id as idUsuario, 
	U.Password as password
    FROM dbo.Clientes C
    INNER JOIN dbo.Usuarios U ON C.IdUsuario = U.Id
    WHERE C.IdCliente = @Id
)

GO
	CREATE FUNCTION dbo.fxGetClienteByUsuario(@IdUsuario int)
	RETURNS TABLE
	AS
	RETURN
	(
		SELECT
		C.IdCliente as idCliente,
		U.Nombre as nombre,
		U.Apellido as apellido,
		U.Correo as correo,
		U.FechaNacimiento as fechaNacimiento,
		U.Foto as foto,
		U.IdStatus as idStatus,
		C.Rfc as rfc,
		C.Direccion as direccion,
		C.Telefono as telefono
	FROM
		dbo.Clientes C with(readuncommitted)
		INNER JOIN dbo.Usuarios U ON C.IdUsuario = U.Id
	WHERE
		C.IdUsuario = @IdUsuario
	)

GO
-- EXEC dbo.ClientesUPD 4, 11, 'Juan', 'Perez','cli1@clamaroj.com' ,'20020910', 'foto', '123', 1, 'MMMM123456MMM', 'DIREE', '4771234567'


-- USE master
GO
--ELIMINA MI DB CERRANDO LAS CONEXIONES ACTIVAS
-- CREATE DATABASE Clamaroj SET SINGLE_USER WITH ROLLBACK IMMEDIATE
-- DROP DATABASE Clamaroj
