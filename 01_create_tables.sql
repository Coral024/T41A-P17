CREATE EXTENSION IF NOT EXISTS hstore;

CREATE TABLE usuarios (
  id SERIAL PRIMARY KEY,
  data JSONB
);

CREATE TABLE productos_jsonb(
  id SERIAL PRIMARY KEY,
  data JSONB
);

--Crear una tabla con columna HSTORE
--Define una tabla productos con atributos como marca, color, peso.
CREATE TABLE productos_hstore (
  id SERIAL PRIMARY KEY,
  nombre TEXT,
  precio NUMERIC,
  atributos HSTORE
);
