----- REMISERIA

DROP DATABASE IF EXISTS proyecto_remiseria;
CREATE DATABASE proyecto_remiseria;

USE proyecto_remiseria;

CREATE TABLE Clientes (
    ID_Cliente INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Telefono VARCHAR(15) NOT NULL,
    Email VARCHAR(50),
    Cuil VARCHAR(200) NOT NULL
);

CREATE TABLE Conductores (
    ID_Conductor INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(200),
    Apellido VARCHAR(200),
    Telefono VARCHAR(200) NOT NULL,
    Email VARCHAR(200)
);

CREATE TABLE Tarifas (
    ID_Tarifa INT PRIMARY KEY AUTO_INCREMENT,
    Descripcion VARCHAR(100),
    Precio_Kilometro DECIMAL(10, 2)
);

CREATE TABLE Zonas (
    ID_Zona INT PRIMARY KEY AUTO_INCREMENT,
    Nombre_Zona VARCHAR(50),
    Tarifa_Base DECIMAL(10, 2),
    ID_Tarifa INT,
    FOREIGN KEY (ID_Tarifa) REFERENCES Tarifas(ID_Tarifa)
);

CREATE TABLE Autos (
    ID_Auto INT PRIMARY KEY AUTO_INCREMENT,
    Patente VARCHAR(200),
    Marca VARCHAR(200),
    Modelo VARCHAR(200),
    ID_Conductor INT,
    FOREIGN KEY (ID_Conductor) REFERENCES Conductores(ID_Conductor)
);

CREATE TABLE Rutas (
    ID_Ruta INT PRIMARY KEY AUTO_INCREMENT,
    Origen VARCHAR(100),
    Destino VARCHAR(100),
    Distancia_Km DECIMAL(10, 2)
);

CREATE TABLE Ofertas (
    ID_Oferta INT PRIMARY KEY AUTO_INCREMENT,
    Descripcion VARCHAR(100),
    Descuento DECIMAL(10, 2),
    Fecha_Inicio DATE,
    Fecha_Fin DATE
);

USE proyecto_remiseria;
CREATE TABLE Reservas (
    ID_Reserva INT PRIMARY KEY AUTO_INCREMENT,
    ID_Cliente INT,
    ID_Auto INT,
    ID_Zona INT,
    ID_Tarifa INT,
    ID_Ruta INT,
    ID_Oferta INT,
    ID_Conductor INT,
    Fecha_Hora DATETIME,
    Origen VARCHAR(100),
    Destino VARCHAR(100),
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente),
    FOREIGN KEY (ID_Auto) REFERENCES Autos(ID_Auto),
    FOREIGN KEY (ID_Zona) REFERENCES Zonas(ID_Zona),
    FOREIGN KEY (ID_Tarifa) REFERENCES Tarifas(ID_Tarifa),
    FOREIGN KEY (ID_Ruta) REFERENCES Rutas(ID_Ruta),
    FOREIGN KEY (ID_Oferta) REFERENCES Ofertas(ID_Oferta),
    FOREIGN KEY (ID_Conductor) REFERENCES Conductores(ID_Conductor)
);

CREATE TABLE Viajes (
    ID_Viaje INT PRIMARY KEY AUTO_INCREMENT,
    ID_Reserva INT,
    ID_Oferta INT,
    Fecha_Hora_Inicio DATETIME,
    Fecha_Hora_Fin DATETIME,
    Kilometraje DECIMAL(10, 2),
    FOREIGN KEY (ID_Reserva) REFERENCES Reservas(ID_Reserva),
    FOREIGN KEY (ID_Oferta) REFERENCES Ofertas(ID_Oferta)
);

CREATE TABLE Pagos (
    ID_Pago INT PRIMARY KEY AUTO_INCREMENT,
    ID_Reserva INT,
    ID_Cliente INT,
    Fecha_Pago DATETIME,
    Monto DECIMAL(10, 2),
    Metodo_Pago VARCHAR(50),
    FOREIGN KEY (ID_Reserva) REFERENCES Reservas(ID_Reserva),
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente)
);

CREATE TABLE Mantenimiento (
    ID_Mantenimiento INT PRIMARY KEY AUTO_INCREMENT,
    ID_Auto INT,
    Fecha DATE,
    Descripcion VARCHAR(100),
    Costo DECIMAL(10, 2),
    FOREIGN KEY (ID_Auto) REFERENCES Autos(ID_Auto)
);

CREATE TABLE Multas (
    ID_Multa INT PRIMARY KEY AUTO_INCREMENT,
    ID_Conductor INT,
    Fecha DATE,
    Descripcion VARCHAR(100),
    Monto DECIMAL(10, 2),
    FOREIGN KEY (ID_Conductor) REFERENCES Conductores(ID_Conductor)
);

CREATE TABLE Seguros (
    ID_Seguro INT PRIMARY KEY AUTO_INCREMENT,
    ID_Auto INT,
    Empresa VARCHAR(50),
    Poliza VARCHAR(50),
    Fecha_Vencimiento DATE,
    FOREIGN KEY (ID_Auto) REFERENCES Autos(ID_Auto)
);

CREATE TABLE Comentarios (
    ID_Comentario INT PRIMARY KEY AUTO_INCREMENT,
    ID_Cliente INT,
    ID_Conductor INT,
    Comentario TEXT,
    Fecha_Comentario DATETIME,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente),
    FOREIGN KEY (ID_Conductor) REFERENCES Conductores(ID_Conductor)
);

CREATE TABLE Historial_Precios (
    ID_Historial INT PRIMARY KEY AUTO_INCREMENT,
    ID_Tarifa INT,
    Fecha DATE,
    Precio DECIMAL(10, 2),
    FOREIGN KEY (ID_Tarifa) REFERENCES Tarifas(ID_Tarifa)
);


-- Insertar datos en Clientes
INSERT INTO Clientes (ID_cliente, Nombre, Apellido, Telefono, Email, Cuil) VALUES 
(1, 'Juan', 'Perez', '123456789', 'juan.perez@hotmail.com', '20-12345678-9'),
(2, 'Ana', 'Gomez', '987654321', 'ana.gomez@hotmail.com', '20-98765432-1'),
(3, 'Carlos', 'Lopez', '456123789', 'carlos.lopez@hotmail.com', '20-45612378-9'),
(4, 'Maria', 'Martinez', '321654987', 'maria.martinez@hotmail.com', '20-32165498-7'),
(5, 'Luis', 'Garcia', '789456123', 'luis.garcia@hotmail.com', '20-78945612-3'),
(6, 'Laura', 'Fernandez', '654789321', 'laura.fernandez@hotmail.com', '20-65478932-1'),
(7, 'Jorge', 'Rodriguez', '852963741', 'jorge.rodriguez@hotmail.com', '20-85296374-1'),
(8, 'Sofia', 'Sanchez', '159753486', 'sofia.sanchez@hotmail.com', '20-15975348-6'),
(9, 'Roberto', 'Torres', '951753852', 'roberto.torres@hotmail.com', '20-95175385-2'),
(10, 'Elena', 'Diaz', '753951486', 'elena.diaz@hotmail.com', '20-75395148-6'),
(11, 'Pedro', 'Molina', '123789456', 'pedro.molina@hotmail.com', '20-12378945-6'),
(12, 'Susana', 'Ramos', '789321654', 'susana.ramos@hotmail.com', '20-78932165-4'),
(13, 'Miguel', 'Silva', '321987654', 'miguel.silva@hotmail.com', '20-32198765-4'),
(14, 'Patricia', 'Mendoza', '654123987', 'patricia.mendoza@hotmail.com', '20-65412398-7'),
(15, 'Juan', 'Romero', '987321456', 'juan.romero@hotmail.com', '20-98732145-6'),
(16, 'Gabriela', 'Castro', '456789123', 'gabriela.castro@hotmail.com', '20-45678912-3'),
(17, 'Jose', 'Ortiz', '951753486', 'jose.ortiz@hotmail.com', '20-95175348-6'),
(18, 'Fernanda', 'Guzman', '753159486', 'fernanda.guzman@hotmail.com', '20-75315948-6'),
(19, 'Luis', 'Vega', '159357486', 'luis.vega@hotmail.com', '20-15935748-6'),
(20, 'Monica', 'Moreno', '357951486', 'monica.moreno@hotmail.com', '20-35795148-6'),
(21, 'Alberto', 'Ruiz', '789654123', 'alberto.ruiz@hotmail.com', '20-78965412-3'),
(22, 'Clara', 'Cruz', '951357486', 'clara.cruz@hotmail.com', '20-95135748-6'),
(23, 'Eduardo', 'Benitez', '159753852', 'eduardo.benitez@hotmail.com', '20-15975385-2'),
(24, 'Daniela', 'Herrera', '357159486', 'daniela.herrera@hotmail.com', '20-35715948-6'),
(25, 'Julian', 'Blanco', '951159753', 'julian.blanco@hotmail.com', '20-95115975-3'),
(26, 'Isabel', 'Navarro', '357951753', 'isabel.navarro@hotmail.com', '20-35795175-3'),
(27, 'Diego', 'Paredes', '753357159', 'diego.paredes@hotmail.com', '20-75335715-9'),
(28, 'Lucia', 'Farias', '951753357', 'lucia.farias@hotmail.com', '20-95175335-7'),
(29, 'Andres', 'Vargas', '159357753', 'andres.vargas@hotmail.com', '20-15935775-3'),
(30, 'Paula', 'Campos', '753951357', 'paula.campos@hotmail.com', '20-75395135-7'),
(31, 'Sergio', 'Cabrera', '159753357', 'sergio.cabrera@hotmail.com', '20-15975335-7'),
(32, 'Andrea', 'Villalba', '753159951', 'andrea.villalba@hotmail.com', '20-75315995-1'),
(33, 'Ricardo', 'Salinas', '357951159', 'ricardo.salinas@hotmail.com', '20-35795115-9'),
(34, 'Mariana', 'Rios', '951753159', 'mariana.rios@hotmail.com', '20-95175315-9'),
(35, 'Victor', 'Aguilar', '159357951', 'victor.aguilar@hotmail.com', '20-15935795-1'),
(36, 'Cecilia', 'Sandoval', '753159357', 'cecilia.sandoval@hotmail.com', '20-75315935-7'),
(37, 'Hugo', 'Dominguez', '951357159', 'hugo.dominguez@hotmail.com', '20-95135715-9'),
(38, 'Valeria', 'Fuentes', '357159951', 'valeria.fuentes@hotmail.com', '20-35715995-1'),
(39, 'Guillermo', 'Montes', '159753951', 'guillermo.montes@hotmail.com', '20-15975395-1'),
(40, 'Pilar', 'Carrizo', '753951159', 'pilar.carrizo@hotmail.com', '20-75395115-9'),
(41, 'Mauricio', 'Bravo', '357159753', 'mauricio.bravo@hotmail.com', '20-35715975-3'),
(42, 'Lourdes', 'Cortez', '951159357', 'lourdes.cortez@hotmail.com', '20-95115935-7'),
(43, 'Martin', 'Flores', '159951357', 'martin.flores@hotmail.com', '20-15995135-7'),
(44, 'Tamara', 'Peña', '753357951', 'tamara.pena@hotmail.com', '20-75335795-1'),
(45, 'Oscar', 'Alvarez', '951357753', 'oscar.alvarez@hotmail.com', '20-95135775-3'),
(46, 'Nadia', 'Luna', '159753951', 'nadia.luna@hotmail.com', '20-15975395-1'),
(47, 'Cristian', 'Morales', '357159357', 'cristian.morales@hotmail.com', '20-35715935-7'),
(48, 'Florencia', 'Soto', '951753357', 'florencia.soto@hotmail.com', '20-95175335-7'),
(49, 'Gustavo', 'Mendez', '159357159', 'gustavo.mendez@hotmail.com', '20-15935715-9'),
(50, 'Marta', 'Villar', '753159159', 'marta.villar@hotmail.com', '20-75315915-9'),
(51, 'Ramiro', 'Gil', '357951951', 'ramiro.gil@hotmail.com', '20-35795195-1'),
(52, 'Elisa', 'Castillo', '951159951', 'elisa.castillo@hotmail.com', '20-95115995-1'),
(53, 'Emilio', 'Lozano', '159357951', 'emilio.lozano@hotmail.com', '20-15935795-1'),
(54, 'Teresa', 'Gomez', '753951753', 'teresa.gomez@hotmail.com', '20-75395175-3'),
(55, 'Nicolas', 'Peralta', '357159159', 'nicolas.peralta@hotmail.com', '20-35715915-9'),
(56, 'Rosario', 'Rios', '951357951', 'rosario.rios@hotmail.com', '20-95135795-1'),
(57, 'Hernan', 'Rojas', '159951753', 'hernan.rojas@hotmail.com', '20-15995175-3'),
(58, 'Silvia', 'Maldonado', '753159951', 'silvia.maldonado@hotmail.com', '20-75315995-1'),
(59, 'Fabian', 'Sanchez', '357951753', 'fabian.sanchez@hotmail.com', '20-35795175-3'),
(60, 'Sabrina', 'Espinoza', '951159159', 'sabrina.espinoza@hotmail.com', '20-95115915-9'),
(61, 'Ariel', 'Gonzalez', '159357159', 'ariel.gonzalez@hotmail.com', '20-15935715-9'),
(62, 'Belen', 'Paz', '753951951', 'belen.paz@hotmail.com', '20-75395195-1'),
(63, 'Rodrigo', 'Caceres', '357159951', 'rodrigo.caceres@hotmail.com', '20-35715995-1'),
(64, 'Liliana', 'Ibanez', '951357357', 'liliana.ibanez@hotmail.com', '20-95135735-7'),
(65, 'Esteban', 'Moya', '159753357', 'esteban.moya@hotmail.com', '20-15975335-7'),
(66, 'Veronica', 'Munoz', '753159753', 'veronica.munoz@hotmail.com', '20-75315975-3'),
(67, 'Marcos', 'Perez', '357951357', 'marcos.perez@hotmail.com', '20-35795135-7'),
(68, 'Adriana', 'Diaz', '951159753', 'adriana.diaz@hotmail.com', '20-95115975-3'),
(69, 'Sebastian', 'Molina', '159357753', 'sebastian.molina@hotmail.com', '20-15935775-3'),
(70, 'Lorena', 'Franco', '753951357', 'lorena.franco@hotmail.com', '20-75395135-7'),
(71, 'Matias', 'Figueroa', '357159753', 'matias.figueroa@hotmail.com', '20-35715975-3'),
(72, 'Carolina', 'Ledesma', '951357951', 'carolina.ledesma@hotmail.com', '20-95135795-1'),
(73, 'Javier', 'Lopez', '159753159', 'javier.lopez@hotmail.com', '20-15975315-9'),
(74, 'Rocio', 'Medina', '753159357', 'rocio.medina@hotmail.com', '20-75315935-7'),
(75, 'Ivan', 'Torres', '357951951', 'ivan.torres@hotmail.com', '20-35795195-1'),
(76, 'Florencia', 'Ortiz', '951159357', 'florencia.ortiz@hotmail.com', '20-95115935-7'),
(77, 'Gonzalo', 'Campos', '159357951', 'gonzalo.campos@hotmail.com', '20-15935795-1'),
(78, 'Julieta', 'Saenz', '753951951', 'julieta.saenz@hotmail.com', '20-75395195-1'),
(79, 'Felipe', 'Nuñez', '357159357', 'felipe.nunez@hotmail.com', '20-35715935-7'),
(80, 'Marina', 'Herrera', '951357753', 'marina.herrera@hotmail.com', '20-95135775-3'),
(81, 'Damian', 'Ruiz', '159753951', 'damian.ruiz@hotmail.com', '20-15975395-1'),
(82, 'Noelia', 'Reyes', '753159753', 'noelia.reyes@hotmail.com', '20-75315975-3'),
(83, 'Natalia', 'Riquelme', '951753159', 'natalia.riquelme@hotmail.com', '20-95175315-9'),
(84, 'Ricardo', 'Leiva', '159357951', 'ricardo.leiva@hotmail.com', '20-15935795-1'),
(85, 'Carmen', 'Castro', '753951357', 'carmen.castro@hotmail.com', '20-75395135-7'),
(86, 'Mario', 'Gomez', '357159357', 'mario.gomez@hotmail.com', '20-35715935-7'),
(87, 'Luciana', 'Ramos', '951753951', 'luciana.ramos@hotmail.com', '20-95175395-1'),
(88, 'Federico', 'Vargas', '159357357', 'federico.vargas@hotmail.com', '20-15935735-7'),
(89, 'Elena', 'Dominguez', '753951753', 'elena.dominguez@hotmail.com', '20-75395175-3'),
(90, 'Daniel', 'Luna', '357159159', 'daniel.luna@hotmail.com', '20-35715915-9'),
(91, 'Graciela', 'Farias', '951357951', 'graciela.farias@hotmail.com', '20-95135795-1'),
(92, 'Alejandro', 'Ruiz', '159753357', 'alejandro.ruiz@hotmail.com', '20-15975335-7'),
(93, 'Marta', 'Ibanez', '753159753', 'marta.ibanez@hotmail.com', '20-75315975-3'),
(94, 'Hugo', 'Perez', '357951357', 'hugo.perez@hotmail.com', '20-35795135-7'),
(95, 'Viviana', 'Diaz', '951159753', 'viviana.diaz@hotmail.com', '20-95115975-3'),
(96, 'Lucas', 'Figueroa', '159357753', 'lucas.figueroa@hotmail.com', '20-15935775-3'),
(97, 'Paula', 'Franco', '753951357', 'paula.franco@hotmail.com', '20-75395135-7'),
(98, 'Ignacio', 'Saenz', '357159753', 'ignacio.saenz@hotmail.com', '20-35715975-3'),
(99, 'Eva', 'Ledesma', '951357951', 'eva.ledesma@hotmail.com', '20-95135795-1'),
(100, 'Nicolas', 'Torres', '159753159', 'nicolas.torres@hotmail.com', '20-15975315-9');

-- Insertar datos en Conductores
INSERT INTO Conductores (Nombre, Apellido, Telefono, Email) VALUES
('Mario', 'Gonzalez', '123123123', 'mario.gonzalez@gmail.com'),
('Paula', 'Hernandez', '321321321', 'paula.hernandez@gmail.com'),
('Andres', 'Gutierrez', '456456456', 'andres.gutierrez@gmail.com'),
('Claudia', 'Jimenez', '789789789', 'claudia.jimenez@gmail.com'),
('Fernando', 'Morales', '147147147', 'fernando.morales@gmail.com'),
('Natalia', 'Rojas', '258258258', 'natalia.rojas@gmail.com'),
('Ricardo', 'Cruz', '369369369', 'ricardo.cruz@gmail.com'),
('Valeria', 'Ortiz', '159159159', 'valeria.ortiz@gmail.com'),
('Diego', 'Medina', '753753753', 'diego.medina@gmail.com'),
('Monica', 'Chavez', '951951951', 'monica.chavez@gmail.com');

-- Insertar datos en Tarifas
INSERT INTO Tarifas (Descripcion, Precio_Kilometro) VALUES 
('Tarifa Básica', 10.00),
('Tarifa Nocturna', 12.00),
('Tarifa Festivos', 15.00),
('Tarifa Larga Distancia', 8.00),
('Tarifa Especial', 20.00),
('Tarifa Económica', 7.00),
('Tarifa VIP', 25.00),
('Tarifa Fin de Semana', 13.00),
('Tarifa Madrugada', 11.00),
('Tarifa Ejecutiva', 18.00);

-- Insertar datos en Zonas
INSERT INTO Zonas (Nombre_Zona, Tarifa_Base, ID_Tarifa) VALUES 
('Zona Centro', 5.00, 1),
('Zona Norte', 6.00, 2),
('Zona Sur', 4.00, 3),
('Zona Este', 5.50, 4),
('Zona Oeste', 4.50, 5),
('Zona Alta', 6.50, 6),
('Zona Baja', 3.50, 7),
('Zona Residencial', 5.25, 8),
('Zona Comercial', 6.75, 9),
('Zona Industrial', 7.25, 10);

-- Insertar datos en Autos
INSERT INTO Autos (Patente, Marca, Modelo, ID_Conductor) VALUES 
('AA000BB', 'Toyota', 'Corolla', 1),
('CC111DD', 'Chevrolet', 'Corsa', 2),
('EE222FF', 'Ford', 'Focus', 3),
('GG333HH', 'Fiat', 'Cronos', 4),
('II444JJ', 'Fiat', 'Siena', 5),
('KK555LL', 'Renault', 'Logan', 6),
('MM666NN', 'Fiat', 'Mobi', 7),
('OO777PP', 'Chevrolet', 'Joy', 8),
('QQ888RR', 'Renault', 'Kwid', 9),
('SS999TT', 'Fiat', 'Palio', 10);

-- Insertar datos en Rutas
INSERT INTO Rutas (Origen, Destino, Distancia_Km) VALUES 
('Plaza Mayor', 'Estación Central', 5.0),
('Aeropuerto', 'Hotel Hilton', 12.5),
('Universidad', 'Centro Comercial', 7.8),
('Parque Principal', 'Museo de Arte', 3.6),
('Hospital General', 'Biblioteca', 8.2),
('Estadio', 'Terminal de Colectivos', 10.0),
('Teatro Nacional', 'Casa de Gobierno', 4.3),
('Zoológico', 'Jardín Botánico', 6.7),
('Catedral', 'Mercado Central', 2.9),
('Centro de Convenciones', 'Playas', 15.0);

-- Insertar datos en Ofertas
INSERT INTO Ofertas (Descripcion, Descuento, Fecha_Inicio, Fecha_Fin) VALUES 
('Descuento Verano', 10.00, '2023-06-01', '2023-08-31'),
('Oferta Especial Navidad', 20.00, '2023-12-01', '2023-12-31'),
('Promoción Fin de Año', 15.00, '2023-12-25', '2024-01-01'),
('Descuento por Fidelidad', 5.00, '2023-01-01', '2023-12-31'),
('Oferta Semana Santa', 12.00, '2023-04-10', '2023-04-17'),
('Descuento Primavera', 8.00, '2023-09-21', '2023-12-21'),
('Promoción Aniversario', 18.00, '2023-07-15', '2023-07-22'),
('Descuento Black Friday', 25.00, '2023-11-24', '2023-11-25'),
('Oferta San Valentín', 14.00, '2023-02-14', '2023-02-14'),
('Descuento por Referencia', 10.00, '2023-01-01', '2023-12-31');

USE proyecto_remiseria;
-- Insertar datos en Reservas
INSERT INTO Reservas (ID_Cliente, ID_Auto, ID_Zona, ID_Tarifa, ID_Ruta, ID_Oferta, ID_Conductor, Fecha_Hora, Origen, Destino) VALUES
(1, 1, 1, 1, 1, 1, 1, '2023-01-01 12:00:00', 'Plaza Mayor', 'Estación Central'),
(2, 2, 2, 2, 2, 2, 2, '2023-01-02 13:00:00', 'Aeropuerto', 'Hotel Hilton'),
(3, 3, 3, 3, 3, 3, 3, '2023-01-03 14:00:00', 'Universidad', 'Centro Comercial'),
(4, 4, 4, 4, 4, 4, 4, '2023-01-04 15:00:00', 'Parque Principal', 'Museo de Arte'),
(5, 5, 5, 5, 5, 5, 5, '2023-01-05 16:00:00', 'Hospital General', 'Biblioteca'),
(6, 6, 6, 6, 6, 6, 6, '2023-01-06 17:00:00', 'Estadio', 'Terminal de Colectivos'),
(7, 7, 7, 7, 7, 7, 7, '2023-01-07 18:00:00', 'Teatro Nacional', 'Casa de Gobierno'),
(8, 8, 8, 8, 8, 8, 8, '2023-01-08 19:00:00', 'Zoológico', 'Jardín Botánico'),
(9, 9, 9, 9, 9, 9, 9, '2023-01-09 20:00:00', 'Catedral', 'Mercado Central'),
(10, 10, 10, 10, 10, 10, 10, '2023-01-10 21:00:00', 'Centro de Convenciones', 'Playas'),
(11, 1, 1, 1, 2, 1, 2, '2023-01-11 22:00:00', 'Plaza Mayor', 'Estación Central'),
(12, 2, 2, 2, 3, 2, 3, '2023-01-12 23:00:00', 'Aeropuerto', 'Hotel Hilton'),
(13, 3, 3, 3, 4, 3, 4, '2023-01-13 00:00:00', 'Universidad', 'Centro Comercial'),
(14, 4, 4, 4, 5, 4, 5, '2023-01-14 01:00:00', 'Parque Principal', 'Museo de Arte'),
(15, 5, 5, 5, 6, 5, 6, '2023-01-15 02:00:00', 'Hospital General', 'Biblioteca'),
(16, 6, 6, 6, 7, 6, 7, '2023-01-16 03:00:00', 'Estadio', 'Terminal de Colectivos'),
(17, 7, 7, 7, 8, 7, 8, '2023-01-17 04:00:00', 'Teatro Nacional', 'Casa de Gobierno'),
(18, 8, 8, 8, 9, 8, 9, '2023-01-18 05:00:00', 'Zoológico', 'Jardín Botánico'),
(19, 9, 9, 9, 10, 9, 10, '2023-01-19 06:00:00', 'Catedral', 'Mercado Central'),
(20, 10, 10, 10, 1, 10, 1, '2023-01-20 07:00:00', 'Centro de Convenciones', 'Playas'),
(1, 1, 1, 1, 2, 1, 2, '2023-01-21 08:00:00', 'Plaza Mayor', 'Estación Central'),
(2, 2, 2, 2, 3, 2, 3, '2023-01-22 09:00:00', 'Aeropuerto', 'Hotel Hilton'),
(3, 3, 3, 3, 4, 3, 4, '2023-01-23 10:00:00', 'Universidad', 'Centro Comercial'),
(4, 4, 4, 4, 5, 4, 5, '2023-01-24 11:00:00', 'Parque Principal', 'Museo de Arte'),
(5, 5, 5, 5, 6, 5, 6, '2023-01-25 12:00:00', 'Hospital General', 'Biblioteca'),
(6, 6, 6, 6, 7, 6, 7, '2023-01-26 13:00:00', 'Estadio', 'Terminal de Colectivos'),
(7, 7, 7, 7, 8, 7, 8, '2023-01-27 14:00:00', 'Teatro Nacional', 'Casa de Gobierno'),
(8, 8, 8, 8, 9, 8, 9, '2023-01-28 15:00:00', 'Zoológico', 'Jardín Botánico'),
(9, 9, 9, 9, 10, 9, 10, '2023-01-29 16:00:00', 'Catedral', 'Mercado Central'),
(10, 10, 10, 10, 1, 10, 1, '2023-01-30 17:00:00', 'Centro de Convenciones', 'Playas'),
(11, 1, 1, 1, 2, 1, 2, '2023-02-01 18:00:00', 'Plaza Mayor', 'Estación Central'),
(12, 2, 2, 2, 3, 2, 3, '2023-02-02 19:00:00', 'Aeropuerto', 'Hotel Hilton'),
(13, 3, 3, 3, 4, 3, 4, '2023-02-03 20:00:00', 'Universidad', 'Centro Comercial'),
(14, 4, 4, 4, 5, 4, 5, '2023-02-04 21:00:00', 'Parque Principal', 'Museo de Arte'),
(15, 5, 5, 5, 6, 5, 6, '2023-02-05 22:00:00', 'Hospital General', 'Biblioteca'),
(16, 6, 6, 6, 7, 6, 7, '2023-02-06 23:00:00', 'Estadio', 'Terminal de Colectivos'),
(17, 7, 7, 7, 8, 7, 8, '2023-02-07 00:00:00', 'Teatro Nacional', 'Casa de Gobierno'),
(18, 8, 8, 8, 9, 8, 9, '2023-02-08 01:00:00', 'Zoológico', 'Jardín Botánico'),
(19, 9, 9, 9, 10, 9, 10, '2023-02-09 02:00:00', 'Catedral', 'Mercado Central'),
(20, 10, 10, 10, 1, 10, 1, '2023-02-10 03:00:00', 'Centro de Convenciones', 'Playas'),
(1, 1, 1, 1, 2, 1, 2, '2023-02-11 04:00:00', 'Plaza Mayor', 'Estación Central'),
(2, 2, 2, 2, 3, 2, 3, '2023-02-12 05:00:00', 'Aeropuerto', 'Hotel Hilton'),
(3, 3, 3, 3, 4, 3, 4, '2023-02-13 06:00:00', 'Universidad', 'Centro Comercial'),
(4, 4, 4, 4, 5, 4, 5, '2023-02-14 07:00:00', 'Parque Principal', 'Museo de Arte'),
(5, 5, 5, 5, 6, 5, 6, '2023-02-15 08:00:00', 'Hospital General', 'Biblioteca'),
(6, 6, 6, 6, 7, 6, 7, '2023-02-16 09:00:00', 'Estadio', 'Terminal de Colectivos'),
(7, 7, 7, 7, 8, 7, 8, '2023-02-17 10:00:00', 'Teatro Nacional', 'Casa de Gobierno'),
(8, 8, 8, 8, 9, 8, 9, '2023-02-18 11:00:00', 'Zoológico', 'Jardín Botánico'),
(9, 9, 9, 9, 10, 9, 10, '2023-02-19 12:00:00', 'Catedral', 'Mercado Central'),
(10, 10, 10, 10, 1, 10, 1, '2023-02-20 13:00:00', 'Centro de Convenciones', 'Playas');

-- Insertar datos en Viajes
INSERT INTO Viajes (ID_Reserva, ID_Oferta, Fecha_Hora_Inicio, Fecha_Hora_Fin, Kilometraje) VALUES 
(1, 1, '2024-07-23 10:00:00', '2024-07-23 10:30:00', 5.0),
(2, 2, '2024-07-23 11:00:00', '2024-07-23 11:45:00', 12.5),
(3, 3, '2024-07-23 12:00:00', '2024-07-23 12:35:00', 7.8),
(4, 4, '2024-07-23 13:00:00', '2024-07-23 13:20:00', 3.6),
(5, 5, '2024-07-23 14:00:00', '2024-07-23 14:50:00', 8.2),
(6, 6, '2024-07-23 15:00:00', '2024-07-23 15:40:00', 10.0),
(7, 7, '2024-07-23 16:00:00', '2024-07-23 16:25:00', 4.3),
(8, 8, '2024-07-23 17:00:00', '2024-07-23 17:35:00', 6.7),
(9, 9, '2024-07-23 18:00:00', '2024-07-23 18:20:00', 2.9),
(10, 10, '2024-07-23 19:00:00', '2024-07-23 20:00:00', 15.0);

-- Insertar datos en Pagos
INSERT INTO Pagos (ID_Reserva, ID_Cliente, Fecha_Pago, Monto, Metodo_Pago) VALUES 
(1, 1, '2024-07-23 10:30:00', 50.00, 'Efectivo'),
(2, 2, '2024-07-23 11:45:00', 125.00, 'Tarjeta de Crédito'),
(3, 3, '2024-07-23 12:35:00', 78.00, 'Tarjeta de Débito'),
(4, 4, '2024-07-23 13:20:00', 36.00, 'Efectivo'),
(5, 5, '2024-07-23 14:50:00', 82.00, 'Transferencia Bancaria'),
(6, 6, '2024-07-23 15:40:00', 100.00, 'Tarjeta de Crédito'),
(7, 7, '2024-07-23 16:25:00', 43.00, 'Efectivo'),
(8, 8, '2024-07-23 17:35:00', 67.00, 'Tarjeta de Débito'),
(9, 9, '2024-07-23 18:20:00', 29.00, 'Efectivo'),
(10, 10, '2024-07-23 20:00:00', 150.00, 'Tarjeta de Crédito');

-- Insertar datos en Mantenimiento
INSERT INTO Mantenimiento (ID_Auto, Fecha, Descripcion, Costo) VALUES 
(1, '2024-06-01', 'Cambio de aceite', 50.00),
(2, '2024-06-05', 'Revisión de frenos', 75.00),
(3, '2024-06-10', 'Cambio de neumáticos', 200.00),
(4, '2024-06-15', 'Revisión general', 150.00),
(5, '2024-06-20', 'Cambio de filtros', 60.00),
(6, '2024-06-25', 'Alineación y balanceo', 80.00),
(7, '2024-06-30', 'Reparación de motor', 300.00),
(8, '2024-07-05', 'Cambio de batería', 100.00),
(9, '2024-07-10', 'Revisión de suspensión', 120.00),
(10, '2024-07-15', 'Reparación de transmisión', 250.00);

-- Insertar datos en Multas
INSERT INTO Multas (ID_Conductor, Fecha, Descripcion, Monto) VALUES 
(1, '2024-05-01', 'Exceso de velocidad', 100.00),
(2, '2024-05-05', 'Estacionamiento indebido', 50.00),
(3, '2024-05-10', 'Conducir sin cinturón', 75.00),
(4, '2024-05-15', 'Pasar semáforo en rojo', 150.00),
(5, '2024-05-20', 'Uso del celular', 80.00),
(6, '2024-05-25', 'Conducir ebrio', 500.00),
(7, '2024-05-30', 'No respetar señal de alto', 90.00),
(8, '2024-06-05', 'Conducir sin licencia', 200.00),
(9, '2024-06-10', 'Exceso de velocidad', 100.00),
(10, '2024-06-15', 'Pasar semáforo en rojo', 150.00);

-- Insertar datos en Seguros
INSERT INTO Seguros (ID_Auto, Empresa, Poliza, Fecha_Vencimiento) VALUES 
(1, 'Seguro S.A.', 'ABC123', '2024-12-31'),
(2, 'Aseguradora XYZ', 'DEF456', '2024-11-30'),
(3, 'Protección Total', 'GHI789', '2024-10-31'),
(4, 'Cobertura Integral', 'JKL012', '2024-09-30'),
(5, 'Seguro Premium', 'MNO345', '2024-08-31'),
(6, 'Asegura Fácil', 'PQR678', '2024-07-31'),
(7, 'Seguridad Completa', 'STU901', '2024-06-30'),
(8, 'Cobertura Básica', 'VWX234', '2024-05-31'),
(9, 'Aseguradora Alfa', 'YZA567', '2024-04-30'),
(10, 'Seguros Beta', 'BCD890', '2024-03-31');

-- Insertar datos en Comentarios
INSERT INTO Comentarios (ID_Cliente, ID_Conductor, Comentario, Fecha_Comentario) VALUES 
(1, 1, 'Excelente servicio, muy puntual.', '2024-07-23 10:30:00'),
(2, 1, 'Conductor muy amable.', '2024-07-23 11:45:00'),
(3, 1, 'El auto estaba limpio y en buen estado.', '2024-07-23 12:35:00'),
(4, 1, 'Muy buena experiencia.', '2024-07-23 13:20:00'),
(5, 1, 'Recomendado.', '2024-07-23 14:50:00'),
(6, 1, 'Todo perfecto pero no fue puntual.', '2024-07-23 15:40:00'),
(7, 1, 'Muy buen servicio.', '2024-07-23 16:25:00'),
(8, 1, 'Conductor muy profesional.', '2024-07-23 17:35:00'),
(9, 1, 'Muy satisfecho con el viaje.', '2024-07-23 18:20:00'),
(10, 1, 'Excelente.', '2024-07-23 20:00:00'),
(11, 2, 'Excelente servicio, muy puntual.', '2024-07-23 10:30:00'),
(12, 2, 'Conductor muy amable.', '2024-07-23 11:45:00'),
(13, 2, 'El auto estaba limpio y en buen estado.', '2024-07-23 12:35:00'),
(14, 2, 'Muy buena experiencia.', '2024-07-23 13:20:00'),
(15, 2, 'Recomendado.', '2024-07-23 14:50:00'),
(16, 2, 'Todo perfecto pero no fue puntual.', '2024-07-23 15:40:00'),
(17, 2, 'Muy buen servicio.', '2024-07-23 16:25:00'),
(18, 2, 'Conductor muy profesional.', '2024-07-23 17:35:00'),
(19, 2, 'Muy satisfecho con el viaje.', '2024-07-23 18:20:00'),
(20, 2, 'Excelente.', '2024-07-23 20:00:00'),
(21, 3, 'Excelente servicio, muy puntual.', '2024-07-23 10:30:00'),
(22, 3, 'Conductor muy amable.', '2024-07-23 11:45:00'),
(23, 3, 'El auto estaba limpio y en buen estado.', '2024-07-23 12:35:00'),
(24, 3, 'Muy buena experiencia.', '2024-07-23 13:20:00'),
(25, 3, 'Recomendado.', '2024-07-23 14:50:00'),
(26, 3, 'Todo perfecto pero no fue puntual.', '2024-07-23 15:40:00'),
(27, 3, 'Muy buen servicio.', '2024-07-23 16:25:00'),
(28, 3, 'Conductor muy profesional.', '2024-07-23 17:35:00'),
(29, 3, 'Muy satisfecho con el viaje.', '2024-07-23 18:20:00'),
(30, 3, 'Excelente.', '2024-07-23 20:00:00'),
(31, 4, 'Excelente servicio, muy puntual.', '2024-07-23 10:30:00'),
(32, 4, 'Conductor muy amable.', '2024-07-23 11:45:00'),
(33, 4, 'El auto estaba limpio y en buen estado.', '2024-07-23 12:35:00'),
(34, 4, 'Muy buena experiencia.', '2024-07-23 13:20:00'),
(35, 4, 'Recomendado.', '2024-07-23 14:50:00'),
(36, 4, 'Todo perfecto pero no fue puntual.', '2024-07-23 15:40:00'),
(37, 4, 'Muy buen servicio.', '2024-07-23 16:25:00'),
(38, 4, 'Conductor muy profesional.', '2024-07-23 17:35:00'),
(39, 4, 'Muy satisfecho con el viaje.', '2024-07-23 18:20:00'),
(40, 4, 'Excelente.', '2024-07-23 20:00:00'),
(41, 5, 'Excelente servicio, muy puntual.', '2024-07-23 10:30:00'),
(42, 5, 'Conductor muy amable.', '2024-07-23 11:45:00'),
(43, 5, 'El auto estaba limpio y en buen estado.', '2024-07-23 12:35:00'),
(44, 5, 'Muy buena experiencia.', '2024-07-23 13:20:00'),
(45, 5, 'Recomendado.', '2024-07-23 14:50:00'),
(46, 5, 'Todo perfecto pero no fue puntual.', '2024-07-23 15:40:00'),
(47, 5, 'Muy buen servicio.', '2024-07-23 16:25:00'),
(48, 5, 'Conductor muy profesional.', '2024-07-23 17:35:00'),
(49, 5, 'Muy satisfecho con el viaje.', '2024-07-23 18:20:00'),
(50, 5, 'Excelente.', '2024-07-23 20:00:00'),
(51, 6, 'Excelente servicio, muy puntual.', '2024-07-23 10:30:00'),
(52, 6, 'Conductor muy amable.', '2024-07-23 11:45:00'),
(53, 6, 'El auto estaba limpio y en buen estado.', '2024-07-23 12:35:00'),
(54, 6, 'Muy buena experiencia.', '2024-07-23 13:20:00'),
(55, 6, 'Recomendado.', '2024-07-23 14:50:00'),
(56, 6, 'Todo perfecto pero no fue puntual.', '2024-07-23 15:40:00'),
(57, 6, 'Muy buen servicio.', '2024-07-23 16:25:00'),
(58, 6, 'Conductor muy profesional.', '2024-07-23 17:35:00'),
(59, 6, 'Muy satisfecho con el viaje.', '2024-07-23 18:20:00'),
(60, 6, 'Excelente.', '2024-07-23 20:00:00'),
(61, 7, 'Excelente servicio, muy puntual.', '2024-07-23 10:30:00'),
(62, 7, 'Conductor muy amable.', '2024-07-23 11:45:00'),
(63, 7, 'El auto estaba limpio y en buen estado.', '2024-07-23 12:35:00'),
(64, 7, 'Muy buena experiencia.', '2024-07-23 13:20:00'),
(65, 7, 'Recomendado.', '2024-07-23 14:50:00'),
(66, 7, 'Todo perfecto pero no fue puntual.', '2024-07-23 15:40:00'),
(67, 7, 'Muy buen servicio.', '2024-07-23 16:25:00'),
(68, 7, 'Conductor muy profesional.', '2024-07-23 17:35:00'),
(69, 7, 'Muy satisfecho con el viaje.', '2024-07-23 18:20:00'),
(70, 7, 'Excelente.', '2024-07-23 20:00:00'),
(71, 8, 'Excelente servicio, muy puntual.', '2024-07-23 10:30:00'),
(72, 8, 'Conductor muy amable.', '2024-07-23 11:45:00'),
(73, 8, 'El auto estaba limpio y en buen estado.', '2024-07-23 12:35:00'),
(74, 8, 'Muy buena experiencia.', '2024-07-23 13:20:00'),
(75, 8, 'Recomendado.', '2024-07-23 14:50:00'),
(76, 8, 'Todo perfecto pero no fue puntual.', '2024-07-23 15:40:00'),
(77, 8, 'Muy buen servicio.', '2024-07-23 16:25:00'),
(78, 8, 'Conductor muy profesional.', '2024-07-23 17:35:00'),
(79, 8, 'Muy satisfecho con el viaje.', '2024-07-23 18:20:00'),
(80, 8, 'Excelente.', '2024-07-23 20:00:00'),
(81, 9, 'Excelente servicio, muy puntual.', '2024-07-23 10:30:00'),
(82, 9, 'Conductor muy amable.', '2024-07-23 11:45:00'),
(83, 9, 'El auto estaba limpio y en buen estado.', '2024-07-23 12:35:00'),
(84, 9, 'Muy buena experiencia.', '2024-07-23 13:20:00'),
(85, 9, 'Recomendado.', '2024-07-23 14:50:00'),
(86, 9, 'Todo perfecto pero no fue puntual.', '2024-07-23 15:40:00'),
(87, 9, 'Muy buen servicio.', '2024-07-23 16:25:00'),
(88, 9, 'Conductor muy profesional.', '2024-07-23 17:35:00'),
(89, 9, 'Muy satisfecho con el viaje.', '2024-07-23 18:20:00'),
(90, 9, 'Excelente.', '2024-07-23 20:00:00'),
(91, 10, 'Excelente servicio, muy puntual.', '2024-07-23 10:30:00'),
(92, 10, 'Conductor muy amable.', '2024-07-23 11:45:00'),
(93, 10, 'El auto estaba limpio y en buen estado.', '2024-07-23 12:35:00'),
(94, 10, 'Muy buena experiencia.', '2024-07-23 13:20:00'),
(95, 10, 'Recomendado.', '2024-07-23 14:50:00'),
(96, 10, 'Todo perfecto pero no fue puntual.', '2024-07-23 15:40:00'),
(97, 10, 'Muy buen servicio.', '2024-07-23 16:25:00'),
(98, 10, 'Conductor muy profesional.', '2024-07-23 17:35:00'),
(99, 10, 'Muy satisfecho con el viaje.', '2024-07-23 18:20:00'),
(100, 10, 'Excelente.', '2024-07-23 20:00:00');

-- Insertar datos en Historial_Precios
INSERT INTO Historial_Precios (ID_Tarifa, Fecha, Precio) VALUES 
(1, '2024-01-01', 10.00),
(2, '2024-02-01', 12.00),
(3, '2024-03-01', 15.00),
(4, '2024-04-01', 8.00),
(5, '2024-05-01', 20.00),
(6, '2024-06-01', 7.00),
(7, '2024-07-01', 25.00),
(8, '2024-08-01', 13.00),
(9, '2024-09-01', 11.00),
(10, '2024-10-01', 18.00);


-- VISTAS
-- VISTA - TABLA AUTOS
USE proyecto_remiseria;

-- VISTA - TABLA AUTOS
CREATE OR REPLACE VIEW
	proyecto_remiseria.vista_autos
	AS (
	SELECT
		a.Patente
    ,	a.ID_Conductor
    ,	c.Nombre AS Nombre_Conductor
    ,	c.Apellido AS Apellido_Conductor
    FROM proyecto_remiseria.autos a
    JOIN proyecto_remiseria.conductores c ON a.ID_Conductor = c.ID_Conductor
	LIMIT 100
);


-- VISTA - TABLA CLIENTES
CREATE OR REPLACE VIEW proyecto_remiseria.vista_clientes AS
(
    SELECT
        c.Nombre,
        c.Apellido,
        c.Telefono,
        c.Cuil,
        r.Origen,
        r.Destino,
        r.Fecha_Hora
    FROM
        proyecto_remiseria.clientes c
    LEFT JOIN
        proyecto_remiseria.reservas r
    ON
        c.ID_Cliente = r.ID_Cliente
    LIMIT 100
);


-- VISTA - TABLA COMENTARIOS
CREATE OR REPLACE VIEW
	proyecto_remiseria.vista_comentarios
	AS (
	SELECT
		co.Comentario
	,	cl.Nombre AS Nombre_Cliente
	,	cl.Apellido AS Apellido_Cliente
	,	con.Nombre AS Nombre_Conductor
	,	con.Apellido AS Apellido_Conductor
    FROM proyecto_remiseria.comentarios co
    JOIN proyecto_remiseria.clientes cl ON co.ID_Cliente = cl.ID_Cliente
    JOIN proyecto_remiseria.conductores con ON co.ID_Conductor = con.ID_Conductor
	LIMIT 100
);


-- VISTA - TABLA CONDUCTORES
CREATE OR REPLACE VIEW proyecto_remiseria.vista_conductores AS
(
    SELECT
        c.Nombre,
        c.Apellido,
        c.Telefono,
        a.Patente,
        a.Marca,
        a.Modelo
    FROM
        proyecto_remiseria.conductores c
    LEFT JOIN
        proyecto_remiseria.autos a
    ON
        c.ID_Conductor = a.ID_Conductor
    LIMIT 100
);


-- VISTA - TABLA RESERVAS
CREATE OR REPLACE VIEW
	proyecto_remiseria.vista_reservas
	AS (
	SELECT
		r.Origen
	,	r.Destino
    ,	r.Fecha_Hora
	,	cl.Nombre AS Nombre_Cliente
	,	cl.Apellido AS Apellido_Cliente
	,	con.Nombre AS Nombre_Conductor
	,	con.Apellido AS Apellido_Conductor
    FROM proyecto_remiseria.reservas r
	JOIN proyecto_remiseria.clientes cl ON r.ID_Cliente = cl.ID_Cliente
	JOIN proyecto_remiseria.conductores con ON r.ID_Conductor = con.ID_Conductor
	LIMIT 100
);


-- VISTA - TABLA RUTAS
CREATE OR REPLACE VIEW proyecto_remiseria.vista_rutas AS
(
    SELECT
        r.Origen,
        r.Destino,
        r.Distancia_Km,
        res.Fecha_Hora,
        res.ID_Cliente
    FROM
        proyecto_remiseria.rutas r
    LEFT JOIN
        proyecto_remiseria.reservas res
    ON
        r.Origen = res.Origen AND
        r.Destino = res.Destino
    LIMIT 100
);


-- STORED PROCEDURES
-- PARA OBTENER INFO DE RESERVAS FILTRADAS POR NOMBRE Y APELLIDO DEL CONDUCTOR
USE proyecto_remiseria;

DELIMITER //

CREATE PROCEDURE ObtenerReservasPorConductor (
    IN p_NombreConductor VARCHAR(50),
    IN p_ApellidoConductor VARCHAR(50)
)
BEGIN
    SELECT r.ID_Reserva, r.ID_Cliente, r.ID_Auto, r.ID_Zona, r.ID_Tarifa, r.ID_Ruta, r.ID_Oferta, r.Fecha_Hora, r.Origen, r.Destino
    FROM Reservas r
    JOIN Autos a ON r.ID_Auto = a.ID_Auto
    JOIN Conductores c ON a.ID_Conductor = c.ID_Conductor
    WHERE c.Nombre = p_NombreConductor AND c.Apellido = p_ApellidoConductor;
END //

DELIMITER ;

CALL ObtenerReservasPorConductor('Valeria', 'Ortiz');
CALL ObtenerReservasPorConductor('Claudia', 'Jimenez');


-- PARA AGREGAR CLIENTES

DELIMITER //

CREATE PROCEDURE AgregarCliente(
    IN p_Nombre VARCHAR(200),
    IN p_Apellido VARCHAR(200),
    IN p_Telefono VARCHAR(200),
    IN p_Email VARCHAR(200),
    IN p_Cuil VARCHAR(20)
)
BEGIN
    INSERT INTO Clientes (Nombre, Apellido, Telefono, Email, Cuil)
    VALUES (p_Nombre, p_Apellido, p_Telefono, p_Email, p_Cuil);
END //

DELIMITER ;

CALL AgregarCliente(
    'Rodrigo',             -- p_Nombre
    'Nunez',            -- p_Apellido
    '3541625879',       -- p_Telefono
    'rodrigo.nunez@gmail.com',  -- p_Email
    '20-43924708-9' -- p_Cuil
);

SELECT * FROM Clientes
WHERE Cuil = '20-43924708-9';


-- FUNCIONES
-- FUNCION PARA OBTENER EL NÚMERO TOTAL DE VIAJES REALIZADOS POR UN CONDUCTOR
USE proyecto_remiseria;

DELIMITER //
CREATE FUNCTION total_viajes_conductor(
    p_Nombre_Conductor VARCHAR(50),
    p_Apellido_Conductor VARCHAR(50)
)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_Total INT;

    SELECT COUNT(V.ID_Viaje) INTO v_Total
    FROM Viajes V
    JOIN Reservas R ON V.ID_Reserva = R.ID_Reserva
    JOIN Autos A ON R.ID_Auto = A.ID_Auto
    JOIN Conductores Co ON A.ID_Conductor = Co.ID_Conductor
    WHERE Co.Nombre = p_Nombre_Conductor
      AND Co.Apellido = p_Apellido_Conductor;

    RETURN IFNULL(v_Total, 0);
END //
DELIMITER ;

SELECT total_viajes_conductor('Ricardo', 'Cruz');


-- FUNCIÓN PARA OBTENER EL NÚMERO TOTAL DE COMENTARIOS RECIBIDOS POR UN CONDUCTOR
USE proyecto_remiseria;

DELIMITER //
CREATE FUNCTION total_comentarios_conductor(
    p_Nombre_Conductor VARCHAR(50),
    p_Apellido_Conductor VARCHAR(50)
)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_Total INT;

    SELECT COUNT(C.ID_Comentario) INTO v_Total
    FROM Comentarios C
    JOIN Conductores Co ON C.ID_Conductor = Co.ID_Conductor
    WHERE Co.Nombre = p_Nombre_Conductor
      AND Co.Apellido = p_Apellido_Conductor;

    RETURN IFNULL(v_Total, 0);
END //
DELIMITER ;


SELECT total_comentarios_conductor('Diego', 'Medina');


-- TRIGGERS
-- Trigger para la tabla Clientes

DELIMITER //

CREATE TRIGGER unique_client_email
BEFORE INSERT ON Clientes
FOR EACH ROW
BEGIN
    DECLARE email_count INT;

    SELECT COUNT(*)
    INTO email_count
    FROM Clientes
    WHERE Email = NEW.Email;

    IF email_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El email ya está en uso.';
    END IF;
END //

DELIMITER ;


-- Trigger para la tabla Pagos

DELIMITER //

CREATE TRIGGER check_pago_monto
BEFORE INSERT ON Pagos
FOR EACH ROW
BEGIN
    IF NEW.Monto < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El monto del pago no puede ser negativo.';
    END IF;
END //

DELIMITER ;