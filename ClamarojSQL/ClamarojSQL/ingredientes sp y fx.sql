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
	IF 
	EXISTS(SELECT * FROM dbo.Ingrediente WHERE IdReceta = @IdReceta 
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
	MP.Nombre AS materiaPrima
    FROM dbo.Ingrediente I
    JOIN dbo.Recetas R ON I.IdReceta = R.IdReceta
    JOIN dbo.MateriasPrimas MP ON I.IdMateriaPrima = MP.Id
)

