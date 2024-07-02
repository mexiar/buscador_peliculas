# Buscador de películas y series
![](https://github.com/mexiar/buscador_peliculas/blob/main/movies.jpg)

## Arquitectura de base de datos para buscador de películas y series

**Alumno:** [Alejandro Sena](https://www.linkedin.com/in/asena/)

**Comisión:** #57190

**Profesor:** Anderson M. Torres

**Tutor:** Leonel Lo Presti

<br/>

### Problema

Una publicación digital de entretenimiento enfocada en películas y series necesita obtener más data sobre los intereses de sus usuarios, para generar contenido acorde en sitio y redes. Para ello quiere desarrollar una herramienta que les permita encontrar fácilmente títulos para ver en cualquier plataforma de streaming disponible a través de una encuesta corta (género, plataforma, antigüedad), lo cual generará información sobre qué prefieren ver los usuarios al mismo tiempo que les ahorra tiempo.

<br/>

> Según datos de la empresa de investigación de mercados Nielsen, el tiempo medio que tarda alguien en encontrar algo que ver en plataformas de streaming ha aumentado a más de 10 minutos, tres más que en 2019, antes de la pandemia.

<br/>

**Puntos clave**

- **Series y películas:** esta es una tabla grande (aprox 800k registros), pero que se puede obtener de recursos gratuitos como TMDB y mantenrse actualizada por medio de su API. 
- **Búsquedas:** guarda todas las encuestas completadas por lo usuarios, para luego poder usar esta información para conocer, principalmente, los géneros y plataformas más buscados por los usuarios.
- **Actividad:** además de lo que buscan, es importante saber sobre qué títulos de los resultados les interesaron e ingresaron a ver más información (luego se puede ampliar para registrar trailers vistos, scroll para ver más contenido, plataformas visitadas, etc).

Esto nos permitirá obtener:
- Las plataformas más buscadas.
- Los géneros más buscados.
- La antigüedad más buscada.
- Los títulos que mayor interés generaron.

<br/>

### Diagrama de entidad de relación

**titulos**<br/>
Contiene todas las series y películas con su información básica.
- titulo_id (PK) INT UNIQUE INDEX
- nombre VARCHAR
- poster_url VARCHAR
- sinopsis VARCHAR
- fecha DATE
- puntaje DECIMAL

**generos**<br/>
Contiene el registro de géneros.
- genero_id (PK) INT UNIQUE INDEX
- nombre VARCHAR

**generos_en_titulos**<br/>
Contiene la relación de géneros con títulos.
- genero_en_id (PK) INT PK UNIQUE INDEX
- genero_id (FK) INT
- titulo_id (FK) INT

**actores**<br/>
Contiene el registro de actores.
- actor_id (PK) INT PK UNIQUE INDEX
- nombre VARCHAR
- foto_url VARCHAR

**actores_en_titulos**<br/>
Contiene la relación de actores que formaron parte de las series y películas con el papel que interpretaron.
- actor_en_id (PK) INT PK UNIQUE INDEX
- actor_id (FK) INT
- titulo_id (FK) INT
- papel VARCHAR

**directores**<br/>
Contiene el registro de direcetores.
- director_id (PK) INT PK UNIQUE INDEX
- nombre VARCHAR
- foto_url VARCHAR

**directores_en_titulos**<br/>
Contiene la relación de directors y títulos.
- director_en_id (PK) INT PK UNIQUE INDEX
- director_id (FK) INT
- titulo_id (FK) INT

**plataformas**<br/>
Contiene el registro de plataformas de streaming.
- plataforma_id (PK) INT PK UNIQUE INDEX
- nombre VARCHAR
- logo_url VARCHAR

**plataformas_en_titulos**<br/>
Contiene la relación de plataformas en las que se pueden ver los títulos.
- plataforma_en_id (PK) INT PK UNIQUE INDEX
- plataforma_id (FK) INT
- titulo_id (FK) INT

**antiguedad**<br/>
Contiene un registro de las antigüedades posibles que se pueden buscar.
- antiguedad_id (PK) INT PK UNIQUE INDEX
- descripcion VARCHAR
- how_old INT

**busquedas**<br/>
Guardar las opciones seleccionadas por los usuarios en cada búsqueda.
- busqueda_id (PK) INT PK UNIQUE INDEX
- genero_id (FK) INT
- plataforma_id (FK) INT
- antiguedad_id (FK) INT
- fecha TIMESTAMP

**actividad**<br/>
Lleva un registro de la actividad que realiza el usuario para luego ponderarla, actualmente guarda solo las visitas a los títulos.
- actividad_id (PK) INT PK UNIQUE INDEX
- titulo_id (FK) INT
- tipo VARCHAR
