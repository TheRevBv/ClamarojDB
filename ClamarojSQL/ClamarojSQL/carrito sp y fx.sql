USE [Clamaroj]
GO
/****** Object:  UserDefinedFunction [dbo].[fxGetCarritoProductos]    Script Date: 18/08/2023 09:56:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fxGetCarritoProductos](@IdCliente int)
RETURNS TABLE
AS
RETURN
(
	SELECT 
	T1.IdCarrito as idCarrito,
	T1.Cantidad as cantidad,
	T1.IdCliente as idCliente,
	T1.IdProducto as idProducto,
	T1.FechaModificacion as fechaModificacion,
	T1.FechaRegistro as fechaRegistro,
	T2.Foto as foto , 
	T2.Codigo as codigo, 
	T2.Nombre as nombre, 
	T2.Descripcion as descripcion, 
	T2.Precio as precio
	FROM [Clamaroj].[dbo].[Carritos] T1
	INNER JOIN [Clamaroj].[dbo].[Productos] T2 ON T1.IdProducto = T2.IdProducto  
	WHERE T1.IdCliente = @IdCliente
)


GO

CREATE PROCEDURE dbo.CarritoUPD
    @IdCarrito int out,
    @IdCliente int,
    @IdProducto int,
    @Cantidad int
AS
BEGIN
	DELETE FROM dbo.Carritos where IdCliente = @IdCliente and IdProducto = @IdProducto
	--IF EXISTS (SELECT IdCarrito FROM Carritos WHERE IdCarrito = @IdCarrito and IdCliente = @IdCliente and IdProducto = @IdProducto)
	--BEGIN
	--	UPDATE dbo.Carritos
	--	SET Cantidad = @Cantidad 
	--	, FechaModificacion = GETDATE()
	--	WHERE IdCarrito = @IdCarrito
	--END
	--ELSE BEGIN
		INSERT INTO dbo.Carritos(IdCliente, IdProducto, Cantidad, FechaRegistro, FechaModificacion)
		VALUES(@IdCliente, @IdProducto, @Cantidad, GETDATE(), GETDATE())
	--END
END

GO