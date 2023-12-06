use clamaroj
go
SELECT * FROM dbo.Usuarios
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.UsuariosUPD
	@Id int out,
	@Nombre varchar(50),
	@Apellido varchar(50),
	@Correo varchar(50),
	@FechaNacimiento datetime,
	@Foto TEXT,
	@IdStatus int,
	@Password varbinary(MAX),
	@IdRoles varchar(max) 
AS
BEGIN
	SET NOCOUNT ON;

	-- Eliminar registros asociados al usuario en la tabla RolesUsuario
	DELETE FROM dbo.RolesUsuarios WHERE IdUsuario = @Id
	DECLARE @PassAntigua varbinary(MAX), @PasswordEncrypt varbinary(MAX)
	

	IF EXISTS(SELECT Id FROM dbo.Usuarios WHERE Id = @Id)
	BEGIN
		SELECT @PassAntigua = [Password] FROM dbo.Usuarios WHERE Id = @Id
		SET @PasswordEncrypt = HASHBYTES('SHA2_512', @Password)

		SET @Password = IIF(@PassAntigua = @Password, @Password, @PasswordEncrypt)

		UPDATE dbo.Usuarios
		SET Nombre = @Nombre,
			Apellido = @Apellido,
			Correo = @Correo,
			FechaNacimiento = @FechaNacimiento,
			Foto = @Foto,
			IdStatus = @IdStatus,
			[Password] = @Password
		WHERE Id = @Id
	END
	ELSE
	BEGIN
		INSERT INTO dbo.Usuarios(Nombre, Apellido, Correo, FechaNacimiento, Foto, IdStatus, FechaRegistro, [Password])
		VALUES (@Nombre, @Apellido, @Correo, @FechaNacimiento, @Foto, @IdStatus, GETDATE(), HASHBYTES('SHA2_512', @Password))

		-- Obtener el ID del usuario recién insertado
		SET @Id = SCOPE_IDENTITY()
	END
	IF @IdRoles <> ''
	BEGIN
		-- Insertar los registros en la tabla RolesUsuario
		INSERT INTO dbo.RolesUsuarios (IdRol, IdUsuario)
		SELECT IdReturn, @Id FROM dbo.fxConvertIDsToTable(@IdRoles)
	END
END

--GO
--EXEC dbo.UsuariosUPD
--@Id = 0,
--@Nombre = 'Usuario de prueba' ,
--@Apellido = 'Vendedor',
--@Correo = 'seller@clamaroj.com',
--@FechaNacimiento = '20031201' ,
--@Foto = '',
--@IdStatus = 1 ,
--@Password = 'Clamaroj123'


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joshua
-- CREATE date: 02/08/2023
-- Description:	
-- =============================================
CREATE FUNCTION dbo.fxGetUsuarios()
RETURNS TABLE 
AS
RETURN 
(
	SELECT U.Id as id,
	U.Nombre as nombre,
	U.Apellido as apellido, 
	U.Correo as correo, 
	U.FechaNacimiento as fechaNacimiento, 
	U.Foto as foto, 
	E.Nombre AS estatus, 
	U.idStatus--, R.Id as IdRol, R.Nombre AS Roles
	FROM dbo.Usuarios U
	--JOIN dbo.RolesUsuarios RU
	--	ON RU.IdUsuario = U.Id
	--JOIN dbo.Roles R
	--	ON R.Id = RU.IdRol
	JOIN dbo.Estatus E
		ON E.Id = U.IdStatus
)
GO
SELECT * FROM dbo.fxGetUsuarios()

--insert into RolesUsuarios(IdRol,IdUsuario)
--values(2,1)
go
CREATE function dbo.fxGetRolesUsuario(@IdUsuario int)
returns table
as
return
(
	select R.Id as id, R.Nombre as nombre
	from dbo.RolesUsuarios RU
	join dbo.Roles R
		on R.Id = RU.IdRol
	join dbo.Usuarios U
		on U.Id = RU.IdUsuario
	where U.Id = @IdUsuario
)
go
select * from dbo.fxGetRolesUsuario(1)

GO
CREATE PROCEDURE dbo.UsuarioDEL
	@Id int
AS
BEGIN
	SET NOCOUNT ON;
	DELETE FROM dbo.Usuarios WHERE Id = @Id
END
GO
CREATE FUNCTION dbo.fxGetUsuario(@Id int)
RETURNS TABLE
AS
RETURN
(
	SELECT U.id,
	U.Nombre as nombre,
	U.Apellido as apellido, 
	U.Correo as correo, 
	U.FechaNacimiento as fechaNacimiento, 
	U.Foto as foto, 
	E.Nombre AS estatus, 
	U.IdStatus as idEstatus--, R.Id as IdRol, R.Nombre AS Roles
	FROM dbo.Usuarios U
	--JOIN dbo.RolesUsuarios RU
	--	ON RU.IdUsuario = U.Id
	--JOIN dbo.Roles R
	--	ON R.Id = RU.IdRol
	JOIN dbo.Estatus E
		ON E.Id = U.IdStatus
	WHERE U.Id = @Id
)
GO
select * from dbo.Roles
select * from Usuarios
SELECT * FROM dbo.RolesUsuarios
--update Usuarios
--set IdStatus = 1


--DECLARE @input nvarchar(50);
--SET @input = 'Admin123'
--declare @pass varbinary(max)
 
--SELECT HASHBYTES('MD2', @input) as 'MD2 Output';
--SELECT HASHBYTES('MD4', @input) as 'MD4 Output';
--SELECT HASHBYTES('MD5', @input) as 'MD5 Output';
--SELECT HASHBYTES('SHA1', @input) as 'SHA1 Output';
--SELECT HASHBYTES('SHA2_256', @input) as 'SHA-256 Output';
--SELECT @pass = HASHBYTES('SHA2_512', @input) --as 'SHA-512 Output';

GO

CREATE FUNCTION dbo.fxLoginUsuario(@Correo varchar(120), @Password varchar(200))
RETURNS TABLE
AS
RETURN
(
	SELECT U.id,
	U.Nombre as nombre,
	U.Apellido as apellido, 
	U.Correo as correo, 
	U.FechaNacimiento as fechaNacimiento, 
	U.Foto as foto, 
	E.Nombre AS estatus, 
	U.IdStatus as idEstatus--, R.Id as IdRol, R.Nombre AS Roles
	FROM dbo.Usuarios U
	--JOIN dbo.RolesUsuarios RU
	--	ON RU.IdUsuario = U.Id
	--JOIN dbo.Roles R
	--	ON R.Id = RU.IdRol
	JOIN dbo.Estatus E
		ON E.Id = U.IdStatus
	WHERE Correo = @Correo and [Password] = HASHBYTES('SHA2_512', @Password)
)

go

use Clamaroj

update dbo.Usuarios
set [Password] = HASHBYTES('SHA2_512', 'Admin123')
where Id = 1

update dbo.Usuarios
set [Password] = HASHBYTES('SHA2_512', 'Proveedor123')
where Id = 2

update dbo.Usuarios
set [Password] = HASHBYTES('SHA2_512', 'Cliente123')
where Id = 3

