from flask import Flask
from config import config

from routes import ArticleRoute
from routes import InvoiceRoute
from routes import UserRoute
from routes import InvoiceDetailRoute

app = Flask(__name__)


def page_not_found(error):
    return "<h1>PAGE NOT FOUND</h1>"


def set_routes():
    app.register_blueprint(ArticleRoute.main, url_prefix='/api/articles')
    app.register_blueprint(InvoiceRoute.main, url_prefix='/api/invoices')
    app.register_blueprint(UserRoute.main, url_prefix='/api/users')
    app.register_blueprint(InvoiceDetailRoute.main, url_prefix='/api/invoices_details')


if __name__ == '__main__':
    app.config.from_object(config['development'])

    set_routes()

    app.register_error_handler(404, page_not_found)
    app.run()
