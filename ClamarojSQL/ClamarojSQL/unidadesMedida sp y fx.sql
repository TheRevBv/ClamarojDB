use Clamaroj
go
select * from dbo.UnidadesMedida
go

CREATE PROCEDURE dbo.UnidadesMedidaUPD
    @Id int,
    @Nombre varchar(50),
    @Descripcion varchar(120),
    @IdStatus int
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS(SELECT * FROM dbo.UnidadesMedida WHERE IdUnidadMedida = @Id)
    BEGIN
        UPDATE dbo.UnidadesMedida
        SET Nombre = @Nombre,
            Descripcion = @Descripcion,
            IdStatus = @IdStatus
        WHERE IdUnidadMedida = @Id
    END
    ELSE
    BEGIN
        INSERT INTO dbo.UnidadesMedida(Nombre,Descripcion,IdStatus)
        VALUES(@Nombre,@Descripcion,@IdStatus)
    END
END

GO
CREATE PROCEDURE dbo.UnidadesMedidaDEL
    @Id int
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM dbo.UnidadesMedida WHERE IdUnidadMedida = @Id
END

GO
CREATE FUNCTION dbo.fxGetUnidadesMedida()
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM dbo.UnidadesMedida
)

GO
CREATE FUNCTION dbo.fxGetUnidadMedida
(
    @Id int
)
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM dbo.UnidadesMedida WHERE IdUnidadMedida = @Id
)
GO
-- TRUNCATE TABLE dbo.UnidadesMedida

