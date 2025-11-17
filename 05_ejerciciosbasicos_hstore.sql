--Consultar por una clave específica
--Encuentra todos los productos cuyo atributo color sea "rojo".
SELECT nombre
FROM productos_hstore
WHERE atributos -> 'color' = 'rojo';

--Actualizar un valor dentro del HSTORE
--Cambia el valor de peso para un producto específico.
UPDATE productos_hstore
SET atributos = atributos || 'peso => 1kg'
WHERE nombre = 'Licuadora';

--Eliminar una clave de un registro
--Elimina el atributo color de un producto.
UPDATE productos_hstore
SET atributos = delete(atributos, 'color')
WHERE nombre = 'Teléfono';

SELECT skeys(atributos) AS clave, svals(atributos) AS valor
FROM productos_hstore;
