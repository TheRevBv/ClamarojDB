USE Clamaroj
GO

-- Función para obtener todas las recetas
CREATE FUNCTION dbo.fxGetRecetas()
RETURNS TABLE
AS
RETURN
(
    SELECT IdReceta, Codigo, IdProducto, IdStatus, FechaRegistro, FechaModificacion
    FROM dbo.Recetas
)
GO
-- Función para obtener una receta por su ID
CREATE FUNCTION dbo.fxGetRecetaById(@Id int)
RETURNS TABLE
AS
RETURN
(
    SELECT IdReceta, Codigo, IdProducto, IdStatus, FechaRegistro, FechaModificacion
    FROM dbo.Recetas
    WHERE IdReceta = @Id
)
GO
-- Procedimiento almacenado para insertar o actualizar una receta
CREATE PROCEDURE dbo.RecetaUPD
    @IdReceta int,
    @Codigo varchar(10),
    @IdProducto int,
    @IdStatus int,
    @FechaRegistro datetime,
    -- @FechaModificacion datetime = GETDATE(),
    @Ingredientes nvarchar(max)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS(SELECT * FROM dbo.Recetas WHERE IdReceta = @IdReceta)
    BEGIN
        UPDATE dbo.Recetas
        SET Codigo = @Codigo,
            IdProducto = @IdProducto,
            IdStatus = @IdStatus,
            FechaRegistro = @FechaRegistro,
            FechaModificacion = GETDATE()
        WHERE IdReceta = @IdReceta
    END
    ELSE
    BEGIN
        INSERT INTO dbo.Recetas(IdReceta, Codigo, IdProducto, IdStatus, FechaRegistro, FechaModificacion)
        VALUES (@IdReceta, @Codigo, @IdProducto, @IdStatus, @FechaRegistro, GETDATE())
    END

    -- Actualizar ingredientes
    DELETE FROM dbo.Ingrediente WHERE IdReceta = @IdReceta;
    INSERT INTO dbo.Ingrediente(IdReceta, Ingredientes) VALUES (@IdReceta, @Ingredientes)
END
GO
-- Procedimiento almacenado para eliminar una receta por su ID
CREATE PROCEDURE dbo.RecetaDEL
    @IdReceta int
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM dbo.Recetas WHERE IdReceta = @IdReceta
    DELETE FROM dbo.Ingrediente WHERE IdReceta = @IdReceta
END
