from src.database.db import get_connection
from src.models.entities.Invoice import Invoice


class InvoiceModel:
    @classmethod
    def get_invoices(self):
        connection = None

        try:
            connection = get_connection()
            invoices = []

            with connection.cursor() as cursor:
                query = """SELECT *
                            FROM factura"""
                cursor.execute(query)
                result = cursor.fetchall()

                for row in result:
                    invoice = Invoice(row[0], row[1], row[2], row[3])
                    invoices.append(invoice.to_JSON())
            return invoices
        except Exception as ex:
            raise Exception(ex)
        finally:
            connection.close()
