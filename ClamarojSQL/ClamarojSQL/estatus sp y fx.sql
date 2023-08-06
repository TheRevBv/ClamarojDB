USE Clamaroj
GO
    SELECT Id as IdEstatus, Nombre
    FROM dbo.Estatus
GO
CREATE PROCEDURE dbo.EstatusUPD
    @Id int,
    @Nombre varchar(50)
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS(SELECT * FROM dbo.Estatus WHERE Id = @Id)
    BEGIN
        UPDATE dbo.Estatus
        SET Nombre = @Nombre
        WHERE Id = @Id
    END
    ELSE
    BEGIN
        INSERT INTO dbo.Estatus(Nombre)
        VALUES(@Nombre)    
    END
END

GO
CREATE PROCEDURE dbo.EstatusDEL
    @Id int
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM dbo.Estatus WHERE Id = @Id
END

GO
CREATE FUNCTION dbo.fxGetEstatuses()
RETURNS TABLE
AS
RETURN
(
    SELECT Id as IdEstatus, Nombre
    FROM dbo.Estatus
)

GO
CREATE FUNCTION dbo.fxGetEstatus
(
    @Id int
)
RETURNS TABLE
AS
RETURN
(
    SELECT Id as IdEstatus, Nombre
    FROM dbo.Estatus WHERE Id = @Id
)
GO
