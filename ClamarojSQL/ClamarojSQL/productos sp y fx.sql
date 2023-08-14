USE Clamaroj
GO

-- Procedimiento almacenado para insertar o actualizar un producto
CREATE PROCEDURE dbo.ProductosUPD
    @IdProducto int out,
    @Codigo varchar(10),
    @Nombre varchar(45),
    @Descripcion varchar(120),
    @Precio decimal(18,4),
    @Foto text,
    @Merma decimal(18,4),
    @IdStatus int
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS(SELECT * FROM dbo.Productos WHERE IdProducto = @IdProducto)
    BEGIN
        UPDATE dbo.Productos
        SET Codigo = @Codigo,
            Nombre = @Nombre,
            Descripcion = @Descripcion,
            Precio = @Precio,
            Foto = @Foto,
            Merma = @Merma,
            IdStatus = @IdStatus,
            FechaModificacion = GETDATE()
        WHERE IdProducto = @IdProducto
    END
    ELSE
    BEGIN
        INSERT INTO dbo.Productos(IdProducto, Codigo, Nombre, Descripcion, Precio, Foto, Merma, IdStatus, FechaRegistro, FechaModificacion)
        VALUES (@IdProducto, @Codigo, @Nombre, @Descripcion, @Precio, @Foto, @Merma, @IdStatus, GETDATE(), GETDATE())

        SET @IdProducto = SCOPE_IDENTITY()
    END
END
GO

-- Procedimiento almacenado para eliminar un producto por su ID
CREATE PROCEDURE dbo.ProductosDEL
    @IdProducto int
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM dbo.Productos WHERE IdProducto = @IdProducto
END
GO

-- Función para obtener todos los productos
CREATE FUNCTION dbo.fxGetProductos()
RETURNS TABLE
AS
RETURN
(
    SELECT IdProducto AS idProducto, 
           Codigo AS codigo, 
           P.Nombre AS nombre, 
           Descripcion AS descripcion, 
           Precio AS precio, 
           Foto AS foto, 
           Merma AS merma, 
           E.Nombre as estatus
    FROM dbo.Productos P
	JOIN dbo.Estatus E ON E.Id = P.IdStatus
)
GO

-- Función para obtener un producto por su ID
CREATE FUNCTION dbo.fxGetProducto(@Id int)
RETURNS TABLE
AS
RETURN
(
    SELECT IdProducto AS idProducto, 
           Codigo AS codigo, 
           Nombre AS nombre, 
           Descripcion AS descripcion, 
           Precio AS precio, 
           Foto AS foto, 
           Merma AS merma, 
           IdStatus AS idStatus, 
           FechaRegistro AS fechaRegistro, 
           FechaModificacion AS fechaModificacion
    FROM dbo.Productos
    WHERE IdProducto = @Id
)
GO
