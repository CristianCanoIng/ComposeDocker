CREATE DATABASE IF NOT EXISTS tienda;
USE tienda;

-- Tabla de Usuarios
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    rol ENUM('admin', 'empleado', 'cliente') NOT NULL
);

INSERT INTO usuarios (nombre, correo, password, rol) VALUES
('Juan Pérez', 'juan@example.com', '12345', 'admin'),
('Ana Gómez', 'ana@example.com', '12345', 'empleado'),
('Carlos Ruiz', 'carlos@example.com', '12345', 'cliente');

-- Tabla de Productos
CREATE TABLE IF NOT EXISTS productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL
);

INSERT INTO productos (nombre, descripcion, precio, stock) VALUES
('Laptop', 'Laptop de última generación', 1500.00, 10),
('Mouse', 'Mouse inalámbrico', 25.00, 50),
('Teclado', 'Teclado mecánico', 80.00, 30);

-- Tabla de Clientes
CREATE TABLE IF NOT EXISTS clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    telefono VARCHAR(15),
    direccion TEXT
);

INSERT INTO clientes (nombre, telefono, direccion) VALUES
('Pedro López', '3001234567', 'Calle 123 #45-67'),
('María Torres', '3109876543', 'Carrera 45 #12-34');

-- Tabla de Ventas
CREATE TABLE IF NOT EXISTS ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

INSERT INTO ventas (id_cliente, total) VALUES
(1, 1525.00),
(2, 80.00);

-- Tabla de Detalle de Ventas
CREATE TABLE IF NOT EXISTS detalle_ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT,
    id_producto INT,
    cantidad INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES ventas(id),
    FOREIGN KEY (id_producto) REFERENCES productos(id)
);

INSERT INTO detalle_ventas (id_venta, id_producto, cantidad, precio) VALUES
(1, 1, 1, 1500.00),
(1, 2, 1, 25.00),
(2, 3, 1, 80.00);
