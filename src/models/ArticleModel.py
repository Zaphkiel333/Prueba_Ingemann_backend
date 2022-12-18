from .entities.Article import Article
from ..database.db import get_connection


class ArticleModel:
    @classmethod
    def get_articles(self):

        connection = None

        try:
            connection = get_connection()
            articles = []

            with connection.cursor() as cursor:
                query = """SELECT *
                            FROM articulo"""
                cursor.execute(query)
                result = cursor.fetchall()

                for row in result:
                    article = Article(row[0], row[1], row[2], row[3], row[4], row[5])
                    articles.append(article.to_JSON())
            return articles
        except Exception as ex:
            raise Exception(ex)
        finally:
            connection.close()

    @classmethod
    def get_article(self, codigo):
        connection = None

        try:
            connection = get_connection()

            with connection.cursor() as cursor:
                query = """SELECT *
                            FROM articulo
                            WHERE codigo = %s"""
                cursor.execute(query, (codigo,))
                row = cursor.fetchone()

                article = None
                if row is not None:
                    article = Article(row[0], row[1], row[2], row[3], row[4], row[5])
                    article = article.to_JSON()

            return article
        except Exception as ex:
            raise Exception(ex)
        finally:
            connection.close()

    @classmethod
    def add_article(self, request):

        connection = None

        try:
            connection = get_connection()

            articles = request.get('articles')

            with connection.cursor() as cursor:
                query = """INSERT INTO factura
                                (codigo, id_cliente, fecha)
                            VALUES
                                (%(codigo)s, %(cliente)s, %(fecha)s)
                            RETURNING id"""
                cursor.execute(query, request)
                id_factura = cursor.fetchone()[0]

                query = """ INSERT INTO detalle_factura
                                (id_factura, id_articulo, cantidad)
                            VALUES"""
                for i in range(0, len(articles)):
                    article = articles[i]
                    query += f"({id_factura}, {article.get('id_articulo')}, {article.get('cantidad')}),"

                cursor.execute(query[:-1])
                row_affected = cursor.rowcount

                connection.commit()

            return row_affected
        except Exception as ex:
            raise Exception(ex)
        finally:
            connection.close()
