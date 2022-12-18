from src.database.db import get_connection
from src.models.entities.InvoiceDetail import InvoiceDetail


class InvoiceDetailModel:

    @classmethod
    def get_invoice_details(self, id_factura):
        connection = None

        try:
            connection = get_connection()
            invoice_details = []

            with connection.cursor() as cursor:
                query = """SELECT *
                            FROM vw_detalle_factura
                            WHERE id_factura = %s"""
                cursor.execute(query, (id_factura,))
                result = cursor.fetchall()

                for row in result:
                    invoice_detail = InvoiceDetail(row[0], row[1], row[2], row[3], row[4])
                    invoice_details.append(invoice_detail.to_JSON())
            return invoice_details
        except Exception as ex:
            raise Exception(ex)
        finally:
            connection.close()
