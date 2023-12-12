
GO


SELECT * FROM dbo.Recetas

select * from dbo.Productos

SELECT * FROM dbo.Ingrediente

SELECT * FROM dbo.MateriasPrimas

select * from Estatus

GO
--ids productos con cantidad separado por comas y guiones 
DECLARE @IdsProductos varchar(MAX) = '1-2,2-3,3-4,4-5,5-6,6-7,7-8,8-9,9-10,10-11'

--CREA UNA TABLA TEMPORAL PARA ALMACENAR LOS IDS DE LOS PRODUCTOS Y LA CANTIDAD
DECLARE @Productos TABLE(IdProducto int, Cantidad int)



select * from Recetas
UPDATE MateriasPrimas SET IdUnidadMedida = 5
update recetas set Cantidad = 1 

SELECT * FROM Ingrediente

UPDATE Ingrediente 
set Cantidad = 1

INSERT INTO Recetas (Codigo, Costo, Cantidad, IdProducto, IdStatus, FechaRegistro, FechaModificacion)
VALUES  ('REC-ENDIABLADA', 3.80, 1, 8, 1, '2023-05-01', '2023-05-01'),
	   ('REC-CACAHUATADA', 4.25, 1, 9, 1, '2023-05-01', '2023-05-01'),
	   ('REC-LAGUNA', 2.90, 1, 10, 1, '2023-05-01', '2023-05-01'),
	   ('REC-SABRIMEDUSA', 3.80, 1, 11, 1, '2023-05-01', '2023-05-01'),
	   ('REC-TEQUILA', 4.25, 1, 12, 1, '2023-05-01', '2023-05-01'),
	   ('REC-PAPAENCHIL', 2.90, 1, 13, 1, '2023-05-01', '2023-05-01'),
	   ('REC-CRERICOT', 3.80, 1, 14, 1, '2023-05-01', '2023-05-01'),
	   ('REC-SABRICHEESE', 3.80, 1, 15, 1, '2023-05-01', '2023-05-01'),
	   ('REC-MACHOLADA', 4.25, 1, 16, 1, '2023-05-01', '2023-05-01'),
	   ('REC-SABRILOCA', 2.90, 1, 17, 1, '2023-05-01', '2023-05-01'),
	   ('REC-CAMARONCHELA', 3.80, 1, 18, 1, '2023-05-01', '2023-05-01'),
	   ('REC-SABRICHIL', 4.25, 1, 19, 1, '2023-05-01', '2023-05-01'),
	   ('REC-GOMILOCAS', 2.90, 1, 20, 1, '2023-05-01', '2023-05-01');


-- ENDIABLADA
INSERT INTO Ingrediente (IdReceta,IdMateriaPrima, Cantidad)
VALUES 
		(8,5 ,200 ),
		(8, 21,200 ),
		(8,1,300 ),
		(8, 25,60 ),
		(8, 22,45 ),
		(8, 14, 15),
		(8, 23, 5);

-- CACAHUATADA
INSERT INTO Ingrediente (IdReceta,IdMateriaPrima, Cantidad)
VALUES 
		(9,5 ,200 ),
		(9, 21,200 ),
		(9,1,300 ),
		(9, 25,60 ),
		(9, 22,45 ),
		(9, 14, 15),
		(9, 23, 5);

-- LAGUNA
INSERT INTO Ingrediente (IdReceta,IdMateriaPrima, Cantidad)
VALUES 
		(10,5 ,200 ),
		(10, 21,200 ),
		(10,1,300 ),
		(10, 25,60 ),
		(10, 22,45 ),
		(10, 14, 15),
		(10, 23, 5);

-- SABRIMEDUSA
INSERT INTO Ingrediente (IdReceta,IdMateriaPrima, Cantidad)
VALUES 
		(11,5 ,200 ),
		(11, 21,200 ),
		(11,1,300 ),
		(11, 25,60 ),
		(11, 22,45 ),
		(11, 14, 15),
		(11, 23, 5);

-- TEQUILA
INSERT INTO Ingrediente (IdReceta,IdMateriaPrima, Cantidad)
VALUES 
		(12,5 ,200 ),
		(12, 21,200 ),
		(12,1,300 ),
		(12, 25,60 ),
		(12, 22,45 ),
		(12, 14, 15),
		(12, 23, 5);

-- PAPAENCHIL
INSERT INTO Ingrediente (IdReceta,IdMateriaPrima, Cantidad)
VALUES 
		(13,5 ,200 ),
		(13, 21,200 ),
		(13,1,300 ),
		(13, 25,60 ),
		(13, 22,45 ),
		(13, 14, 15),
		(13, 23, 5);

-- CRERICOT
INSERT INTO Ingrediente (IdReceta,IdMateriaPrima, Cantidad)
VALUES 
		(14,5 ,200 ),
		(14, 21,200 ),
		(14,1,300 ),
		(14, 25,60 ),
		(14, 22,45 ),
		(14, 14, 15),
		(14, 23, 5);

-- SABRICHEESE
INSERT INTO Ingrediente (IdReceta,IdMateriaPrima, Cantidad)
VALUES 
		(15,5 ,200 ),
		(15, 21,200 ),
		(15,1,300 ),
		(15, 25,60 ),
		(15, 22,45 ),
		(15, 14, 15),
		(15, 23, 5);

-- MACHOLADA
INSERT INTO Ingrediente (IdReceta,IdMateriaPrima, Cantidad)
VALUES 
		(16,5 ,200 ),
		(16, 21,200 ),
		(16,1,300 ),
		(16, 25,60 ),
		(16, 22,45 ),
		(16, 14, 15),
		(16, 23, 5);

-- SABRILOCA
INSERT INTO Ingrediente (IdReceta,IdMateriaPrima, Cantidad)
VALUES 
		(17,5 ,200 ),
		(17, 21,200 ),
		(17,1,300 ),
		(17, 25,60 ),
		(17, 22,45 ),
		(17, 14, 15),
		(17, 23, 5);

-- CAMARONCHELA
INSERT INTO Ingrediente (IdReceta,IdMateriaPrima, Cantidad)
VALUES 
		(18,5 ,200 ),
		(18, 21,200 ),
		(18,1,300 ),
		(18, 25,60 ),
		(18, 22,45 ),
		(18, 14, 15),
		(18, 23, 5);

-- SABRICHIL
INSERT INTO Ingrediente (IdReceta,IdMateriaPrima, Cantidad)
VALUES 
		(19,5 ,200 ),
		(19, 21,200 ),
		(19,1,300 ),
		(19, 25,60 ),
		(19, 22,45 ),
		(19, 14, 15),
		(19, 23, 5);

-- GOMILOCAS
INSERT INTO Ingrediente (IdReceta,IdMateriaPrima, Cantidad)
VALUES 
		(20,5 ,200 ),
		(20, 21,200 ),
		(20,1,300 ),
		(20, 25,60 ),
		(20, 22,45 ),
		(20, 14, 15),
		(20, 23, 5);

select distinct IdReceta from Ingrediente

SELECT * FROM Pedidos
where IdPedido = 1

SELECT * FROM DetallePedidos
where IdPedido = 1

SELECT * FROM MateriasPrimas

select * from Clamaroj.dbo.Usuarios

UPDATE Clamaroj.dbo.Usuarios set [Password] = HASHBYTES('SHA2_512', '123456') where ID = 1002
