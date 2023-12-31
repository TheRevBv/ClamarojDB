USE [Clamaroj]
GO
/****** Object:  UserDefinedFunction [dbo].[fxGetMateriasPrimas]    Script Date: 24/08/2023 02:02:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fxGetMateriasPrimas]()
RETURNS TABLE
AS
RETURN
(
		SELECT Id as id, 
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
  --  SELECT 
		--MP.Id as id, 
		--MP.Codigo as codigo, 
		--MP.Nombre as nombre, 
		--P.RazonSocial as razonSocial,
		--S.Nombre as estatus,
		--MP.Descripcion as descripcion,
		--MP.Stock as stock,
		--MP.Precio as precio,
		--MP.Foto as foto,
		--0 as cantidad
  --  FROM dbo.MateriasPrimas as MP
  --  JOIN dbo.Proveedores as P
		--ON MP.IdProveedor = P.IdProveedor
  --  JOIN dbo.Estatus as S
		--ON MP.IdStatus = S.Id
)
