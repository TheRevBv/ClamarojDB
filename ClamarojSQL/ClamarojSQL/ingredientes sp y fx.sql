use Clamaroj
go
select * from dbo.Ingrediente
go
CREATE PROCEDURE dbo.IngredientesUPD
@IdReceta int,
@IdMateriaPrima INT,
@Cantidad decimal(18,4)
AS
BEGIN
	--DELETE FROM dbo.Ingrediente WHERE IdReceta = @IdReceta

	IF EXISTS(SELECT * FROM dbo.Ingrediente WHERE IdReceta = @IdReceta 
	AND IdMateriaPrima = @IdMateriaPrima)
		UPDATE dbo.Ingrediente
		SET Cantidad = @Cantidad
		WHERE IdReceta = @IdReceta
		AND IdMateriaPrima = @IdMateriaPrima
	ELSE
		INSERT INTO dbo.Ingrediente(IdReceta, IdMateriaPrima, Cantidad)
		VALUES(@IdReceta,@IdMateriaPrima,@Cantidad)
END

GO
CREATE PROCEDURE dbo.IngredientesDEL
@IdReceta int,
@IdMateriaPrima int
AS
BEGIN
	DELETE FROM dbo.Ingrediente 
	WHERE IdReceta = @IdReceta AND IdMateriaPrima = @IdMateriaPrima
END

GO

CREATE FUNCTION dbo.fxGetIngredientesReceta
(
    @IdReceta int
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
		MP.Codigo as codigo, 
		MP.Nombre as nombre, 
		I.Cantidad as cantidad
    FROM dbo.MateriasPrimas as MP
    JOIN dbo.Ingrediente I
	ON I.IdMateriaPrima = MP.Id
    WHERE I.IdReceta = @IdReceta
)

GO

GO

CREATE FUNCTION dbo.fxGetIngrediente
(
    @IdReceta int,
    @IdMateriaPrima int
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
	I.IdReceta AS idReceta, 
	I.IdMateriaPrima AS idMateriaPrima, 
	I.Cantidad AS cantidad 
    FROM dbo.Ingrediente I    
    WHERE I.IdReceta = @IdReceta 
	AND I.IdMateriaPrima = @IdMateriaPrima
)

GO

CREATE FUNCTION dbo.fxGetIngredientes()
RETURNS TABLE
AS
RETURN
(
    SELECT 
	I.IdReceta AS idReceta, 
	I.IdMateriaPrima AS idMateriaPrima, 
	I.Cantidad AS cantidad, 
	R.Codigo AS receta, 
	MP.Nombre AS materiaPrima,
	E.Nombre AS estatus
    FROM dbo.Ingrediente I
    JOIN dbo.Recetas R ON I.IdReceta = R.IdReceta
    JOIN dbo.MateriasPrimas MP ON I.IdMateriaPrima = MP.Id
	JOIN dbo.Estatus E ON E.Id = MP.IdStatus
)


GO

DECLARE @IdReceta int = 1

--IF EXISTS(SELECT * FROM dbo.Ingrediente WHERE IdReceta = @IdReceta)
	SELECT  
		ISNULL(IdReceta, @IdReceta) as idReceta, 
		MP.Id as idMateriasPrima, 
		ISNULL(I.Cantidad, 0) as Cantidad
	FROM dbo.Ingrediente I
	RIGHT JOIN dbo.MateriasPrimas MP
		ON MP.Id = I.IdMateriaPrima
		WHERE I.IdReceta = @IdReceta



SELECT 
MP.Id AS idMateriaPrimas,
MP.Foto AS foto,
MP.IdStatus,
0 AS cantidad
FROM dbo.MateriasPrimas MP

go

DECLARE @IdReceta int = 1

SELECT 
MP.Id as id, 
MP.Nombre as nombre, 
S.Nombre as estatus,
--MP.Foto as foto,
0 as cantidad
FROM dbo.MateriasPrimas as MP
JOIN dbo.Proveedores as P
ON MP.IdProveedor = P.IdProveedor
JOIN dbo.Estatus as S
ON MP.IdStatus = S.Id

UNION 

SELECT
0,
'',
'',
--'',
--'',
I.Cantidad as cantidad
FROM dbo.Ingrediente I
WHERE IdReceta = @IdReceta

--EXEC dbo.IngredientesUPD 1,2,10

select * from Ingrediente

