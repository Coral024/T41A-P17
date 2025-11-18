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


def test_productos_hstore_final():
    result_peso = run_query("SELECT atributos -> 'peso' FROM productos_hstore WHERE nombre = 'Licuadora';")
    assert result_peso[0][0] == '1kg'
    
    result_color_telefono = run_query("SELECT COUNT(*) FROM productos_hstore WHERE nombre = 'Teléfono' AND atributos ? 'color';")
    assert result_color_telefono[0][0] == 0
    
    result_rojo = run_query("SELECT nombre FROM productos_hstore WHERE atributos -> 'color' = 'rojo';")
    expected_rojo = {'Licuadora'}
    actual_rojo = {row[0] for row in result_rojo}
    assert actual_rojo == expected_rojo

    result_conteo_color = run_query("SELECT COUNT(*) FROM productos_hstore WHERE atributos ? 'color';")
    assert result_conteo_color[0][0] == 4

    result_agregacion = run_query("""
        SELECT (atributos -> 'marca') AS marca, COUNT(*) AS total
        FROM productos_hstore
        WHERE atributos ? 'marca' 
        GROUP BY 1
        ORDER BY 1 DESC;
    """)
    
    actual_agregacion = {row[0]: row[1] for row in result_agregacion}
    expected_agregacion = {'Samsung': 2, 'Ekco': 1, 'Dell': 1}
    
    assert actual_agregacion == expected_agregacion



