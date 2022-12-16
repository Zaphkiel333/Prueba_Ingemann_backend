from src.database.db import get_connection
from src.models.entities.InvoiceDetail import InvoiceDetail


class InvoiceDetailModel:

    @classmethod
    def get_invoice_details(self):
        connection = None

        try:
            connection = get_connection()
            invoice_details = []

            with connection.cursor() as cursor:
                query = """SELECT *
                            FROM detalle_factura"""
                cursor.execute(query)
                result = cursor.fetchall()

                for row in result:
                    invoice_detail = InvoiceDetail(row[0], row[1], row[2], row[3])
                    invoice_details.append(invoice_detail.to_JSON())
            return invoice_details
        except Exception as ex:
            raise Exception(ex)
        finally:
            connection.close()
