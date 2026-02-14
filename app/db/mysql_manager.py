import pymysql
from config import MYSQL_HOST, MYSQL_PORT, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DATABASE


class DatabaseError(Exception):
    """Custom exception for database errors with user-friendly messages"""
    pass


def get_connection():
    return pymysql.connect(
        host=MYSQL_HOST,
        port=MYSQL_PORT,
        user=MYSQL_USER,
        password=MYSQL_PASSWORD,
        database=MYSQL_DATABASE,
        cursorclass=pymysql.cursors.DictCursor
    )


def call_proc(proc_name, args=None):
    conn = get_connection()
    try:
        with conn.cursor() as cursor:
            cursor.callproc(proc_name, args or [])
            results = cursor.fetchall()

            if not results:
                cursor.nextset()
                results = cursor.fetchall()

        conn.commit()
        return results
    except pymysql.err.OperationalError as e:
        error_msg = str(e.args[1]) if len(e.args) > 1 else str(e)
        raise DatabaseError(error_msg)
    except pymysql.err.IntegrityError as e:
        error_msg = str(e.args[1]) if len(e.args) > 1 else str(e)
        raise DatabaseError(error_msg)
    finally:
        conn.close()


def execute_query(query, args=None):
    conn = get_connection()
    try:
        with conn.cursor() as cursor:
            cursor.execute(query, args or [])
            results = cursor.fetchall()
        conn.commit()
        return results
    except pymysql.err.OperationalError as e:
        error_msg = str(e.args[1]) if len(e.args) > 1 else str(e)
        raise DatabaseError(error_msg)
    except pymysql.err.IntegrityError as e:
        error_msg = str(e.args[1]) if len(e.args) > 1 else str(e)
        raise DatabaseError(error_msg)
    finally:
        conn.close()