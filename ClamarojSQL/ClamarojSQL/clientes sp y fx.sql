USE Clamaroj
GO

SELECT * FROM dbo.Clientes
GO
ALTER PROCEDURE dbo.ClientesUPD
    @Id int,
    @IdUsuario int,
    @Nombre varchar(50),
    @Apellido varchar(50),
    @Correo varchar(50),
    @FechaNacimiento datetime,
    @Foto TEXT,
    @IdStatus int,
    @Rfc varchar(50),
    @Direccion varchar(50),
    @Telefono varchar(13)
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS(SELECT * FROM dbo.Clientes WHERE IdCliente = @Id)
    BEGIN
        UPDATE dbo.Clientes
        SET Rfc = @Rfc,
            Direccion = @Direccion,
            Telefono = @Telefono

        WHERE IdCliente = @Id

        EXEC dbo.UsuariosUPD @IdUsuario, @Nombre, @Apellido, @Correo, @FechaNacimiento, @Foto, @IdStatus
    END
    ELSE
    BEGIN
        INSERT INTO dbo.Clientes(Rfc,Direccion,Telefono)
        VALUES(@Rfc,@Direccion,@Telefono)

        EXEC dbo.UsuariosUPD @IdUsuario, @Nombre, @Apellido, @Correo, @FechaNacimiento, @Foto, @IdStatus
    END
END

GO

ALTER PROCEDURE dbo.ClienteDEL
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
ALTER FUNCTION dbo.fxGetClientes()
RETURNS TABLE
AS
RETURN
(
    SELECT C.IdCliente, U.Nombre, U.Apellido, U.Correo, U.FechaNacimiento, U.Foto, U.IdStatus, C.Rfc, C.Direccion, C.Telefono
    FROM dbo.Clientes C
    INNER JOIN dbo.Usuarios U ON C.IdUsuario = U.Id    
)
GO
ALTER FUNCTION dbo.fxGetCliente(@Id int)
RETURNS TABLE
AS
RETURN
(
    SELECT C.IdCliente, U.Nombre, U.Apellido, U.Correo, U.FechaNacimiento, U.Foto, U.IdStatus, C.Rfc, C.Direccion, C.Telefono
    FROM dbo.Clientes C
    INNER JOIN dbo.Usuarios U ON C.IdUsuario = U.Id
    WHERE C.IdCliente = @Id
)

GO
ALTER FUNCTION dbo.fxGetClienteByUsuario(@IdUsuario int)
RETURNS TABLE
AS
RETURN
(
    SELECT C.IdCliente, U.Nombre, U.Apellido, U.Correo, U.FechaNacimiento, U.Foto, U.IdStatus, C.Rfc, C.Direccion, C.Telefono
    FROM dbo.Clientes C
    INNER JOIN dbo.Usuarios U ON C.IdUsuario = U.Id
    WHERE C.IdUsuario = @IdUsuario
)