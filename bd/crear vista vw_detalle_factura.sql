create view vw_detalle_factura
as
select a.codigo, a.descripcion, a.precio, df.cantidad, df.id_factura 
from detalle_factura as df
join articulo as a
	on df.id_articulo = a.id