from flask import Flask
from config import config

from routes import Article

app = Flask(__name__)


def page_not_found(error):
    return "<h1>PAGE NOT FOUND</h1>"


if __name__ == '__main__':
    app.config.from_object(config['development'])

    app.register_blueprint(Article.main, url_prefix='/api/articles')

    app.register_error_handler(404, page_not_found)
    app.run()
