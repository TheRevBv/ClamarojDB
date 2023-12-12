USE [Clamaroj]
GO
/** Object:  UserDefinedFunction [dbo].[fxGetPedidosByUsuario]    Script Date: 09/12/2023 01:11:46 a. m. **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[fxGetPedidosByUsuario](@Id int)
RETURNS TABLE
AS
RETURN
(
   SELECT distinct P.IdPedido AS idPedido, 
           P.IdUsuario AS idUsuario,
           P.IdStatus as idStatus,
           P.Fecha as fecha, 
           P.FechaEntrega as fechaEntrega,
           P.Domicilio as domicilio, 
           P.Telefono as telefono,
           P.RazonSocial as razonSocial, 
           P.Rfc as rfc,
           TRIM(P.TipoPago) as tipoPago, 
           TRIM(P.TipoEnvio) as tipoEnvio, 
           TRIM(P.TipoPedido) as tipoPedido,
           P.Total as total,
		   E.Nombre as estatus,
		   DP.IdProducto,
		   pr.Nombre,
		   DP.Cantidad,
		   DP.PrecioUnitario,
		   DP.Subtotal
    FROM dbo.Pedidos P
    --JOIN dbo.Usuarios U ON U.Id = P.IdUsuario
    JOIN dbo.Estatus E ON E.Id = P.IdStatus
	inner join DetallePedidos DP ON DP.IdPedido=P.IdPedido
	inner join Productos PR on PR.IdProducto= DP.IdProducto
    WHERE P.IdUsuario = @Id
	--AND P.TipoPedido = 'C'
)