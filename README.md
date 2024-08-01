# PRESENTACIÓN DE BASES DE DATOS PARA UNA REMISERÍA
## Segunda entrega

Alumna: Nieto Eliana

Comisión: 57190

Profesor: Anderson Ocaña

Tutor: Leonel Lo Presi

## Vistas
### 1. Vista: view_marketing_vista_autos
#### Descripción:
Esta vista brinda información sobre los autos y sus conductores. Incluye la patente del auto, el identificador del conductor y los nombres y apellidos de los conductores. Así se puede ver fácilmente qué conductor está asociado con cada auto, ayudando a gestionar mejor los vehículos y sus conductores.
#### Objetivo:
Esta vista tiene como objetivo la visión rápida de la información de los autos y sus conductores, que puede ser útil para el departamento de marketing o para cualquier análisis relacionado con los autos disponibles y sus respectivos conductores.
#### Tablas Compuestas:
  * ### Autos:
        Contiene la información básica del auto, incluyendo la patente y el identificador del conductor.
  * ### Conductores:
        Contiene la información del conductor, como nombre y apellido.

![image](https://github.com/user-attachments/assets/884e6938-5901-4734-9b4d-6054f8c69f66)

### 2. Vista: view_marketing_vista_clientes
#### Descripción:
Esta vista muestra información de los clientes junto con los detalles de sus reservas, como el origen, destino y fecha de la reserva.
### Objetivo:
Esta vista tiene como objetivo proporcionar un resumen de la información de los clientes y sus reservas, útil para el marketing y la gestión de relaciones con clientes.
### Tablas Compuestas:
* ### Clientes:
      Contiene los datos personales del cliente, como nombre, apellido, teléfono y CUIL.
* ### Reservas:
      Contiene detalles sobre las reservas hechas por los clientes, incluyendo el origen, destino y la fecha de la reserva.
![image](https://github.com/user-attachments/assets/11f0dd4d-e0a9-4f9d-90df-d65321f1cc61)
