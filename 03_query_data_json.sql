SELECT data->>'nombre' AS nombre
FROM usuarios
WHERE data->>'activo' = 'true';

CREATE INDEX idx_data_gin ON usuarios USING GIN (data);

SELECT * FROM usuarios
WHERE data @> '{"activo": true}';

--EJERCICIOS RECOMENDADOS
--Consultar productos por color, tamaño o categoría.  
SELECT data->>'nombre' AS nombre, data->>'color' AS color
FROM productos_jsonb
WHERE data->>'color' = 'rojo';

--Crear índices GIN y medir el rendimiento.
CREATE INDEX idx_data_gin ON productos_jsonb USING GIN (data);

SELECT * FROM productos_jsonb
WHERE data @> '{"categoria": "tecnologia"}';




























