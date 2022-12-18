class Article:

    def __init__(self, id, codigo, descripcion, precio, costo, is_active):
        self.id = id
        self.codigo = codigo
        self.descripcion = descripcion
        self.precio = precio
        self.costo = costo
        self.is_active = is_active

    def to_JSON(self):
        return {
            'id': self.id,
            'codigo': self.codigo,
            'descripcion': self.descripcion,
            'precio':self.precio,
            'costo': self.costo,
            'is_active': self.is_active
        }
