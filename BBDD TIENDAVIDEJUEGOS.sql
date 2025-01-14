CREATE DATABASE IF NOT EXISTS TiendaVideojuegosCarlosPertierra;
USE TiendaVideojuegosCarlosPertierra;

-- Tabla de Usuarios
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL,
    contrasena VARCHAR(100) NOT NULL,
    tipo_cuenta ENUM('administrador', 'cliente') NOT NULL
);

-- Tabla de Consolas
CREATE TABLE consolas (
    id_consola INT AUTO_INCREMENT PRIMARY KEY,
    nombre_consola VARCHAR(50) NOT NULL,
    potencia_cpu DECIMAL(5,2) NOT NULL, 
    potencia_gpu DECIMAL(5,2) NOT NULL, 
    compania VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    unidades_disponibles INT NOT NULL
);

-- Tabla de Juegos
CREATE TABLE juegos (
    id_juego INT AUTO_INCREMENT PRIMARY KEY,
    nombre_juego VARCHAR(100) NOT NULL,
    plataforma VARCHAR(50) NOT NULL,
    compania_desarrolladora VARCHAR(50) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    puntuacion_metacritic DECIMAL(3,1) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    unidades_disponibles INT NOT NULL,
    id_consola INT DEFAULT NULL 
);
