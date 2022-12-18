class Invoice:

    def __init__(self, id, codigo, fecha, cliente, total):
        self.id = id
        self.codigo = codigo
        self.fecha = fecha
        self.cliente = cliente
        self.total = total

    def to_JSON(self):
        return {
            'id': self.id,
            'codigo': self.codigo,
            'fecha': self.fecha.strftime('%d/%m/%Y'),
            'cliente': self.cliente,
            'total': self.total
        }
