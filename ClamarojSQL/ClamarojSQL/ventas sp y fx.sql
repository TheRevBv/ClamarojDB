use Clamaroj
GO

GO
CREATE FUNCTION dbo.fxGetVentas()
RETURNS TABLE
AS
RETURN
(
	SELECT 
	V.Id as id,
	Fecha as fecha,
	CONCAT(U.Nombre,' ',U.Apellido) as usuarioNombre,
	IdPedido as idPedido,
	Total as total
	FROM dbo.Ventas	V
	LEFT JOIN dbo.Clientes C
		ON C.IdCliente = V.IdCliente
	JOIN dbo.Usuarios U
		ON U.Id = C.IdUsuario
)


GO
CREATE FUNCTION dbo.fxGetVenta(
	@Id int
)
RETURNS TABLE
AS
RETURN
(
	SELECT 
	Id as id,
	Fecha as fecha,
	IdCliente as idCliente,
	IdPedido as idPedido,
	Total as total
	FROM dbo.Ventas
	WHERE Id = @Id
)

GO

CREATE PROCEDURE dbo.VentasUPD
	@Id int out,
	@IdPedido int,
	@Fecha DATETIME,
	@IdCliente int,
	@Total decimal(18,4)
AS
BEGIN
    SET NOCOUNT ON

	IF EXISTS(SELECT * FROM dbo.Ventas WHERE Id = @Id)
    BEGIN
        UPDATE dbo.Ventas
        SET IdPedido = @IdPedido,
            Fecha = @Fecha,
			IdCliente = @IdCliente,
            Total = @Total
        WHERE Id = @Id
    END
    ELSE
    BEGIN
        INSERT INTO dbo.Ventas(IdPedido,IdCliente, Fecha, Total)
        VALUES (@IdPedido, @IdCliente, @Fecha, @Total)

        SET @Id = SCOPE_IDENTITY()
    END
END


GO

CREATE PROCEDURE dbo.VentasDEL
	@Id int
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM dbo.Ventas WHERE Id = @Id

END

