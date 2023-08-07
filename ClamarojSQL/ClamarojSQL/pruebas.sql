DECLARE 
@Id int						=0,
@IdUsuario int				=0,
@Nombre varchar(50)			='Usuario Pruebas',
@Apellido varchar(50)		='Cliente 2',
@Correo varchar(50)			='clientes2@clamaroj.com',
@FechaNacimiento datetime	='20000305',
@Foto NVARCHAR(MAX)			='',
@Password varchar(MAX)		='Clamaroj123',
@IdStatus int				=1,
@Rfc varchar(13)			='COMP010101COM',
@Direccion varchar(50)		='Clamaroj UTL',
@Telefono varchar(10)		='1234567890'


EXEC dbo.UsuariosUPD @IdUsuario out, @Nombre, @Apellido, @Correo, @FechaNacimiento, @Foto, @IdStatus, @Password
DECLARE @IdUser int = (select MAX(Id) from dbo.Usuarios )

INSERT INTO dbo.Clientes(Rfc,Direccion,Telefono,IdUsuario)
VALUES(@Rfc,@Direccion,@Telefono,@IdUser)


SELECT * FROM dbo.Clientes
select * from dbo.Usuarios
