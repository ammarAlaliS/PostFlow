# Prueba Técnica para Desarrollador Flutter Móvil

## Descripción

Esta aplicación fue creada como una prueba técnica para demostrar el uso de **Flutter** junto con la **Arquitectura Limpia (Clean Architecture)** y **GetX** como manejador de estado. La aplicación permite a los usuarios navegar a través de una lista de publicaciones, ver detalles de cada una, guardar publicaciones para leer más tarde y ver el perfil de usuario, cumpliendo los requisitos de la prueba.

## Requerimientos Funcionales Implementados

1. **Pantalla de Inicio (Feed de Publicaciones)**
   - La aplicación presenta una pantalla principal que muestra una lista de publicaciones.
   - Cada publicación muestra un **título**, un **resumen** y la **fecha de publicación**.
   - Los datos se obtienen de una **API REST pública**: `https://jsonplaceholder.typicode.com/posts`.
   - Se implementa el **paginado** para cargar las publicaciones en bloques de 10, utilizando un sistema de **infinite scroll** para cargar más publicaciones al desplazarse hacia abajo.

2. **Pantalla de Detalles de Publicación**
   - Al seleccionar una publicación en el feed, se navega a una pantalla de detalles.
   - La pantalla de detalles muestra el **título completo**, el **cuerpo** de la publicación y el **autor**.
   - También se muestran los **comentarios** de la publicación, obtenidos de la API `https://jsonplaceholder.typicode.com/comments?postId={postId}`.
   - Los comentarios se listan debajo de los detalles de la publicación.

3. **Funcionalidad de Guardado**
   - Los usuarios pueden "guardar" una publicación para leerla más tarde.
   - La funcionalidad de guardado utiliza el almacenamiento local mediante `shared_preferences` para persistir las publicaciones guardadas.
   - Las publicaciones guardadas son accesibles desde una sección separada llamada **"Guardados"** en la pantalla principal.

4. **Pantalla de Perfil de Usuario**
   - Se incluye una pantalla de perfil donde el usuario puede ver su **nombre**, **correo electrónico** y un **avatar** simulado.
   - Los datos del usuario se obtienen de la API `https://jsonplaceholder.typicode.com/users/1`.
   - La pantalla incluye un botón de **Cerrar sesión** que redirige a la pantalla de inicio (sin funcionalidad completa).

5. **Temas y Diseño Responsive**
   - La aplicación soporta **modo oscuro y claro**, con una opción para cambiar de tema en la pantalla de configuración.
   - Se asegura que la interfaz sea **responsive**, optimizada para varios tamaños de pantalla, tanto en dispositivos móviles como en tabletas.

## Puntos Evaluados y Cómo Se Cumplen

1. **Código limpio y organizado**:
   - Se utilizó la Arquitectura Limpia para mantener el código modular y bien estructurado.
   - Cada capa tiene una responsabilidad clara, siguiendo el principio de separación de responsabilidades.
   - Los widgets están personalizados y organizados en una estructura de carpetas fácil de entender.

2. **Uso del Estado con GetX**:
   - GetX se utiliza como manejador de estado y facilita la reactividad de la interfaz.
   - Esto permite que la aplicación actualice automáticamente la vista cuando cambia el estado de las publicaciones.

3. **Optimización y Paginación**:
   - Se implementó **paginado** para cargar publicaciones en lotes de 10 y optimizar el rendimiento.
   - La función de infinite scroll carga más publicaciones solo cuando el usuario se desplaza hasta el final de la lista.

4. **Manejo de Errores**:
   - Los errores de red se manejan adecuadamente y se muestran mensajes al usuario en caso de problemas de conexión.
   - Esto asegura una buena experiencia de usuario incluso cuando hay problemas de red.

5. **Persistencia**:
   - La aplicación usa `shared_preferences` para almacenar las publicaciones guardadas.
   - Las publicaciones guardadas se mantienen después de cerrar y reabrir la aplicación.

6. **Pruebas Básicas**:
   - Se implementó una prueba unitaria para asegurar el correcto funcionamiento de la lógica de guardado de publicaciones.

## Bonus (Características Opcionales Implementadas)

- **Animaciones**: Se añadieron animaciones de transición entre pantallas y un efecto de sombreado en botones.
- **Mejoras en UI/UX**: Se añadieron skeletons para las cargas y un loader animado en la lista de publicaciones.

## Estructura del Proyecto

La aplicación sigue el patrón de **Arquitectura Limpia (Clean Architecture)**, con una estructura de carpetas organizada en módulos: `data`, `domain`, `presentation` y `core`.

```plaintext
lib/
├── core/                   # Funcionalidades compartidas y configuraciones globales
│   ├── config/             # Configuraciones generales de la app
│   ├── error/              # Manejo de errores y excepciones
│   ├── network/            # Utilidades para verificar la conexión de red
│   └── usecase/            # Clases base para la implementación de casos de uso
├── data/                   # Capa de datos
│   ├── models/             # Modelos que representan la estructura de datos
│   ├── repositories/       # Implementaciones de los repositorios
│   └── data_sources/       # Fuentes de datos (API externa)
├── domain/                 # Capa de dominio
│   ├── entities/           # Entidades de negocio (modelos sin lógica)
│   ├── usecases/           # Casos de uso para ejecutar lógica de negocio
│   └── repositories/       # Interfaces de repositorios para abstracción
├── presentation/           # Capa de presentación
│   ├── pages/              # Pantallas de la interfaz de usuario
│   ├── widgets/            # Widgets personalizados reutilizables
│   └── controllers/        # Controladores (usando GetX) para manejar estado
└── main.dart               # Archivo principal de entrada de la aplicación

