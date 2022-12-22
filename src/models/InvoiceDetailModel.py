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

    @classmethod
    def add_invoice_detail(self, request):

        connection = None

        try:
            connection = get_connection()

            articles = request.get('articulos')

            with connection.cursor() as cursor:
                query = """INSERT INTO factura
                                    (codigo, id_cliente, fecha)
                                VALUES
                                    (%(codigo)s, %(cliente)s, %(fecha)s)
                                RETURNING id"""
                cursor.execute(query, request)
                id_factura = cursor.fetchone()[0]

                query = """ INSERT INTO detalle_factura
                                    (id_factura, id_articulo, cantidad)
                                VALUES"""
                for i in range(0, len(articles)):
                    article = articles[i]
                    query += f"({id_factura}, {article.get('id_articulo')}, {article.get('cantidad')}),"

                cursor.execute(query[:-1])
                row_affected = cursor.rowcount

                connection.commit()

            return row_affected
        except Exception as ex:
            raise Exception(ex)
        finally:
            connection.close()
