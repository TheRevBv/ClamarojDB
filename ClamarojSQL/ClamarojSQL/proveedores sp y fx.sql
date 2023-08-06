USE Clamaroj
GO
SELECT * FROM dbo.Proveedores
GO
alter PROCEDURE dbo.ProveedoresUPD
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
    @Telefono varchar(13),
    @RazonSocial varchar(120),
    @Password varchar(MAX)
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS(SELECT * FROM dbo.Proveedores WHERE IdProveedor = @Id)
    BEGIN
        UPDATE dbo.Proveedores
        SET Rfc = @Rfc,
            Direccion = @Direccion,
            Telefono = @Telefono,
            RazonSocial = @RazonSocial
        WHERE IdProveedor = @Id

        EXEC dbo.UsuariosUPD @IdUsuario, @Nombre, @Apellido, @Correo, @FechaNacimiento, @Foto, @IdStatus, @Password
    END
    ELSE
    BEGIN
        EXEC dbo.UsuariosUPD @IdUsuario out, @Nombre, @Apellido, @Correo, @FechaNacimiento, @Foto, @IdStatus, @Password

        INSERT INTO dbo.Proveedores(Rfc,Direccion,Telefono,IdUsuario,RazonSocial)
        VALUES(@Rfc,@Direccion,@Telefono,@IdUsuario,@RazonSocial)

    END
END

GO

alter PROCEDURE dbo.ProveedorDEL
    @Id int
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @IdUsuario int
    SELECT @IdUsuario = IdUsuario FROM dbo.Proveedores WHERE IdProveedor = @Id
    UPDATE dbo.Usuarios SET IdStatus = 2 WHERE Id = @IdUsuario

    DELETE FROM dbo.Proveedores WHERE IdProveedor = @Id
END

GO
alter FUNCTION dbo.fxGetProveedores()
RETURNS TABLE
AS
RETURN
(
    SELECT P.IdProveedor, U.Id, U.Nombre, U.Apellido, U.Correo, 
    U.FechaNacimiento, U.Foto, U.IdStatus, 
    P.Rfc, P.Direccion, P.Telefono, P.RazonSocial, U.Id as IdUsuario
    FROM dbo.Proveedores P
    INNER JOIN dbo.Usuarios U ON P.IdUsuario = U.Id    
)

GO
alter FUNCTION dbo.fxGetProveedor(@Id int)
RETURNS TABLE
AS
RETURN
(
    SELECT P.IdProveedor, U.Id, U.Nombre, U.Apellido, U.Correo, U.FechaNacimiento, U.Foto, 
    U.IdStatus, P.Rfc, P.Direccion, P.Telefono, P.RazonSocial, U.Id as IdUsuario, U.Password
    FROM dbo.Proveedores P
    INNER JOIN dbo.Usuarios U ON P.IdUsuario = U.Id
    WHERE P.IdProveedor = @Id
)
