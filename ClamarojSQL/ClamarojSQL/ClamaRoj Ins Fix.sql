use clamaroj;
go

-- ALTER TABLE Productos ALTER COLUMN FechaModificacion datetime NULL;
-- delete from Productos
-- DBCC CHECKIDENT ('Productos', RESEED, 0);
go

--Revisar antes de ejecutar, para que primero agregue los seeders del proyecto
select * from Usuarios

update dbo.Usuarios
set [Password] = HASHBYTES('SHA2_512', 'Admin123')
where Id = 1

update dbo.Usuarios
set [Password] = HASHBYTES('SHA2_512', 'Proveedor123')
where Id = 2

update dbo.Usuarios
set [Password] = HASHBYTES('SHA2_512', 'Cliente123')
where Id = 3


select * from productos
select * from MateriasPrimas

go
INSERT INTO Productos (Codigo, Nombre, Descripcion, Precio, Foto, Merma, IdStatus, FechaRegistro, FechaModificacion)
VALUES
    ('PROD000001', 'MICHE CUBANA', 'Michelada con salsa maggi, inglesa, tabasco y cerveza clara', 60.00, 'cubana.jpg', 5, 1, '2023-05-02', '2023-05-02'),
    ('PROD000002', 'PAPALOCAS', 'Tostilocos con ingredientes variados y salsas picantes', 50.00, 'papalocas.jpg', 3, 1, '2023-05-05', '2023-05-05'),
    ('PROD000003', 'PIÑACHELA', 'Michelada con piña y chile en polvo', 65.00, 'pinachela.jpg', 2, 1, '2023-05-08', '2023-05-08'),
    ('PROD000004', 'TOSTILOCOS', 'Tostitos con cueritos, cueritos y cueritos', 60.00, 'tostilocos.jpg', 1, 1, '2023-05-11', '2023-05-11'),
    ('PROD000005', 'GOMICHELA', 'Michelada con gomitas y chamoy', 70.00, 'gomichela.jpg', 4, 1, '2023-05-14', '2023-05-14'),
    ('PROD000006', 'DORILOCOS', 'Doritos con pepino, cueritos y salsas', 40.00, 'dorilocos.jpg', 1, 1, '2023-05-17', '2023-05-17'),
    ('PROD000007', 'CHAMOCHELA', 'Michelada con chamoy y tamarindos', 60.00, 'chamochela.jpg', 3, 1, '2023-05-20', '2023-05-20'),
    ('PROD000008', 'ENDIABLADA', 'Botana picante con chiles secos y limón', 10.99, 'endiablada.jpg', 1, 1, '2023-05-23', '2023-05-23'),
    ('PROD000009', 'CACAHUATADA', 'Botana con cacahuates y salsa picante', 8.99, 'cacahuatada.jpg', 1, 1, '2023-05-26', '2023-05-26'),
    ('PROD000010', 'LAGUNA AZUL', 'Cóctel refrescante con frutas y hielo', 14.99, 'laguna_azul.jpg', 2, 1, '2023-05-29', '2023-05-29'),
    ('PROD000011', 'SABRIMEDUSA', 'Bebida con sabores de frutas y gelatina', 9.99, 'sabrimedusa.jpg', 1, 1, '2023-05-02', '2023-05-02'),
    ('PROD000012', 'TEQUILA SUNRISE', 'Cóctel con tequila y jugo de naranja', 20.99, 'tequila_sunrise.jpg', 3, 1, '2023-05-05', '2023-05-05'),
    ('PROD000013', 'PAPA ENCHILADA', 'Papas fritas con salsa enchilada y queso', 11.99, 'papa_enchilada.jpg', 2, 1, '2023-05-08', '2023-05-08'),
    ('PROD000014', 'CRERICOT FRUTOS ROJOS', 'Bebida refrescante con crema y frutos rojos', 13.99, 'crema_frutos_rojos.jpg', 1, 1, '2023-05-11', '2023-05-11'),
    ('PROD000015', 'SABRICHEESE', 'Botana con salsa de queso y nachos', 16.99, 'sabricheese.jpg', 2, 1, '2023-05-14', '2023-05-14'),
    ('PROD000016', 'MACHOLADA', 'Michelada con mango y chile en polvo', 17.99, 'macholada.jpg', 3, 1, '2023-05-17', '2023-05-17'),
    ('PROD000017', 'SABRILOCA', 'Bebida con sabores mezclados y chile', 12.99, 'sabriloca.jpg', 1, 1, '2023-05-20', '2023-05-20'),
    ('PROD000018', 'CAMARONCHELA', 'Michelada con camarones y salsas', 24.99, 'camaronchela.jpg', 4, 1, '2023-05-23', '2023-05-23'),
    ('PROD000019', 'SABRICHIL', 'Bebida con sabor a tamarindo y chile', 9.99, 'sabrichil.jpg', 1, 1, '2023-05-26', '2023-05-26'),
    ('PROD000020', 'GOMILOCAS', 'Botana con gomitas y salsas variadas', 11.99, 'gomilocas.jpg', 1, 1, '2023-05-29', '2023-05-29');

GO
-------- INSERCION DE USUARIOS TIPO CLIENTES -----------------------
--SELECT * FROM USUARIOS
--delete  FROM Usuarios where Id>21;
--DECLARE @UltimoID INT;
--SELECT @UltimoID = MAX(ID) FROM Usuarios;
--DBCC CHECKIDENT ('Usuarios', RESEED, @UltimoID);
-- Usuarios tipo clientes Mes Mayo
GO
SELECT * FROM dbo.Usuarios

INSERT INTO Usuarios (Nombre, Apellido, Correo, [Password], Foto, FechaNacimiento, FechaRegistro, IdStatus)
VALUES
    ('Jorge', 'Martínez', 'cliente22@mail.com',		HASHBYTES('SHA2_512', 'cliente22'), 'jorge.jpg', '1985-06-20', '2023-05-12', 1),
    ('Sofía', 'Hernández', 'cliente23@mail.com',	HASHBYTES('SHA2_512', 'cliente23'), 'sofia.jpg', '1992-07-10', '2023-05-14', 1),
    ('Carlos', 'López', 'cliente24@mail.com',		HASHBYTES('SHA2_512', 'cliente24'), 'carlos.jpg', '1988-11-03', '2023-05-16', 1),
    ('María', 'Rodríguez', 'cliente25@mail.com',	HASHBYTES('SHA2_512', 'cliente25'), 'maria.jpg', '1995-02-25', '2023-05-18', 1),
    ('José', 'Gómez', 'cliente26@mail.com',			HASHBYTES('SHA2_512', 'cliente26'), 'jose.jpg', '1987-06-18', '2023-05-20', 1),
    ('Laura', 'Pérez', 'cliente27@mail.com',		HASHBYTES('SHA2_512', 'cliente27'), 'laura.jpg', '1993-09-08', '2023-05-22', 1),
    ('Andrés', 'Díaz', 'cliente28@mail.com',		HASHBYTES('SHA2_512', 'cliente28'), 'andres.jpg', '1989-12-21', '2023-05-24', 1),
    ('Isabel', 'Torres', 'cliente29@mail.com',		HASHBYTES('SHA2_512', 'cliente29'), 'isabel.jpg', '1997-03-14', '2023-05-26', 1),
    ('David', 'Flores', 'cliente30@mail.com',		HASHBYTES('SHA2_512', 'cliente30'), 'david.jpg', '1994-07-27', '2023-05-28', 1),
    ('Ana', 'Sánchez', 'cliente31@mail.com',		HASHBYTES('SHA2_512', 'cliente31'), 'ana.jpg', '1990-04-15', '2023-05-10', 1),
    ('Jorge', 'Ramírez', 'cliente32@mail.com',		HASHBYTES('SHA2_512', 'cliente32'), 'jorge.jpg', '1985-06-20', '2023-05-12', 1),
    ('Sofía', 'Morales', 'cliente33@mail.com',		HASHBYTES('SHA2_512', 'cliente33'), 'sofia.jpg', '1992-07-10', '2023-05-14', 1),
    ('Carlos', 'Vargas', 'cliente34@mail.com',		HASHBYTES('SHA2_512', 'cliente34'), 'carlos.jpg', '1988-11-03', '2023-05-16', 1),
    ('María', 'Luna', 'cliente35@mail.com',			HASHBYTES('SHA2_512', 'cliente35'), 'maria.jpg', '1995-02-25', '2023-05-18', 1);

GO
--SELECT * FROM dbo.Usuarios

-- Usuarios Mes Junio
INSERT INTO Usuarios (Nombre, Apellido, Correo, [Password], Foto, FechaNacimiento, FechaRegistro, IdStatus)
VALUES
    ('Luis', 'López', 'cliente36@mail.com',				HASHBYTES('SHA2_512','cliente36'), 'luis.jpg', '1991-06-15', '2023-06-05', 1),
    ('Alejandra', 'González', 'cliente37@mail.com',		HASHBYTES('SHA2_512','cliente37'), 'alejandra.jpg', '1984-06-20', '2023-06-08', 1),
    ('Roberto', 'Vega', 'cliente38@mail.com',			HASHBYTES('SHA2_512','cliente38'), 'roberto.jpg', '1993-06-10', '2023-06-12', 1),
    ('Fernanda', 'Morales', 'cliente39@mail.com',		HASHBYTES('SHA2_512','cliente39'), 'fernanda.jpg', '1989-06-03', '2023-06-15', 1),
    ('Miguel', 'Hernández', 'cliente40@mail.com',		HASHBYTES('SHA2_512','cliente40'), 'miguel.jpg', '1996-06-25', '2023-06-18', 1),
    ('Diana', 'Martínez', 'cliente41@mail.com',			HASHBYTES('SHA2_512','cliente41'), 'diana.jpg', '1988-06-18', '2023-06-22', 1),
    ('Javier', 'Sánchez', 'cliente42@mail.com',			HASHBYTES('SHA2_512','cliente42'), 'javier.jpg', '1994-06-10', '2023-06-26', 1),
    ('Adriana', 'Ramírez', 'cliente43@mail.com',		HASHBYTES('SHA2_512','cliente43'), 'adriana.jpg', '1990-06-23', '2023-06-29', 1),
    ('Héctor', 'Castro', 'cliente44@mail.com',			HASHBYTES('SHA2_512','cliente44'), 'hector.jpg', '1998-06-14', '2023-06-03', 1),
    ('Paola', 'Luna', 'cliente45@mail.com',				HASHBYTES('SHA2_512','cliente45'), 'paola.jpg', '1995-06-27', '2023-06-07', 1),
    ('Manuel', 'Torres', 'cliente46@mail.com',			HASHBYTES('SHA2_512','cliente46'), 'manuel.jpg', '1992-06-20', '2023-06-10', 1),
    ('Mariana', 'Pérez', 'cliente47@mail.com',			HASHBYTES('SHA2_512','cliente47'), 'mariana.jpg', '1987-06-13', '2023-06-14', 1),
    ('Ricardo', 'García', 'cliente48@mail.com',			HASHBYTES('SHA2_512','cliente48'), 'ricardo.jpg', '1983-06-26', '2023-06-17', 1),
    ('Ana María', 'Díaz', 'cliente49@mail.com',			HASHBYTES('SHA2_512','cliente49'), 'ana_maria.jpg', '1997-06-09', '2023-06-21', 1),
    ('Juan Pablo', 'Fernández', 'cliente50@mail.com',	HASHBYTES('SHA2_512','cliente50'), 'juan_pablo.jpg', '1994-06-22', '2023-06-25', 1),
    ('Sara', 'Gómez', 'cliente51@mail.com',				HASHBYTES('SHA2_512','cliente51'), 'sara.jpg', '1991-06-05', '2023-06-28', 1),
    ('Hugo', 'Álvarez', 'cliente52@mail.com',			HASHBYTES('SHA2_512','cliente52'), 'hugo.jpg', '1989-06-18', '2023-06-02', 1),
    ('Valentina', 'Juárez', 'cliente53@mail.com',		HASHBYTES('SHA2_512','cliente53'), 'valentina.jpg', '1996-06-10', '2023-06-06', 1);

-- Usuarios Mes Julio
INSERT INTO Usuarios (Nombre, Apellido, Correo, [Password], Foto, FechaNacimiento, FechaRegistro, IdStatus)
VALUES
    ('Eduardo', 'Soto', 'cliente54@mail.com',			HASHBYTES('SHA2_512','cliente54'), 'eduardo.jpg', '1992-07-15', '2023-07-05', 1),
    ('Fernando', 'Cruz', 'cliente55@mail.com',			HASHBYTES('SHA2_512','cliente55'), 'fernando.jpg', '1983-07-20', '2023-07-08', 1),
    ('Daniela', 'Lara', 'cliente56@mail.com',			HASHBYTES('SHA2_512','cliente56'), 'daniela.jpg', '1991-07-10', '2023-07-12', 1),
    ('Mónica', 'Ortega', 'cliente57@mail.com',			HASHBYTES('SHA2_512','cliente57'), 'monica.jpg', '1987-07-03', '2023-07-15', 1),
    ('Gustavo', 'Vargas', 'cliente58@mail.com',			HASHBYTES('SHA2_512','cliente58'), 'gustavo.jpg', '1995-07-25', '2023-07-18', 1),
    ('Patricia', 'Mendoza', 'cliente59@mail.com',		HASHBYTES('SHA2_512','cliente59'), 'patricia.jpg', '1989-07-18', '2023-07-22', 1),
    ('Rafael', 'Herrera', 'cliente60@mail.com',			HASHBYTES('SHA2_512','cliente60'), 'rafael.jpg', '1993-07-10', '2023-07-26', 1),
    ('Carmen', 'Montes', 'cliente61@mail.com',			HASHBYTES('SHA2_512','cliente61'), 'carmen.jpg', '1985-07-23', '2023-07-29', 1),
    ('Hugo', 'López', 'cliente62@mail.com',				HASHBYTES('SHA2_512','cliente62'), 'hugo.jpg', '1998-07-14', '2023-07-03', 1),
    ('Silvia', 'Sánchez', 'cliente63@mail.com',			HASHBYTES('SHA2_512','cliente63'), 'silvia.jpg', '1996-07-27', '2023-07-07', 1),
    ('Leonardo', 'García', 'cliente64@mail.com',		HASHBYTES('SHA2_512','cliente64'), 'leonardo.jpg', '1992-07-20', '2023-07-10', 1),
    ('Marisol', 'Pérez', 'cliente65@mail.com',			HASHBYTES('SHA2_512','cliente65'), 'marisol.jpg', '1986-07-13', '2023-07-14', 1),
    ('Elena', 'Ramírez', 'cliente66@mail.com',			HASHBYTES('SHA2_512','cliente66'), 'elena.jpg', '1984-07-26', '2023-07-17', 1),
    ('Manuel', 'Martínez', 'cliente67@mail.com',		HASHBYTES('SHA2_512','cliente67'), 'manuel.jpg', '1990-07-09', '2023-07-21', 1),
    ('Gabriela', 'Fernández', 'cliente68@mail.com',		HASHBYTES('SHA2_512','cliente68'), 'gabriela.jpg', '1994-07-22', '2023-07-25', 1),
    ('Joaquín', 'Hernández', 'cliente69@mail.com',		HASHBYTES('SHA2_512','cliente69'), 'joaquin.jpg', '1997-07-05', '2023-07-28', 1),
    ('Verónica', 'López', 'cliente70@mail.com',			HASHBYTES('SHA2_512','cliente70'), 'veronica.jpg', '1991-07-18', '2023-07-02', 1),
    ('Roberto', 'Gómez', 'cliente71@mail.com',			HASHBYTES('SHA2_512','cliente71'), 'roberto.jpg', '1988-07-10', '2023-07-06', 1),
    ('Ana Laura', 'Díaz', 'cliente72@mail.com',			HASHBYTES('SHA2_512','cliente72'), 'ana_laura.jpg', '1993-07-20', '2023-07-09', 1),
    ('Julián', 'Ortega', 'cliente73@mail.com',			HASHBYTES('SHA2_512','cliente73'), 'julian.jpg', '1982-07-12', '2023-07-13', 1),
    ('Santiago', 'Ortega', 'cliente74@mail.com',		HASHBYTES('SHA2_512','cliente74'), 'santiago.jpg', '1992-07-28', '2023-07-16', 1);


go
--select * from usuarios

go

--UPDATE dbo.Usuarios
--SET [Password] = HASHBYTES('SHA2_512', [Password])
--WHERE Id NOT IN (1,2,3)

select * from usuarios
go
--DECLARE @hash AS VARBINARY(64)

--SELECT @hash = HASHBYTES('SHA2_512', 'cliente22')

--SELECT LOWER(CONVERT(NVARCHAR(MAX), @hash, 2)) AS HashHex;


---------- Insercion de Clientes   --------------------------------
--DECLARE @UltimoID2 INT;
--SELECT @UltimoID2 = MAX(IdCliente) FROM Clientes;
--DBCC CHECKIDENT ('Clientes', RESEED, @UltimoID2);
--select * from Clientes

--Corregido en migraciones
--ALTER TABLE Clientes
--ALTER COLUMN Direccion VARCHAR(255)

INSERT INTO Clientes (IdUsuario, Direccion, Telefono, Rfc)
VALUES
    (4, 'Avenida Guanajuato - Colonia Obregón', '4771234567', 'RFC111111A01'),
    (5, 'Calle Yucatán - Colonia Jardines de Jerez', '4772345678', 'RFC222222A02'),
    (6, 'Avenida Insurgentes - Colonia Chapalita', '4773456789', 'RFC333333A03'),
    (7, 'Calle Hidalgo - Colonia Las Torres', '4774567890', 'RFC444444A04'),
    (8, 'Avenida Chapultepec - Colonia San Felipe', '4775678901', 'RFC555555A05'),
    (9, 'Calle Querétaro - Colonia El Dorado', '4776789012', 'RFC666666A06'),
    (10, 'Avenida Juárez - Colonia Los Gavilanes', '4777890123', 'RFC777777A07'),
    (11, 'Calle Morelos - Colonia San Isidro', '4778901234', 'RFC888888A08'),
    (12, 'Avenida Reforma - Colonia La Moderna', '4779012345', 'RFC999999A09'),
    (13, 'Calle Zacatecas - Colonia La Brisa', '4770123456', 'RFC101010A10'),
    (14, 'Avenida Álvaro Obregón - Colonia La Salle', '4771234567', 'RFC111011A11'),
    (15, 'Calle Michoacán - Colonia La Florida', '4772345678', 'RFC121212A12'),
    (16, 'Avenida Venustiano Carranza - Colonia Villa Verde', '4773456789', 'RFC131313A13'),
    (17, 'Calle Puebla - Colonia La Merced', '4774567890', 'RFC141414A14'),
    (18, 'Avenida Revolución - Colonia San Jerónimo', '4775678901', 'RFC151515A15'),
    (19, 'Calle Coahuila - Colonia Industrial', '4776789012', 'RFC161616A16'),
    (20, 'Avenida Himno Nacional - Colonia San Juan Bosco', '4777890123', 'RFC171717A17'),
    (21, 'Calle Veracruz - Colonia Del Valle', '4778901234', 'RFC181818A18'),
    (22, 'Avenida Rayón - Colonia León II', '4779012345', 'RFC191919A19'),
    (23, 'Calle Jalisco - Colonia La Estrella', '4770123456', 'RFC202020A20'),
    (24, 'Avenida López Mateos - Colonia San Miguel', '4771234567', 'RFC212121A21'),
    (25, 'Calle Sinaloa - Colonia Las Américas', '4772345678', 'RFC222222A22'),
    (26, 'Avenida Sierra de Lobos - Colonia La Campiña', '4773456789', 'RFC232323A23'),
    (27, 'Calle Durango - Colonia Los Paraísos', '4774567890', 'RFC242424A24'),
    (28, 'Avenida Celaya - Colonia Las Trojes', '4775678901', 'RFC252525A25'),
    (29, 'Calle Oaxaca - Colonia San José del Consuelo', '4776789012', 'RFC262626A26'),
    (30, 'Avenida León-Querétaro - Colonia Hidalgo', '4777890123', 'RFC272727A27');

GO

INSERT INTO Clientes (IdUsuario, Direccion, Telefono, Rfc)
VALUES
    (31, 'Avenida Miguel Hidalgo - Colonia Los Naranjos', '4778901234', 'RFC282828A28'),
    (32, 'Calle Colima - Colonia Azteca', '4779012345', 'RFC292929A29'),
    (33, 'Avenida Mariano Escobedo - Colonia San Nicolás', '4770123456', 'RFC303030A30'),
    (34, 'Calle Nayarit - Colonia Nueva', '4771234567', 'RFC313131A31'),
    (35, 'Avenida La Luz - Colonia San José de Cementos', '4772345678', 'RFC323232A32'),
    (36, 'Calle Tamaulipas - Colonia San Rafael', '4773456789', 'RFC333333A33'),
    (37, 'Avenida Industrial - Colonia La Marina', '4774567890', 'RFC343434A34'),
    (38, 'Calle Campeche - Colonia San Felipe de Jesús', '4775678901', 'RFC353535A35'),
    (39, 'Avenida Guanajuato - Colonia Obregón', '4776789012', 'RFC363636A36'),
    (40, 'Calle Yucatán - Colonia Jardines de Jerez', '4777890123', 'RFC373737A37'),
    (41, 'Avenida Insurgentes - Colonia Chapalita', '4778901234', 'RFC383838A38'),
    (42, 'Calle Hidalgo - Colonia Las Torres', '4779012345', 'RFC393939A39'),
    (43, 'Avenida Chapultepec - Colonia San Felipe', '4770123456', 'RFC404040A40'),
    (44, 'Calle Querétaro - Colonia El Dorado', '4771234567', 'RFC414141A41'),
    (45, 'Avenida Juárez - Colonia Los Gavilanes', '4772345678', 'RFC424242A42'),
    (46, 'Calle Morelos - Colonia San Isidro', '4773456789', 'RFC434343A43'),
    (47, 'Avenida Reforma - Colonia La Moderna', '4774567890', 'RFC444444A44'),
    (48, 'Calle Zacatecas - Colonia La Brisa', '4775678901', 'RFC454545A45'),
    (49, 'Avenida Álvaro Obregón - Colonia La Salle', '4776789012', 'RFC464646A46'),
    (50, 'Calle Michoacán - Colonia La Florida', '4777890123', 'RFC474747A47'),
    (51, 'Avenida Venustiano Carranza - Colonia Villa Verde', '4778901234', 'RFC484848A48'),
    (52, 'Calle Puebla - Colonia La Merced', '4779012345', 'RFC494949A49'),
    (53, 'Avenida Revolución - Colonia San Jerónimo', '4770123456', 'RFC505050A50'),
    (54, 'Calle Coahuila - Colonia Industrial', '4771234567', 'RFC515151A51'),
    (55, 'Avenida Himno Nacional - Colonia San Juan Bosco', '4772345678', 'RFC525252A52'),
    (56, 'Calle Oaxaca - Colonia San José del Consuelo', '4776789012', 'RFC262626A26');


select * from clientes 

-------- INSERCION A TABLA ROLESUSUARIOS TIPO CLIENTES (2)------------------------------
select * from RolesUsuarios
select * from Roles
select * from Usuarios

INSERT INTO RolesUsuarios(IdUsuario, IdRol)
SELECT IdUsuario, 2 FROM Clientes
WHERE IdUsuario NOT IN (1,2,3)


-------- INSERCION DE USUARIOS TIPO PROVEEDORES -----------------------
/*delete from Usuarios where Id>74
DECLARE @UltimoID3 INT;
SELECT @UltimoID3 = MAX(id) FROM Usuarios;
DBCC CHECKIDENT ('Usuarios', RESEED, @UltimoID3);*/
GO
DECLARE @IdUsuarioFin INT
, 
@IdUsuarioIni INT = (SELECT MAX(Id) FROM Usuarios)

INSERT INTO Usuarios (Nombre, Apellido, Correo, [Password], Foto, FechaNacimiento, FechaRegistro, IdStatus)
VALUES
    ('Snacks International', 'S.A. de C.V.', 'proveedor75@example.com',			HASHBYTES('SHA2_512','proveedor75'), 'snacks_international.jpg', '1980-05-15', '2023-05-02', 1),
    ('Bebidas Refrescantes', 'S.A. de C.V.', 'proveedor76@example.com',			HASHBYTES('SHA2_512','proveedor76'), 'bebidas_refrescantes.jpg', '1975-05-20', '2023-05-05', 1),
    ('Chips y Dips', 'S.A. de C.V.', 'proveedor77@example.com',					HASHBYTES('SHA2_512','proveedor77'), 'chips_dips.jpg', '1988-05-10', '2023-05-08', 1),
    ('Micheladas Deluxe', 'S.A. de C.V.', 'proveedor78@example.com',			HASHBYTES('SHA2_512','proveedor78'), 'micheladas_deluxe.jpg', '1993-05-03', '2023-05-11', 1),
    ('Sabores Saludables', 'S.A. de C.V.', 'proveedor79@example.com',			HASHBYTES('SHA2_512','proveedor79'), 'sabores_saludables.jpg', '1985-05-18', '2023-05-14', 1),
    ('Barras Energéticas', 'S.A. de C.V.', 'proveedor80@example.com',			HASHBYTES('SHA2_512','proveedor80'), 'barras_energeticas.jpg', '1990-05-06', '2023-05-17', 1),
    ('Especias y Condimentos', 'S.A. de C.V.', 'proveedor81@example.com',		HASHBYTES('SHA2_512','proveedor81'), 'especias_condimentos.jpg', '1983-05-22', '2023-05-20', 1),
    ('Snacks y Botanas Creativas', 'S.A. de C.V.', 'proveedor82@example.com',	HASHBYTES('SHA2_512','proveedor82'), 'snacks_botanas_creativas.jpg', '1977-05-12', '2023-05-23', 1);

--SET @IdUsuarioFin = SCOPE_IDENTITY()
--select * from Usuarios
--UPDATE dbo.Usuarios
--SET [Password] = LOWER(CONVERT(NVARCHAR(MAX),HASHBYTES('SHA2_512', [Password]),2))
--WHERE Id > @IdUsuarioIni

---Insercion rolesusuarios PROVEEDORES -----
INSERT INTO RolesUsuarios(IdUsuario, IdRol)
SELECT Id, 3 FROM Usuarios
WHERE Id > @IdUsuarioIni

-------------Insercion de Proveedores-----------------
INSERT INTO Proveedores (IdUsuario, Direccion, Telefono, Rfc, RazonSocial)
VALUES
    (57, 'Avenida Guanajuato - Colonia Obregón', '4771234567', 'PRV111111A01', 'Proveedores Snacks'),
    (58, 'Calle Yucatán - Colonia Jardines de Jerez', '4772345678', 'PRV222222A02', 'Distribuidora de Bebidas'),
    (59, 'Avenida Insurgentes - Colonia Chapalita', '4773456789', 'PRV333333A03', 'Chips y Dips S.A.'),
    (60, 'Calle Hidalgo - Colonia Las Torres', '4774567890', 'PRV444444A04', 'Micheladas Deluxe S.A.'),
    (61, 'Avenida Chapultepec - Colonia San Felipe', '4775678901', 'PRV555555A05', 'Sabores Saludables Distribuciones'),
    (62, 'Calle Querétaro - Colonia El Dorado', '4776789012', 'PRV666666A06', 'Energía Natural S.A.'),
    (63, 'Avenida Juárez - Colonia Los Gavilanes', '4777890123', 'PRV777777A07', 'Especias y Condimentos S.A.'),
    (64, 'Calle Morelos - Colonia San Isidro', '4778901234', 'PRV888888A08', 'Creaciones de Snacks S.A.');

SELECT * FROM dbo.Proveedores
select * from dbo.Usuarios
go
---- INSERCION MATERIS PRIMAS---------------
select * from UnidadesMedida
--delete from MateriasPrimas
--DBCC CHECKIDENT ('MateriasPrimas', RESEED, 0);
--select * from MateriasPrimas
INSERT INTO MateriasPrimas (Codigo, Nombre, Descripcion, Perecedero, Stock, CantMinima, CantMaxima, IdUnidadMedida, Precio, Foto, IdProveedor, IdStatus, FechaRegistro, FechaModificacion)
VALUES
    ('MP00000001', 'limon', 'Limones frescos para jugo y decoración', 1, 100, 10, 200, 4, 0.5, 'limones.jpg', 1, 1, '2023-05-01', '2023-05-01'),
    ('MP00000002', 'salsa inglesa', 'Salsa inglesa para condimentar', 0, 200, 20, 400, 4, 1.99, 'salsa_inglesa.jpg', 2, 1, '2023-05-01', '2023-05-01'),
    ('MP00000003', 'salsa maggi', 'Salsa Maggi para realzar el sabor', 0, 150, 15, 300, 4, 1.49, 'salsa_maggi.jpg', 3, 1, '2023-05-01', '2023-05-01'),
    ('MP00000004', 'salsa tabasco', 'Salsa Tabasco para dar un toque picante', 0, 180, 18, 350, 4, 1.29, 'salsa_tabasco.jpg', 4, 1, '2023-05-01', '2023-05-01'),
    ('MP00000005', 'cerveza clara', 'Cerveza clara para micheladas', 1, 50, 5, 100, 4, 2.5, 'cerveza_clara.jpg', 5, 1, '2023-05-01', '2023-05-01'),
    ('MP00000006', 'cerveza obscura', 'Cerveza obscura para micheladas', 1, 40, 4, 80, 4, 2.7, 'cerveza_obscura.jpg', 6, 1, '2023-05-01', '2023-05-01'),
    ('MP00000007', 'pepino', 'Pepino fresco para decoración', 1, 120, 12, 250, 2, 0.3, 'pepino.jpg', 7, 1, '2023-05-01', '2023-05-01'),
    ('MP00000008', 'jicama', 'Jicama fresca para micheladas', 1, 100, 10, 200, 2, 0.25, 'jicama.jpg', 8, 1, '2023-05-01', '2023-05-01'),
    ('MP00000009', 'zanahoria', 'Zanahoria fresca para decoración', 1, 130, 13, 260, 2, 0.2, 'zanahoria.jpg', 9, 1, '2023-05-01', '2023-05-01'),
    ('MP00000010', 'papas fritas', 'Papas fritas para botanas', 0, 180, 18, 350, 5, 0.4, 'papas_fritas.jpg', 1, 1, '2023-05-01', '2023-05-01'),
    ('MP00000011', 'cachuate japones', 'Cachuate japonés para botanas', 0, 250, 25, 500, 2, 0.35, 'cachuate_japones.jpg', 2, 1, '2023-05-01', '2023-05-01'),
    ('MP00000012', 'gomita enchilada', 'Gomita enchilada para botanas', 0, 300, 30, 600, 2, 0.15, 'gomita_enchilada.jpg', 3, 1, '2023-05-01', '2023-05-01'),
    ('MP00000013', 'duulce tamarindo', 'Dulce de tamarindo para botanas', 0, 220, 22, 440, 2, 0.2, 'dulce_tamarindo.jpg', 4, 1, '2023-05-01', '2023-05-01'),
    ('MP00000014', 'chile en polvo', 'Chile en polvo para condimentar', 0, 350, 35, 700, 2, 0.1, 'chile_en_polvo.jpg', 5, 1, '2023-05-01', '2023-05-01'),
    ('MP00000015', 'chamoy liquido', 'Chamoy líquido para micheladas', 0, 280, 28, 560, 4, 1.0, 'chamoy_liquido.jpg', 6, 1, '2023-05-01', '2023-05-01'),
    ('MP00000016', 'piña', 'Piña fresca para micheladas y botanas', 1, 120, 12, 240, 4, 1.5, 'pina.jpg', 7, 1, '2023-05-01', '2023-05-01'),
    ('MP00000017', 'chile piquin', 'Chile piquín para condimentar', 0, 400, 40, 800, 2, 0.05, 'chile_piquin.jpg', 8, 1, '2023-05-01', '2023-05-01'),
    ('MP00000018', 'pimienta', 'Pimienta para condimentar', 0, 300, 30, 600, 2, 0.08, 'pimienta.jpg', 9, 1, '2023-05-01', '2023-05-01'),
    ('MP00000019', 'tostitos', 'Tostitos para botanas', 0, 220, 22, 440, 2, 0.25, 'tostitos.jpg', 1, 1, '2023-05-01', '2023-05-01'),
    ('MP00000020', 'cueros curtidos de cerdo', 'Cueros curtidos de cerdo para botanas', 0, 180, 18, 360, 2, 0.3, 'cueros_curtidos_cerdo.jpg', 2, 1, '2023-05-01', '2023-05-01'),
    ('MP00000021', 'clamato', 'Clamato para micheladas', 0, 240, 24, 480, 4, 1.2, 'clamato.jpg', 3, 1, '2023-05-01', '2023-05-01'),
    ('MP00000022', 'chamoy polvo', 'Chamoy en polvo para condimentar', 0, 320, 32, 640, 2, 0.15, 'chamoy_polvo.jpg', 4, 1, '2023-05-01', '2023-05-01'),
    ('MP00000023', 'sal', 'Sal para condimentar', 0, 500, 50, 1000, 1, 0.02, 'sal.jpg', 2, 1, '2023-05-01', '2023-05-01'),
    ('MP00000024', 'azucar', 'Azúcar para condimentar y decorar', 0, 450, 45, 900, 2, 0.03, 'azucar.jpg', 6, 1, '2023-05-01', '2023-05-01'),
	('MP00000025', 'Salsa Picante', 'Salsa picante para botanas', 0, 450, 45, 900, 4, 0.03, 'salsa_picante.jpg', 6, 1, '2023-05-01', '2023-05-01'),
	('MP00000026', 'Doritos', 'Botanas Doritos', 0, 450, 45, 900, 2, 0.03, 'Doritos.jpg', 9, 1, '2023-05-01', '2023-05-01');

-------INSERCIONES RECETAS-----------
--DROP INDEX IX_Recetas_Codigo ON Recetas;
--ALTER TABLE Recetas ALTER COLUMN Codigo varchar(255);
--DELETE FROM Recetas
--DBCC CHECKIDENT ('Recetas', RESEED, 0);
--
SELECT * FROM Recetas
select * from Productos

INSERT INTO Recetas (Codigo, Costo, Cantidad, IdProducto, IdStatus, FechaRegistro, FechaModificacion)
VALUES 
('REC-MicheCUBANA', 5.75, 2, 1, 1, '2023-05-01', '2023-05-01'),
('REC-PAPALOCAS', 4.25, 1, 2, 1, '2023-05-01', '2023-05-01'),
('REC-PIÑACHELA', 3.50, 3, 3, 1, '2023-05-01', '2023-05-01'),
('REC-TOSTILOCOS', 2.90, 2, 4, 1, '2023-05-01', '2023-05-01'),
('REC-GOMICHELA', 6.10, 1, 5, 1, '2023-05-01', '2023-05-01'),
('REC-DORILOCOS', 3.80, 2, 6, 1, '2023-05-01', '2023-05-01'),
('REC-CHAMOCHELA', 7.50, 1, 7, 1, '2023-05-01', '2023-05-01');

------INSERCIONES INGREDIENTE -----
SELECT * FROM Ingrediente
SELECT * FROM MateriasPrimas
SELECT MP.Id,MP.Nombre, UM.IdUnidadMedida, UM.Nombre FROM MateriasPrimas AS MP
INNER JOIN UnidadesMedida AS UM ON MP.IdUnidadMedida=UM.IdUnidadMedida;
SELECT * FROM UnidadesMedida
--UPDATE MateriasPrimas SET IdUnidadMedida=2 WHERE Id=19
select * from Recetas
select * from Ingrediente
-- CUBANA--
INSERT INTO Ingrediente (IdReceta,IdMateriaPrima, Cantidad)
VALUES 
	(1,1, 100),
	(1,14, 20),
	(1,2, 45),
	(1,3, 45),
	(1,4, 15),
	(1, 5,450 );

	--PAPALOCAS
INSERT INTO Ingrediente (IdReceta,IdMateriaPrima, Cantidad)
VALUES 
	(2,7 ,100 ),
	(2,8 ,50 ),
	(2,9 ,50 ),
	(2,10 ,60 ),
	(2, 11,50 ),
	(2,12 , 30),
	(2, 13, 15),
	(2, 1, 100),
	(2, 14, 30),
	(2, 15,50 ),
	(2, 25, 30);

	--PI�ACHELA
INSERT INTO Ingrediente (IdReceta,IdMateriaPrima, Cantidad)
VALUES 
	(3,16 ,20 ),
	(3, 17, 15),
	(3, 1,300 ),
	(3, 5, 200),
	(3, 23, 5),
	(3, 18,5 );

	-- TOSTILOCOS
INSERT INTO Ingrediente (IdReceta,IdMateriaPrima, Cantidad)
VALUES 
	(4,19 ,60 ),
	(4, 7,200 ),
	(4, 8,100 ),
	(4, 20, 200),
	(4, 21,50 ),
	(4, 1, 200),
	(4, 25,15 ),
	(4, 15,30 ),
	( 4,18, 5);

--GOMICHELA
INSERT INTO Ingrediente (IdReceta,IdMateriaPrima, Cantidad)
VALUES 
	(5, 6,355 ),
	(5, 15,30 ),
	(5, 2, 15),
	(5, 14,10 ),
	(5, 23, 5),
	(5, 1,200 ),
	(5, 25, 30),
	(5, 17,15 ),
	(5, 12,50 );

-- DORILOCOS
INSERT INTO Ingrediente (IdReceta,IdMateriaPrima, Cantidad)
VALUES 
	( 6,26, 60),
	(6, 8,100 ),
	(6, 9, 50),
	(6, 7,50 ),
	(6, 20,100 ),
	(6, 11, 50),
	(6, 1, 200),
	(6, 15,30 ),
	(6, 25,15 ),
	(6,17 ,15 );

-- CHAMOCHELA
INSERT INTO Ingrediente (IdReceta,IdMateriaPrima, Cantidad)
VALUES 
		(7,5 ,200 ),
		(7, 21,200 ),
		(7,1,300 ),
		(7, 25,60 ),
		(7, 22,45 ),
		(7, 14, 15),
		(7, 23, 5);

--- INSERCIONES PEDIDOS A PROVEEDORES

--ALTER TABLE Pedidos
--ALTER COLUMN Rfc VARCHAR(255); 
--DELETE FROM Pedidos
--DBCC CHECKIDENT ('Pedidos', RESEED, 0);

-- 16 rows

INSERT INTO Pedidos (IdPedido, Fecha, IdUsuario, IdStatus, FechaEntrega, Domicilio, Telefono, RazonSocial, Rfc, TipoPago, TipoEnvio, TipoPedido, Total)
VALUES
    (1, '2023-05-01', 57, 1, '2023-05-05', 'Avenida Guanajuato - Colonia Obregón', '4771234567', 'Proveedor1', 'RFC111111A01', 'E', 'D', 'C', 150.50),
    (2, '2023-05-02', 58, 1, '2023-05-06', 'Calle Yucatán - Colonia Jardines de Jerez', '4772345678', 'Proveedor2', 'RFC222222A02', 'TC', 'T', 'C', 200.00),
    (3, '2023-05-03', 59, 1, '2023-05-07', 'Avenida Insurgentes - Colonia Chapalita', '4773456789', 'Proveedor3', 'RFC333333A03', 'TD', 'D', 'C', 120.75),
    (4, '2023-05-04', 60, 1, '2023-05-08', 'Calle Hidalgo - Colonia Las Torres', '4774567890', 'Proveedor4', 'RFC444444A04', 'TB', 'T', 'C', 85.20),
    (5, '2023-05-05', 61, 1, '2023-05-09', 'Avenida Chapultepec - Colonia San Felipe', '4775678901', 'Proveedor5', 'RFC555555A05', 'E', 'D', 'C', 300.00),
    (6, '2023-05-06', 62, 1, '2023-05-10', 'Calle Querétaro - Colonia El Dorado', '4776789012', 'Proveedor6', 'RFC666666A06', 'TC', 'T', 'C', 75.50),
    (7, '2023-05-07', 63, 1, '2023-05-11', 'Avenida Juárez - Colonia Los Gavilanes', '4777890123', 'Proveedor7', 'RFC777777A07', 'TD', 'D', 'C', 210.25),
    (8, '2023-05-08', 64, 1, '2023-05-12', 'Calle Morelos - Colonia San Isidro', '4778901234', 'Proveedor8', 'RFC888888A08', 'TB', 'T', 'C', 95.80),
    (9, '2023-05-09', 57, 1, '2023-05-13', 'Avenida Reforma - Colonia La Moderna', '4779012345', 'Proveedor9', 'RFC999999A09', 'E', 'D', 'C', 180.60),
    (10, '2023-05-10', 58, 1, '2023-05-14', 'Calle Zacatecas - Colonia La Brisa', '4770123456', 'Proveedor10', 'RFC101010A10', 'TC', 'T', 'C', 250.75),
    (11, '2023-05-15', 61, 1, '2023-05-19', 'Avenida Chapultepec - Colonia San Felipe', '4775678901', 'Proveedor15', 'RFC555616A05', 'E', 'D', 'C', 280.20),
    (12, '2023-05-16', 62, 1, '2023-05-20', 'Calle Querétaro - Colonia El Dorado', '4776789012', 'Proveedor16', 'RFC666717A06', 'TC', 'T', 'C', 65.00),
    (13, '2023-05-17', 63, 1, '2023-05-21', 'Avenida Juárez - Colonia Los Gavilanes', '4777890123', 'Proveedor17', 'RFC777818A07', 'TD', 'D', 'C', 190.30),
    (14, '2023-05-18', 64, 1, '2023-05-22', 'Calle Morelos - Colonia San Isidro', '4778901234', 'Proveedor18', 'RFC888919A08', 'TB', 'T', 'C', 85.75),
    (15, '2023-05-19', 57, 1, '2023-05-23', 'Avenida Reforma - Colonia La Moderna', '4779012345', 'Proveedor19', 'RFC999920A09', 'E', 'D', 'C', 160.15),
    (16, '2023-05-20', 58, 1, '2023-05-24', 'Calle Zacatecas - Colonia La Brisa', '4770123456', 'Proveedor20', 'RFC101021A10', 'TC', 'T', 'C', 230.50);


-- INSERCIONES A COMPRAS
--ALTER TABLE dbo.Compras
--DROP CONSTRAINT FK_Compras_Pedidos_IdPedido_Fecha;

select * from Pedidos
select * from Compras

INSERT INTO Compras (Fecha, IdPedido, IdProveedor, Total)
SELECT TOP 16 PT.Fecha, PT.IdPedido, P.IdProveedor, PT.Total + 30
FROM Pedidos PT
JOIN dbo.Proveedores P
ON P.IdUsuario = PT.IdUsuario


--VALUES
--    ('2023-05-01',1 ,  1, 100.00),
--    ('2023-05-02',2 ,  2, 150.00),
--    ('2023-05-03',3 ,  3, 120.00),
--    ('2023-05-04',4 ,  4, 80.00),
--    ('2023-05-05',5 ,  5, 90.00),
--    ('2023-05-06',6 ,  6, 200.00),
--    ('2023-05-07',7 ,  7, 130.00),
--    ('2023-05-08',8 ,  8, 110.00),
--    ('2023-05-09',9 ,  9, 170.00),
--    ('2023-05-10',10,  1,  140.00),
--    ('2023-05-11',11,  2,  160.00),
--    ('2023-05-12',12,  3,  190.00),
--    ('2023-05-13',13,  4,  70.00),
--    ('2023-05-14',14,  5,  180.00),
--    ('2023-05-19',15,  6,  210.00),
--    ('2023-05-20',16,  7,  250.00);

GO
----INSERCIONES PEDIDOS A CLIENTES 64 ROWS 
DECLARE @IdPedidoIni INT = (SELECT MAX(IdPedido) FROM dbo.Pedidos)
select * from Pedidos
--MES MAYO
--inicia en 17

    -- Valores del 1 al 10
INSERT INTO Pedidos (IdPedido, Fecha, IdUsuario, IdStatus, FechaEntrega, Domicilio, Telefono, RazonSocial, Rfc, TipoPago, TipoEnvio, TipoPedido, Total)
VALUES
    (@IdPedidoIni + 1, '2023-05-01', 4, 1, '2023-05-01', 'Avenida Guanajuato - Colonia Obregón', '4771234567', 'Proveedor1', 'RFC111113A01', 'E', 'D', 'V', 50.00),
    (@IdPedidoIni + 2, '2023-05-02', 5, 1, '2023-05-02', 'Calle Yucatán - Colonia Jardines de Jerez', '4772345678', 'Proveedor2', 'RFC222223A02', 'TC', 'T', 'V', 75.50),
    (@IdPedidoIni + 3, '2023-05-03', 6, 1, '2023-05-03', 'Avenida Insurgentes - Colonia Chapalita', '4773456789', 'Proveedor3', 'RFC333334A03', 'TD', 'D', 'V', 120.75),
    (@IdPedidoIni + 4, '2023-05-04', 7, 1, '2023-05-04', 'Calle Hidalgo - Colonia Las Torres', '4774567890', 'Proveedor4', 'RFC444445A04', 'TB', 'T', 'V', 85.25),
    (@IdPedidoIni + 5, '2023-05-05', 8, 1, '2023-05-05', 'Avenida Chapultepec - Colonia San Felipe', '4775678901', 'Proveedor5', 'RFC555556A05', 'E', 'D', 'V', 150.50),
    (@IdPedidoIni + 6, '2023-05-06', 9, 1, '2023-05-06', 'Calle Querétaro - Colonia El Dorado', '4776789012', 'Proveedor6', 'RFC666667A06', 'TC', 'T', 'V', 200.00),
    (@IdPedidoIni + 7, '2023-05-07', 10, 1, '2023-05-07', 'Avenida Juárez - Colonia Los Gavilanes', '4777890123', 'Proveedor7', 'RFC777778A07', 'TD', 'D', 'V', 90.75),
    (@IdPedidoIni + 8, '2023-05-08', 11, 1, '2023-05-08', 'Calle Morelos - Colonia San Isidro', '4778901234', 'Proveedor8', 'RFC888889A08', 'TB', 'T', 'V', 180.25),
    (@IdPedidoIni + 9, '2023-05-09', 12, 1, '2023-05-09', 'Avenida Reforma - Colonia La Moderna', '4779012345', 'Proveedor9', 'RFC999990A09', 'E', 'D', 'V', 120.00),
    (@IdPedidoIni + 10, '2023-05-10', 13, 1, '2023-05-10', 'Calle Zacatecas - Colonia La Brisa', '4770123456', 'Proveedor10', 'RFC1010100A10', 'TC', 'T', 'V', 70.50);
GO
DECLARE @IdPedidoIni INT = (SELECT MAX(IdPedido) FROM dbo.Pedidos)
-- Valores del 11 al 20
INSERT INTO Pedidos (IdPedido, Fecha, IdUsuario, IdStatus, FechaEntrega, Domicilio, Telefono, RazonSocial, Rfc, TipoPago, TipoEnvio, TipoPedido, Total)
VALUES
    (@IdPedidoIni + 1, '2023-05-11', 14, 1, '2023-05-11', 'Avenida Álvaro Obregón - Colonia La Salle', '4771234567', 'Proveedor11', 'RFC1111111A11', 'E', 'D', 'V', 110.75),
    (@IdPedidoIni + 2, '2023-05-12', 15, 1, '2023-05-12', 'Calle Michoacán - Colonia La Florida', '4772345678', 'Proveedor12', 'RFCA222222A12', 'TC', 'T', 'V', 80.25),
    (@IdPedidoIni + 3, '2023-05-13', 16, 1, '2023-05-13', 'Avenida Venustiano Carranza - Colonia Villa Verde', '4773456789', 'Proveedor13', 'RFC3333333A13', 'TD', 'D', 'V', 60.00),
    (@IdPedidoIni + 4, '2023-05-14', 17, 1, '2023-05-14', 'Calle Puebla - Colonia La Merced', '4774567890', 'Proveedor14', 'RFC4444444A14', 'TB', 'T', 'V', 95.50),
    (@IdPedidoIni + 5, '2023-05-15', 18, 1, '2023-05-15', 'Avenida Revolución - Colonia San Jerónimo', '4775678901', 'Proveedor15', 'RFC5555555A15', 'E', 'D', 'V', 130.75),
    (@IdPedidoIni + 6, '2023-05-16', 19, 1, '2023-05-16', 'Calle Coahuila - Colonia Industrial', '4776789012', 'Proveedor16', 'RFC6666666A16', 'TC', 'T', 'V', 70.25),
    (@IdPedidoIni + 7, '2023-05-17', 20, 1, '2023-05-17', 'Avenida Himno Nacional - Colonia San Juan Bosco', '4777890123', 'Proveedor17', 'RFC7777777A17', 'TD', 'D', 'V', 200.50),
    (@IdPedidoIni + 8, '2023-05-18', 21, 1, '2023-05-18', 'Calle Veracruz - Colonia Del Valle', '4778901234', 'Proveedor18', 'RFC888888A18', 'TB', 'T', 'V', 150.00),
    (@IdPedidoIni + 9, '2023-05-19', 22, 1, '2023-05-19', 'Avenida Rayón - Colonia León II', '4779012345', 'Proveedor19', 'RFC999999A19', 'E', 'D', 'V', 180.75),
    (@IdPedidoIni + 10, '2023-05-20', 23, 1, '2023-05-20', 'Calle Jalisco - Colonia La Estrella', '4770123456', 'Proveedor20', 'RFC1010101A20', 'TC', 'T', 'V', 120.25);
    -- Valores del 21 al 30
GO
DECLARE @IdPedidoIni INT = (SELECT MAX(IdPedido) FROM dbo.Pedidos)
INSERT INTO Pedidos (IdPedido, Fecha, IdUsuario, IdStatus, FechaEntrega, Domicilio, Telefono, RazonSocial, Rfc, TipoPago, TipoEnvio, TipoPedido, Total)
VALUES
    (@IdPedidoIni + 1, '2023-05-21', 24, 1, '2023-05-21', 'Avenida López Mateos - Colonia San Miguel', '4771234567', 'Proveedor21', 'RFCA111111A21', 'TD', 'D', 'V', 90.50),
    (@IdPedidoIni + 2, '2023-05-22', 25, 1, '2023-05-22', 'Calle Sinaloa - Colonia Las Américas', '4772345678', 'Proveedor22', 'RFC2222222A22', 'TB', 'T', 'V', 70.00),
    (@IdPedidoIni + 3, '2023-05-01', 24, 1, '2023-05-01', 'Avenida Guanajuato - Colonia Obregón', '4771234567', 'Proveedor23', 'RFC1111112A23', 'E', 'D', 'V', 80.00),
    (@IdPedidoIni + 4, '2023-05-02', 25, 1, '2023-05-02', 'Calle Yucatán - Colonia Jardines de Jerez', '4772345678', 'Proveedor24', 'RFC2222222A24', 'TC', 'T', 'V', 110.25),
    (@IdPedidoIni + 5, '2023-05-03', 26, 1, '2023-05-03', 'Avenida Insurgentes - Colonia Chapalita', '4773456789', 'Proveedor25', 'RFC3333332A25', 'TD', 'D', 'V', 75.75),
    (@IdPedidoIni + 6, '2023-05-04', 27, 1, '2023-05-04', 'Calle Hidalgo - Colonia Las Torres', '4774567890', 'Proveedor26', 'RFC4444425A26', 'TB', 'T', 'V', 90.50),
    (@IdPedidoIni + 7, '2023-05-05', 28, 1, '2023-05-05', 'Avenida Chapultepec - Colonia San Felipe', '4775678901', 'Proveedor27', 'RFC5555526A27', 'E', 'D', 'V', 105.75),
    (@IdPedidoIni + 8, '2023-05-06', 29, 1, '2023-05-06', 'Calle Querétaro - Colonia El Dorado', '4776789012', 'Proveedor28', 'RFC6666662A28', 'TC', 'T', 'V', 70.25),
    (@IdPedidoIni + 9, '2023-05-07', 30, 1, '2023-05-07', 'Avenida Juárez - Colonia Los Gavilanes', '4777890123', 'Proveedor29', 'RFC7777728A29', 'TD', 'D', 'V', 95.50),
    (@IdPedidoIni + 10, '2023-05-08', 31, 1, '2023-05-08', 'Calle Morelos - Colonia San Isidro', '4778901234', 'Proveedor30', 'RFC8888829A30', 'TB', 'T', 'V', 120.75);
	GO
DECLARE @IdPedidoIni INT = (SELECT MAX(IdPedido) FROM dbo.Pedidos)
-- Valores del 31 al 40
INSERT INTO Pedidos (IdPedido, Fecha, IdUsuario, IdStatus, FechaEntrega, Domicilio, Telefono, RazonSocial, Rfc, TipoPago, TipoEnvio, TipoPedido, Total)
VALUES
    (@IdPedidoIni + 1, '2023-05-09', 32, 1, '2023-05-09', 'Avenida Reforma - Colonia La Moderna', '4779012345', 'Proveedor31', 'RFC9999930A31', 'E', 'D', 'V', 150.00),
    (@IdPedidoIni + 2, '2023-05-10', 33, 1, '2023-05-10', 'Calle Zacatecas - Colonia La Brisa', '4770123456', 'Proveedor32', 'RFC1010103A32', 'TC', 'T', 'V', 85.25),
    (@IdPedidoIni + 3, '2023-05-11', 34, 1, '2023-05-11', 'Avenida Álvaro Obregón - Colonia La Salle', '4771234567', 'Proveedor33', 'RFC1110112A33', 'E', 'D', 'V', 110.50),
    (@IdPedidoIni + 4, '2023-05-12', 35, 1, '2023-05-12', 'Calle Michoacán - Colonia La Florida', '4772345678', 'Proveedor34', 'RFC1212123A34', 'TC', 'T', 'V', 95.75),
    (@IdPedidoIni + 5, '2023-05-13', 36, 1, '2023-05-13', 'Avenida Venustiano Carranza - Colonia Villa Verde', '4773456789', 'Proveedor35', 'RFC1313134A35', 'TD', 'D', 'V', 75.25),
    (@IdPedidoIni + 6, '2023-05-14', 37, 1, '2023-05-14', 'Calle Puebla - Colonia La Merced', '4774567890', 'Proveedor36', 'RFC1414145A36', 'TB', 'T', 'V', 120.00),
    (@IdPedidoIni + 7, '2023-05-15', 38, 1, '2023-05-15', 'Avenida Revolución - Colonia San Jerónimo', '4775678901', 'Proveedor37', 'RFC1511536A37', 'E', 'D', 'V', 85.50),
    (@IdPedidoIni + 8, '2023-05-16', 39, 1, '2023-05-16', 'Calle Coahuila - Colonia Industrial', '4776789012', 'Proveedor38', 'RFC1616167A38', 'TC', 'T', 'V', 70.25),
    (@IdPedidoIni + 9, '2023-05-17', 40, 1, '2023-05-17', 'Avenida Himno Nacional - Colonia San Juan Bosco', '4777890123', 'Proveedor39', 'RFC1717178A39', 'TD', 'D', 'V', 100.75),
    (@IdPedidoIni + 10, '2023-05-18', 41, 1, '2023-05-18', 'Calle Veracruz - Colonia Del Valle', '4778901234', 'Proveedor40', 'RFC1818139A40', 'TB', 'T', 'V', 150.50);

GO
DECLARE @IdPedidoIni INT = (SELECT MAX(IdPedido) FROM dbo.Pedidos)
    -- Valores del 41 al 50
INSERT INTO Pedidos (IdPedido, Fecha, IdUsuario, IdStatus, FechaEntrega, Domicilio, Telefono, RazonSocial, Rfc, TipoPago, TipoEnvio, TipoPedido, Total)
VALUES
    (@IdPedidoIni + 1, '2023-05-19', 42, 1, '2023-05-19', 'Avenida Rayón - Colonia León II', '4779012345', 'Proveedor41', 'RFC1919140A41', 'E', 'D', 'V', 95.00),
    (@IdPedidoIni + 2, '2023-05-20', 43, 1, '2023-05-20', 'Calle Jalisco - Colonia La Estrella', '4770123456', 'Proveedor42', 'RFC2020204A42', 'TC', 'T', 'V', 110.25),
    (@IdPedidoIni + 3, '2023-05-21', 44, 1, '2023-05-21', 'Avenida López Mateos - Colonia San Miguel', '4771234567', 'Proveedor43', 'RFC2121214A43', 'TD', 'D', 'V', 75.75),
    (@IdPedidoIni + 4, '2023-05-22', 45, 1, '2023-05-22', 'Avenida Sierra de Lobos - Colonia La Campiña', '4772345678', 'Proveedor44', 'RFC2222224A44', 'E', 'D', 'V', 80.00),
    (@IdPedidoIni + 5, '2023-05-23', 46, 1, '2023-05-23', 'Calle Durango - Colonia Los Paraísos', '4773456789', 'Proveedor45', 'RFC3333334A45', 'TC', 'T', 'V', 110.25),
    (@IdPedidoIni + 6, '2023-05-24', 47, 1, '2023-05-24', 'Avenida Celaya - Colonia Las Trojes', '4774567890', 'Proveedor46', 'RFC4444445A46', 'TD', 'D', 'V', 75.75),
    (@IdPedidoIni + 7, '2023-05-25', 48, 1, '2023-05-25', 'Calle Oaxaca - Colonia San José del Consuelo', '4775678901', 'Proveedor47', 'RFC5555546A47', 'TB', 'T', 'V', 90.50),
    (@IdPedidoIni + 8, '2023-05-26', 49, 1, '2023-05-26', 'Avenida León-Querétaro - Colonia Hidalgo', '4776789012', 'Proveedor48', 'RFC6666647A48', 'E', 'D', 'V', 105.75),
    (@IdPedidoIni + 9, '2023-05-27', 50, 1, '2023-05-27', 'Calle Guadalajara - Colonia La Carmona', '4777890123', 'Proveedor49', 'RFC7777748A49', 'TC', 'T', 'V', 70.25),
    (@IdPedidoIni + 10, '2023-05-28', 51, 1, '2023-05-28', 'Avenida Valle de Santiago - Colonia Los Castillos', '4778901234', 'Proveedor50', 'RFC8888849A50', 'TD', 'D', 'V', 95.50);

GO
DECLARE @IdPedidoIni INT = (SELECT MAX(IdPedido) FROM dbo.Pedidos)
-- Valores del 51 al 60
INSERT INTO Pedidos (IdPedido, Fecha, IdUsuario, IdStatus, FechaEntrega, Domicilio, Telefono, RazonSocial, Rfc, TipoPago, TipoEnvio, TipoPedido, Total)
VALUES
    (@IdPedidoIni + 1, '2023-05-29', 52, 1, '2023-05-29', 'Calle Sonora - Colonia La Joya', '4779012345', 'Proveedor51', 'RFC9999950A51', 'TB', 'T', 'V', 120.75),
    (@IdPedidoIni + 2, '2023-05-30', 53, 1, '2023-05-30', 'Avenida San Juan Bosco - Colonia Los Olivos', '4770123456', 'Proveedor52', 'RFC1010105A52', 'E', 'D', 'V', 150.00),
    (@IdPedidoIni + 3, '2023-05-31', 54, 1, '2023-05-31', 'Calle Aguascalientes - Colonia El Rosario', '4771234567', 'Proveedor53', 'RFC1110112A53', 'TC', 'T', 'V', 85.25),
    (@IdPedidoIni + 4, '2023-05-01', 55, 1, '2023-05-01', 'Avenida Miguel Hidalgo - Colonia Los Naranjos', '4772345678', 'Proveedor54', 'RFC1212123A54', 'E', 'D', 'V', 110.50),
    (@IdPedidoIni + 5, '2023-05-02', 56, 1, '2023-05-02', 'Calle Colima - Colonia Azteca', '4773456789', 'Proveedor55', 'RFC1313134A55', 'TC', 'T', 'V', 95.75),
    (@IdPedidoIni + 6, '2023-05-03', 57, 1, '2023-05-03', 'Avenida Mariano Escobedo - Colonia San Nicolás', '4774567890', 'Proveedor56', 'RFC1414145A56', 'TD', 'D', 'V', 75.25),
    (@IdPedidoIni + 7, '2023-05-04', 58, 1, '2023-05-04', 'Calle Nayarit - Colonia Nueva', '4775678901', 'Proveedor57', 'RFC1515156A57', 'TB', 'T', 'V', 120.00),
    (@IdPedidoIni + 8, '2023-05-05', 59, 1, '2023-05-05', 'Avenida La Luz - Colonia San José de Cementos', '4776789012', 'Proveedor58', 'RFC1616157A58', 'E', 'D', 'V', 85.50),
    (@IdPedidoIni + 9, '2023-05-06', 60, 1, '2023-05-06', 'Calle Tamaulipas - Colonia San Rafael', '4777890123', 'Proveedor59', 'RFC1717175A59', 'TC', 'T', 'V', 110.25),
    (@IdPedidoIni + 10, '2023-05-07', 61, 1, '2023-05-07', 'Avenida Industrial - Colonia La Marina', '4778901234', 'Proveedor60', 'RFC1818159A60', 'TD', 'D', 'V', 75.75);

GO
DECLARE @IdPedidoIni INT = (SELECT MAX(IdPedido) FROM dbo.Pedidos)
-- Valores del 60 al 64
INSERT INTO Pedidos (IdPedido, Fecha, IdUsuario, IdStatus, FechaEntrega, Domicilio, Telefono, RazonSocial, Rfc, TipoPago, TipoEnvio, TipoPedido, Total)
VALUES
    (@IdPedidoIni + 1, '2023-05-08', 62, 1, '2023-05-08', 'Calle Campeche - Colonia San Felipe de Jesús', '4779012345', 'Proveedor61', 'RFC1911960A61', 'TB', 'T', 'V', 90.50),
    (@IdPedidoIni + 2, '2023-05-09', 63, 1, '2023-05-09', 'Avenida Guanajuato - Colonia Obregón', '4770123456', 'Proveedor62', 'RFC2020201A62', 'E', 'D', 'V', 105.75),
    (@IdPedidoIni + 3, '2023-05-10', 64, 1, '2023-05-10', 'Calle Yucatán - Colonia Jardines de Jerez', '4771234567', 'Proveedor63', 'RFC2121212A63', 'TC', 'T', 'V', 70.25),
    (@IdPedidoIni + 4, '2023-05-11', 4, 1, '2023-05-11', 'Avenida Insurgentes - Colonia Chapalita', '4772345678', 'Proveedor64', 'RFC222223A64', 'E', 'D', 'V', 80.00);

	--termina en 80
-- MES JUNIO 78 rows


GO
select * from Pedidos
--Inicia en 81
DECLARE @IdPedidoIni INT = (SELECT MAX(IdPedido) FROM dbo.Pedidos)
INSERT INTO Pedidos (IdPedido, Fecha, IdUsuario, IdStatus, FechaEntrega, Domicilio, Telefono, RazonSocial, Rfc, TipoPago, TipoEnvio, TipoPedido, Total)
VALUES
    (@IdPedidoIni + 1, '2023-06-01', 4, 1, '2023-06-01', 'Avenida Insurgentes - Colonia Chapalita', '4772345678', 'Proveedor68', 'RFC222223A68', 'E', 'D', 'V', 85.00),
    (@IdPedidoIni + 2, '2023-06-02', 5, 1, '2023-06-02', 'Calle Hidalgo - Colonia Las Torres', '4773456789', 'Proveedor69', 'RFC333334A69', 'TC', 'T', 'V', 120.75),
    (@IdPedidoIni + 3, '2023-06-03', 6, 1, '2023-06-03', 'Avenida Chapultepec - Colonia San Felipe', '4774567890', 'Proveedor70', 'RFC444445A70', 'TD', 'D', 'V', 70.25),
    (@IdPedidoIni + 4, '2023-06-04', 7, 1, '2023-06-04', 'Calle Querétaro - Colonia El Dorado', '4775678901', 'Proveedor71', 'RFC555556A71', 'TB', 'T', 'V', 88.90),
    (@IdPedidoIni + 5, '2023-06-05', 8, 1, '2023-06-05', 'Avenida Juárez - Colonia Los Gavilanes', '4776789012', 'Proveedor72', 'RFC666667A72', 'E', 'D', 'V', 95.50),
    (@IdPedidoIni + 6, '2023-06-06', 9, 1, '2023-06-06', 'Calle Morelos - Colonia San Isidro', '4777890123', 'Proveedor73', 'RFC777778A73', 'TC', 'T', 'V', 130.25),
    (@IdPedidoIni + 7, '2023-06-07', 10, 1, '2023-06-07', 'Avenida Reforma - Colonia La Moderna', '4778901234', 'Proveedor74', 'RFC888889A74', 'TD', 'D', 'V', 75.75),
    (@IdPedidoIni + 8, '2023-06-08', 11, 1, '2023-06-08', 'Calle Zacatecas - Colonia La Brisa', '4779012345', 'Proveedor75', 'RFC999990A75', 'TB', 'T', 'V', 92.00),
    (@IdPedidoIni + 9, '2023-06-09', 12, 1, '2023-06-09', 'Avenida Álvaro Obregón - Colonia La Salle', '4770123456', 'Proveedor76', 'RFC101010B76', 'E', 'D', 'V', 88.50),
    (@IdPedidoIni + 10,'2023-06-10', 13, 1, '2023-06-10', 'Calle Michoacán - Colonia La Florida', '4771234567', 'Proveedor77', 'RFC121212B77', 'TC', 'T', 'V', 125.75);
GO
--Inicia en 91
DECLARE @IdPedidoIni INT = (SELECT MAX(IdPedido) FROM dbo.Pedidos)
INSERT INTO Pedidos (IdPedido, Fecha, IdUsuario, IdStatus, FechaEntrega, Domicilio, Telefono, RazonSocial, Rfc, TipoPago, TipoEnvio, TipoPedido, Total)
VALUES    
	(@IdPedidoIni + 1, '2023-06-11', 14, 1, '2023-06-11', 'Avenida Venustiano Carranza - Colonia Villa Verde', '4772345678', 'Proveedor78', 'RFC131313C78', 'TD', 'D', 'V', 78.25),
    (@IdPedidoIni + 2, '2023-06-12', 15, 1, '2023-06-12', 'Calle Puebla - Colonia La Merced', '4773456789', 'Proveedor79', 'RFC141414C79', 'TB', 'T', 'V', 96.90),
    (@IdPedidoIni + 3, '2023-06-13', 16, 1, '2023-06-13', 'Avenida Revolución - Colonia San Jerónimo', '4774567890', 'Proveedor80', 'RFC151515D80', 'E', 'D', 'V', 103.50),
    (@IdPedidoIni + 4, '2023-06-14', 17, 1, '2023-06-14', 'Calle Coahuila - Colonia Industrial', '4775678901', 'Proveedor81', 'RFC161616D81', 'TC', 'T', 'V', 140.25),
    (@IdPedidoIni + 5, '2023-06-15', 18, 1, '2023-06-15', 'Avenida Himno Nacional - Colonia San Juan Bosco', '4776789012', 'Proveedor82', 'RFC171717E82', 'TD', 'D', 'V', 82.75),
    (@IdPedidoIni + 6, '2023-06-16', 19, 1, '2023-06-16', 'Calle Veracruz - Colonia Del Valle', '4777890123', 'Proveedor83', 'RFC181818E83', 'TB', 'T', 'V', 99.00),
    (@IdPedidoIni + 7, '2023-06-17', 20, 1, '2023-06-17', 'Avenida Rayón - Colonia León II', '4778901234', 'Proveedor84', 'RFC191919F84', 'E', 'D', 'V', 91.50),
    (@IdPedidoIni + 8, '2023-06-18', 21, 1, '2023-06-18', 'Calle Jalisco - Colonia La Estrella', '4779012345', 'Proveedor85', 'RFC202020F85', 'TC', 'T', 'V', 130.75),
    (@IdPedidoIni + 9, '2023-06-19', 22, 1, '2023-06-19', 'Avenida López Mateos - Colonia San Miguel', '4770123456', 'Proveedor86', 'RFC212121G86', 'TD', 'D', 'V', 88.25),
    (@IdPedidoIni + 10,'2023-06-20', 23, 1, '2023-06-20', 'Calle Sinaloa - Colonia Las Américas', '4771234567', 'Proveedor87', 'RFC222222G87', 'TB', 'T', 'V', 102.00);

GO
--Inicia en 101
DECLARE @IdPedidoIni INT = (SELECT MAX(IdPedido) FROM dbo.Pedidos)
INSERT INTO Pedidos (IdPedido, Fecha, IdUsuario, IdStatus, FechaEntrega, Domicilio, Telefono, RazonSocial, Rfc, TipoPago, TipoEnvio, TipoPedido, Total)
VALUES   
    (@IdPedidoIni + 1, '2023-06-21', 24, 1, '2023-06-21', 'Avenida Sierra de Lobos - Colonia La Campiña', '4772345678', 'Proveedor88', 'RFC232323H88', 'E', 'D', 'V', 75.00),
    (@IdPedidoIni + 2, '2023-06-22', 25, 1, '2023-06-22', 'Calle Durango - Colonia Los Paraísos', '4773456789', 'Proveedor89', 'RFC242424H89', 'TC', 'T', 'V', 110.75),
    (@IdPedidoIni + 3, '2023-06-23', 26, 1, '2023-06-23', 'Avenida Celaya - Colonia Las Trojes', '4774567890', 'Proveedor90', 'RFC252525H90', 'TD', 'D', 'V', 62.25),
    (@IdPedidoIni + 4, '2023-06-24', 27, 1, '2023-06-24', 'Calle Oaxaca - Colonia San José del Consuelo', '4775678901', 'Proveedor91', 'RFC262626H91', 'TB', 'T', 'V', 88.90),
    (@IdPedidoIni + 5, '2023-06-25', 28, 1, '2023-06-25', 'Avenida León-Querétaro - Colonia Hidalgo', '4776789012', 'Proveedor92', 'RFC272727H92', 'E', 'D', 'V', 93.50),
    (@IdPedidoIni + 6, '2023-06-26', 29, 1, '2023-06-26', 'Calle Guadalajara - Colonia La Carmona', '4777890123', 'Proveedor93', 'RFC282828H93', 'TC', 'T', 'V', 120.25),
    (@IdPedidoIni + 7, '2023-06-27', 30, 1, '2023-06-27', 'Avenida Valle de Santiago - Colonia Los Castillos', '4778901234', 'Proveedor94', 'RFC292929H94', 'TD', 'D', 'V', 73.75),
    (@IdPedidoIni + 8, '2023-06-28', 31, 1, '2023-06-28', 'Calle Sonora - Colonia La Joya', '4779012345', 'Proveedor95', 'RFC303030H95', 'TB', 'T', 'V', 82.00),
    (@IdPedidoIni + 9, '2023-06-29', 32, 1, '2023-06-29', 'Avenida San Juan Bosco - Colonia Los Olivos', '4770123456', 'Proveedor96', 'RFC313131H96', 'E', 'D', 'V', 88.25),
    (@IdPedidoIni + 10,'2023-06-30', 33, 1, '2023-06-30', 'Calle Aguascalientes - Colonia El Rosario', '4771234567', 'Proveedor97', 'RFC323232H97', 'TC', 'T', 'V', 130.75);

GO
--Inicia en 111
DECLARE @IdPedidoIni INT = (SELECT MAX(IdPedido) FROM dbo.Pedidos)
INSERT INTO Pedidos (IdPedido, Fecha, IdUsuario, IdStatus, FechaEntrega, Domicilio, Telefono, RazonSocial, Rfc, TipoPago, TipoEnvio, TipoPedido, Total)
VALUES
    (@IdPedidoIni + 1, '2023-06-21', 34, 1, '2023-06-21', 'Avenida Miguel Hidalgo - Colonia Los Naranjos', '4772345678', 'Proveedor98', 'RFC333333H98', 'TD', 'D', 'V', 68.25),
    (@IdPedidoIni + 2, '2023-06-22', 35, 1, '2023-06-22', 'Calle Colima - Colonia Azteca', '4773456789', 'Proveedor99', 'RFC343434H99', 'TB', 'T', 'V', 95.90),
    (@IdPedidoIni + 3, '2023-06-23', 36, 1, '2023-06-23', 'Avenida Mariano Escobedo - Colonia San Nicolás', '4774567890', 'Proveedor100', 'RFC353535H100', 'E', 'D', 'V', 102.50),
    (@IdPedidoIni + 4, '2023-06-24', 37, 1, '2023-06-24', 'Calle Nayarit - Colonia Nueva', '4775678901', 'Proveedor101', 'RFC363636H101', 'TC', 'T', 'V', 140.25),
    (@IdPedidoIni + 5, '2023-06-25', 38, 1, '2023-06-25', 'Avenida La Luz - Colonia San José de Cementos', '4776789012', 'Proveedor102', 'RFC373737H102', 'TD', 'D', 'V', 82.75),
    (@IdPedidoIni + 6, '2023-06-26', 39, 1, '2023-06-26', 'Calle Tamaulipas - Colonia San Rafael', '4777890123', 'Proveedor103', 'RFC383838H103', 'TB', 'T', 'V', 99.00),
    (@IdPedidoIni + 7, '2023-06-27', 40, 1, '2023-06-27', 'Avenida Industrial - Colonia La Marina', '4778901234', 'Proveedor104', 'RFC393939H104', 'E', 'D', 'V', 105.25),
    (@IdPedidoIni + 8, '2023-06-28', 41, 1, '2023-06-28', 'Calle Campeche - Colonia San Felipe de Jesús', '4779012345', 'Proveedor105', 'RFC404040H105', 'TC', 'T', 'V', 62.90),
    (@IdPedidoIni + 9, '2023-06-29', 42, 1, '2023-06-29', 'Avenida Guanajuato - Colonia Obregón', '4770123456', 'Proveedor106', 'RFC414141H106', 'TD', 'D', 'V', 88.50),
    (@IdPedidoIni + 10,'2023-06-30', 43, 1, '2023-06-30', 'Calle Yucatán - Colonia Jardines de Jerez', '4771234567', 'Proveedor107', 'RFC424242H107', 'TB', 'T', 'V', 102.25);

GO
--Inicia en 121
DECLARE @IdPedidoIni INT = (SELECT MAX(IdPedido) FROM dbo.Pedidos)
INSERT INTO Pedidos (IdPedido, Fecha, IdUsuario, IdStatus, FechaEntrega, Domicilio, Telefono, RazonSocial, Rfc, TipoPago, TipoEnvio, TipoPedido, Total)
VALUES
    (@IdPedidoIni + 1, '2023-06-01', 44, 1, '2023-06-01', 'Avenida Insurgentes - Colonia Chapalita', '4772345678', 'Proveedor108', 'RFC434343H108', 'E', 'D', 'V', 95.00),
    (@IdPedidoIni + 2, '2023-06-02', 45, 1, '2023-06-02', 'Calle Hidalgo - Colonia Las Torres', '4773456789', 'Proveedor109', 'RFC444444H109', 'TC', 'T', 'V', 112.75),
    (@IdPedidoIni + 3, '2023-06-03', 46, 1, '2023-06-03', 'Avenida Chapultepec - Colonia San Felipe', '4774567890', 'Proveedor110', 'RFC454545H110', 'TD', 'D', 'V', 67.25),
    (@IdPedidoIni + 4, '2023-06-04', 47, 1, '2023-06-04', 'Calle Querétaro - Colonia El Dorado', '4775678901', 'Proveedor111', 'RFC464646H111', 'TB', 'T', 'V', 85.90),
    (@IdPedidoIni + 5, '2023-06-05', 48, 1, '2023-06-05', 'Avenida Juárez - Colonia Los Gavilanes', '4776789012', 'Proveedor112', 'RFC474747H112', 'E', 'D', 'V', 92.50),
    (@IdPedidoIni + 6, '2023-06-06', 49, 1, '2023-06-06', 'Calle Morelos - Colonia San Isidro', '4777890123', 'Proveedor113', 'RFC484848H113', 'TC', 'T', 'V', 78.25),
    (@IdPedidoIni + 7, '2023-06-07', 50, 1, '2023-06-07', 'Avenida Reforma - Colonia La Moderna', '4778901234', 'Proveedor114', 'RFC494949H114', 'TD', 'D', 'V', 105.75),
    (@IdPedidoIni + 8, '2023-06-08', 51, 1, '2023-06-08', 'Calle Zacatecas - Colonia La Brisa', '4779012345', 'Proveedor115', 'RFC505050H115', 'TB', 'T', 'V', 89.00),
    (@IdPedidoIni + 9, '2023-06-09', 52, 1, '2023-06-09', 'Avenida Álvaro Obregón - Colonia La Salle', '4770123456', 'Proveedor116', 'RFC515151H116', 'E', 'D', 'V', 74.25),
    (@IdPedidoIni + 10,'2023-06-10', 53, 1, '2023-06-10', 'Calle Michoacán - Colonia La Florida', '4771234567', 'Proveedor117', 'RFC525252H117', 'TC', 'T', 'V', 96.75);

GO
--Inicia en 131
DECLARE @IdPedidoIni INT = (SELECT MAX(IdPedido) FROM dbo.Pedidos)
INSERT INTO Pedidos (IdPedido, Fecha, IdUsuario, IdStatus, FechaEntrega, Domicilio, Telefono, RazonSocial, Rfc, TipoPago, TipoEnvio, TipoPedido, Total)
VALUES
    (@IdPedidoIni + 1, '2023-06-11', 54, 1, '2023-06-11', 'Avenida Venustiano Carranza - Colonia Villa Verde', '4772345678', 'Proveedor118', 'RFC535353H118', 'TD', 'D', 'V', 78.25),
    (@IdPedidoIni + 2, '2023-06-12', 55, 1, '2023-06-12', 'Calle Puebla - Colonia La Merced', '4773456789', 'Proveedor119', 'RFC545454H119', 'TB', 'T', 'V', 110.50),
    (@IdPedidoIni + 3, '2023-06-13', 56, 1, '2023-06-13', 'Avenida Revolución - Colonia San Jerónimo', '4774567890', 'Proveedor120', 'RFC555555H120', 'E', 'D', 'V', 88.25),
    (@IdPedidoIni + 4, '2023-06-14', 57, 1, '2023-06-14', 'Calle Coahuila - Colonia Industrial', '4775678901', 'Proveedor121', 'RFC565656H121', 'TC', 'T', 'V', 92.75),
    (@IdPedidoIni + 5, '2023-06-15', 58, 1, '2023-06-15', 'Avenida Himno Nacional - Colonia San Juan Bosco', '4776789012', 'Proveedor122', 'RFC575757H122', 'TD', 'D', 'V', 75.90),
    (@IdPedidoIni + 6, '2023-06-16', 59, 1, '2023-06-16', 'Calle Veracruz - Colonia Del Valle', '4777890123', 'Proveedor123', 'RFC585858H123', 'TB', 'T', 'V', 102.25),
    (@IdPedidoIni + 7, '2023-06-17', 60, 1, '2023-06-17', 'Avenida Rayón - Colonia León II', '4778901234', 'Proveedor124', 'RFC595959H124', 'E', 'D', 'V', 86.50),
    (@IdPedidoIni + 8, '2023-06-18', 61, 1, '2023-06-18', 'Calle Jalisco - Colonia La Estrella', '4779012345', 'Proveedor125', 'RFC606060H125', 'TC', 'T', 'V', 73.75),
    (@IdPedidoIni + 9, '2023-06-19', 62, 1, '2023-06-19', 'Avenida López Mateos - Colonia San Miguel', '4770123456', 'Proveedor126', 'RFC616161H126', 'TD', 'D', 'V', 94.25),
    (@IdPedidoIni + 10,'2023-06-20', 63, 1, '2023-06-20', 'Calle Sinaloa - Colonia Las Américas', '4771234567', 'Proveedor127', 'RFC626262H127', 'TB', 'T', 'V', 79.50);

GO
--Inicia en 141
DECLARE @IdPedidoIni INT = (SELECT MAX(IdPedido) FROM dbo.Pedidos)
INSERT INTO Pedidos (IdPedido, Fecha, IdUsuario, IdStatus, FechaEntrega, Domicilio, Telefono, RazonSocial, Rfc, TipoPago, TipoEnvio, TipoPedido, Total)
VALUES
    (@IdPedidoIni + 1, '2023-06-21', 64, 1, '2023-06-21', 'Avenida Sierra de Lobos - Colonia La Campiña', '4772345678', 'Proveedor128', 'RFC636363H128', 'E', 'D', 'V', 101.75),
    (@IdPedidoIni + 2, '2023-06-22', 4, 1, '2023-06-22', 'Calle Durango - Colonia Los Paraísos', '4773456789', 'Proveedor129', 'RFC646464H129', 'TC', 'T', 'V', 84.00),
    (@IdPedidoIni + 3, '2023-06-23', 5, 1, '2023-06-23', 'Avenida Celaya - Colonia Las Trojes', '4774567890', 'Proveedor130', 'RFC656565H130', 'E', 'D', 'V', 93.50),
    (@IdPedidoIni + 4, '2023-06-24', 6, 1, '2023-06-24', 'Calle Oaxaca - Colonia San José del Consuelo', '4775678901', 'Proveedor131', 'RFC666666H131', 'TC', 'T', 'V', 78.75),
    (@IdPedidoIni + 5, '2023-06-25', 7, 1, '2023-06-25', 'Avenida León-Querétaro - Colonia Hidalgo', '4776789012', 'Proveedor132', 'RFC676767H132', 'TD', 'D', 'V', 105.25),
    (@IdPedidoIni + 6, '2023-06-26', 8, 1, '2023-06-26', 'Calle Guadalajara - Colonia La Carmona', '4777890123', 'Proveedor133', 'RFC686868H133', 'TB', 'T', 'V', 89.50),
    (@IdPedidoIni + 7, '2023-06-27', 9, 1, '2023-06-27', 'Avenida Valle de Santiago - Colonia Los Castillos', '4778901234', 'Proveedor134', 'RFC696969H134', 'E', 'D', 'V', 74.75),
    (@IdPedidoIni + 8, '2023-06-28', 10, 1, '2023-06-28', 'Calle Sonora - Colonia La Joya', '4779012345', 'Proveedor135', 'RFC707070H135', 'TC', 'T', 'V', 96.00),
    (@IdPedidoIni + 9, '2023-06-29', 11, 1, '2023-06-29', 'Avenida San Juan Bosco - Colonia Los Olivos', '4770123456', 'Proveedor136', 'RFC717171H136', 'TD', 'D', 'V', 80.25),
    (@IdPedidoIni + 10,'2023-06-30', 12, 1, '2023-06-30', 'Calle Aguascalientes - Colonia El Rosario', '4771234567', 'Proveedor137', 'RFC727272H137', 'TB', 'T', 'V', 102.50);

GO
--Inicia en 151
DECLARE @IdPedidoIni INT = (SELECT MAX(IdPedido) FROM dbo.Pedidos)
INSERT INTO Pedidos (IdPedido, Fecha, IdUsuario, IdStatus, FechaEntrega, Domicilio, Telefono, RazonSocial, Rfc, TipoPago, TipoEnvio, TipoPedido, Total)
VALUES
    (@IdPedidoIni + 1,'2023-06-01', 13, 1, '2023-06-01', 'Avenida Miguel Hidalgo - Colonia Los Naranjos', '4772345678', 'Proveedor138', 'RFC737373H138', 'E', 'D', 'V', 86.75),
    (@IdPedidoIni + 2,'2023-06-02', 14, 1, '2023-06-02', 'Calle Colima - Colonia Azteca', '4773456789', 'Proveedor139', 'RFC747474H139', 'TC', 'T', 'V', 104.00),
    (@IdPedidoIni + 3,'2023-06-03', 15, 1, '2023-06-03', 'Avenida Mariano Escobedo - Colonia San Nicolás', '4774567890', 'Proveedor140', 'RFC757575H140', 'TD', 'D', 'V', 87.25),
    (@IdPedidoIni + 4,'2023-06-04', 16, 1, '2023-06-04', 'Calle Nayarit - Colonia Nueva', '4775678901', 'Proveedor141', 'RFC767676H141', 'TB', 'T', 'V', 99.50),
    (@IdPedidoIni + 5,'2023-06-05', 17, 1, '2023-06-05', 'Avenida La Luz - Colonia San José de Cementos', '4776789012', 'Proveedor142', 'RFC777777H142', 'E', 'D', 'V', 83.75),
    (@IdPedidoIni + 6,'2023-06-06', 18, 1, '2023-06-06', 'Calle Tamaulipas - Colonia San Rafael', '4777890123', 'Proveedor143', 'RFC787878H143', 'TC', 'T', 'V', 101.00),
    (@IdPedidoIni + 7,'2023-06-07', 19, 1, '2023-06-07', 'Avenida Industrial - Colonia La Marina', '4778901234', 'Proveedor144', 'RFC797979H144', 'TD', 'D', 'V', 84.25),
    (@IdPedidoIni + 8,'2023-06-08', 20, 1, '2023-06-08', 'Calle Campeche - Colonia San Felipe de Jesús', '4779012345', 'Proveedor145', 'RFC808080H145', 'TB', 'T', 'V', 96.50);
-- TERMINA EN 158

-- MES JULIO   86 rows
GO
-- INICIA 159
DECLARE @IdPedidoIni INT = (SELECT MAX(IdPedido) FROM dbo.Pedidos)
INSERT INTO Pedidos (IdPedido, Fecha, IdUsuario, IdStatus, FechaEntrega, Domicilio, Telefono, RazonSocial, Rfc, TipoPago, TipoEnvio, TipoPedido, Total)
VALUES
    (@IdPedidoIni + 1, '2023-07-01', 4, 1, '2023-07-01', 'Avenida Guanajuato - Colonia Obregón', '4771234567', 'Proveedor146', 'RFC818181H146', 'E', 'D', 'V', 85.75),
    (@IdPedidoIni + 2, '2023-07-02', 5, 1, '2023-07-02', 'Calle Yucatán - Colonia Jardines de Jerez', '4772345678', 'Proveedor147', 'RFC828282H147', 'TC', 'T', 'V', 103.00),
    (@IdPedidoIni + 3, '2023-07-03', 6, 1, '2023-07-03', 'Avenida Insurgentes - Colonia Chapalita', '4773456789', 'Proveedor148', 'RFC838383H148', 'TD', 'D', 'V', 86.25),
    (@IdPedidoIni + 4, '2023-07-04', 7, 1, '2023-07-04', 'Calle Hidalgo - Colonia Las Torres', '4774567890', 'Proveedor149', 'RFC848484H149', 'TB', 'T', 'V', 98.50),
    (@IdPedidoIni + 5, '2023-07-05', 8, 1, '2023-07-05', 'Avenida Chapultepec - Colonia San Felipe', '4775678901', 'Proveedor150', 'RFC858585H150', 'E', 'D', 'V', 82.75),
    (@IdPedidoIni + 6, '2023-07-06', 9, 1, '2023-07-06', 'Calle Querétaro - Colonia El Dorado', '4776789012', 'Proveedor151', 'RFC868686H151', 'TC', 'T', 'V', 100.00),
    (@IdPedidoIni + 7, '2023-07-07', 10, 1, '2023-07-07', 'Avenida Juárez - Colonia Los Gavilanes', '4777890123', 'Proveedor152', 'RFC878787H152', 'TD', 'D', 'V', 83.25),
    (@IdPedidoIni + 8, '2023-07-08', 11, 1, '2023-07-08', 'Calle Morelos - Colonia San Isidro', '4778901234', 'Proveedor153', 'RFC888888H153', 'TB', 'T', 'V', 95.50),
    (@IdPedidoIni + 9, '2023-07-09', 12, 1, '2023-07-09', 'Avenida Reforma - Colonia La Moderna', '4779012345', 'Proveedor154', 'RFC898989H154', 'E', 'D', 'V', 79.75),
    (@IdPedidoIni + 10,'2023-07-10', 13, 1, '2023-07-10', 'Calle Zacatecas - Colonia La Brisa', '4770123456', 'Proveedor155', 'RFC909090H155', 'TC', 'T', 'V', 97.00);

GO
-- INICIA 169
DECLARE @IdPedidoIni INT = (SELECT MAX(IdPedido) FROM dbo.Pedidos)
INSERT INTO Pedidos (IdPedido, Fecha, IdUsuario, IdStatus, FechaEntrega, Domicilio, Telefono, RazonSocial, Rfc, TipoPago, TipoEnvio, TipoPedido, Total)
VALUES
    (@IdPedidoIni + 1, '2023-07-11', 14, 1, '2023-07-11', 'Avenida Álvaro Obregón - Colonia La Salle', '4771234567', 'Proveedor156', 'RFC919191H156', 'TD', 'D', 'V', 80.25),
    (@IdPedidoIni + 2, '2023-07-12', 15, 1, '2023-07-12', 'Calle Michoacán - Colonia La Florida', '4772345678', 'Proveedor157', 'RFC929292H157', 'TB', 'T', 'V', 92.50),
    (@IdPedidoIni + 3, '2023-07-13', 16, 1, '2023-07-13', 'Avenida Venustiano Carranza - Colonia Villa Verde', '4773456789', 'Proveedor158', 'RFC939393H158', 'E', 'D', 'V', 76.75),
    (@IdPedidoIni + 4, '2023-07-14', 17, 1, '2023-07-14', 'Calle Puebla - Colonia La Merced', '4774567890', 'Proveedor159', 'RFC949494H159', 'TC', 'T', 'V', 94.00),
    (@IdPedidoIni + 5, '2023-07-15', 18, 1, '2023-07-15', 'Avenida Revolución - Colonia San Jerónimo', '4775678901', 'Proveedor160', 'RFC959595H160', 'TD', 'D', 'V', 77.25),
    (@IdPedidoIni + 6, '2023-07-16', 19, 1, '2023-07-16', 'Calle Coahuila - Colonia Industrial', '4776789012', 'Proveedor161', 'RFC969696H161', 'TB', 'T', 'V', 89.50),
    (@IdPedidoIni + 7, '2023-07-17', 20, 1, '2023-07-17', 'Avenida Himno Nacional - Colonia San Juan Bosco', '4777890123', 'Proveedor162', 'RFC979797H162', 'E', 'D', 'V', 73.75),
    (@IdPedidoIni + 8, '2023-07-18', 4, 1, '2023-07-18', 'Calle Oaxaca - Colonia San José del Consuelo', '4778901234', 'Proveedor163', 'RFC989898H163', 'TC', 'T', 'V', 91.00),
    (@IdPedidoIni + 9, '2023-07-19', 5, 1, '2023-07-19', 'Avenida León-Querétaro - Colonia Hidalgo', '4779012345', 'Proveedor164', 'RFC999999H164', 'TD', 'D', 'V', 74.25),
    (@IdPedidoIni + 10,'2023-07-20', 6, 1, '2023-07-20', 'Calle Guadalajara - Colonia La Carmona', '4770123456', 'Proveedor165', 'RFC101010H165', 'TB', 'T', 'V', 86.50);

GO
-- INICIA 179
DECLARE @IdPedidoIni INT = (SELECT MAX(IdPedido) FROM dbo.Pedidos)
INSERT INTO Pedidos (IdPedido, Fecha, IdUsuario, IdStatus, FechaEntrega, Domicilio, Telefono, RazonSocial, Rfc, TipoPago, TipoEnvio, TipoPedido, Total)
VALUES
    (@IdPedidoIni + 1, '2023-07-21', 7, 1, '2023-07-21', 'Avenida Valle de Santiago - Colonia Los Castillos', '4771234567', 'Proveedor166', 'RFC111111H166', 'E', 'D', 'V', 70.75),
    (@IdPedidoIni + 2, '2023-07-22', 8, 1, '2023-07-22', 'Calle Sonora - Colonia La Joya', '4772345678', 'Proveedor167', 'RFC121212H167', 'TC', 'T', 'V', 88.00),
    (@IdPedidoIni + 3, '2023-07-23', 9, 1, '2023-07-23', 'Avenida San Juan Bosco - Colonia Los Olivos', '4773456789', 'Proveedor168', 'RFC131313H168', 'TD', 'D', 'V', 71.25),
    (@IdPedidoIni + 4, '2023-07-24', 10, 1, '2023-07-24', 'Calle Aguascalientes - Colonia El Rosario', '4774567890', 'Proveedor169', 'RFC141414H169', 'TB', 'T', 'V', 83.50),
    (@IdPedidoIni + 5, '2023-07-25', 11, 1, '2023-07-25', 'Avenida Miguel Hidalgo - Colonia Los Naranjos', '4775678901', 'Proveedor170', 'RFC151515H170', 'E', 'D', 'V', 67.75),
    (@IdPedidoIni + 6, '2023-07-26', 12, 1, '2023-07-26', 'Calle Colima - Colonia Azteca', '4776789012', 'Proveedor171', 'RFC161616H171', 'TC', 'T', 'V', 85.00),
    (@IdPedidoIni + 7, '2023-07-27', 13, 1, '2023-07-27', 'Avenida Mariano Escobedo - Colonia San Nicolás', '4777890123', 'Proveedor172', 'RFC171717H172', 'TD', 'D', 'V', 68.25),
    (@IdPedidoIni + 8, '2023-07-28', 14, 1, '2023-07-28', 'Calle Nayarit - Colonia Nueva', '4778901234', 'Proveedor173', 'RFC181818H173', 'TB', 'T', 'V', 80.50),
    (@IdPedidoIni + 9, '2023-07-29', 15, 1, '2023-07-29', 'Avenida La Luz - Colonia San José de Cementos', '4779012345', 'Proveedor174', 'RFC191919H174', 'E', 'D', 'V', 64.75),
    (@IdPedidoIni + 10,'2023-07-30', 16, 1, '2023-07-30', 'Calle Tamaulipas - Colonia San Rafael', '4770123456', 'Proveedor175', 'RFC202020H175', 'TC', 'T', 'V', 82.00);

GO
-- INICIA 189
DECLARE @IdPedidoIni INT = (SELECT MAX(IdPedido) FROM dbo.Pedidos)
INSERT INTO Pedidos (IdPedido, Fecha, IdUsuario, IdStatus, FechaEntrega, Domicilio, Telefono, RazonSocial, Rfc, TipoPago, TipoEnvio, TipoPedido, Total)
VALUES
    (@IdPedidoIni + 1, '2023-07-31', 17, 1, '2023-07-31', 'Avenida Industrial - Colonia La Marina', '4771234567', 'Proveedor176', 'RFC212121H176', 'TD', 'D', 'V', 65.25),
    (@IdPedidoIni + 2, '2023-07-23', 18, 1, '2023-07-23', 'Avenida San Juan Bosco - Colonia Los Olivos', '4773456789', 'Proveedor177', 'RFC222222H177', 'TB', 'T', 'V', 77.50),
    (@IdPedidoIni + 3, '2023-07-24', 19, 1, '2023-07-24', 'Calle Aguascalientes - Colonia El Rosario', '4774567890', 'Proveedor178', 'RFC232323H178', 'E', 'D', 'V', 61.75),
    (@IdPedidoIni + 4, '2023-07-25', 20, 1, '2023-07-25', 'Avenida Miguel Hidalgo - Colonia Los Naranjos', '4775678901', 'Proveedor179', 'RFC242424H179', 'TC', 'T', 'V', 79.00),
    (@IdPedidoIni + 5, '2023-07-26', 4, 1, '2023-07-26', 'Calle Colima - Colonia Azteca', '4776789012', 'Proveedor180', 'RFC252525H180', 'TD', 'D', 'V', 62.25),
    (@IdPedidoIni + 6, '2023-07-27', 5, 1, '2023-07-27', 'Avenida Mariano Escobedo - Colonia San Nicolás', '4777890123', 'Proveedor181', 'RFC262626H181', 'TB', 'T', 'V', 74.50),
    (@IdPedidoIni + 7, '2023-07-28', 6, 1, '2023-07-28', 'Calle Nayarit - Colonia Nueva', '4778901234', 'Proveedor182', 'RFC272727H182', 'E', 'D', 'V', 58.75),
    (@IdPedidoIni + 8, '2023-07-29', 7, 1, '2023-07-29', 'Avenida La Luz - Colonia San José de Cementos', '4779012345', 'Proveedor183', 'RFC282828H183', 'TC', 'T', 'V', 76.00),
    (@IdPedidoIni + 9, '2023-07-30', 8, 1, '2023-07-30', 'Calle Tamaulipas - Colonia San Rafael', '4770123456', 'Proveedor184', 'RFC292929H184', 'TD', 'D', 'V', 59.25);
	
GO
-- INICIA 199
DECLARE @IdPedidoIni INT = (SELECT MAX(IdPedido) FROM dbo.Pedidos)
INSERT INTO Pedidos (IdPedido, Fecha, IdUsuario, IdStatus, FechaEntrega, Domicilio, Telefono, RazonSocial, Rfc, TipoPago, TipoEnvio, TipoPedido, Total)
VALUES
    (@IdPedidoIni + 1,'2023-07-31', 9, 1, '2023-07-31', 'Avenida Industrial - Colonia La Marina', '4771234567', 'Proveedor185', 'RFC303030H185', 'TB', 'T', 'V', 71.50),
    (@IdPedidoIni + 2,'2023-07-23', 10, 1, '2023-07-23', 'Avenida San Juan Bosco - Colonia Los Olivos', '4773456789', 'Proveedor186', 'RFC313131H186', 'E', 'D', 'V', 55.75),
    (@IdPedidoIni + 3,'2023-07-24', 11, 1, '2023-07-24', 'Calle Aguascalientes - Colonia El Rosario', '4774567890', 'Proveedor187', 'RFC323232H187', 'TC', 'T', 'V', 73.00),
    (@IdPedidoIni + 4,'2023-07-25', 12, 1, '2023-07-25', 'Avenida Miguel Hidalgo - Colonia Los Naranjos', '4775678901', 'Proveedor188', 'RFC333333H188', 'TD', 'D', 'V', 56.25),
    (@IdPedidoIni + 5,'2023-07-26', 13, 1, '2023-07-26', 'Calle Colima - Colonia Azteca', '4776789012', 'Proveedor189', 'RFC343434H189', 'TB', 'T', 'V', 68.50),
    (@IdPedidoIni + 6,'2023-07-23', 14, 1, '2023-07-23', 'Avenida San Juan Bosco - Colonia Los Olivos', '4773456789', 'Proveedor190', 'RFC353535H190', 'E', 'D', 'V', 62.75),
    (@IdPedidoIni + 7,'2023-07-24', 15, 1, '2023-07-24', 'Calle Aguascalientes - Colonia El Rosario', '4774567890', 'Proveedor191', 'RFC363636H191', 'TC', 'T', 'V', 80.00),
    (@IdPedidoIni + 8,'2023-07-25', 16, 1, '2023-07-25', 'Avenida Miguel Hidalgo - Colonia Los Naranjos', '4775678901', 'Proveedor192', 'RFC373737H192', 'TD', 'D', 'V', 63.25),
    (@IdPedidoIni + 9,'2023-07-26', 17, 1, '2023-07-26', 'Calle Colima - Colonia Azteca', '4776789012', 'Proveedor193', 'RFC383838H193', 'TB', 'T', 'V', 75.50);

GO
-- INICIA 209
DECLARE @IdPedidoIni INT = (SELECT MAX(IdPedido) FROM dbo.Pedidos)
INSERT INTO Pedidos (IdPedido, Fecha, IdUsuario, IdStatus, FechaEntrega, Domicilio, Telefono, RazonSocial, Rfc, TipoPago, TipoEnvio, TipoPedido, Total)
VALUES
    (@IdPedidoIni + 1,'2023-07-27', 18, 1, '2023-07-27', 'Avenida Mariano Escobedo - Colonia San Nicolás', '4777890123', 'Proveedor194', 'RFC393939H194', 'E', 'D', 'V', 59.75),
    (@IdPedidoIni + 2,'2023-07-28', 19, 1, '2023-07-28', 'Calle Nayarit - Colonia Nueva', '4778901234', 'Proveedor195', 'RFC404040H195', 'TC', 'T', 'V', 77.00),
    (@IdPedidoIni + 3,'2023-07-29', 20, 1, '2023-07-29', 'Avenida La Luz - Colonia San José de Cementos', '4779012345', 'Proveedor196', 'RFC414141H196', 'TD', 'D', 'V', 60.25),
    (@IdPedidoIni + 4,'2023-07-30', 4, 1, '2023-07-30', 'Calle Tamaulipas - Colonia San Rafael', '4770123456', 'Proveedor197', 'RFC424242H197', 'TB', 'T', 'V', 72.50),
    (@IdPedidoIni + 5,'2023-07-31', 5, 1, '2023-07-31', 'Avenida Industrial - Colonia La Marina', '4771234567', 'Proveedor198', 'RFC434343H198', 'E', 'D', 'V', 56.75),
    (@IdPedidoIni + 6,'2023-07-23', 6, 1, '2023-07-23', 'Avenida San Juan Bosco - Colonia Los Olivos', '4773456789', 'Proveedor199', 'RFC444444H199', 'TC', 'T', 'V', 75.00),
    (@IdPedidoIni + 7,'2023-07-24', 7, 1, '2023-07-24', 'Calle Aguascalientes - Colonia El Rosario', '4774567890', 'Proveedor200', 'RFC454545H200', 'TD', 'D', 'V', 58.25),
    (@IdPedidoIni + 8,'2023-07-25', 8, 1, '2023-07-25', 'Avenida Miguel Hidalgo - Colonia Los Naranjos', '4775678901', 'Proveedor201', 'RFC464646H201', 'TB', 'T', 'V', 70.50),
    (@IdPedidoIni + 9,'2023-07-26', 9, 1, '2023-07-26', 'Calle Colima - Colonia Azteca', '4776789012', 'Proveedor202', 'RFC474747H202', 'E', 'D', 'V', 54.75);

GO
-- INICIA 219
DECLARE @IdPedidoIni INT = (SELECT MAX(IdPedido) FROM dbo.Pedidos)
INSERT INTO Pedidos (IdPedido, Fecha, IdUsuario, IdStatus, FechaEntrega, Domicilio, Telefono, RazonSocial, Rfc, TipoPago, TipoEnvio, TipoPedido, Total)
VALUES
    (@IdPedidoIni + 1, '2023-07-27', 10, 1, '2023-07-27', 'Avenida Mariano Escobedo - Colonia San Nicolás', '4777890123', 'Proveedor203', 'RFC484848H203', 'TC', 'T', 'V', 72.00),
    (@IdPedidoIni + 2, '2023-07-28', 11, 1, '2023-07-28', 'Calle Nayarit - Colonia Nueva', '4778901234', 'Proveedor204', 'RFC494949H204', 'TD', 'D', 'V', 55.25),
    (@IdPedidoIni + 3, '2023-07-29', 12, 1, '2023-07-29', 'Avenida La Luz - Colonia San José de Cementos', '4779012345', 'Proveedor205', 'RFC505050H205', 'TB', 'T', 'V', 67.50),
    (@IdPedidoIni + 4, '2023-07-30', 13, 1, '2023-07-30', 'Calle Tamaulipas - Colonia San Rafael', '4770123456', 'Proveedor206', 'RFC515151H206', 'E', 'D', 'V', 51.75),
    (@IdPedidoIni + 5, '2023-07-31', 14, 1, '2023-07-31', 'Avenida Industrial - Colonia La Marina', '4771234567', 'Proveedor207', 'RFC525252H207', 'TC', 'T', 'V', 69.00),
    (@IdPedidoIni + 6, '2023-07-23', 15, 1, '2023-07-23', 'Avenida San Juan Bosco - Colonia Los Olivos', '4773456789', 'Proveedor208', 'RFC262626H208', 'TD', 'D', 'V', 52.25),
    (@IdPedidoIni + 7, '2023-07-24', 16, 1, '2023-07-24', 'Calle Aguascalientes - Colonia El Rosario', '4774567890', 'Proveedor209', 'RFC272727H209', 'TB', 'T', 'V', 64.50),
    (@IdPedidoIni + 8, '2023-07-25', 17, 1, '2023-07-25', 'Avenida Miguel Hidalgo - Colonia Los Naranjos', '4775678901', 'Proveedor210', 'RFC282828H210', 'E', 'D', 'V', 47.75),
    (@IdPedidoIni + 9, '2023-07-23', 18, 1, '2023-07-23', 'Avenida San Juan Bosco - Colonia Los Olivos', '4773456789', 'Proveedor211', 'RFC292929H211', 'E', 'D', 'V', 62.75),
    (@IdPedidoIni + 10,'2023-07-24', 19, 1, '2023-07-24', 'Calle Aguascalientes - Colonia El Rosario', '4774567890', 'Proveedor212', 'RFC303030H212', 'TC', 'T', 'V', 80.00);

GO
-- INICIA 229
DECLARE @IdPedidoIni INT = (SELECT MAX(IdPedido) FROM dbo.Pedidos)
INSERT INTO Pedidos (IdPedido, Fecha, IdUsuario, IdStatus, FechaEntrega, Domicilio, Telefono, RazonSocial, Rfc, TipoPago, TipoEnvio, TipoPedido, Total)
VALUES
    (@IdPedidoIni + 1, '2023-07-25', 20, 1, '2023-07-25', 'Avenida Miguel Hidalgo - Colonia Los Naranjos', '4775678901', 'Proveedor213', 'RFC313131H213', 'TD', 'D', 'V', 63.25),
    (@IdPedidoIni + 2, '2023-07-26', 21, 1, '2023-07-26', 'Calle Colima - Colonia Azteca', '4776789012', 'Proveedor214', 'RFC323232H214', 'TB', 'T', 'V', 75.50),
    (@IdPedidoIni + 3, '2023-07-27', 22, 1, '2023-07-27', 'Avenida Mariano Escobedo - Colonia San Nicolás', '4777890123', 'Proveedor215', 'RFC333333H215', 'E', 'D', 'V', 59.75),
    (@IdPedidoIni + 4, '2023-07-28', 23, 1, '2023-07-28', 'Calle Nayarit - Colonia Nueva', '4778901234', 'Proveedor216', 'RFC343434H216', 'TC', 'T', 'V', 77.00),
    (@IdPedidoIni + 5, '2023-07-29', 24, 1, '2023-07-29', 'Avenida La Luz - Colonia San José de Cementos', '4779012345', 'Proveedor217', 'RFC353535H217', 'TD', 'D', 'V', 60.25),
    (@IdPedidoIni + 6, '2023-07-30', 25, 1, '2023-07-30', 'Calle Tamaulipas - Colonia San Rafael', '4770123456', 'Proveedor218', 'RFC363636H218', 'TB', 'T', 'V', 72.50),
    (@IdPedidoIni + 7, '2023-07-31', 26, 1, '2023-07-31', 'Avenida Industrial - Colonia La Marina', '4771234567', 'Proveedor219', 'RFC373737H219', 'E', 'D', 'V', 56.75),
    (@IdPedidoIni + 8, '2023-07-23', 27, 1, '2023-07-23', 'Avenida San Juan Bosco - Colonia Los Olivos', '4773456789', 'Proveedor220', 'RFC383838H220', 'TC', 'T', 'V', 75.00),
    (@IdPedidoIni + 9, '2023-07-24', 28, 1, '2023-07-24', 'Calle Aguascalientes - Colonia El Rosario', '4774567890', 'Proveedor221', 'RFC393939H221', 'TD', 'D', 'V', 58.25),
    (@IdPedidoIni + 10,'2023-07-25', 29, 1, '2023-07-25', 'Avenida Miguel Hidalgo - Colonia Los Naranjos', '4775678901', 'Proveedor222', 'RFC404040H222', 'TB', 'T', 'V', 70.50);

GO
-- INICIA 239
DECLARE @IdPedidoIni INT = (SELECT MAX(IdPedido) FROM dbo.Pedidos)
INSERT INTO Pedidos (IdPedido, Fecha, IdUsuario, IdStatus, FechaEntrega, Domicilio, Telefono, RazonSocial, Rfc, TipoPago, TipoEnvio, TipoPedido, Total)
VALUES
    (@IdPedidoIni + 1, '2023-07-26', 30, 1, '2023-07-26', 'Calle Colima - Colonia Azteca', '4776789012', 'Proveedor223', 'RFC414141H223', 'E', 'D', 'V', 54.75),
    (@IdPedidoIni + 2, '2023-07-27', 31, 1, '2023-07-27', 'Avenida Mariano Escobedo - Colonia San Nicolás', '4777890123', 'Proveedor224', 'RFC424242H224', 'TC', 'T', 'V', 72.00),
    (@IdPedidoIni + 3, '2023-07-28', 32, 1, '2023-07-28', 'Calle Nayarit - Colonia Nueva', '4778901234', 'Proveedor225', 'RFC434343H225', 'TD', 'D', 'V', 55.25),
    (@IdPedidoIni + 4, '2023-07-29', 33, 1, '2023-07-29', 'Avenida La Luz - Colonia San José de Cementos', '4779012345', 'Proveedor226', 'RFC444444H226', 'TB', 'T', 'V', 67.50),
    (@IdPedidoIni + 5, '2023-07-30', 34, 1, '2023-07-30', 'Calle Tamaulipas - Colonia San Rafael', '4770123456', 'Proveedor227', 'RFC454545H227', 'E', 'D', 'V', 51.75),
    (@IdPedidoIni + 6, '2023-07-31', 35, 1, '2023-07-31', 'Avenida Industrial - Colonia La Marina', '4771234567', 'Proveedor228', 'RFC464646H228', 'TC', 'T', 'V', 69.00),
    (@IdPedidoIni + 7, '2023-07-23', 36, 1, '2023-07-23', 'Avenida San Juan Bosco - Colonia Los Olivos', '4773456789', 'Proveedor229', 'RFC262626H229', 'TD', 'D', 'V', 52.25),
    (@IdPedidoIni + 8, '2023-07-24', 37, 1, '2023-07-24', 'Calle Aguascalientes - Colonia El Rosario', '4774567890', 'Proveedor230', 'RFC272727H230', 'TB', 'T', 'V', 64.50),
    (@IdPedidoIni + 9, '2023-07-25', 38, 1, '2023-07-25', 'Avenida Miguel Hidalgo - Colonia Los Naranjos', '4775678901', 'Proveedor231', 'RFC282828H231', 'E', 'D', 'V', 47.75);	

-- 244

------------ INSERCIONES VENTAS -------------------------
ALTER TABLE dbo.Ventas
DROP CONSTRAINT FK_Ventas_Pedidos_IdPedido_Fecha;

--ALTER TABLE dbo.Ventas
--DROP CONSTRAINT FK_Ventas_Clientes_IdCliente
-- MES MAYO

INSERT INTO Ventas (Fecha, IdPedido, IdCliente, Total)
SELECT PT.Fecha, PT.IdPedido, C.IdCliente, PT.Total + 30
FROM Pedidos PT
JOIN Clientes C
ON C.IdUsuario = PT.IdUsuario
AND PT.TipoPedido = 'V'
--ORDER BY 3,1

/*
INSERT INTO Ventas (Fecha, IdCliente, IdPedido, Total)
VALUES
    ('2023-05-01', 4, 17, 150.75),
    ('2023-05-02', 5, 18, 200.00),
    ('2023-05-03', 6, 19, 75.50),
    ('2023-05-04', 7, 20, 300.25),
    ('2023-05-05', 8, 21, 125.00),
    ('2023-05-06', 9, 22, 180.50),
    ('2023-05-07', 10, 23, 90.75),
    ('2023-05-08', 11, 24, 150.00),
    ('2023-05-09', 12, 25, 220.25),
    ('2023-05-10', 13, 26, 80.50),
    ('2023-05-11', 14, 27, 175.75),
    ('2023-05-12', 15, 28, 130.00),
    ('2023-05-13', 16, 29, 210.25),
    ('2023-05-14', 17, 30, 95.50),
    ('2023-05-15', 18, 31, 160.75),
    ('2023-05-16', 19, 32, 180.00),
    ('2023-05-17', 20, 33, 240.25),
    ('2023-05-18', 21, 34, 120.50),
    ('2023-05-19', 22, 35, 195.75),
    ('2023-05-20', 23, 36, 150.00),
    ('2023-05-21', 24, 37, 120.50),
    ('2023-05-22', 25, 38, 180.75),
    ('2023-05-23', 26, 39, 250.00),
    ('2023-05-24', 27, 40, 95.25),
    ('2023-05-25', 28, 41, 140.50),
    ('2023-05-26', 29, 42, 200.75),
    ('2023-05-27', 30, 43, 110.00),
    ('2023-05-28', 31, 44, 165.25),
    ('2023-05-29', 32, 45, 220.50),
    ('2023-05-30', 33, 46, 135.75),
    ('2023-05-31', 34, 47, 250.00),
    ('2023-05-01', 35, 48, 120.25),
    ('2023-05-02', 36, 49, 180.50),
    ('2023-05-03', 37, 50, 210.75),
    ('2023-05-04', 38, 51, 95.00),
    ('2023-05-05', 39, 52, 145.25),
    ('2023-05-06', 40, 53, 230.50),
    ('2023-05-07', 41, 54, 110.75),
    ('2023-05-08', 42, 55, 175.00),
    ('2023-05-09', 43, 56, 140.25),
    ('2023-05-10', 44, 57, 120.50),
    ('2023-05-11', 45, 58, 180.75),
    ('2023-05-12', 46, 59, 250.00),
    ('2023-05-13', 47, 60, 95.25),
    ('2023-05-14', 48, 61, 140.50),
    ('2023-05-15', 49, 62, 200.75),
    ('2023-05-16', 50, 63, 110.00),
    ('2023-05-17', 51, 64, 165.25),
    ('2023-05-18', 52, 65, 220.50),
    ('2023-05-19', 53, 66, 135.75),
    ('2023-05-20', 54, 67, 250.00),
    ('2023-05-21', 55, 68, 120.25),
    ('2023-05-22', 56, 69, 180.50),
    ('2023-05-23', 4, 70, 210.75),
    ('2023-05-24', 5, 71, 95.00),
    ('2023-05-25', 6, 72, 145.25),
    ('2023-05-26', 7, 73, 230.50),
    ('2023-05-27', 8, 74, 110.75),
    ('2023-05-28', 9, 75, 175.00),
    ('2023-05-29', 10, 76, 140.25), 
	('2023-05-30', 11, 77, 200.50),
    ('2023-05-31', 12, 78, 150.75),
    ('2023-05-15', 13, 79, 185.00),
    ('2023-05-16', 14, 80, 120.25);

-- MES JUNIO
INSERT INTO Ventas (Fecha, IdCliente, IdPedido, Total)
VALUES
    ('2023-06-05', 15, 81, 250.00),
    ('2023-06-10', 16, 82, 180.50),
    ('2023-06-12', 17, 83, 300.25),
    ('2023-06-15', 18, 84, 210.75),
    ('2023-06-18', 19, 85, 170.00),
    ('2023-06-20', 20, 86, 225.50),
    ('2023-06-23', 21, 87, 190.25),
    ('2023-06-25', 22, 88, 280.75),
    ('2023-06-28', 23, 89, 195.00),
    ('2023-06-30', 24, 90, 215.50),
    ('2023-06-10', 25, 91, 175.25),
    ('2023-06-12', 26, 92, 230.00),
    ('2023-06-15', 27, 93, 290.50),
    ('2023-06-18', 28, 94, 210.25),
    ('2023-06-20', 29, 95, 180.75),
    ('2023-06-23', 30, 96, 245.00),
    ('2023-06-25', 31, 97, 270.50),
    ('2023-06-28', 32, 98, 225.25),
    ('2023-06-30', 33, 99, 195.00),
    ('2023-06-10', 34, 100, 215.50),
    ('2023-06-03', 35, 101, 230.00),
    ('2023-06-06', 36, 102, 180.50),
    ('2023-06-09', 37, 103, 300.25),
    ('2023-06-12', 38, 104, 210.75),
    ('2023-06-15', 39, 105, 170.00),
    ('2023-06-18', 40, 106, 225.50),
    ('2023-06-21', 41, 107, 190.25),
    ('2023-06-24', 42, 108, 280.75),
    ('2023-06-27', 43, 109, 195.00),
    ('2023-06-30', 44, 110, 215.50),
    ('2023-06-04', 45, 111, 175.25),
    ('2023-06-07', 46, 112, 230.00),
    ('2023-06-10', 47, 113, 290.50),
    ('2023-06-13', 48, 114, 210.25),
    ('2023-06-16', 49, 115, 180.75),
    ('2023-06-19', 50, 116, 245.00),
    ('2023-06-22', 51, 117, 270.50),
    ('2023-06-25', 52, 118, 225.25),
    ('2023-06-28', 53, 119, 195.00),
    ('2023-06-30', 54, 120, 215.50),
    ('2023-06-03', 55, 121, 230.00),
    ('2023-06-06', 56, 122, 180.50),
    ('2023-06-09', 57, 123, 300.25),
    ('2023-06-12', 58, 124, 210.75),
    ('2023-06-15', 59, 125, 170.00),
    ('2023-06-18', 60, 126, 225.50),
    ('2023-06-21', 61, 127, 190.25),
    ('2023-06-24', 62, 128, 280.75),
    ('2023-06-27', 63, 129, 195.00),
    ('2023-06-30', 64, 130, 215.50),
    ('2023-06-04', 4, 131, 175.25),
    ('2023-06-07', 5, 132, 230.00),
    ('2023-06-10', 6, 133, 290.50),
    ('2023-06-13', 7, 134, 210.25),
    ('2023-06-16', 8, 135, 180.75),
    ('2023-06-19', 9, 136, 245.00),
    ('2023-06-22', 10, 137, 270.50),
    ('2023-06-25', 11, 138, 225.25),
    ('2023-06-28', 12, 139, 195.00),
    ('2023-06-30', 13, 140, 215.50),
    ('2023-06-02', 14, 141, 185.00),
    ('2023-06-05', 15, 142, 240.50),
    ('2023-06-08', 16, 143, 310.25),
    ('2023-06-11', 17, 144, 220.75),
    ('2023-06-14', 18, 145, 180.00),
    ('2023-06-17', 19, 146, 235.50),
    ('2023-06-20', 20, 147, 200.25),
    ('2023-06-23', 21, 148, 290.75),
    ('2023-06-26', 22, 149, 205.00),
    ('2023-06-29', 23, 150, 225.50),
    ('2023-06-02', 24, 151, 170.25),
    ('2023-06-05', 25, 152, 225.00),
    ('2023-06-08', 26, 153, 275.50),
    ('2023-06-11', 27, 154, 195.25),
    ('2023-06-14', 28, 155, 165.75),
    ('2023-06-17', 29, 156, 220.00),
    ('2023-06-20', 30, 157, 245.50),
    ('2023-06-23', 31, 158, 210.25);

-- MES JULIO
INSERT INTO Ventas (Fecha, IdCliente, IdPedido, Total)
VALUES
    ('2023-07-02', 32, 161, 180.00),
    ('2023-07-05', 33, 162, 235.50),
    ('2023-07-08', 34, 163, 200.25),
    ('2023-07-11', 35, 164, 290.75),
    ('2023-07-14', 36, 165, 205.00),
    ('2023-07-17', 37, 166, 225.50),
    ('2023-07-20', 38, 167, 170.25),
    ('2023-07-23', 39, 168, 225.00),
    ('2023-07-26', 40, 169, 275.50),
    ('2023-07-29', 41, 170, 195.25),
    ('2023-07-02', 42, 171, 165.75),
    ('2023-07-05', 43, 172, 220.00),
    ('2023-07-08', 44, 173, 245.50),
    ('2023-07-11', 45, 174, 210.25),
    ('2023-07-14', 46, 175, 180.00),
    ('2023-07-17', 47, 176, 235.50),
    ('2023-07-20', 48, 177, 200.25),
    ('2023-07-23', 49, 178, 290.75),
    ('2023-07-26', 50, 179, 205.00),
    ('2023-07-29', 51, 180, 225.50),
    ('2023-07-02', 52, 181, 180.00),
    ('2023-07-05', 53, 182, 235.50),
    ('2023-07-08', 54, 183, 200.25),
    ('2023-07-11', 55, 184, 290.75),
    ('2023-07-14', 56, 185, 205.00),
    ('2023-07-17', 57, 186, 225.50),
    ('2023-07-20', 58, 187, 170.25),
    ('2023-07-23', 59, 188, 225.00),
    ('2023-07-26', 60, 189, 275.50),
    ('2023-07-29', 61, 190, 195.25),
    ('2023-07-02', 62, 191, 165.75),
    ('2023-07-05', 63, 192, 220.00),
    ('2023-07-08', 64, 193, 245.50),
    ('2023-07-11', 4, 194, 210.25),
    ('2023-07-14', 5, 195, 180.00),
    ('2023-07-17', 6, 196, 235.50),
    ('2023-07-20', 7, 197, 200.25),
    ('2023-07-23', 8, 198, 290.75),
    ('2023-07-26', 9, 199, 205.00),
    ('2023-07-29', 10, 200, 225.50),
    ('2023-07-02', 11, 201, 180.00),
    ('2023-07-05', 12, 202, 235.50),
    ('2023-07-08', 13, 203, 200.25),
    ('2023-07-11', 14, 204, 290.75),
    ('2023-07-14', 15, 205, 205.00),
    ('2023-07-17', 16, 206, 225.50),
    ('2023-07-20', 17, 207, 170.25),
    ('2023-07-23', 18, 208, 225.00),
    ('2023-07-26', 19, 209, 275.50),
    ('2023-07-29', 20, 210, 195.25),
    ('2023-07-02', 21, 211, 165.75),
    ('2023-07-05', 22, 212, 220.00),
    ('2023-07-08', 23, 213, 245.50),
    ('2023-07-11', 24, 214, 210.25),
    ('2023-07-14', 25, 215, 180.00),
    ('2023-07-17', 26, 216, 235.50),
    ('2023-07-20', 27, 217, 200.25),
    ('2023-07-23', 28, 218, 290.75),
    ('2023-07-26', 29, 219, 205.00),
    ('2023-07-29', 30, 220, 225.50),
    ('2023-07-02', 31, 221, 180.00),
    ('2023-07-05', 32, 222, 235.50),
    ('2023-07-08', 33, 223, 200.25),
    ('2023-07-11', 34, 224, 290.75),
    ('2023-07-14', 35, 225, 205.00),
    ('2023-07-17', 36, 226, 225.50),
    ('2023-07-20', 37, 227, 170.25),
    ('2023-07-23', 38, 228, 225.00),
    ('2023-07-26', 39, 229, 275.50),
    ('2023-07-29', 40, 230, 195.25),
    ('2023-07-02', 41, 231, 165.75),
    ('2023-07-05', 42, 232, 220.00),
    ('2023-07-08', 43, 233, 245.50),
    ('2023-07-11', 44, 234, 210.25),
    ('2023-07-14', 45, 235, 180.00),
    ('2023-07-17', 46, 236, 235.50),
    ('2023-07-20', 47, 237, 200.25),
    ('2023-07-23', 48, 238, 290.75),
    ('2023-07-26', 49, 239, 205.00),
    ('2023-07-29', 50, 240, 225.50),
    ('2023-07-02', 51, 241, 180.00),
    ('2023-07-05', 52, 242, 235.50),
    ('2023-07-08', 53, 243, 200.25),
    ('2023-07-11', 54, 244, 290.75),
    ('2023-07-14', 55, 245, 205.00),
    ('2023-07-17', 56, 246, 225.50);

*/

---------------INSERCION DETALLEPEDIDOS DE TIPO PROVEEDORES   ----------------------


select * from DetallePedidos -- Proveedores
select * from Pedidos -- 1-16
select * from MateriasPrimas --- 1-26
ALTER TABLE dbo.DetallePedidos
DROP CONSTRAINT FK_DetallePedido_Pedido;
--delete from DetallePedidos
--DBCC CHECKIDENT ('DetallePedidos', RESEED, 0);
               
INSERT INTO DetallePedidos (IdPedido, Fecha, IdProducto, Cantidad, PrecioUnitario, Subtotal)
VALUES
    (1, '2023-05-01', 1, 3, 25.00, 75.00),
    (2, '2023-05-02', 2, 2, 18.50, 37.00),
    (3, '2023-05-03', 3, 1, 12.00, 12.00),
    (4, '2023-05-04', 4, 4, 15.75, 63.00),
    (5, '2023-05-05', 5, 2, 8.50, 17.00),
    (6, '2023-05-06', 6, 3, 22.00, 66.00),
    (7, '2023-05-07', 7, 1, 10.00, 10.00),
    (8, '2023-05-08', 8, 2, 6.50, 13.00),
    (9, '2023-05-09', 9, 3, 8.25, 24.75),
    (10, '2023-05-10', 10, 1, 15.00, 15.00),
    (11, '2023-05-11', 11, 4, 14.50, 58.00),
    (12, '2023-05-12', 12, 2, 11.00, 22.00),
    (13, '2023-05-13', 13, 1, 9.00, 9.00),
    (14, '2023-05-14', 14, 3, 13.25, 39.75),
    (15, '2023-05-15', 15, 2, 7.50, 15.00),
    (16, '2023-05-16', 16, 3, 10.00, 30.00);

--- INSERCION DETALLEPEDIDOS TIPO CLIENTES
select * from DetallePedidos -- Proveedores
SELECT * FROM Pedidos WHERE MONTH(fecha) = 5 and IdPedido>15; -- 16-80 64 rows
SELECT * FROM Productos
--- MES MAYO
INSERT INTO DetallePedidos (IdPedido, Fecha, IdProducto, Cantidad, PrecioUnitario, Subtotal)
VALUES
    (17, '2023-05-01', 2, 2, 18.50, 37.00),
    (18, '2023-05-02', 3, 1, 12.00, 12.00),
    (19, '2023-05-03', 4, 4, 15.75, 63.00),
    (20, '2023-05-04', 5, 2, 8.50, 17.00),
    (21, '2023-05-05', 6, 3, 22.00, 66.00),
    (22, '2023-05-06', 7, 1, 10.00, 10.00),
    (23, '2023-05-07', 8, 2, 6.50, 13.00),
    (24, '2023-05-08', 9, 3, 8.25, 24.75),
    (25, '2023-05-09', 10, 1, 15.00, 15.00),
    (26, '2023-05-10', 11, 4, 14.50, 58.00),
    (27, '2023-05-11', 12, 2, 11.00, 22.00),
    (28, '2023-05-12', 13, 1, 9.00, 9.00),
    (29, '2023-05-13', 14, 3, 13.25, 39.75),
    (30, '2023-05-14', 15, 2, 7.50, 15.00),
    (31, '2023-05-15', 16, 3, 10.00, 30.00),
    (32, '2023-05-16', 17, 2, 12.50, 25.00),
    (33, '2023-05-17', 18, 1, 14.00, 14.00),
    (34, '2023-05-18', 19, 3, 9.75, 29.25),
    (35, '2023-05-19', 20, 2, 8.00, 16.00),
    (36, '2023-05-20', 1, 4, 23.00, 92.00),
    (37, '2023-05-21', 2, 2, 18.50, 37.00),
    (38, '2023-05-22', 3, 1, 12.00, 12.00),
    (39, '2023-05-23', 4, 3, 15.75, 47.25),
    (40, '2023-05-24', 5, 2, 8.50, 17.00),
    (41, '2023-05-25', 6, 3, 22.00, 66.00),
    (42, '2023-05-26', 7, 1, 10.00, 10.00),
    (43, '2023-05-27', 8, 2, 6.50, 13.00),
    (44, '2023-05-28', 9, 3, 8.25, 24.75),
    (45, '2023-05-29', 10, 1, 15.00, 15.00),
    (46, '2023-05-30', 11, 4, 14.50, 58.00),
    (47, '2023-05-31', 12, 2, 11.00, 22.00),
    (48, '2023-05-01', 13, 1, 9.00, 9.00),
    (49, '2023-05-02', 14, 3, 13.25, 39.75),
    (50, '2023-05-04', 15, 2, 7.50, 15.00),
    (51, '2023-05-05', 16, 3, 10.00, 30.00),
    (52, '2023-05-06', 17, 2, 12.50, 25.00),
    (53, '2023-05-07', 18, 1, 14.00, 14.00),
    (54, '2023-05-08', 19, 3, 9.75, 29.25),
    (55, '2023-05-09', 20, 2, 8.00, 16.00),
    (56, '2023-05-10', 1, 4, 23.00, 92.00),
    (57, '2023-05-11', 2, 2, 18.50, 37.00),
    (58, '2023-05-12', 3, 1, 12.00, 12.00),
    (59, '2023-05-13', 4, 3, 15.75, 47.25),
    (60, '2023-05-14', 5, 2, 8.50, 17.00),
    (61, '2023-05-15', 6, 3, 22.00, 66.00),
    (62, '2023-05-16', 7, 1, 10.00, 10.00),
    (63, '2023-05-17', 8, 2, 6.50, 13.00),
    (64, '2023-05-18', 9, 3, 8.25, 24.75),
    (65, '2023-05-19', 10, 2, 15.00, 30.00),
    (66, '2023-05-20', 11, 3, 14.50, 43.50),
    (67, '2023-05-21', 12, 1, 11.00, 11.00),
    (68, '2023-05-22', 13, 2, 9.00, 18.00),
    (69, '2023-05-23', 14, 3, 13.25, 39.75),
    (70, '2023-05-24', 15, 2, 7.50, 15.00),
    (71, '2023-05-25', 16, 3, 10.00, 30.00),
    (72, '2023-05-26', 17, 2, 12.50, 25.00),
    (73, '2023-05-27', 18, 1, 14.00, 14.00),
    (74, '2023-05-28', 19, 3, 9.75, 29.25),
    (75, '2023-05-29', 20, 2, 8.00, 16.00),
    (76, '2023-05-30', 1, 4, 23.00, 92.00),
    (77, '2023-05-31', 2, 2, 18.50, 37.00),
    (78, '2023-05-01', 3, 1, 12.00, 12.00),
    (79, '2023-05-02', 4, 3, 15.75, 47.25),
    (80, '2023-05-03', 5, 2, 8.50, 17.00);

-- MES DE JUNIO
SELECT * FROM Pedidos WHERE MONTH(fecha) = 6 and IdPedido>16; -- 81-158  78 ROWS
INSERT INTO DetallePedidos (IdPedido, Fecha, IdProducto, Cantidad, PrecioUnitario, Subtotal)
VALUES
    (81, '2023-06-01', 1, 2, 10.00, 20.00),
    (82, '2023-06-02', 2, 3, 8.50, 25.50),
    (83, '2023-06-03', 3, 1, 12.00, 12.00),
    (84, '2023-06-04', 4, 4, 7.25, 29.00),
    (85, '2023-06-05', 5, 2, 11.50, 23.00),
    (86, '2023-06-06', 6, 3, 9.00, 27.00),
    (87, '2023-06-07', 7, 1, 6.75, 6.75),
    (88, '2023-06-08', 8, 2, 13.00, 26.00),
    (89, '2023-06-09', 9, 3, 8.50, 25.50),
    (90, '2023-06-10', 10, 2, 10.00, 20.00),
    (91, '2023-06-11', 11, 3, 11.75, 35.25),
    (92, '2023-06-12', 12, 1, 9.00, 9.00),
    (93, '2023-06-13', 13, 2, 7.50, 15.00),
    (94, '2023-06-14', 14, 3, 12.25, 36.75),
    (95, '2023-06-15', 15, 2, 8.00, 16.00),
    (96, '2023-06-16', 16, 3, 14.50, 43.50),
    (97, '2023-06-17', 17, 1, 11.00, 11.00),
    (98, '2023-06-18', 18, 2, 9.25, 18.50),
    (99, '2023-06-19', 19, 3, 6.50, 19.50),
    (100, '2023-06-20', 20, 2, 13.00, 26.00),
    (101, '2023-06-21', 1, 3, 10.50, 31.50),
    (102, '2023-06-22', 2, 1, 8.00, 8.00),
    (103, '2023-06-23', 3, 2, 12.25, 24.50),
    (104, '2023-06-24', 4, 3, 7.75, 23.25),
    (105, '2023-06-25', 5, 2, 9.50, 19.00),
    (106, '2023-06-26', 6, 3, 10.00, 30.00),
    (107, '2023-06-27', 7, 2, 8.75, 17.50),
    (108, '2023-06-28', 8, 3, 11.50, 34.50),
    (109, '2023-06-29', 9, 1, 9.50, 9.50),
    (110, '2023-06-30', 10, 2, 7.75, 15.50),
    (111, '2023-06-01', 11, 3, 13.25, 39.75),
    (112, '2023-06-02', 12, 2, 10.00, 20.00),
    (113, '2023-06-03', 13, 3, 8.50, 25.50),
    (114, '2023-06-04', 14, 1, 11.75, 11.75),
    (115, '2023-06-05', 15, 2, 6.00, 12.00),
    (116, '2023-06-06', 16, 3, 9.75, 29.25),
    (117, '2023-06-07', 17, 2, 12.50, 25.00),
    (118, '2023-06-08', 18, 3, 7.25, 21.75),
    (119, '2023-06-09', 19, 1, 10.00, 10.00),
    (120, '2023-06-10', 20, 2, 8.50, 17.00),
    (121, '2023-06-11', 1, 3, 11.00, 33.00),
    (122, '2023-06-12', 2, 2, 9.25, 18.50),
    (123, '2023-06-13', 3, 3, 6.50, 19.50),
    (124, '2023-06-14', 4, 1, 12.00, 12.00),
    (125, '2023-06-15', 5, 2, 7.75, 15.50),
    (126, '2023-06-16', 6, 3, 11.50, 34.50),
    (127, '2023-06-17', 7, 2, 9.00, 18.00),
    (128, '2023-06-18', 8, 3, 13.25, 39.75),
    (129, '2023-06-19', 9, 1, 10.50, 10.50),
    (130, '2023-06-20', 10, 2, 8.75, 17.50),
    (131, '2023-06-21', 11, 3, 12.50, 37.50),
    (132, '2023-06-22', 12, 2, 9.75, 19.50),
    (133, '2023-06-23', 13, 3, 7.25, 21.75),
    (134, '2023-06-24', 14, 1, 10.00, 10.00),
    (135, '2023-06-25', 15, 2, 8.50, 17.00),
    (136, '2023-06-26', 16, 3, 9.25, 27.75),
    (137, '2023-06-27', 17, 2, 11.00, 22.00),
    (138, '2023-06-28', 18, 3, 7.75, 23.25),
    (139, '2023-06-29', 19, 1, 9.50, 9.50),
    (140, '2023-06-30', 20, 2, 6.75, 13.50),
    (141, '2023-06-01', 1, 3, 10.50, 31.50),
    (142, '2023-06-02', 2, 2, 8.75, 17.50),
    (143, '2023-06-03', 3, 3, 7.00, 21.00),
    (144, '2023-06-04', 4, 1, 11.25, 11.25),
    (145, '2023-06-05', 5, 2, 9.00, 18.00),
    (146, '2023-06-06', 6, 3, 10.75, 32.25),
    (147, '2023-06-07', 7, 2, 7.50, 15.00),
    (148, '2023-06-08', 8, 3, 12.75, 38.25),
    (149, '2023-06-09', 9, 1, 8.50, 8.50),
    (150, '2023-06-10', 10, 2, 6.25, 12.50),
    (151, '2023-06-11', 11, 3, 9.50, 28.50),
    (152, '2023-06-12', 12, 2, 7.75, 15.50),
    (153, '2023-06-13', 13, 3, 11.00, 33.00),
    (154, '2023-06-14', 14, 1, 8.25, 8.25),
    (155, '2023-06-15', 15, 2, 10.00, 20.00),
    (156, '2023-06-16', 16, 3, 6.75, 20.25),
    (157, '2023-06-17', 17, 2, 9.50, 19.00),
    (158, '2023-06-18', 18, 3, 12.25, 36.75);

----MES JULIO
INSERT INTO DetallePedidos (IdPedido, Fecha, IdProducto, Cantidad, PrecioUnitario, Subtotal)
VALUES
    (159, '2023-07-01', 1, 3, 10.50, 31.50),
    (160, '2023-07-02', 2, 2, 8.75, 17.50),
    (161, '2023-07-03', 3, 3, 7.00, 21.00),
    (162, '2023-07-04', 4, 1, 11.25, 11.25),
    (163, '2023-07-05', 5, 2, 9.00, 18.00),
    (164, '2023-07-06', 6, 3, 10.75, 32.25),
    (165, '2023-07-07', 7, 2, 7.50, 15.00),
    (166, '2023-07-08', 8, 3, 12.75, 38.25),
    (167, '2023-07-09', 9, 1, 8.50, 8.50),
    (168, '2023-07-10', 10, 2, 6.25, 12.50),
    (169, '2023-07-11', 11, 3, 9.50, 28.50),
    (170, '2023-07-12', 12, 2, 7.75, 15.50),
    (171, '2023-07-13', 13, 3, 11.00, 33.00),
    (172, '2023-07-14', 14, 1, 8.25, 8.25),
    (173, '2023-07-15', 15, 2, 10.00, 20.00),
    (174, '2023-07-16', 16, 3, 6.75, 20.25),
    (175, '2023-07-17', 17, 2, 9.50, 19.00),
    (176, '2023-07-18', 18, 3, 12.25, 36.75),
    (177, '2023-07-19', 19, 1, 7.50, 7.50),
    (178, '2023-07-20', 20, 2, 9.75, 19.50),
    (179, '2023-07-21', 1, 3, 10.50, 31.50),
    (180, '2023-07-22', 2, 2, 8.75, 17.50),
    (181, '2023-07-23', 3, 3, 7.00, 21.00),
    (182, '2023-07-24', 4, 1, 11.25, 11.25),
    (183, '2023-07-25', 5, 2, 9.00, 18.00),
    (184, '2023-07-26', 6, 3, 10.75, 32.25),
    (185, '2023-07-27', 7, 2, 7.50, 15.00),
    (186, '2023-07-28', 8, 3, 12.75, 38.25),
    (187, '2023-07-29', 9, 1, 8.50, 8.50),
    (188, '2023-07-30', 10, 2, 6.25, 12.50),
    (189, '2023-07-31', 11, 3, 9.50, 28.50),
    (190, '2023-07-01', 12, 2, 7.75, 15.50),
    (191, '2023-07-02', 13, 3, 11.00, 33.00),
    (192, '2023-07-03', 14, 1, 8.25, 8.25),
    (193, '2023-07-04', 15, 2, 10.00, 20.00),
    (194, '2023-07-05', 16, 3, 6.75, 20.25),
    (195, '2023-07-06', 17, 2, 9.50, 19.00),
    (196, '2023-07-07', 18, 3, 12.25, 36.75),
    (197, '2023-07-08', 19, 1, 7.50, 7.50),
    (198, '2023-07-09', 20, 2, 9.75, 19.50),
    (199, '2023-07-10', 1, 3, 10.50, 31.50),
    (200, '2023-07-11', 2, 2, 8.75, 17.50),
    (201, '2023-07-12', 3, 3, 7.00, 21.00),
    (202, '2023-07-13', 4, 1, 11.25, 11.25),
    (203, '2023-07-14', 5, 2, 9.00, 18.00),
    (204, '2023-07-15', 6, 3, 10.75, 32.25),
    (205, '2023-07-16', 7, 2, 7.50, 15.00),
    (206, '2023-07-17', 8, 3, 12.75, 38.25),
    (207, '2023-07-18', 9, 1, 8.50, 8.50),
    (208, '2023-07-19', 10, 2, 6.25, 12.50),
    (209, '2023-07-20', 11, 3, 9.50, 28.50),
    (210, '2023-07-21', 12, 2, 7.75, 15.50),
    (211, '2023-07-22', 13, 3, 11.00, 33.00),
    (212, '2023-07-23', 14, 1, 8.25, 8.25),
    (213, '2023-07-24', 15, 2, 10.00, 20.00),
    (214, '2023-07-25', 16, 3, 6.75, 20.25),
    (215, '2023-07-26', 17, 2, 9.50, 19.00),
    (216, '2023-07-27', 18, 3, 12.25, 36.75),
    (217, '2023-07-28', 19, 1, 7.50, 7.50),
    (218, '2023-07-29', 20, 2, 9.75, 19.50),
    (219, '2023-07-30', 1, 3, 10.50, 31.50),
    (220, '2023-07-31', 2, 2, 8.75, 17.50),
    (221, '2023-07-01', 3, 3, 7.00, 21.00),
    (222, '2023-07-02', 4, 1, 11.25, 11.25),
    (223, '2023-07-03', 5, 2, 9.00, 18.00),
    (224, '2023-07-04', 6, 3, 10.75, 32.25),
    (225, '2023-07-05', 7, 2, 7.50, 15.00),
    (226, '2023-07-06', 8, 3, 12.75, 38.25),
    (227, '2023-07-07', 9, 1, 8.50, 8.50),
    (228, '2023-07-08', 10, 2, 6.25, 12.50),
    (229, '2023-07-09', 11, 3, 9.50, 28.50),
    (230, '2023-07-10', 12, 2, 7.75, 15.50),
    (231, '2023-07-11', 13, 3, 11.00, 33.00),
    (232, '2023-07-12', 14, 1, 8.25, 8.25),
    (233, '2023-07-13', 15, 2, 10.00, 20.00),
    (234, '2023-07-14', 16, 3, 6.75, 20.25),
    (235, '2023-07-15', 17, 2, 9.50, 19.00),
    (236, '2023-07-16', 18, 3, 12.25, 36.75),
    (237, '2023-07-17', 19, 1, 7.50, 7.50),
    (238, '2023-07-18', 20, 2, 9.75, 19.50),
    (239, '2023-07-19', 1, 3, 10.50, 31.50),
    (240, '2023-07-20', 2, 2, 8.75, 17.50),
    (241, '2023-07-21', 3, 3, 7.00, 21.00),
    (242, '2023-07-22', 4, 1, 11.25, 11.25),
    (243, '2023-07-23', 5, 2, 9.00, 18.00),
    (244, '2023-07-24', 6, 3, 10.75, 32.25);




select * from Pedidos
select * from DetallePedidos

	----- ESTOS UPDATES SON NECESARIOS PARA QUE CUADREN CON LA FECHA DE DETALLEPEDIDO---
DECLARE @contador INT
DECLARE @IDP INT
SET @contador = 0;
SET @IDP=110;
WHILE @contador < 30
BEGIN
    PRINT @contador
	
    SET @contador = @contador + 1
	SET @IDP= @IDP+1
	PRINT @IDP
	PRINT 'FECHA 0'+CAST(@contador AS VARCHAR)
	update Pedidos set Fecha=CONCAT('2023-06-',@contador), FechaEntrega=CONCAT('2023-06-',@contador) where IdPedido =@IDP
END

DECLARE @contador2 INT
DECLARE @IDP2 INT
SET @contador2 = 0;
SET @IDP2=140;
WHILE @contador2 < 18
BEGIN
    PRINT @contador2
	
    SET @contador2 = @contador2 + 1
	SET @IDP2= @IDP2+1
	PRINT @IDP2
	PRINT 'FECHA 0'+CAST(@contador2 AS VARCHAR)
	update Pedidos set Fecha=CONCAT('2023-06-',@contador2), FechaEntrega=CONCAT('2023-06-',@contador2) where IdPedido =@IDP2
END

DECLARE @contador3 INT
DECLARE @IDP3 INT
SET @contador3 = 0;
SET @IDP3=198;
WHILE @contador3 < 31
BEGIN
    PRINT @contador3
	
    SET @contador3 = @contador3 + 1
	SET @IDP3= @IDP3+1
	PRINT @IDP3
	PRINT 'FECHA 0'+CAST(@contador3 AS VARCHAR)
	update Pedidos set Fecha=CONCAT('2023-07-',@contador3), FechaEntrega=CONCAT('2023-07-',@contador3) where IdPedido =@IDP3
END

DECLARE @contador4 INT
DECLARE @IDP4 INT
SET @contador4 = 0;
SET @IDP4=229;
WHILE @contador4 < 15
BEGIN
    PRINT @contador4
	
    SET @contador4 = @contador4 + 1
	SET @IDP4= @IDP4+1
	PRINT @IDP4
	PRINT 'FECHA 0'+CAST(@contador4 AS VARCHAR)
	update Pedidos set Fecha=CONCAT('2023-07-',@contador4), FechaEntrega=CONCAT('2023-07-',@contador4) where IdPedido =@IDP4
END

DECLARE @contador5 INT
DECLARE @IDP5 INT
SET @contador5 = 22;
SET @IDP5=38;
WHILE @contador5 < 48
BEGIN
    PRINT @contador5
	
    SET @contador5 = @contador5 + 1
	SET @IDP5= @IDP5+1
	PRINT @IDP5
	PRINT 'FECHA 0'+CAST(@contador5 AS VARCHAR)
	update Pedidos set Fecha=CONCAT('2023-05-',@contador5), FechaEntrega=CONCAT('2023-05-',@contador5) where IdPedido =@IDP5
END

DECLARE @contador6 INT
DECLARE @IDP6 INT
SET @contador6 = 0;
SET @IDP6=47;
WHILE @contador6 < 31
BEGIN
    PRINT @contador6
	
    SET @contador6 = @contador6 + 1
	SET @IDP6= @IDP6+1
	PRINT @IDP6
	PRINT 'FECHA 0'+CAST(@contador6 AS VARCHAR)
	update Pedidos set Fecha=CONCAT('2023-05-',@contador6), FechaEntrega=CONCAT('2023-05-',@contador6) where IdPedido =@IDP6
END

update Pedidos set Fecha='2023-05-01', FechaEntrega='2023-05-01' where IdPedido =79
update Pedidos set Fecha='2023-05-02', FechaEntrega='2023-05-02' where IdPedido =80

DECLARE @contador7 INT
DECLARE @IDP7 INT
SET @contador7 = 0;
SET @IDP7=189;
WHILE @contador7 < 31
BEGIN
    PRINT @contador7
	
    SET @contador7 = @contador7 + 1
	SET @IDP7= @IDP7+1
	PRINT @IDP7
	PRINT 'FECHA 0'+CAST(@contador7 AS VARCHAR)
	update Pedidos set Fecha=CONCAT('2023-07-',@contador7), FechaEntrega=CONCAT('2023-07-',@contador7) where IdPedido =@IDP7
END

DECLARE @contador8 INT
DECLARE @IDP8 INT
SET @contador8 = 0;
SET @IDP8=220;
WHILE @contador8 < 24
BEGIN
    PRINT @contador8
	
    SET @contador8 = @contador8 + 1
	SET @IDP8= @IDP8+1
	PRINT @IDP8
	PRINT 'FECHA 0'+CAST(@contador8 AS VARCHAR)
	update Pedidos set Fecha=CONCAT('2023-07-',@contador8), FechaEntrega=CONCAT('2023-07-',@contador8) where IdPedido =@IDP8
END
select * from pedidos


GO
INSERT INTO Pedidos (IdPedido, Fecha, IdUsuario, IdStatus, FechaEntrega, Domicilio, Telefono, RazonSocial, Rfc, TipoPago, TipoEnvio, TipoPedido, Total)
VALUES
    (245, '2023-06-01', 57, 1, '2023-05-05', 'Avenida Guanajuato - Colonia Obregón', '4771234567', 'Proveedor1', 'RFC111111A01', 'E', 'D', 'C', 150.50),
    (246, '2023-06-02', 58, 1, '2023-05-06', 'Calle Yucatán - Colonia Jardines de Jerez', '4772345678', 'Proveedor2', 'RFC222222A02', 'TC', 'T', 'C', 200.00),
    (247, '2023-06-03', 59, 1, '2023-05-07', 'Avenida Insurgentes - Colonia Chapalita', '4773456789', 'Proveedor3', 'RFC333333A03', 'TD', 'D', 'C', 120.75),
    (248, '2023-06-04', 60, 1, '2023-05-08', 'Calle Hidalgo - Colonia Las Torres', '4774567890', 'Proveedor4', 'RFC444444A04', 'TB', 'T', 'C', 85.20),
    (249, '2023-06-05', 61, 1, '2023-05-09', 'Avenida Chapultepec - Colonia San Felipe', '4775678901', 'Proveedor5', 'RFC555555A05', 'E', 'D', 'C', 300.00),
    (250, '2023-06-06', 62, 1, '2023-05-10', 'Calle Querétaro - Colonia El Dorado', '4776789012', 'Proveedor6', 'RFC666666A06', 'TC', 'T', 'C', 75.50),
    (251, '2023-06-07', 63, 1, '2023-05-11', 'Avenida Juárez - Colonia Los Gavilanes', '4777890123', 'Proveedor7', 'RFC777777A07', 'TD', 'D', 'C', 210.25),
    (252, '2023-06-08', 64, 1, '2023-05-12', 'Calle Morelos - Colonia San Isidro', '4778901234', 'Proveedor8', 'RFC888888A08', 'TB', 'T', 'C', 95.80),
    (253, '2023-06-09', 57, 1, '2023-05-13', 'Avenida Reforma - Colonia La Moderna', '4779012345', 'Proveedor9', 'RFC999999A09', 'E', 'D', 'C', 180.60),
    (254, '2023-06-10', 58, 1, '2023-05-14', 'Calle Zacatecas - Colonia La Brisa', '4770123456', 'Proveedor10', 'RFC101010A10', 'TC', 'T', 'C', 250.75);

INSERT INTO Pedidos (IdPedido, Fecha, IdUsuario, IdStatus, FechaEntrega, Domicilio, Telefono, RazonSocial, Rfc, TipoPago, TipoEnvio, TipoPedido, Total)
VALUES
    (255, '2023-07-01', 57, 1, '2023-05-05', 'Avenida Guanajuato - Colonia Obregón', '4771234567', 'Proveedor1', 'RFC111111A01', 'E', 'D', 'C', 150.50+10),
    (256, '2023-07-02', 58, 1, '2023-05-06', 'Calle Yucatán - Colonia Jardines de Jerez', '4772345678', 'Proveedor2', 'RFC222222A02', 'TC', 'T', 'C', 200.00+23),
    (257, '2023-07-03', 59, 1, '2023-05-07', 'Avenida Insurgentes - Colonia Chapalita', '4773456789', 'Proveedor3', 'RFC333333A03', 'TD', 'D', 'C', 120.75-20),
    (258, '2023-07-04', 60, 1, '2023-05-08', 'Calle Hidalgo - Colonia Las Torres', '4774567890', 'Proveedor4', 'RFC444444A04', 'TB', 'T', 'C', 85.20+35),
    (259, '2023-07-05', 61, 1, '2023-05-09', 'Avenida Chapultepec - Colonia San Felipe', '4775678901', 'Proveedor5', 'RFC555555A05', 'E', 'D', 'C', 300.00-50),
    (260, '2023-07-06', 62, 1, '2023-05-10', 'Calle Querétaro - Colonia El Dorado', '4776789012', 'Proveedor6', 'RFC666666A06', 'TC', 'T', 'C', 75.50+10),
    (261, '2023-07-07', 63, 1, '2023-05-11', 'Avenida Juárez - Colonia Los Gavilanes', '4777890123', 'Proveedor7', 'RFC777777A07', 'TD', 'D', 'C', 210.25+20),
    (262, '2023-07-08', 64, 1, '2023-05-12', 'Calle Morelos - Colonia San Isidro', '4778901234', 'Proveedor8', 'RFC888888A08', 'TB', 'T', 'C', 95.80+30),
    (263, '2023-07-09', 57, 1, '2023-05-13', 'Avenida Reforma - Colonia La Moderna', '4779012345', 'Proveedor9', 'RFC999999A09', 'E', 'D', 'C', 180.60+10),
    (264, '2023-07-10', 58, 1, '2023-05-14', 'Calle Zacatecas - Colonia La Brisa', '4770123456', 'Proveedor10', 'RFC101010A10', 'TC', 'T', 'C', 250.75+20);
GO

INSERT INTO Compras (Fecha, IdPedido, IdProveedor, Total)
SELECT  PT.Fecha, PT.IdPedido, P.IdProveedor, PT.Total + 30
FROM Pedidos PT
JOIN dbo.Proveedores P
ON P.IdUsuario = PT.IdUsuario
where IdPedido>254

UPDATE Productos
SET Foto = CONCAT(Nombre,'.png')
