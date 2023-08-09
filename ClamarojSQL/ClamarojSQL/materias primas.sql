USE Clamaroj
GO

-- Función para obtener todas las materias primas
CREATE FUNCTION dbo.fxGetMateriasPrimas()
RETURNS TABLE
AS
RETURN
(
    SELECT mp.Id as id, 
    mp.Codigo as codigo, 
    mp.Nombre as nombre, 
    p.RazonSocial as razonSocial,
    s.Nombre as estatus
    -- , 
    -- IdProveedor, 
    -- IdStatus, 
    -- FechaRegistro, 
    -- FechaModificacion
    FROM dbo.MateriasPrimas as mp
    JOIN dbo.Proveedores as p
    ON mp.IdProveedor = p.IdProveedor
    JOIN dbo.Estatus as s
    ON mp.IdStatus = s.Id
)
GO
-- Función para obtener una materia prima por su ID
CREATE FUNCTION dbo.fxGetMateriaPrima(@Id int)
RETURNS TABLE
AS
RETURN
(
    SELECT Id, 
    Codigo, 
    Nombre, 
    Descripcion, 
    Perecedero, 
    Stock, 
    CantMinima, 
    CantMaxima,
    IdUnidadMedida, 
    Precio, 
    Foto, 
    IdProveedor, 
    IdStatus, 
    FechaRegistro, 
    FechaModificacion
    FROM dbo.MateriasPrimas
    WHERE Id = @Id
)
GO
-- Procedimiento almacenado para insertar o actualizar una materia prima
CREATE PROCEDURE dbo.MateriasPrimasUPD
    @Id int,
    @Codigo varchar(10),
    @Nombre varchar(45),
    @Descripcion varchar(120),
    @Perecedero int,
    @Stock int,
    @CantMinima int,
    @CantMaxima int,
    @IdUnidadMedida int,
    @Precio decimal(18,4),
    @Foto nvarchar(max),
    @IdProveedor int,
    @IdStatus int,
    @FechaRegistro datetime,
    @FechaModificacion datetime--,
    -- @Ingredientes nvarchar(max)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS(SELECT * FROM dbo.MateriasPrimas WHERE Id = @Id)
    BEGIN
        UPDATE dbo.MateriasPrimas
        SET Codigo = @Codigo,
            Nombre = @Nombre,
            Descripcion = @Descripcion,
            Perecedero = @Perecedero,
            Stock = @Stock,
            CantMinima = @CantMinima,
            CantMaxima = @CantMaxima,
            IdUnidadMedida = @IdUnidadMedida,
            Precio = @Precio,
            Foto = @Foto,
            IdProveedor = @IdProveedor,
            IdStatus = @IdStatus,
            FechaRegistro = @FechaRegistro,
            FechaModificacion = @FechaModificacion
        WHERE Id = @Id
    END
    ELSE
    BEGIN
        INSERT INTO dbo.MateriasPrimas(Id, Codigo, Nombre, Descripcion, Perecedero, Stock,
                                     CantMinima, CantMaxima, IdUnidadMedida, Precio,
                                     Foto, IdProveedor, IdStatus, FechaRegistro, FechaModificacion)
        VALUES (@Id, @Codigo, @Nombre, @Descripcion, @Perecedero, @Stock,
                @CantMinima, @CantMaxima, @IdUnidadMedida, @Precio,
                @Foto, @IdProveedor, @IdStatus, @FechaRegistro, @FechaModificacion)
    END
END
GO
-- Procedimiento almacenado para eliminar una materia prima por su ID
CREATE PROCEDURE dbo.MateriasPrimasDEL
    @Id int
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM dbo.MateriasPrimas WHERE Id = @Id
    DELETE FROM dbo.Ingrediente WHERE IdMateriaPrima = @Id
END

