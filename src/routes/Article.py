from flask import Blueprint

from src.models.ArticleModel import ArticleModel

main = Blueprint('article_blueprint', __name__)


@main.route('/')
def get_articles():
    try:
        articles = ArticleModel.get_articles()
        return articles
    except Exception as ex:
        return {'error': str(ex)}, 500


@main.route('/<codigo>')
def get_article(codigo):
    try:
        article = ArticleModel.get_article(codigo)
        if article is not None:
            return article
        else:
            return {}, 404
    except Exception as ex:
        return {'error': str(ex)}, 500
