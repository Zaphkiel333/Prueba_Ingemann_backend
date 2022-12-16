from .entities.Article import Article
from ..database.db import get_connection


class ArticleModel():
    @classmethod
    def get_article(self):

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
