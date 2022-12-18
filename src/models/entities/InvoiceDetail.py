class InvoiceDetail:

    def __init__(self, codigo, descripcion, costo, cantidad, id_factura):
        self.codigo = codigo
        self.descripcion = descripcion
        self.costo = costo
        self.cantidad = cantidad
        self.id_factura = id_factura

    def to_JSON(self):
        return {
            'codigo': self.codigo,
            'descripcion': self.descripcion,
            'costo': self.costo,
            'cantidad': self.cantidad,
            'id_factura': self.id_factura
        }
