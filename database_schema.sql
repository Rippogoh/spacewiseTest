CREATE DATABASE IF NOT EXISTS spacewise;
USE spacewise;

-- 1. Tabla Cliente
CREATE TABLE Cliente (
    rut VARCHAR(12) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100) UNIQUE NOT NULL,
    direccion VARCHAR(150),
    razonSocial VARCHAR(100)
);

-- 2. Tabla admin
CREATE TABLE admin (
    idAdmin INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    rol VARCHAR(30) NOT NULL
);

-- 3. Tabla contenedor
CREATE TABLE contenedor (
    idContenedor INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(40) NOT NULL,
    tamanio VARCHAR(15) NOT NULL,
    descripcionCont VARCHAR(100) NOT NULL,
    estado VARCHAR(25) NOT NULL,
    precioBase INT NOT NULL
);

-- 4. Tabla cotizaciones
CREATE TABLE cotizaciones (
    idCotizacion INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATETIME NOT NULL,
    estado VARCHAR(25) NOT NULL,
    valorTotal INT NOT NULL,
    rutCliente VARCHAR(12) NOT NULL,
    idAdmin INT,
    FOREIGN KEY (rutCliente) REFERENCES Cliente(rut),
    FOREIGN KEY (idAdmin) REFERENCES admin(idAdmin)
);

-- 5. Tabla detalleCotizacion
CREATE TABLE detalleCotizacion (
    idDetalle INT AUTO_INCREMENT PRIMARY KEY,
    cantidad INT NOT NULL,
    precioUnitario INT NOT NULL,
    idContenedor INT NOT NULL,
    idCotizacion INT NOT NULL,
    FOREIGN KEY (idContenedor) REFERENCES contenedor(idContenedor),
    FOREIGN KEY (idCotizacion) REFERENCES cotizaciones(idCotizacion)
);

-- 6. Tabla compra
CREATE TABLE compra (
    idCompra INT AUTO_INCREMENT PRIMARY KEY,
    fechaCompra DATETIME NOT NULL,
    tipoDocumento VARCHAR(20) NOT NULL,
    numDocumento INT UNIQUE NOT NULL,
    montoTotal INT NOT NULL,
    idCotizacion INT NOT NULL,
    FOREIGN KEY (idCotizacion) REFERENCES cotizaciones(idCotizacion)
);

-- 7. Tabla garantia
CREATE TABLE garantia (
    idGarantia INT AUTO_INCREMENT PRIMARY KEY,
    fechaSolicitud DATETIME NOT NULL,
    motivo VARCHAR(100) NOT NULL,
    estado VARCHAR(30) NOT NULL,
    resolucion VARCHAR(200),
    idCompra INT NOT NULL,
    idAdmin INT,
    FOREIGN KEY (idCompra) REFERENCES compra(idCompra),
    FOREIGN KEY (idAdmin) REFERENCES admin(idAdmin)
);

-- 8. Tabla detalleGarantia
CREATE TABLE detalleGarantia (
    idDetalleGarantia INT AUTO_INCREMENT PRIMARY KEY,
    cantidad INT NOT NULL,
    idContenedor INT NOT NULL,
    idGarantia INT NOT NULL,
    FOREIGN KEY (idContenedor) REFERENCES contenedor(idContenedor),
    FOREIGN KEY (idGarantia) REFERENCES garantia(idGarantia)
);