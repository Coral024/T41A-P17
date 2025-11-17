DO $$
BEGIN
  IF EXISTS (
    SELECT 1 FROM usuarios WHERE id = 1 AND data->>'nombre' = 'Ana'
  ) THEN
    RAISE NOTICE 'OK: nombre correcto para id 1';
  ELSE
    RAISE EXCEPTION 'Fallo: nombre incorrecto para id 1';
  END IF;

  IF EXISTS (
    SELECT 1 FROM usuarios WHERE id = 1 AND data->>'activo' = 'true'
  ) THEN
    RAISE NOTICE 'OK: usuario activo para id 1';
  ELSE
    RAISE EXCEPTION 'Fallo: usuario no está activo para id 1';
  END IF;

  IF EXISTS (
    SELECT 1 FROM usuarios WHERE id = 2 AND data->>'edad' = '25'
  ) THEN
    RAISE NOTICE 'OK: edad correcta para id 2';
  ELSE
    RAISE EXCEPTION 'Fallo: edad incorrecta para id 2';
  END IF;
END;
$$;

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
