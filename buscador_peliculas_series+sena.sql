-- Creo la base de datos
DROP DATABASE IF EXISTS buscador_peliculas_series;
CREATE DATABASE buscador_peliculas_series;

-- La selecciono
USE buscador_peliculas_series;

-- Creo las tablas y sus relaciones
CREATE TABLE titulos (
    titulo_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    poster_url VARCHAR(255) NULL,
    sinopsis VARCHAR(1000) NULL,
    fecha DATE DEFAULT NULL COMMENT 'Un título puede no tener fecha de estreno aún',
    puntaje DECIMAL(4, 2)
);

CREATE TABLE generos (
    genero_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL
);

CREATE TABLE generos_en_titulos (
    genero_en_id INT PRIMARY KEY AUTO_INCREMENT,
    genero_id INT NOT NULL,
    titulo_id INT NOT NULL,
    FOREIGN KEY (genero_id) REFERENCES generos(genero_id),
    FOREIGN KEY (titulo_id) REFERENCES titulos(titulo_id)
);

CREATE TABLE actores (
    actor_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    foto_url VARCHAR(255) DEFAULT 'sin_foto.jpg'
);

CREATE TABLE actores_en_titulos (
    actor_en_id INT PRIMARY KEY AUTO_INCREMENT,
    actor_id INT NOT NULL,
    titulo_id INT NOT NULL,
    papel VARCHAR(255) DEFAULT 'A sí mismo/a',
    FOREIGN KEY (actor_id) REFERENCES actores(actor_id),
    FOREIGN KEY (titulo_id) REFERENCES titulos(titulo_id)
);

CREATE TABLE directores (
    director_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    foto_url VARCHAR(255) DEFAULT 'sin_foto.jpg'
);

CREATE TABLE directores_en_titulos (
    director_en_id INT PRIMARY KEY AUTO_INCREMENT,
    director_id INT NOT NULL,
    titulo_id INT NOT NULL,
    FOREIGN KEY (director_id) REFERENCES directores(director_id),
    FOREIGN KEY (titulo_id) REFERENCES titulos(titulo_id)
);

CREATE TABLE plataformas (
    plataforma_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    logo_url VARCHAR(255) NOT NULL
);

CREATE TABLE plataformas_en_titulos (
    plataforma_en_id INT PRIMARY KEY AUTO_INCREMENT,
    plataforma_id INT NOT NULL,
    titulo_id INT NOT NULL,
    FOREIGN KEY (plataforma_id) REFERENCES plataformas(plataforma_id),
    FOREIGN KEY (titulo_id) REFERENCES titulos(titulo_id)
);

CREATE TABLE antiguedad (
    antiguedad_id INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(255) NOT NULL,
    how_old INT COMMENT 'Guardar la cantidad de años hacia atrás a partir del actual que se puede buscar'
);

CREATE TABLE busquedas (
    busqueda_id INT PRIMARY KEY AUTO_INCREMENT,
    genero_id INT NOT NULL,
    plataforma_id INT NOT NULL,
    antiguedad_id INT NOT NULL,
    fecha TIMESTAMP NOT NULL,
    FOREIGN KEY (genero_id) REFERENCES generos(genero_id),
    FOREIGN KEY (plataforma_id) REFERENCES plataformas(plataforma_id),
    FOREIGN KEY (antiguedad_id) REFERENCES antiguedad(antiguedad_id)
);

CREATE TABLE actividad (
    actividad_id INT PRIMARY KEY AUTO_INCREMENT,
    titulo_id INT NOT NULL,
    tipo VARCHAR(255) NOT NULL COMMENT 'Esta estructura permite registrar todo tipo de actividad y diferenciarlas por string',
    FOREIGN KEY (titulo_id) REFERENCES titulos(titulo_id)
);
