from flask import Blueprint, jsonify

from src.models.ArticleModel import ArticleModel

main = Blueprint('article_blueprint', __name__)


@main.route('/')
def get_article():
    try:
        articles = ArticleModel.get_article()
        return jsonify(articles)
    except Exception as ex:
        return jsonify({'error': str(ex)}), 500
