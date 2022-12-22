from flask import Blueprint, request

from src.models.InvoiceDetailModel import InvoiceDetailModel

main = Blueprint('invoice_detail_blueprint', __name__)


@main.route('/<id_factura>')
def get_invoice_details(id_factura):
    try:
        invoices_details = InvoiceDetailModel.get_invoice_details(id_factura)
        return invoices_details, 200
    except Exception as ex:
        return {'error': str(ex)}, 500


@main.route('/', methods=['POST'])
def add_invoice_detail():
    try:
        affected_rows = InvoiceDetailModel.add_invoice_detail(request.json)
        if affected_rows > 0:
            return {"Inserted": affected_rows}, 200

        return {'error': 'no rows affected'}, 400
    except Exception as ex:
        return {'error': str(ex)}, 500
