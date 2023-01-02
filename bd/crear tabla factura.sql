create table factura(
	id serial primary key,
	codigo varchar(10) not null,
	fecha timestamp not null,
	id_cliente int not null
);

alter table factura
add constraint UQ_codigo_factura
unique (codigo);

alter table factura
add constraint FK_id_cliente
foreign key (id_cliente)
references cliente (id);