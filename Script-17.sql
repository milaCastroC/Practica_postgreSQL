create schema libros;

-- Crear una tabla libros con los siguientes campos:
--○ id (clave primaria, autoincremental)
--○ titulo (varchar de 150 caracteres, obligatorio)
--○ autor (varchar de 100 caracteres, obligatorio)
--○ categoria (varchar de 50 caracteres, obligatorio)
--○ disponible (booleano, indica si está disponible o no)

create table "libros".libros (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    disponible BOOLEAN NOT NULL DEFAULT TRUE
);

--Insertar al menos 6 libros de diferentes categorías.
insert into"libros".libros(titulo, autor, categoria, disponible) values
('El universo en una cáscara de nuez', 'Stephen Hawking', 'Ciencia', TRUE),
('Breve historia del tiempo', 'Stephen Hawking', 'Ciencia', TRUE),
('El origen de las especies', 'Charles Darwin', 'Biología', TRUE),
('La estructura de la evolución', 'Stephen Jay Gould', 'Biología', TRUE),
('Los números primos', 'Marcus du Sautoy', 'Matemática', TRUE),
('El enigma de Fermat', 'Simon Singh', 'Matemática', TRUE);

--Consultar todos los libros de la categoría 'Ciencia'.
select * from"libros".libros where categoria = 'Ciencia';

--Buscar si un libro específico está en la biblioteca por su título.
select * from "libros".libros where titulo = 'El origen de las especies';

--Actualizar la disponibilidad de un libro para indicar que ha sido prestado.
update "libros".libros 
set disponible = FALSE 
where titulo = 'El origen de las especies';

--Eliminar un libro específico de la base de datos.
delete from biblioteca.libros where titulo = 'Los números primos';
