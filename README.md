# Buscador de películas y series
![](https://github.com/mexiar/buscador_peliculas/blob/main/movies.jpg)

## Arquitectura de base de datos para buscador de películas y series

**Alumno:** [Alejandro Sena](https://www.linkedin.com/in/asena/)

**Comisión:** #57190

**Profesor:** Anderson M. Torres

**Tutor:** Leonel Lo Presti

<br/>

### Problema

Una publicación digital de entretenimiento enfocada en películas y series necesita obtener más data sobre los intereses de sus usuarios, para generar contenido acorde en sitio y redes. Para ello quiere desarrollar una herramienta que les permita encontrar fácilmente títulos para ver en cualquier plataforma de streaming disponible a través de una encuesta corta (géneros, plataformas, antigüedad), lo cual generará información sobre qué prefieren ver los usuarios al mismo tiempo que les ahorra tiempo.

<br/>

> Según datos de la empresa de investigación de mercados Nielsen, el tiempo medio que tarda alguien en encontrar algo que ver en plataformas de streaming ha aumentado a más de 10 minutos, tres más que en 2019, antes de la pandemia.

<br/>

**Puntos clave**

- **Series y películas:** esta es una tabla gigante, pero que se puede obtener de recursos gratuitos como TMDB y mantenrse actualizada por medio de su API. 
- **Búsquedas:** guarda todas las encuestas completadas por lo usuarios, para luego poder usar esta información para conocer, principalmente, los géneros y plataformas más buscados por los usuarios.
- **Actividad:** además de lo que buscan, es importante saber sobre qué títulos de los resultados ingresaron para obtener más información.
