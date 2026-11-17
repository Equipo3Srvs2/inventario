-- ==========================================================
--  Script de inicialización de la base de datos "inventario"
--  Adaptado a Kicks Lab (tienda de tenis) - datos ficticios
--  MySQL lo ejecuta automáticamente SOLO la primera vez,
--  cuando el volumen datos_mysql está vacío.
-- ==========================================================

SET NAMES utf8mb4;
USE inventario;

CREATE TABLE IF NOT EXISTS equipos (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    nombre          VARCHAR(100) NOT NULL,
    tipo            ENUM('Computadora punto de venta','Laptop','Tableta','Impresora de tickets','Impresora de etiquetas','Lector de código de barras','Terminal de pago','Cámara de seguridad','Equipo de red') NOT NULL,
    marca           VARCHAR(50)  NOT NULL,
    numero_serie    VARCHAR(50)  NOT NULL UNIQUE,
    ubicacion       VARCHAR(100) NOT NULL,
    estado          ENUM('En uso','En almacén','En reparación','Fuera de servicio','Dado de baja') NOT NULL DEFAULT 'En uso',
    fecha_registro  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Registros de ejemplo de Kicks Lab (datos ficticios)
INSERT INTO equipos (nombre, tipo, marca, numero_serie, ubicacion, estado) VALUES
('KL-POS-01 Equipo todo en uno de caja',   'Computadora punto de venta', 'Lenovo',   'SN-KL-48213', 'Caja 1',        'En uso'),
('KL-POS-02 Equipo todo en uno de caja',   'Computadora punto de venta', 'Lenovo',   'SN-KL-48214', 'Caja 2',        'En reparación'),
('KL-LAP-01 Laptop 14" de la gerencia',    'Laptop',                     'Dell',     'SN-KL-73390', 'Oficina',       'En uso'),
('KL-TAB-01 Tableta 10" de consulta',      'Tableta',                    'Samsung',  'SN-KL-10577', 'Piso de venta', 'En uso'),
('KL-TAB-02 Tableta 10" de consulta',      'Tableta',                    'Samsung',  'SN-KL-10578', 'Bodega',        'En almacén'),
('KL-IMP-01 Impresora térmica 80 mm',      'Impresora de tickets',       'Epson',    'SN-KL-22041', 'Caja 1',        'En uso'),
('KL-ETQ-01 Impresora de etiquetas',       'Impresora de etiquetas',     'Zebra',    'SN-KL-31507', 'Bodega',        'En uso'),
('KL-LEC-01 Lector inalámbrico',           'Lector de código de barras', 'Honeywell','SN-KL-65102', 'Caja 2',        'Fuera de servicio'),
('KL-TPV-01 Terminal de pago con tarjeta', 'Terminal de pago',           'Ingenico', 'SN-KL-58830', 'Caja 1',        'En uso'),
('KL-CAM-01 Cámara IP tipo domo',          'Cámara de seguridad',        'Hikvision','SN-KL-90015', 'Entrada',       'En uso'),
('KL-RED-01 Módem/router principal',       'Equipo de red',              'TP-Link',  'SN-KL-40422', 'Oficina',       'En uso'),
('KL-LAP-02 Laptop antigua de oficina',    'Laptop',                     'HP',       'SN-KL-73001', 'Bodega',        'Dado de baja');
