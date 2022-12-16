import psycopg2
from psycopg2 import DatabaseError
from decouple import config


def get_connection():
    try:
        return psycopg2.connect(
            user=config('DB_USER'),
            password=config('DB_PASSWORD'),
            database=config('DB_DATABASE_NAME'),
            host=config('DB_HOST'),
            port=config('DB_PORT')
        )
    except DatabaseError as ex:
        raise ex