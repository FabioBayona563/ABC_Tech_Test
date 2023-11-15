# ABC_Tech_Test
### CRUD Flask - Personajes de Los Simpsons

Este proyecto implementa un CRUD (Crear, Leer, Actualizar, Eliminar) en Flask para gestionar información de personajes de Los Simpsons.

#### Descripción

La aplicación permite realizar las siguientes operaciones:

- **Listar Personajes:** Muestra una tabla con la información de todos los personajes registrados.
- **Leer Personaje:** Devuelve la información de un personaje específico según su nombre.
- **Registrar Personaje:** Permite agregar un nuevo personaje proporcionando su ID, nombre, edad, ocupación y relación.
- **Modificar Personaje:** Actualiza la información de un personaje existente.
- **Eliminar Personaje:** Elimina un personaje de la base de datos.

#### Estructura del Proyecto

- **`app.py`**: Archivo principal que contiene la lógica de la aplicación Flask.
- **`config.py`**: Archivo de configuración para diferentes entornos (desarrollo, producción, etc.).
- **`templates`**: Carpeta que contiene las plantillas HTML para renderizar las páginas.
- **`src`**: Carpeta que contiene los recursos estáticos y otros archivos relacionados con el proyecto.

#### Dependencias

- Flask: `pip install flask`
- Flask-MySQLdb: `pip install flask-mysqldb`

#### Ejecución

Asegúra tener las dependencias instaladas y luego ejecuta `app.py` para iniciar la aplicación Flask. Accede a `http://localhost:5000` en tu navegador para interactuar con el CRUD.

Pasos

- En la terminal proceda a digitar:
 cd c:\carpetaDeDlonadoDeProyecto\Python-Proyect
- Ingresar en carpetas de entornos para asegurar el uso del proyecto con las dependencias específicas 
.\env\Scripts\activate
- python .\src\app.py

#### Endpoints

- **Listar Personajes:** `GET /`
- **Leer Personaje:** `GET /Personajes/<nombre>`
- **Registrar Personaje:** `POST /Personajes`
- **Modificar Personaje:** `PUT /Personajes/<ID_Personaje>`
- **Eliminar Personaje:** `DELETE /Personajes/<ID_Personaje>`

#### Manejo de Errores

- Si se intenta registrar un personaje con un ID existente, se devuelve un mensaje de error indicando que ya existe un personaje con ese ID.
- Se ha implementado una página personalizada para manejar errores 404 (páginas no encontradas).

En este repositorio podrá encontrar la base de datos creada con MariaDB, usando PhpMyAdmin para su gestión.
