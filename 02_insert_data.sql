INSERT INTO usuarios (data)
VALUES 
  ('{"nombre": "Ana", "activo": true, "edad": 30}'),
  ('{"nombre": "Juan", "activo": false, "edad": 25}');

INSERT INTO productos_jsonb (data)
VALUES 
  ('{"nombre": "television", "color": "azul", "tamaño": "grande", "categoria":"tecnologia"}'),
  ('{"nombre": "telefono", "color": "rojo", "tamaño": "mediano", "categoria":"tecnologia"}'),
  ('{"nombre": "libreta", "color": "rojo", "tamaño": "grande", "categoria":"papeleria"}'),
  ('{"nombre": "lapicero", "color": "negro", "tamaño": "pequeño", "categoria":"papeleria"}'),
  ('{"nombre": "pan", "color": "cafe", "tamaño": "pequeño", "categoria":"panaderia"}');

--Inserta al menos 5 productos con diferentes combinaciones de atributos.
INSERT INTO productos_hstore (nombre,precio, atributos)
VALUES 
  ('Laptop', 12500,'marca => Dell, color => negro, tamaño=> mediano, peso=>2kg'),
  ('Teléfono',9000, 'marca => Samsung, color => rojo, tamaño=> pequeño,peso=>200g'),
  ('Television', 22000, 'marca => Samsung, color => gris, tamaño=> grande, peso=>14kg'),
  ('Licuadora', 1445,'color => rojo, tamaño=> pequeño,peso=>0.74kg'),
  ('Cacerola',1200, 'marca => Ekco, color => roja, tamaño=> pequeño, peso=>2.5L');

