--Indexar la columna HSTORE con GIN
--Crea un índice para mejorar el rendimiento de búsquedas por clave.
CREATE INDEX idx_productos_hstore_gin ON productos_hstore USING GIN (atributos);

--Usar funciones agregadas con HSTORE
--Agrupa productos por marca y cuenta cuántos hay por cada una.
SELECT atributos -> 'marca' AS marca, COUNT(*) AS total_productos
FROM productos_hstore
WHERE atributos ? 'marca' 
GROUP BY 1
ORDER BY 2 DESC;

--Convertir HSTORE a JSON y viceversa
--Practica con hstore_to_json() y json_to_hstore() si tienes datos mixtos.
SELECT nombre, hstore_to_json(atributos) AS atributos_json
FROM productos_hstore;

--Validar existencia de múltiples claves
--Usa ?& para verificar si un producto tiene tanto color como peso.
SELECT nombre, atributos
FROM productos_hstore
WHERE atributos ?& ARRAY['color', 'peso'];

--Crear una función que reciba un HSTORE y devuelva un resumen
--Por ejemplo, una función que devuelva "Producto X: marca=Y, color=Z".
-- Función que devuelva "Producto X: marca=Y, color=Z".
CREATE OR REPLACE FUNCTION generar_resumen_producto(
    p_nombre TEXT,
    p_atributos HSTORE
)
RETURNS TEXT AS $$
DECLARE
    v_resumen TEXT := p_nombre || ': ';
    v_clave TEXT;
    v_valor TEXT;
BEGIN
    FOR v_clave, v_valor IN SELECT * FROM EACH(p_atributos)
    LOOP
        v_resumen := v_resumen || v_clave || '=' || v_valor || ', ';
    END LOOP;
    RETURN TRIM(TRAILING ', ' FROM v_resumen);
END;
$$ LANGUAGE plpgsql IMMUTABLE;

SELECT generar_resumen_producto(nombre, atributos) AS resumen
FROM productos_hstore;
