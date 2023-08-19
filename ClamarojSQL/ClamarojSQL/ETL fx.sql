use Clamaroj
go

CREATE FUNCTION GetProductosVendidos()
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM productosVendidos
);

GO
GO
create FUNCTION FiltrarVentasPorMesYFecha
(
    @mes int,
    @anio varchar(50)
)
RETURNS TABLE
AS
RETURN
(
    select producto, cantProductos from productosVendidos where mes=@mes and anio=@anio
);
GO

GO
create FUNCTION GetSumVentas
(
    @mes int,
    @anio varchar(50)
)
RETURNS TABLE
AS
RETURN
(
    select suma from sumVentas where mes=@mes and anio=@anio
);
GO

GO
create FUNCTION GetGanancias
(
    @mes int,
    @anio varchar(50)
)
RETURNS TABLE
AS
RETURN
(
    select ganancia from ganancias where mes=@mes and anio=@anio
);
GO

GO
create FUNCTION GetTopClientes
(
    @mes int,
    @anio varchar(50)
)
RETURNS TABLE
AS
RETURN
(
    select Cliente, pedidos from topClientes where mes=@mes and anio=@anio
);
GO