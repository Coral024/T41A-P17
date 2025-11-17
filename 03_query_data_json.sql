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

--Implementar pruebas unitarias
DO $$
BEGIN
  IF EXISTS (
    SELECT 1 FROM productos_jsonb WHERE id = 1 AND data->>'nombre' = 'television'
  ) THEN
    RAISE NOTICE 'OK: nombre correcto para id 1';
  ELSE
    RAISE EXCEPTION 'Fallo: nombre incorrecto para id 1';
  END IF;

  IF EXISTS (
    SELECT 1 FROM productos_jsonb WHERE id = 1 AND data->>'color' = 'azul'
  ) THEN
    RAISE NOTICE 'OK: usuario color rojo para id 1';
  ELSE
    RAISE EXCEPTION 'Fallo: color usuario no es rojo para id 1';
  END IF;
END;
$$;


























