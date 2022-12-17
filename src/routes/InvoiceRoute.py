from flask import Blueprint

from src.models.InvoiceModel import InvoiceModel

main = Blueprint('invoice_blueprint', __name__)


@main.route('/')
def get_invoices():
    try:
        invoices = InvoiceModel.get_invoices()
        return invoices
    except Exception as ex:
        return {'error': str(ex)}, 500


@main.route('/<codigo>')
def get_invoices_filtered(codigo):
    try:
        invoices = InvoiceModel.get_invoices_filtered(codigo)
        return invoices
    except Exception as ex:
        return {'error': str(ex)}, 500
