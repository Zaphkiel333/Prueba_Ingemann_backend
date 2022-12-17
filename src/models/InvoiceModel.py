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
                            FROM vw_factura"""
                cursor.execute(query)
                result = cursor.fetchall()

                for row in result:
                    invoice = Invoice(row[0], row[1], row[2], row[3], row[4])
                    invoices.append(invoice.to_JSON())
            return invoices
        except Exception as ex:
            raise Exception(ex)
        finally:
            connection.close()

    @classmethod
    def get_invoices_filtered(self, codigo):
        connection = None

        try:
            connection = get_connection()
            invoices = []


            with connection.cursor() as cursor:

                query = """SELECT *
                            FROM vw_factura
                            WHERE codigo LIKE %(codigo)s OR
                                nombre_cliente LIKE %(codigo)s """

                codigo_dict = {
                    'codigo': str(codigo) + '%',
                }

                cursor.execute(query, codigo_dict)
                result = cursor.fetchall()

                for row in result:
                    invoice = Invoice(row[0], row[1], row[2], row[3], row[4])
                    invoices.append(invoice.to_JSON())

            return invoices
        except Exception as ex:
            raise Exception(ex)
        finally:
            connection.close()
