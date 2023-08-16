USE Clamaroj;
GO

-- Function to retrieve all compras
CREATE FUNCTION dbo.fxGetCompras()
RETURNS TABLE
AS
RETURN
(
    SELECT 
	C.Id as id,
	Fecha as fecha,
	CONCAT(U.Nombre,' ',U.Apellido) as usuarioNombre,
	IdPedido as idPedido,
	Total as total
	FROM dbo.Compras C
	LEFT JOIN dbo.Proveedores P
		ON P.IdProveedor = C.IdProveedor
	JOIN dbo.Usuarios U
		ON U.Id = P.IdUsuario
);
GO

-- Function to retrieve a specific compra by Id
CREATE FUNCTION dbo.fxGetCompra(
    @Id int
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        Id AS id,
        Fecha AS fecha,
        IdProveedor AS idProveedor,
        IdPedido AS idPedido,
        Total AS total
    FROM dbo.Compras
    WHERE Id = @Id
);
GO

-- Stored procedure for inserting or updating compras
CREATE PROCEDURE dbo.ComprasUPD
    @Id int OUTPUT,
    @IdPedido int,
    @Fecha DATETIME,
    @IdProveedor int,
    @Total decimal(18, 4)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS(SELECT * FROM dbo.Compras WHERE Id = @Id)
    BEGIN
        UPDATE dbo.Compras
        SET IdPedido = @IdPedido,
            Fecha = @Fecha,
            IdProveedor = @IdProveedor,
            Total = @Total
        WHERE Id = @Id;
    END
    ELSE
    BEGIN
        INSERT INTO dbo.Compras(IdPedido, IdProveedor, Fecha, Total)
        VALUES (@IdPedido, @IdProveedor, @Fecha, @Total);

        SET @Id = SCOPE_IDENTITY();
    END
END;
GO

-- Stored procedure for deleting a compra by Id
CREATE PROCEDURE dbo.ComprasDEL
    @Id int
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM dbo.Compras WHERE Id = @Id;
END;
