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

### Tablas
El principal desafío es usar trablas intermedias en lugar de strings para guardar información de los títulos. Por ejemplo, sería muy sencillo agregar un campo "generos" a titulos y guardar los genero_id separados por coma (2,5,9). En su lugar se usa una tabla intermedia para géneros, actores, directores y plataformas.

**titulos**<br/>
Contiene todas las series y películas con su información básica.
- titulo_id (PK)
- nombre
- poster_url
- sinopsis
- fecha
- puntaje

**generos**<br/>
Contiene el registro de géneros.
- genero_id (PK)
- nombre

**generos_en_titulos**<br/>
Contiene la relación de géneros con títulos.
- genero_en_id (PK)
- genero_id (FK)
- titulo_id (FK)

**actores**<br/>
Contiene el registro de actores.
- actor_id (PK)
- nombre
- foto_url

**actores_en_titulos**<br/>
Contiene la relación de actores que formaron parte de las series y películas con el papel que interpretaron.
- actor_en_id (PK)
- actor_id (FK)
- titulo_id (FK)
- papel

**directores**<br/>
Contiene el registro de direcetores.
- director_id (PK)
- nombre
- foto_url

**directores_en_titulos**<br/>
Contiene la relación de directors y títulos.
- director_en_id (PK)
- director_id (FK)
- titulo_id (FK)

**plataformas**<br/>
Contiene el registro de plataformas de streaming.
- plataforma_id (PK)
- nombre
- logo_url

**plataformas_en_titulos**<br/>
Contiene la relación de plataformas en las que se pueden ver los títulos.
- plataforma_en_id (PK)
- plataforma_id (FK)
- titulo_id (FK)

**antiguedad**<br/>
Contiene un registro de las antigüedades posibles que se pueden buscar.
- antiguedad_id (PK)
- descripcion
- how_old

**busquedas**<br/>
Guardar las opciones seleccionadas por los usuarios en cada búsqueda.
- busqueda_id (PK)
- genero_id (FK)
- plataforma_id (FK)
- antiguedad_id (FK)
- fecha

**actividad**<br/>
Lleva un registro de la actividad que realiza el usuario para luego ponderarla, actualmente guarda solo las visitas a los títulos.
- actividad_id (PK)
- titulo_id (FK)

### DER de workbench
![](https://github.com/mexiar/buscador_peliculas/blob/main/DER_workbench.jpg)
- tipo 
