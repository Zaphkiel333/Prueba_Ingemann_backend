class Invoice:

    def __init__(self, id, codigo, fecha, id_cliente):
        self.id = id
        self.codigo = codigo
        self.fecha = fecha
        self.id_cliente = id_cliente

    def to_JSON(self):
        return {
            'id': self.id,
            'codigo': self.codigo,
            'fecha': self.fecha,
            'id_cliente': self.id_cliente
        }
