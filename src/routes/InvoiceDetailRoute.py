from flask import Blueprint

from src.models.InvoiceDetailModel import InvoiceDetailModel

main = Blueprint('invoice_detail_blueprint', __name__)


@main.route('/')
def get_invoice_details():
    try:
        invoices_details = InvoiceDetailModel.get_invoice_details()
        return invoices_details
    except Exception as ex:
        return {'error': str(ex)}, 500
