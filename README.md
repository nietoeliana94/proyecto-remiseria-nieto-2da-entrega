# PRESENTACIÓN DE BASES DE DATOS PARA UNA REMISERÍA
## Segunda entrega

Alumna: Nieto Eliana

Comisión: 57190

Profesor: Anderson Ocaña

Tutor: Leonel Lo Presi

## VISTAS
![image](https://github.com/user-attachments/assets/6600c126-3e06-4832-90af-a45fc7adaa42)

### 1. Vista: vista_autos
#### Descripción:
Esta vista muestra información de los autos junto con el nombre y apellido del conductor asignado.
#### Objetivo:
Esta vista tiene como objetivo proporcionar una lista de autos con sus respectivos conductores, que será útil para consultar qué conductor está asignado a cada auto.
#### Tablas que la componen:
* proyecto_remiseria.autos
* proyecto_remiseria.conductores

### Script

![image](https://github.com/user-attachments/assets/dd4a4801-ac09-43a2-b4c6-37f0362aa30e)

### 2. Vista: vista_clientes
#### Descripción:
Esta vista muestra información de los clientes junto con los detalles de sus reservas si las hay.
### Objetivo:
Esta vista tiene como objetivo proporcionar una lista de clientes con sus datos de contacto y sus reservas, que será útil para analizar el comportamiento y las preferencias de los clientes.
### Tablas que la componen:
* proyecto_remiseria.clientes
* proyecto_remiseria.reservas

### Script

![image](https://github.com/user-attachments/assets/bf3fc956-0a81-4eaf-94db-16237dc83b15)

### 3. Vista: vista_comentarios
#### Descripción:
Esta vista muestra los comentarios hechos por los clientes, junto con los nombres y apellidos de los clientes y conductores involucrados.
#### Objetivo:
Esta vista tiene como objetivo proporcionar una lista de comentarios con información sobre los clientes y conductores, que será útil para el análisis de feedback y la mejora del servicio.
### Tablas que la componen:
* proyecto_remiseria.comentarios
* proyecto_remiseria.clientes
* proyecto_remiseria.conductores

### Script

![image](https://github.com/user-attachments/assets/48c65906-4adc-4948-a368-53461f0bbc40)

### 4. Vista: vista_conductores
#### Descripción:
Esta vista muestra información de los conductores junto con los detalles del auto que manejan (si tienen uno asignado).
#### Objetivo:
Esta vista tiene como objetivo brindar una lista de conductores con sus datos de contacto y los autos que manejan, que servirá para la gestión de conductores y asignación de vehículos.
### Tablas que la componen:
* proyecto_remiseria.conductores
* proyecto_remiseria.autos

### Script
![image](https://github.com/user-attachments/assets/2f6a5f40-6d53-42ca-9ea0-736f92b938c5)

### 5. Vista: vista_reservas
#### Descripción:
Esta vista muestra información de las reservas, incluyendo el origen, destino y fecha/hora, los nombres y apellidos de los clientes y conductores.
#### Objetivo:
Esta vista tiene como objetivo brindar una lista de reservas con información completa sobre los clientes y conductores involucrados, que servirá para el seguimiento y análisis de reservas.

### Tablas que la componen:
* proyecto_remiseria.reservas
* proyecto_remiseria.clientes
* proyecto_remiseria.conductores

### Script
![image](https://github.com/user-attachments/assets/53ceb6f4-dc90-4882-9619-314b32ee1b3e)

### 6. Vista: vista_rutas
#### Descripción:
Esta vista muestra las rutas disponibles, incluyendo el origen, destino y la distancia en kilómetros, junto con la información de las reservas que coinciden con esas rutas, como la fecha/hora de la reserva y el ID del cliente que hizo la reserva.
#### Objetivo:
Esta vista tiene como objetivo proporcionar una lista de rutas con sus detalles y las reservas asociadas, útil para analizar las rutas más comunes, su frecuencia y los clientes que las utilizan.

### Tablas que la componen:
* proyecto_remiseria.rutas
* proyecto_remiseria.reservas

### Script
![image](https://github.com/user-attachments/assets/1dd156fa-4de8-44d1-b390-cbfe50d7327a)


## FUNCIONES
![image](https://github.com/user-attachments/assets/21deb637-0c14-48f3-8944-8ed419384dc1)

### 1. Función: total_viajes_conductor
#### Descripción:
Esta función calcula el total de viajes realizados por un conductor específico, identificado por su nombre y apellido.
#### Objetivo:
Esta función tiene como objetivo proporcionar un conteo del número de viajes realizados por un conductor en particular, útil para evaluaciones de rendimiento y análisis de trabajo del conductor.
#### Datos o tablas manipuladas:
* Viajes: Para obtener los viajes realizados.
* Reservas: Para enlazar los viajes con las reservas.
* Autos: Para identificar el auto utilizado en la reserva.
* Conductores: Para identificar el conductor específico.

### Script
![image](https://github.com/user-attachments/assets/af29222c-61b4-484f-97dd-0cbeb3dc1ff7)

![image](https://github.com/user-attachments/assets/9e34489c-d524-441d-98c5-9b0037d619cb)

Al ejecutar el script se muestra el total del viajes realizado por el conductor
![image](https://github.com/user-attachments/assets/ec6d609c-a3bf-4d0d-8cbd-b1103b74aaff)


### 2. Función: total_comentarios_conductor
#### Descripción:
Esta función calcula el total de comentarios recibidos por un conductor específico, identificado por su nombre y apellido.
#### Objetivo:
Esta función tiene como objetivo proporcionar un conteo del número de comentarios recibidos por un conductor en particular, útil para analizar la retroalimentación del servicio y evaluar la satisfacción del cliente con respecto al conductor.
#### Datos o tablas manipuladas:
* Comentarios: Para obtener los comentarios hechos.
* Conductores: Para identificar el conductor específico.

### Script
![image](https://github.com/user-attachments/assets/46081d7e-23f2-450f-990f-91d6b20a57ed)


## STORED PROCEDURES
![image](https://github.com/user-attachments/assets/06aca7bb-efe8-48a0-b831-a8550ccfbf02)

### 1. Stored Procedure: ObtenerReservasPorConductor
#### Descripción:
Este procedimiento recupera todas las reservas asociadas a un conductor específico, identificado por su nombre y apellido.
#### Objetivo o beneficio que aporta al proyecto:
Este procedimiento tiene como objetivo proporcionar una manera eficiente de consultar todas las reservas realizadas por un conductor en particular. Esto facilita la gestión y análisis del trabajo del conductor, permitiendo a la administración evaluar la carga de trabajo y eficiencia de trabajo de los conductores.
#### Tablas que coponen y/o interactúan:
* Reservas: Proporciona la información de las reservas.
* Autos: Relaciona las reservas con los autos.
* Conductores: Identifica el conductor asociado al auto y, por ende, a las reservas.

### Script
![image](https://github.com/user-attachments/assets/feb9ca19-3742-4840-aa48-e3ed1cdcc604)

### Llamado del stored procedure
![image](https://github.com/user-attachments/assets/76bfcf25-4d03-43b4-b622-8e56f380a744)

Ejemplo: Al ejecutar el script se obtienen las reservas realizadas por los conductores Valeria Ortiz y Claudia Jimenez

![image](https://github.com/user-attachments/assets/d671db77-f057-430d-b369-cc9a74b225d1)
![image](https://github.com/user-attachments/assets/7ef00b3d-f30a-40f7-99c9-0eb718f48e82)

![image](https://github.com/user-attachments/assets/3fbd1443-701c-4451-81dc-9622dae07c0d)
![image](https://github.com/user-attachments/assets/56f155a6-715c-469a-8d8a-0021458486b5)


### 2. Stored Procedure: AgregarCliente
#### Descripción:
Este procedimiento añade un nuevo cliente a la base de datos, insertando sus datos personales como nombre, apellido, teléfono, email y CUIL.
#### Objetivo o beneficio que aporta al proyecto:
Este procedimiento tiene como objetivo automatizar y simplificar el proceso de inserción de nuevos clientes en la base de datos, asegura la consistencia de los datos ingresados, mejora la gestión de información de los clientes y facilita la integración de nuevos clientes en el sistema.
#### Tablas que coponen y/o interactúan:
* Clientes: La tabla en la que se insertan los nuevos registros de clientes.

### Script
![image](https://github.com/user-attachments/assets/1e831b3e-9365-4ead-a729-38fb554f502a)

### Llamado del stored procedure
![image](https://github.com/user-attachments/assets/fc9f2d9f-9431-4c09-a0d8-18c855ef262d)

![image](https://github.com/user-attachments/assets/1feea662-6e11-4864-99a0-86474475d698)

Al ejecutar el script, se agrega el cliente N° 101


### En esta segunda entrega, se añadieron 7 tablas nuevas a las 8 ya existentes. Por eso, se adjunta el diagrama de entidad-relación actualizado para que pueda verse cómo se relacionan todas las tablas entre sí. Actualmente las tablas quedaron relacionadas de la siguiente manera con su respectiva descripción.
![DER](https://github.com/user-attachments/assets/1750a446-cde7-4666-9b91-41b2ea67243e)

### Tablas de la 1° entrega:
### 1. Clientes
 * Almacena información básica de los clientes.
 * Atributos: ID_Cliente, Nombre, Apellido, Teléfono, Email, Cuil.

### Conductores
 * Almacena información básica de los conductores.
 * Atributos: ID_Conductor, Nombre, Apellido, Teléfono, Email.

### Autos
 * Almacena detalles de los autos, como matrícula, marca, modelo.
 * Atributos: ID_Auto, Patente, Marca, Modelo, ID_Conductor.

### Reservas
 * Registra las reservas realizadas por los clientes.
 * Atributos: ID_Reserva, ID_Cliente, ID_Auto, ID_Zona, ID_Tarifa, ID_Ruta, ID_Oferta, ID_Conductor, Fecha_Hora, Origen, Destino.

### Viajes
 * Registra los viajes realizados, incluyendo duración y kilometraje.
 * Atributos: ID_Viaje, ID_Reserva, ID_Oferta, Fecha_Hora_Inicio, Fecha_Hora_Fin, Kilometraje.

### Pagos
 * Registra los pagos realizados por los clientes.
 * Atributos: ID_Pago, ID_Reserva, ID_Cliente, Fecha_Pago, Monto, Método_Pago.

### Tarifas
 * Define tarifas por kilómetro para los viajes.
 * Atributos: ID_Tarifa, Descripción, Precio_Kilómetro

### Zonas
 * Define las zonas geográficas y sus tarifas base.
 * Atributos: ID_Zona, Nombre_Zona, Tarifa_Base, ID_Tarifa (FK)

## Tablas de la 2° entrega:
### Comentarios
 * Almacena los comentarios realizados por los clientes hacia los conductores.
 * Atributos: ID_Comentario, ID_Cliente, ID_Conductor (FK), Comentario, Fecha_Comentario.

### Historial_precios
 * Registra los cambios en los precios de las tarifas a lo largo del tiempo.
 * Atributos: ID_Historial, ID_Tarifa (FK), Fecha, Precio.

### Mantenimiento
  * Registra los mantenimientos realizados a los autos.
  * Atributos: ID_Mantenimiento, ID_Auto (FK), Fecha, Descripcion, Costo.

### Multas
 * Registra las multas impuestas a los conductores.
 * Atributos: ID_Multa, ID_Conductor (FK), Fecha, Descripcion, Monto.

### Ofertas
 * Almacena información sobre las ofertas especiales.
 * Atributos: ID_Oferta, Descripcion, Descuento, Fecha_Inicio, Fecha_Fin.

### Rutas
 * Define las rutas disponibles, incluyendo origen, destino y distancia.
 * Atributos: ID_Ruta, Origen, Destino, Distancia_Km.

### Seguros
 * Registra la información de los seguros de los autos.
 * Atributos: ID_Seguro, ID_Auto (FK), Empresa, Poliza, Fecha_Vencimiento.
