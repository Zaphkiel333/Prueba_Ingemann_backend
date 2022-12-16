from flask import Flask
from config import config

from routes import Article
from routes import Invoice

app = Flask(__name__)


def page_not_found(error):
    return "<h1>PAGE NOT FOUND</h1>"


def get_routes():
    app.register_blueprint(Article.main, url_prefix='/api/articles')
    app.register_blueprint(Invoice.main, url_prefix='/api/invoices')


if __name__ == '__main__':
    app.config.from_object(config['development'])

    get_routes()

    app.register_error_handler(404, page_not_found)
    app.run()
