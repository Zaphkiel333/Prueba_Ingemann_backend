create table detalle_factura(
	id serial primary key,
	id_factura int not null,
	id_articulo int not null,
	cantidad int not null
);

alter table detalle_factura
add constraint FK_id_factura
foreign key (id_factura)
references factura (id);

alter table detalle_factura
add constraint FK_id_articulo
foreign key (id_articulo)
references articulo (id);