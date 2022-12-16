class User:

    def __init__(self, id, nombre_cliente, contraseña):
        self.id = id
        self.nombre_cliente = nombre_cliente
        self.contraseña = contraseña

    def to_JSON(self):
        return {
            'id': self.id,
            'nombre_cliente': self.nombre_cliente,
            'contraseña': self.contraseña
        }
