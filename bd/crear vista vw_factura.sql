CREATE VIEW vw_factura
 AS
select f.id, f.codigo, fecha, c.nombre_cliente, (((sum(df.cantidad*a.precio)*15)/100)+sum(df.cantidad*a.precio)) as total
from factura as f
join cliente as c
	on f.id_cliente = c.id
join detalle_factura as df
	on df.id_factura = f.id 
join articulo as a
	on a.id  = df.id_articulo 
group by (f.id, c.id)