USE Clamaroj
GO
SELECT * FROM dbo.Pedidos
select * from dbo.DetallePedidos
SELECT * FROM dbo.Compras
SELECT * FROM dbo.Ventas
GO
-- Procedimiento almacenado para insertar o actualizar un pedido
CREATE PROCEDURE dbo.PedidosUPD
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
	--,
	--@IdsProductos
AS
BEGIN
    SET NOCOUNT ON;
	DECLARE @IdIns INT, @IdProveedor int, @IdCliente int 
	SET @Total = 0

	DELETE FROM dbo.DetallePedidos WHERE IdPedido = @Id AND Fecha = @Fecha

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

		IF @TipoPedido = 'C'
		BEGIN
			SELECT @IdProveedor = IdProveedor FROM dbo.Proveedores WHERE IdUsuario = @IdUsuario
			SET @IdProveedor = ISNULL(@IdProveedor, @IdUsuario)

			SELECT @IdIns = Id FROM dbo.Compras WHERE IdPedido = @Id

			EXEC dbo.ComprasUPD @IdIns,@Id,@Fecha,@IdProveedor, @Total
		END
		IF @TipoPedido = 'V'
		BEGIN
			SELECT @IdCliente = IdCliente FROM dbo.Clientes WHERE IdUsuario = @IdUsuario
			SET @IdCliente = ISNULL(@IdCliente, @IdUsuario)

			SELECT @IdIns = Id FROM dbo.Ventas WHERE IdPedido = @Id

			EXEC dbo.VentasUPD @IdIns, @Id, @Fecha, @IdCliente, @Total
		END
    END
    ELSE
    BEGIN
		SET @Id = (SELECT ISNULL(MAX(IdPedido),0) FROM Pedidos) + 1

        INSERT INTO dbo.Pedidos(IdPedido,IdUsuario, IdStatus, Fecha, FechaEntrega, Domicilio, Telefono, RazonSocial, Rfc, TipoPago, TipoEnvio, TipoPedido, Total)
        VALUES (@Id,@IdUsuario, @IdStatus, @Fecha, @FechaEntrega, @Domicilio, @Telefono, @RazonSocial, @Rfc, @TipoPago, @TipoEnvio, @TipoPedido, @Total)

        --SET @Id = SCOPE_IDENTITY()	
		SET @IdIns = 0

		IF @TipoPedido = 'C'
		BEGIN
			SELECT @IdProveedor = IdProveedor FROM dbo.Proveedores WHERE IdUsuario = @IdUsuario
			SET @IdProveedor = ISNULL(@IdProveedor, @IdUsuario)

			EXEC dbo.ComprasUPD @IdIns,@Id,@Fecha,@IdProveedor, @Total
		END
		IF @TipoPedido = 'V'
		BEGIN
			SELECT @IdCliente = IdCliente FROM dbo.Clientes WHERE IdUsuario = @IdUsuario
			SET @IdCliente = ISNULL(@IdCliente, @IdUsuario)

			EXEC dbo.VentasUPD @IdIns, @Id, @Fecha, @IdCliente, @Total
		END
    END
	--EXEC dbo.DetallePedidosUPD @Id,@Id
END

GO

-- Procedimiento almacenado para eliminar un pedido por su ID
CREATE PROCEDURE dbo.PedidosDEL
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
           P.Fecha AS fecha, 
		   P.FechaEntrega as fechaEntrega,
           P.Domicilio as domicilio, 
		   P.Telefono as telefono,
           P.RazonSocial as razonSocial, 
		   P.Rfc as rfc,
           P.TipoPago as tipoPago, 
		   P.TipoEnvio as tipoEnvio, 
		   P.TipoPedido as tipoPedido,
           P.Total as total
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
           P.Total as total
    FROM dbo.Pedidos P
    --JOIN dbo.Usuarios U ON U.Id = P.IdUsuario
    --JOIN dbo.Estatus E ON E.Id = P.IdStatus
    WHERE P.IdPedido = @Id
)
GO
---Para correcciones en llaves primaria identity 1,1
/*
DROP TABLE DetallePedidos
drop table Ventas
drop table Compras
DROP TABLE Pedidos

CREATE TABLE Pedidos (
    IdPedido INT NOT NULL,
    IdUsuario INT NOT NULL,
    IdStatus INT NOT NULL,
    Fecha DATETIME NOT NULL,
    FechaEntrega DATETIME NOT NULL,
    Domicilio NVARCHAR(45) NOT NULL,
    Telefono NVARCHAR(10) NOT NULL,
    RazonSocial NVARCHAR(45),
    Rfc NVARCHAR(13),
    TipoPago NCHAR(4) NOT NULL,
    TipoEnvio NCHAR(4) NOT NULL,
    TipoPedido NCHAR(4) NOT NULL,
    Total DECIMAL(18, 4) NOT NULL,
	PRIMARY KEY (IdPedido,Fecha),
    FOREIGN KEY (IdUsuario) REFERENCES Usuarios(Id),
    FOREIGN KEY (IdStatus) REFERENCES Estatus(Id)
);

CREATE TABLE Ventas (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Fecha DATETIME NOT NULL,
    IdCliente INT NOT NULL,
    IdPedido INT NOT NULL,
    Total DECIMAL(18, 4) NOT NULL,
    FOREIGN KEY (IdCliente) REFERENCES Clientes(IdCliente),
    FOREIGN KEY (IdPedido, Fecha) REFERENCES Pedidos(IdPedido,Fecha)
);

CREATE TABLE Compras (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Fecha DATETIME NOT NULL,
    IdProveedor INT NOT NULL,
    IdPedido INT NOT NULL,
    Total DECIMAL(18, 4) NOT NULL,
    FOREIGN KEY (IdProveedor) REFERENCES Proveedores(IdProveedor),
    FOREIGN KEY (IdPedido, Fecha) REFERENCES Pedidos(IdPedido,Fecha)
);

CREATE TABLE DetallePedidos (
    IdDetallePedido INT PRIMARY KEY IDENTITY(1,1),
    IdPedido INT NOT NULL,
    Fecha DATETIME NOT NULL,
    IdProducto INT NOT NULL,
    Cantidad DECIMAL(18, 4) NOT NULL,
    PrecioUnitario DECIMAL(18, 4) NOT NULL,
    Subtotal DECIMAL(18, 4) NOT NULL,
    FOREIGN KEY (IdPedido, Fecha) REFERENCES Pedidos(IdPedido,Fecha),
    FOREIGN KEY (IdProducto) REFERENCES Productos(IdProducto)
);

*/
--Pruebas UPDS

/*

EXEC dbo.PedidosUPD
@Id = 1,
@IdUsuario = 1,
@IdStatus = 5,
@Fecha = '20230701',
@FechaEntrega = '20230707',
@Domicilio = 'Villa los ANGELES',
@Telefono = '4771234567',
@RazonSocial = '',
@Rfc = '',
@TipoPago = 'E',
@TipoEnvio = 'D',
@TipoPedido = 'C',
@Total = 0

EXEC dbo.DetallesPedidosUPD
@Id = 0,
@Fecha = '20230701',
@IdPedido  = 2,
@IdProducto = 1,
@Cantidad = 11,
@PrecioUnitario = 22,
@Subtotal = 242

SELECT * FROM dbo.Pedidos
select * from dbo.DetallePedidos

ALTER TABLE dbo.DetallePedidos
DROP CONSTRAINT FK_DetallePedidos_Productos_IdProducto;

*/


/*
The INSERT statement conflicted with the FOREIGN KEY constraint "FK__DetallePe__IdPed__607251E5". 
The conflict occurred in database "Clamaroj", table "dbo.Pedidos", column 'IdPedido'.
The statement has been terminated.


Excepción no controlada del tipo 'System.Exception' en System.Private.CoreLib.dll
The INSERT statement conflicted with the FOREIGN KEY constraint "FK__DetallePe__IdPed__607251E5". The conflict occurred in database "Clamaroj", table "dbo.Pedidos", column 'IdPedido'.
The statement has been terminated.

Excepción no controlada del tipo 'System.Exception' en System.Private.CoreLib.dll
The INSERT statement conflicted with the FOREIGN KEY constraint "FK__DetallePe__IdPed__607251E5". The conflict occurred in database "Clamaroj", table "dbo.Pedidos", column 'IdPedido'.
The statement has been terminated.

Excepción producida: 'Microsoft.Data.SqlClient.SqlException' en Microsoft.Data.SqlClient.dll
El programa '[17720] ClamarojBack.exe' terminó con código 0 (0x0).

*/