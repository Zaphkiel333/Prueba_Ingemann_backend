from flask import Blueprint, request

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


@main.route('/add', methods=['POST'])
def add_article():
    try:
        codigo = request.json['codigo']
        descripcion = request.json['descripcion']
        precio = request.json['precio']
        is_active = request.json['is_active']

        cost = ((precio * 15) / 100) * precio
        request.json['costo'] = cost

        affected_rows = ArticleModel.add_article(request.json)
        if affected_rows > 0:
            return {"Inserted": request.json['codigo']}, 200

        return {'error': 'no rows affected'}, 400
    except Exception as ex:
        return {'error': str(ex)}, 500
