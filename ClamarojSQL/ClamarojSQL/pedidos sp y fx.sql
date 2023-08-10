USE Clamaroj
GO
SELECT * FROM dbo.Pedidos
GO
-- Procedimiento almacenado para insertar o actualizar un pedido
CREATE PROCEDURE dbo.PedidoUPD
    @Id int out,
    @IdUsuario int,
    @IdStatus int,
    @Fecha datetime,
    @FechaEntrega datetime,
    @Domicilio varchar(45),
    @Telefono varchar(10),
    @RazonSocial varchar(45),
    @Rfc varchar(13),
    @TipoPago char(4),
    @TipoEnvio char(4),
    @TipoPedido char(4),
    @Total decimal(18,4)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS(SELECT * FROM dbo.Pedidos WHERE IdPedido = @Id)
    BEGIN
        UPDATE dbo.Pedidos
        SET IdUsuario = @IdUsuario,
            IdStatus = @IdStatus,
            Fecha = @Fecha,
            FechaEntrega = @FechaEntrega,
            Domicilio = @Domicilio,
            Telefono = @Telefono,
            RazonSocial = @RazonSocial,
            Rfc = @Rfc,
            TipoPago = @TipoPago,
            TipoEnvio = @TipoEnvio,
            TipoPedido = @TipoPedido,
            Total = @Total
        WHERE IdPedido = @Id
    END
    ELSE
    BEGIN
        INSERT INTO dbo.Pedidos(IdUsuario, IdStatus, Fecha, FechaEntrega, Domicilio, Telefono, RazonSocial, Rfc, TipoPago, TipoEnvio, TipoPedido, Total)
        VALUES (@IdUsuario, @IdStatus, @Fecha, @FechaEntrega, @Domicilio, @Telefono, @RazonSocial, @Rfc, @TipoPago, @TipoEnvio, @TipoPedido, @Total)

        SET @Id = SCOPE_IDENTITY()
    END

	--EXEC dbo.DetallePedidosUPD @Id,@Id
END

GO

-- Procedimiento almacenado para eliminar un pedido por su ID
CREATE PROCEDURE dbo.PedidoDEL
    @Id int
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM dbo.Pedidos WHERE IdPedido = @Id
END
GO

-- Función para obtener todos los pedidos
CREATE FUNCTION dbo.fxGetPedidos()
RETURNS TABLE
AS
RETURN
(
    SELECT P.IdPedido AS idPedido, 
           P.IdUsuario AS idUsuario,
           U.Nombre AS usuarioNombre,
           E.Nombre AS estatus,
           P.Fecha, P.FechaEntrega,
           P.Domicilio, P.Telefono,
           P.RazonSocial, P.Rfc,
           P.TipoPago, P.TipoEnvio, P.TipoPedido,
           P.Total
    FROM dbo.Pedidos P
    JOIN dbo.Usuarios U ON U.Id = P.IdUsuario
    JOIN dbo.Estatus E ON E.Id = P.IdStatus
)
GO

-- Función para obtener un pedido por su ID
CREATE FUNCTION dbo.fxGetPedido(@Id int)
RETURNS TABLE
AS
RETURN
(
    SELECT P.IdPedido AS idPedido, 
           P.IdUsuario AS idUsuario,
           U.Nombre AS usuarioNombre,
           E.Nombre AS estatus,
           P.Fecha, P.FechaEntrega,
           P.Domicilio, P.Telefono,
           P.RazonSocial, P.Rfc,
           P.TipoPago, P.TipoEnvio, P.TipoPedido,
           P.Total
    FROM dbo.Pedidos P
    JOIN dbo.Usuarios U ON U.Id = P.IdUsuario
    JOIN dbo.Estatus E ON E.Id = P.IdStatus
    WHERE P.IdPedido = @Id
)
GO
