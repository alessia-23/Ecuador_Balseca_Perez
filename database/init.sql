DROP DATABASE IF EXISTS ecuador_db;

CREATE DATABASE ecuador_db
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE ecuador_db;
SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;

CREATE TABLE provincias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    capital VARCHAR(100) NOT NULL,
    area_km2 DECIMAL(10,2) NOT NULL,
    poblacion_estimada INT NOT NULL,
    latitud DECIMAL(10,6) NOT NULL,
    longitud DECIMAL(10,6) NOT NULL
) CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

INSERT INTO provincias (nombre, capital, area_km2, poblacion_estimada, latitud, longitud) VALUES
('Azuay', 'Cuenca', 8309.58, 881394, -2.900128, -79.005896),
('Bolívar', 'Guaranda', 3945.38, 209933, -1.592630, -79.000980),
('Cañar', 'Azogues', 3146.08, 281396, -2.739690, -78.848600),
('Carchi', 'Tulcán', 3780.45, 186869, 0.811870, -77.717270),
('Chimborazo', 'Riobamba', 6499.72, 524004, -1.663550, -78.654650),
('Cotopaxi', 'Latacunga', 6085.00, 488716, -0.931560, -78.605850),
('El Oro', 'Machala', 5766.68, 715751, -3.258610, -79.955390),
('Esmeraldas', 'Esmeraldas', 14893.00, 643654, 0.968180, -79.651720),
('Galápagos', 'Puerto Baquerizo Moreno', 8010.00, 33042, -0.902500, -89.610190),
('Guayas', 'Guayaquil', 15430.40, 4391923, -2.170998, -79.922359),
('Imbabura', 'Ibarra', 4587.51, 476257, 0.351710, -78.122330),
('Loja', 'Loja', 11066.00, 521154, -3.993130, -79.204220),
('Los Ríos', 'Babahoyo', 6254.00, 921763, -1.802170, -79.534430),
('Manabí', 'Portoviejo', 18939.60, 1595622, -1.054580, -80.454450),
('Morona Santiago', 'Macas', 24059.40, 196535, -2.308680, -78.111350),
('Napo', 'Tena', 13271.00, 133705, -0.993800, -77.812860),
('Orellana', 'Francisco de Orellana', 21675.10, 182166, -0.466450, -76.987190),
('Pastaza', 'Puyo', 29973.70, 114202, -1.492410, -78.002570),
('Pichincha', 'Quito', 9535.91, 3228233, -0.229850, -78.524950),
('Santa Elena', 'Santa Elena', 3690.17, 401178, -2.226220, -80.858730),
('Santo Domingo de los Tsáchilas', 'Santo Domingo', 3857.00, 492969, -0.253050, -79.175360),
('Sucumbíos', 'Nueva Loja', 18084.42, 230503, 0.084720, -76.882780),
('Tungurahua', 'Ambato', 3334.80, 590600, -1.249080, -78.616750),
('Zamora Chinchipe', 'Zamora', 10556.00, 120416, -4.069170, -78.956670);