--Filtrar registros que contienen una clave
--Usa el operador ? para encontrar productos que tengan el atributo marca.
SELECT nombre, atributos
FROM productos_hstore
WHERE atributos ? 'marca';

--Combinar HSTORE con otras columnas
--Consulta productos que tengan marca = 'Sony' y precio > 500.
SELECT nombre, precio, atributos
FROM productos_hstore
WHERE (atributos -> 'marca') = 'Samsung' AND precio > 500;

--Extraer todas las claves y valores
--Usa skeys() y svals() para listar todos los atributos de cada producto.
SELECT nombre, skeys(atributos) AS claves, svals(atributos) AS valores
FROM productos_hstore;

--Contar cuántos productos tienen un atributo específico
--¿Cuántos productos tienen el atributo color?
SELECT COUNT(*) AS total_con_color
FROM productos_hstore
WHERE atributos ? 'color';
