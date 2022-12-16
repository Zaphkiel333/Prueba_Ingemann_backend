from flask import Blueprint

from src.models.UserModel import UserModel

main = Blueprint('user_blueprint', __name__)


@main.route('/')
def get_users():
    try:
        users = UserModel.get_users()
        return users
    except Exception as ex:
        return {'error': str(ex)}, 500
