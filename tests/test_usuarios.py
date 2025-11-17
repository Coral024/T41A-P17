import psycopg2
import pytest

DB_CONFIG = {
    "dbname": "test_db",
    "user": "postgres",
    "password": "postgres",
    "host": "localhost",
    "port": 5432
}

def run_query(query):
    with psycopg2.connect(**DB_CONFIG) as conn:
        with conn.cursor() as cur:
            cur.execute(query)
            return cur.fetchall()

def test_nombre_ana():
    result = run_query("SELECT data->>'nombre' FROM usuarios WHERE id = 1;")
    print(f'resultado del query: {result}')
    assert result[0][0] == "Ana"

def test_usuario_activo():
    result = run_query("SELECT data->>'activo' FROM usuarios WHERE id = 1;")
    assert result[0][0] == "true"

def test_edad_juan():
    result = run_query("SELECT data->>'edad' FROM usuarios WHERE id = 2;")
    assert result[0][0] == "25"

def test_color_rojo():
    result = run_query("SELECT data->>'nombre' FROM productos_jsonb WHERE data->>'color' = 'rojo';")
    assert result[0][0] == "telefono"
    assert result[0][1] == "libreta"
    
def test_categoria_jsonb():
    with db_connection.cursor() as cur:
        cur.execute("SELECT * FROM productos_jsonb WHERE data @> '{"categoria": "tecnologia"}';")
        result = cur.fetchall()
    assert len(result) == 2

def test_basico():
    result= run_query("SELECT nombre FROM productos_hstore WHERE atributos -> 'color' = 'rojo';")
    assert result[0][0] == "Teléfono"
    assert result[0][1] == "Licuadora"
    result2 = run_query("SELECT atributos -> 'Peso' AS Peso FROM productos_hstore WHERE id=4;")
    assert result2[0][0]='1kg'

