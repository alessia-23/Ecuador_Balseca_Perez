import os
import time
from flask import Flask, jsonify, render_template
import mysql.connector
from mysql.connector import Error

app = Flask(__name__)

DB_HOST = os.getenv("DB_HOST", "mysql_db")
DB_USER = os.getenv("DB_USER", "root")
DB_PASSWORD = os.getenv("DB_PASSWORD", "root")
DB_NAME = os.getenv("DB_NAME", "ecuador_db")
SERVER_NAME = os.getenv("SERVER_NAME", "Servidor Flask")


def get_connection():
    return mysql.connector.connect(
        host=DB_HOST,
        user=DB_USER,
        password=DB_PASSWORD,
        database=DB_NAME
    )


def wait_for_database():
    retries = 20

    for attempt in range(retries):
        try:
            connection = get_connection()
            connection.close()
            print("Base de datos conectada correctamente")
            return
        except Error:
            print(f"Esperando base de datos... intento {attempt + 1}/{retries}")
            time.sleep(3)

    raise Exception("No se pudo conectar a la base de datos")


@app.route("/")
def index():
    return render_template("index.html", server_name=SERVER_NAME)


@app.route("/api/provincias")
def get_provincias():
    try:
        connection = get_connection()
        cursor = connection.cursor(dictionary=True)

        cursor.execute("""
            SELECT 
                id,
                nombre,
                capital,
                area_km2,
                poblacion_estimada,
                latitud,
                longitud
            FROM provincias
            ORDER BY nombre ASC
        """)

        provincias = cursor.fetchall()

        cursor.close()
        connection.close()

        return jsonify({
            "servidor": SERVER_NAME,
            "total": len(provincias),
            "provincias": provincias
        })

    except Error as e:
        return jsonify({
            "error": "Error al consultar la base de datos",
            "detalle": str(e),
            "servidor": SERVER_NAME
        }), 500


@app.route("/api/provincias/<int:provincia_id>")
def get_provincia_by_id(provincia_id):
    try:
        connection = get_connection()
        cursor = connection.cursor(dictionary=True)

        cursor.execute("""
            SELECT 
                id,
                nombre,
                capital,
                area_km2,
                poblacion_estimada,
                latitud,
                longitud
            FROM provincias
            WHERE id = %s
        """, (provincia_id,))

        provincia = cursor.fetchone()

        cursor.close()
        connection.close()

        if provincia is None:
            return jsonify({
                "error": "Provincia no encontrada",
                "servidor": SERVER_NAME
            }), 404

        return jsonify({
            "servidor": SERVER_NAME,
            "provincia": provincia
        })

    except Error as e:
        return jsonify({
            "error": "Error al consultar la provincia",
            "detalle": str(e),
            "servidor": SERVER_NAME
        }), 500


@app.route("/health")
def health():
    return jsonify({
        "status": "OK",
        "servidor": SERVER_NAME
    })


if __name__ == "__main__":
    wait_for_database()
    app.run(host="0.0.0.0", port=5000, debug=True)