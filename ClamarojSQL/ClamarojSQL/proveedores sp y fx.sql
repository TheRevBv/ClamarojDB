USE Clamaroj
GO
SELECT * FROM dbo.Proveedores
GO
CREATE PROCEDURE dbo.ProveedoresUPD
    @Id int out,
    @IdUsuario int,
    @Nombre varchar(50),
    @Apellido varchar(50),
    @Correo varchar(50),
    @FechaNacimiento datetime,
    @Foto TEXT,
    @IdStatus int,
    @Rfc varchar(50),
    @Direccion varchar(255),
    @Telefono varchar(13),
    @RazonSocial varchar(120),
    @Password varchar(MAX)
AS
BEGIN
    SET NOCOUNT ON;
	DECLARE @IdRoles int = 3
    IF EXISTS(SELECT * FROM dbo.Proveedores WHERE IdProveedor = @Id)
    BEGIN
        UPDATE dbo.Proveedores
        SET Rfc = @Rfc,
            Direccion = @Direccion,
            Telefono = @Telefono,
            RazonSocial = @RazonSocial
        WHERE IdProveedor = @Id

        EXEC dbo.UsuariosUPD @IdUsuario, @Nombre, @Apellido, @Correo, @FechaNacimiento, @Foto, @IdStatus, @Password, @IdRoles
    END
    ELSE
    BEGIN
        EXEC dbo.UsuariosUPD @IdUsuario out, @Nombre, @Apellido, @Correo, @FechaNacimiento, @Foto, @IdStatus, @Password, @IdRoles

		DECLARE @IdUser int = (select MAX(Id) from dbo.Usuarios)

        INSERT INTO dbo.Proveedores(Rfc,Direccion,Telefono,IdUsuario,RazonSocial)
        VALUES(@Rfc,@Direccion,@Telefono,@IdUser,@RazonSocial)

    END
END

GO

CREATE PROCEDURE dbo.ProveedorDEL
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
CREATE FUNCTION dbo.fxGetProveedores()
RETURNS TABLE
AS
RETURN
(
    SELECT 
		P.IdProveedor AS idProveedor,
		U.Nombre AS nombre, 
		U.Apellido AS apellido, 
		U.Correo AS correo, 
		U.FechaNacimiento AS fechaNacimiento, 
		U.Foto AS foto, 
		U.IdStatus AS idStatus, 
		P.Rfc AS rfc, 
		P.Direccion AS direccion, 
		P.Telefono AS telefono, 
		P.RazonSocial AS razonSocial, 
		U.Id AS idUsuario,
		U.Password as password
	FROM dbo.Proveedores P
	INNER JOIN dbo.Usuarios U ON P.IdUsuario = U.Id
   
)

GO
CREATE FUNCTION dbo.fxGetProveedor(@Id int)
RETURNS TABLE
AS
RETURN
(
    SELECT 
		P.IdProveedor AS idProveedor, 
		U.Nombre AS nombre, 
		U.Apellido AS apellido, 
		U.Correo AS correo, 
		U.FechaNacimiento AS fechaNacimiento, 
		U.Foto AS foto, 
		U.IdStatus AS idStatus, 
		P.Rfc AS rfc, 
		P.Direccion AS direccion, 
		P.Telefono AS telefono, 
		P.RazonSocial AS razonSocial, 
		U.Id AS idUsuario, 
		U.Password as password
	FROM dbo.Proveedores P
	INNER JOIN dbo.Usuarios U ON P.IdUsuario = U.Id
	WHERE P.IdProveedor = @Id

)
