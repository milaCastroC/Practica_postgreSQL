create schema hotel;

--Crear una tabla clientes con:
--○ id (clave primaria, autoincremental)
--○ nombre (varchar de 100 caracteres, obligatorio)
--○ email (varchar de 150 caracteres, único y obligatorio)
--○ telefono (varchar de 15 caracteres, opcional)

CREATE TABLE "hotel".clientes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    telefono VARCHAR(15)
);


--Crear una tabla reservas con:
--○ id (clave primaria, autoincremental)
--○ id_cliente (clave foránea que referencia a clientes)
--○ fecha_entrada (DATE, obligatorio)
--○ fecha_salida (DATE, obligatorio)
--○ habitacion (int, obligatorio)

CREATE TABLE "hotel".reservas (
    id SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES hotel.clientes(id) ON DELETE CASCADE,
    fecha_entrada DATE NOT NULL,
    fecha_salida DATE NOT NULL,
    habitacion INT NOT NULL
);

--Insertar registros en ambas tablas.
INSERT INTO "hotel".clientes (nombre, email, telefono) VALUES
('María González', 'maria.gonzalez@email.com', '123456789'),
('Carlos López', 'carlos.lopez@email.com', '987654321'),
('Marta Pérez', 'marta.perez@email.com', NULL),
('Pedro Ramírez', 'pedro.ramirez@email.com', '555123456');

INSERT INTO "hotel".reservas (id_cliente, fecha_entrada, fecha_salida, habitacion) VALUES
(1, '2024-04-10', '2024-04-15', 101),
(2, '2024-04-12', '2024-04-18', 202),
(3, '2024-04-15', '2024-04-20', 303);

--Filtrar clientes cuyo nombre empiece con 'M'.
SELECT * FROM "hotel".clientes WHERE nombre = 'M%';

--Eliminar una reserva específica.
DELETE FROM "hotel".reservas WHERE id = 2;

