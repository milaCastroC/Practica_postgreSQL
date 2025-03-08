--Crear la bd
create schema tienda;

--Crear la tabla clientes
create table "tienda"."clientes"(
	id SERIAL primary key,
	nombre VARCHAR(100)not null,
	email VARCHAR(150) not null unique,
	telefono VARCHAR(15)
);

--Insertar data en la tabla clientes
insert into "tienda"."clientes"(nombre, email, telefono) values
('Juan Pérez', 'juan.perez@email.com', '123456789'),
('María López', 'maria.lopez@email.com', '987654321'),
('Carlos Gómez', 'carlos.gomez@email.com', NULL),
('Ana Torres', 'ana.torres@email.com', '555123456'),
('Pedro Ramírez', 'pedro.ramirez@email.com', '666789012');

--Consultar todos los registros
select * from "tienda"."clientes";

--Filtrar datos
select * from "tienda"."clientes" where nombre ilike '%A%';

--Actualizar un registro
update "tienda"."clientes" set telefono = '1122334455' where id = 3;


-- Eliminar un registro
delete from "tienda"."clientes" where email = 'pedro.ramirez@email.com';

--Creación de tablas relacionales
create table "tienda"."pedidos"(
	id SERIAL primary key,
	id_cliente INT references "tienda"."clientes"(id),
	fecha DATE not null,
	total NUMERIC(10, 2) not null
);

--Insertar datos en tablas relacionadas
insert into "tienda"."pedidos" (id_cliente, fecha, total) values
(1, '2024-02-05', 150.75),
(2, '2024-02-10', 200.00),
(3, '2024-02-15', 350.50);

--Consulta con JOIN
select c.nombre as cliente, p.fecha as pedido
from "tienda"."pedidos" p
join "tienda"."clientes" c on p.id_cliente = c.id;


--Creación de una vista
create view "tienda"."vista_pedidos" as
select c.nombre as cliente, p.fecha, p.total
from "tienda"."pedidos" p
join "tienda"."clientes" c on p.id_cliente = c.id;

--Consultar una vista
select * from "tienda"."vista_pedidos";

--Uso de funciones agregadas
select SUM(total) as total_ventas from "tienda"."pedidos";

--Filtro avanzado
select * from "tienda"."pedidos" where fecha > '2024-02-10';

--Eliminadción en cascada
alter table "tienda"."pedidos"
drop constraint pedidos_id_cliente_fkey,
add constraint pedidos_id_cliente_fkey foreign key(id_cliente) references "tienda"."clientes"(id) on delete cascade;

--Prueba de eliminación en cascada
delete from "tienda"."clientes" where id = 2;
select * from "tienda"."pedidos";
select * from "tienda"."clientes";
select * from "tienda"."vista_pedidos";