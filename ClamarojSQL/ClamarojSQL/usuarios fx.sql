use clamaroj
go
SELECT * FROM dbo.Usuarios
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
/*ALTER PROCEDURE dbo.UsuariosUPD
	@Id int out,
	@Nombre varchar(50),
	@Apellido varchar(50),
	@Correo varchar(50),
	@FechaNacimiento datetime,
	@Foto TEXT,
	@IdStatus int,
	@Password varchar(MAX)
	,
	@IdRoles varchar(max) = ''
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS(SELECT * FROM dbo.Usuarios WHERE Id = @Id)
		UPDATE dbo.Usuarios
		SET Nombre = @Nombre,
			Apellido = @Apellido,
			Correo = @Correo,
			FechaNacimiento = @FechaNacimiento,
			Foto = @Foto,
			IdStatus = @IdStatus,
			[Password] = @Password
		WHERE Id = @Id
	ELSE
		INSERT INTO dbo.Usuarios(Nombre,Apellido,Correo,FechaNacimiento,Foto,IdStatus,FechaRegistro,[Password])
		VALUES(@Nombre,@Apellido,@Correo,@FechaNacimiento,@Foto,@IdStatus, GETDATE(), @Password)
END
*/
ALTER PROCEDURE dbo.UsuariosUPD
	@Id int out,
	@Nombre varchar(50),
	@Apellido varchar(50),
	@Correo varchar(50),
	@FechaNacimiento datetime,
	@Foto TEXT,
	@IdStatus int,
	@Password varchar(MAX),
	@IdRoles varchar(max) 
AS
BEGIN
	SET NOCOUNT ON;

	-- Eliminar registros asociados al usuario en la tabla RolesUsuario
	DELETE FROM dbo.RolesUsuarios WHERE IdUsuario = @Id

	IF EXISTS(SELECT * FROM dbo.Usuarios WHERE Id = @Id)
	BEGIN
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
		VALUES (@Nombre, @Apellido, @Correo, @FechaNacimiento, @Foto, @IdStatus, GETDATE(), @Password)

		-- Obtener el ID del usuario recién insertado
		SET @Id = SCOPE_IDENTITY()
	END

	IF @IdRoles <> ''
	BEGIN
		-- Convertir la cadena @IdRoles en una tabla temporal para iterar sobre ella
		DECLARE @RolesTable AS TABLE (RoleId INT)
		DECLARE @RoleId INT

		-- Dividir la cadena @IdRoles y almacenar los IDs de roles en la tabla temporal
		WHILE LEN(@IdRoles) > 0
		BEGIN
			IF CHARINDEX(',', @IdRoles) > 0
			BEGIN
				SET @RoleId = CAST(LEFT(@IdRoles, CHARINDEX(',', @IdRoles) - 1) AS INT)
				SET @IdRoles = RIGHT(@IdRoles, LEN(@IdRoles) - CHARINDEX(',', @IdRoles))
			END
			ELSE
			BEGIN
				SET @RoleId = CAST(@IdRoles AS INT)
				SET @IdRoles = ''
			END

			INSERT INTO @RolesTable (RoleId) VALUES (@RoleId)
		END

		-- Insertar los registros en la tabla RolesUsuario
		INSERT INTO dbo.RolesUsuarios (IdRol, IdUsuario)
		SELECT RoleId, @Id FROM @RolesTable
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
ALTER FUNCTION dbo.fxGetUsuarios()
RETURNS TABLE 
AS
RETURN 
(
	SELECT U.Id,U.Nombre,U.Apellido, U.Correo, U.FechaNacimiento, U.Foto, E.Nombre AS Estatus, U.IdStatus--, R.Id as IdRol, R.Nombre AS Roles
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
ALTER function dbo.fxGetRolesUsuario(@IdUsuario int)
returns table
as
return
(
	select R.Id, R.Nombre
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
ALTER PROCEDURE dbo.UsuarioDEL
	@Id int
AS
BEGIN
	SET NOCOUNT ON;
	DELETE FROM dbo.Usuarios WHERE Id = @Id
END
GO
ALTER FUNCTION dbo.fxGetUsuario(@Id int)
RETURNS TABLE
AS
RETURN
(
	SELECT U.Id,U.Nombre,U.Apellido, U.Correo, U.FechaNacimiento, U.Foto, E.Nombre AS Estatus, U.IdStatus--, R.Id as IdRol, R.Nombre AS Roles
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

