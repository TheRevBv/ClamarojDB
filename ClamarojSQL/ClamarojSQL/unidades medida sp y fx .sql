USE Clamaroj
GO
SELECT * FROM dbo.UnidadesMedida
go
-- Función para obtener todas las unidades de medida
CREATE FUNCTION dbo.fxGetUnidadesMedida()
RETURNS TABLE
AS
RETURN
(
    SELECT IdUnidadMedida AS idUnidadMedida, 
    Nombre AS nombre,
    Descripcion AS descripcion,
    IdStatus AS idStatus
    FROM dbo.UnidadesMedida
)
GO
-- Función para obtener una unidad de medida por su ID
CREATE FUNCTION dbo.fxGetUnidadMedida(@Id int)
RETURNS TABLE
AS
RETURN
(
    SELECT IdUnidadMedida as idUnidadMedida,
    Nombre as nombre,
    Descripcion as descripcion,
    IdStatus as idStatus
    FROM dbo.UnidadesMedida
    WHERE IdUnidadMedida = @Id
)
GO
-- Procedimiento almacenado para insertar o actualizar una unidad de medida
CREATE PROCEDURE dbo.UnidadesMedidaUPD
    @IdUnidadMedida int out,
    @Nombre varchar(45),
    @Descripcion varchar(120),
    @IdStatus int
AS
BEGIN
    SET NOCOUNT ON;
    
    IF EXISTS(SELECT * FROM dbo.UnidadesMedida WHERE IdUnidadMedida = @IdUnidadMedida)
    BEGIN
        UPDATE dbo.UnidadesMedida
        SET Nombre = @Nombre,
            Descripcion = @Descripcion,
            IdStatus = @IdStatus
        WHERE IdUnidadMedida = @IdUnidadMedida
    END
    ELSE
    BEGIN
        INSERT INTO dbo.UnidadesMedida(IdUnidadMedida, Nombre, Descripcion, IdStatus)
        VALUES (@IdUnidadMedida, @Nombre, @Descripcion, @IdStatus)
    END
END
GO
-- Procedimiento almacenado para eliminar una unidad de medida por su ID
CREATE PROCEDURE dbo.UnidadesMedidaDEL
    @IdUnidadMedida int
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM dbo.UnidadesMedida WHERE IdUnidadMedida = @IdUnidadMedida
END
