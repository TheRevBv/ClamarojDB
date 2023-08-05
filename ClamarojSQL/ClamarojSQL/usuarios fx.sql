use clamaroj
go
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joshua
-- ALTER date: 02/08/2023
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

--Procedimiento almacenado para insertar un usuario con un rol especifico y si existe el usuario actualizarlo
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joshua
-- ALTER date: 02/08/2023
-- Description:	
-- =============================================
ALTER PROCEDURE dbo.UsuariosUPD
	@Id int,
	@Nombre varchar(50),
	@Apellido varchar(50),
	@Correo varchar(50),
	@FechaNacimiento datetime,
	@Foto TEXT,
	@IdStatus int
	--,
	--@IdRoles varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF EXISTS(SELECT * FROM dbo.Usuarios WHERE Id = @Id)
		UPDATE dbo.Usuarios
		SET Nombre = @Nombre,
			Apellido = @Apellido,
			Correo = @Correo,
			FechaNacimiento = @FechaNacimiento,
			Foto = @Foto,
			IdStatus = @IdStatus
		WHERE Id = @Id
	ELSE
		INSERT INTO dbo.Usuarios(Nombre,Apellido,Correo,FechaNacimiento,Foto,IdStatus,FechaRegistro)
		VALUES(@Nombre,@Apellido,@Correo,@FechaNacimiento,@Foto,@IdStatus, GETDATE())
END

-- IF EXISTS(SELECT * FROM dbo.RolesUsuarios WHERE IdUsuario = @Id)
-- 	BEGIN
-- 		IF EXISTS(SELECT * FROM dbo.RolesUsuarios WHERE IdUsuario = @Id AND IdRol = @IdRol)
-- 		BEGIN
-- 			RETURN
-- 		END
-- 		ELSE
-- 		BEGIN
-- 			INSERT INTO dbo.RolesUsuarios(IdRol,IdUsuario)
-- 			VALUES(@IdRol,@Id)
-- 		END
-- 	END
-- 	ELSE
-- 	BEGIN
-- 		INSERT INTO dbo.RolesUsuarios(IdRol,IdUsuario)
-- 		VALUES(@IdRol,@Id)
-- 	END
-- 	--Sino hay un rol
GO
SELECT * FROM dbo.fxConvertIDsToTable('')
GO
ALTER PROCEDURE dbo.UsuarioDEL
	@Id int
AS
BEGIN
	SET NOCOUNT ON;
	DELETE FROM dbo.Usuarios WHERE Id = @Id
END
GO
