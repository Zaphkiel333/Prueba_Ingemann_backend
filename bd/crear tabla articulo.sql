create table articulo(
	id SERIAL primary key,
	codigo varchar(10) not null,
	descripcion text not null,
	precio decimal(10,2) not null,
	costo decimal(10,2) not null,
	is_active boolean not null
);

alter table articulo 
add constraint UQ_codigo
unique (codigo);
