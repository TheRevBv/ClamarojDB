USE Clamaroj
GO
SELECT * FROM dbo.MateriasPrimas
GO
-- Función para obtener todas las materias primas
CREATE FUNCTION dbo.fxGetMateriasPrimas()
RETURNS TABLE
AS
RETURN
(
    SELECT 
		MP.Id as id, 
		MP.Codigo as codigo, 
		MP.Nombre as nombre, 
		P.RazonSocial as razonSocial,
		S.Nombre as estatus,
		MP.Descripcion as descripcion,
		MP.Stock as stock,
		MP.Precio as precio
    FROM dbo.MateriasPrimas as MP
    JOIN dbo.Proveedores as P
		ON MP.IdProveedor = P.IdProveedor
    JOIN dbo.Estatus as S
		ON MP.IdStatus = S.Id
)
GO
-- Función para obtener una materia prima por su ID
CREATE FUNCTION dbo.fxGetMateriaPrima(@Id int)
RETURNS TABLE
AS
RETURN
(
    SELECT 
		Id as id, 
		Codigo as codigo, 
		Nombre as nombre, 
		Descripcion as descripcion, 
		Perecedero as perecedero, 
		Stock as stock, 
		CantMinima as cantMinima, 
		CantMaxima as cantMaxima,
		IdUnidadMedida as idUnidadMedida, 
		Precio as precio, 
		Foto as foto, 
		IdProveedor as idProveedor, 
		IdStatus as idStatus, 
		FechaRegistro as fechaRegistro, 
		FechaModificacion as fechaModificacion
	FROM dbo.MateriasPrimas
	WHERE Id = @Id

)
GO
-- Procedimiento almacenado para insertar o actualizar una materia prima
CREATE PROCEDURE dbo.MateriasPrimasUPD
    @Id int out,
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
    @IdStatus int--,
    --@FechaRegistro datetime,
    --@FechaModificacion datetime--,
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
            FechaModificacion = GETDATE()
        WHERE Id = @Id
    END
    ELSE
    BEGIN
        INSERT INTO dbo.MateriasPrimas(Id, Codigo, Nombre, Descripcion, Perecedero, Stock,
                                     CantMinima, CantMaxima, IdUnidadMedida, Precio,
                                     Foto, IdProveedor, IdStatus, FechaRegistro, FechaModificacion)
        VALUES (@Id, @Codigo, @Nombre, @Descripcion, @Perecedero, @Stock,
                @CantMinima, @CantMaxima, @IdUnidadMedida, @Precio,
                @Foto, @IdProveedor, @IdStatus, GETDATE(), GETDATE())
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

