create table cliente(
	id serial primary key,
	nombre_cliente text not null,
	contraseña text not null
);

alter table cliente
add constraint UQ_nombre_cliente
unique (nombre_cliente);