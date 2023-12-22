WITH PedidosConNumeracion AS (
    SELECT P.IdPedido, P.Fecha,
           ROW_NUMBER() OVER (ORDER BY P.IdPedido) as rn_pedido
    FROM Pedidos P
     LEFT JOIN DetallePedidos DP ON P.IdPedido = DP.IdPedido AND P.Fecha = DP.Fecha
     WHERE DP.IdPedido IS NULL  -- Si no necesitas unir con DetallePedidos, comenta estas líneas
),

ProductosConNumeracion AS (
    SELECT TOP 
	20 M.Id as IdProducto, M.Precio, M.Stock as Cantidad,ROW_NUMBER() OVER (ORDER BY M.Id ASC) as rn_producto
    FROM MateriasPrimas M
)

INSERT INTO dbo.DetallePedidos(IdPedido, Fecha, IdProducto, PrecioUnitario, Cantidad, Subtotal)
SELECT PCN.IdPedido, PCN.Fecha, PCN.IdProducto, PCN.Precio, PCN.Cantidad, PCN.Precio * PCN.Cantidad as subtotal
FROM (
    SELECT P.IdPedido, P.Fecha, M.IdProducto, M.Precio, M.Cantidad
    FROM PedidosConNumeracion P
    JOIN ProductosConNumeracion M
    ON P.rn_pedido = M.rn_producto
) PCN
order by 1
--WHERE PCN.rn_pedido_producto = 1


