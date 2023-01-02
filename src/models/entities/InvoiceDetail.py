class InvoiceDetail:

    def __init__(self, codigo, descripcion, precio, cantidad, id_factura):
        self.codigo = codigo
        self.descripcion = descripcion
        self.precio = precio
        self.cantidad = cantidad
        self.id_factura = id_factura

    def to_JSON(self):
        return {
            'codigo': self.codigo,
            'descripcion': self.descripcion,
            'precio': self.precio,
            'cantidad': self.cantidad,
            'id_factura': self.id_factura
        }
