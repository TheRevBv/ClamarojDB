USE Clamaroj
GO

-- Procedimiento almacenado para insertar o actualizar un detalle de pedido
CREATE PROCEDURE dbo.DetallePedidosUPD
    @Id int out,
    @Fecha datetime,
    @IdPedido int,
    @IdProducto int,
    @Cantidad int,
    @PrecioUnitario decimal(18,4),
    @Subtotal decimal(18,4)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS(SELECT * FROM dbo.DetallePedidos WHERE IdDetallePedido = @Id)
    BEGIN
        UPDATE dbo.DetallePedidos
        SET IdProducto = @IdProducto,
            Cantidad = @Cantidad,
            PrecioUnitario = @PrecioUnitario,
            Subtotal = @Subtotal
        WHERE IdPedido = @IdPedido
		AND Fecha = @Fecha		
		AND IdDetallePedido = @Id
    END
    ELSE
    BEGIN
        INSERT INTO dbo.DetallePedidos(Fecha, IdPedido, IdProducto, Cantidad, PrecioUnitario, Subtotal)
        VALUES (@Fecha, @IdPedido, @IdProducto, @Cantidad, @PrecioUnitario, @Subtotal)

        SET @Id = SCOPE_IDENTITY()
    END

	UPDATE dbo.Pedidos 
	SET Total = Total + @Subtotal
	WHERE IdPedido = @IdPedido
	AND Fecha = @Fecha

	UPDATE dbo.Ventas
	SET Total = Total + @Subtotal
	WHERE IdPedido = @IdPedido
	AND Fecha = @Fecha

	UPDATE dbo.Compras
	SET Total = Total + @Subtotal
	WHERE IdPedido = @IdPedido
	AND Fecha = @Fecha

END
GO

-- Procedimiento almacenado para eliminar un detalle de pedido por su ID
CREATE PROCEDURE dbo.DetallePedidoDEL
    @Id int
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM dbo.DetallePedidos WHERE IdDetallePedido = @Id
END
GO

-- Función para obtener todos los detalles de pedido
CREATE FUNCTION dbo.fxGetDetallesPedido(@IdPedido int)
RETURNS TABLE
AS
RETURN
(
    SELECT IdDetallePedido AS idDetallePedido, 
           Fecha, 
           IdPedido AS idPedido, 
           IdProducto AS idProducto, 
           Cantidad, 
           PrecioUnitario AS precioUnitario, 
           Subtotal
    FROM dbo.DetallePedidos
	WHERE IdPedido = @IdPedido
)
GO

-- Función para obtener un detalle de pedido por su ID
CREATE FUNCTION dbo.fxGetDetallePedido(@IdPedido int, @Id int)
RETURNS TABLE
AS
RETURN
(
    SELECT IdDetallePedido AS idDetallePedido, 
           Fecha, 
           IdPedido AS idPedido, 
           IdProducto AS idProducto, 
           Cantidad, 
           PrecioUnitario AS precioUnitario, 
           Subtotal
    FROM dbo.DetallePedidos
    WHERE IdPedido = @IdPedido
	AND IdDetallePedido = @Id
)
GO
