CREATE PROCEDURE ActualizarPedido
    @IdPedido INT
AS
BEGIN
    -- Actualizamos el pedido
    UPDATE Pedidos
    SET IdStatus = 4
    WHERE IdPedido = @IdPedido;

    PRINT 'Pedido actualizado.';

    -- Obtenemos los IdProducto del pedido
    DECLARE @IdProducto INT;

    DECLARE ProductosCursor CURSOR FOR
    SELECT IdProducto
    FROM DetallePedidos
    WHERE IdPedido = @IdPedido;

    OPEN ProductosCursor;
    FETCH NEXT FROM ProductosCursor INTO @IdProducto;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Imprimimos el IdProducto
        PRINT 'IdProducto: ' + CAST(@IdProducto AS VARCHAR);

        -- Obtenemos el IdReceta relacionado con el IdProducto
        DECLARE @IdReceta INT;
        SELECT @IdReceta = IdReceta FROM Recetas WHERE IdProducto = @IdProducto;

        -- Imprimimos el IdReceta
        PRINT 'IdReceta: ' + CAST(@IdReceta AS VARCHAR);

      

        -- Actualizamos las materias primas
        UPDATE MateriasPrimas
        SET Stock = Stock - I.Cantidad
        FROM Ingrediente I
        WHERE I.IdReceta = @IdReceta
          AND MateriasPrimas.Id = I.IdMateriaPrima;

        PRINT 'Stock de materias primas actualizado.';

        -- Obtenemos información adicional si es necesario
        SELECT Cantidad, IdMateriaPrima
        FROM Ingrediente
        WHERE IdReceta = @IdReceta;

        FETCH NEXT FROM ProductosCursor INTO @IdProducto;
    END

    CLOSE ProductosCursor;
    DEALLOCATE ProductosCursor;

    -- Imprimimos mensaje final
    PRINT 'Proceso completado para el pedido ' + CAST(@IdPedido AS VARCHAR);
END;