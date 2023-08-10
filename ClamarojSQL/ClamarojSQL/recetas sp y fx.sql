USE Clamaroj
GO
SELECT * FROM dbo.Recetas
select * from dbo.Productos
GO
-- Función para obtener todas las recetas
CREATE FUNCTION dbo.fxGetRecetas()
RETURNS TABLE
AS
RETURN
(
    SELECT R.IdReceta idReceta, 
	R.Codigo codigo, 
	P.Nombre producto,
	E.Nombre estatus
	--IdProducto, 
	--IdStatus, 	
    FROM dbo.Recetas R
	JOIN dbo.Productos P
		ON P.IdProducto = R.IdProducto
	JOIN dbo.Estatus E
		ON E.Id = R.IdStatus
)
GO
-- Función para obtener una receta por su ID
CREATE FUNCTION dbo.fxGetReceta(@Id int)
RETURNS TABLE
AS
RETURN
(
    SELECT 
	IdReceta as idReceta, 
	Codigo as codigo, 
	IdProducto as idProducto, 
	IdStatus as idStatus
	FROM dbo.Recetas
	WHERE IdReceta = @Id

)
GO
-- Procedimiento almacenado para insertar o actualizar una receta
CREATE PROCEDURE dbo.RecetasUPD
    @Id int out,
    @Codigo varchar(10),
    @IdProducto int,
    @IdStatus int--,
    --@FechaRegistro datetime,
    -- @FechaModificacion datetime = GETDATE(),
    --@IdMateriasPrimas nvarchar(max)
AS
BEGIN
    SET NOCOUNT ON;
	DELETE FROM dbo.Ingrediente WHERE IdReceta = @Id

    IF EXISTS(SELECT * FROM dbo.Recetas WHERE IdReceta = @Id)
    BEGIN
        UPDATE dbo.Recetas
        SET Codigo = @Codigo,
            IdProducto = @IdProducto,
            IdStatus = @IdStatus,
            FechaRegistro = GETDATE(),
            FechaModificacion = GETDATE()
        WHERE IdReceta = @Id
    END
    ELSE
    BEGIN
        INSERT INTO dbo.Recetas(IdReceta, Codigo, IdProducto, IdStatus, FechaRegistro, FechaModificacion)
        VALUES (@Id, @Codigo, @IdProducto, @IdStatus, GETDATE(), GETDATE())

		-- Obtener el ID del usuario recién insertado
		SET @Id = SCOPE_IDENTITY()
    END
    -- Actualizar ingredientes    
	--Se hara en otro stored para configurar las recetas
	
END
GO
-- Procedimiento almacenado para eliminar una receta por su ID
CREATE PROCEDURE dbo.RecetasDEL
    @Id int
AS
BEGIN
    SET NOCOUNT ON;
    --DELETE FROM dbo.Recetas WHERE IdReceta = @Id
	UPDATE dbo.Recetas
	SET IdStatus = 2
	WHERE IdReceta = @Id
    DELETE FROM dbo.Ingrediente WHERE IdReceta = @Id
END

go

