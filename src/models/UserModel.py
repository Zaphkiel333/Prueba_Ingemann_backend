from src.database.db import get_connection
from src.models.entities.User import User


class UserModel:
    @classmethod
    def get_users(self):
        connection = None

        try:
            connection = get_connection()
            users = []

            with connection.cursor() as cursor:
                query = """SELECT *
                            FROM cliente"""
                cursor.execute(query)
                result = cursor.fetchall()

                for row in result:
                    user = User(row[0], row[1], row[2])
                    users.append(user.to_JSON())
            return users
        except Exception as ex:
            raise Exception(ex)
        finally:
            connection.close()