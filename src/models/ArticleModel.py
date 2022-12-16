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
