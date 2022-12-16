class InvoiceDetail:

    def __init__(self, id, id_factura, id_articulo, cantidad):
        self.id = id
        self.id_factura = id_factura
        self.id_articulo = id_articulo
        self.cantidad = cantidad

    def to_JSON(self):
        return {
            'id': self.id,
            'id_factura': self.id_factura,
            'id_articulo': self.id_articulo,
            'cantidad': self.cantidad
        }
