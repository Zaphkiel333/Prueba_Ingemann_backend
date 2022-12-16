from flask import Blueprint, jsonify

main = Blueprint('article_blueprint', __name__)

@main.route('/')
def get_article():
    return jsonify({'mensaje':'mensaje'})