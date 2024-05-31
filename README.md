# Proyecto de Aplicación de Películas

## Arquitectura

Este proyecto sigue una arquitectura modular y bien organizada que separa las responsabilidades en diferentes capas y módulos. Esto facilita el mantenimiento, la escalabilidad y las pruebas del código.

### Estructura de Carpetas

- `Common`: Contiene componentes, ayudantes y recursos compartidos en toda la aplicación.
  - `Components`: Componentes reutilizables de la interfaz de usuario.
  - `Helpers`: Funciones y utilidades que se utilizan en diferentes partes de la aplicación.
  - `Resources`: Archivos de recursos como imágenes, colores y cadenas de texto.

- `System`: Contiene los archivos principales de la aplicación, como la configuración y el punto de entrada principal.

- `Features`: Contiene los módulos específicos de funcionalidades de la aplicación. En este caso, un módulo específico para la lista de películas.
  - `MovieList`:
    - `ViewModel`: Contiene las clases que gestionan el estado y la lógica de negocio de la interfaz de usuario.
    - `UIState`: Gestiona el estado de la interfaz de usuario para el módulo de la lista de películas.
    - `Repositories`: Gestiona el acceso a los datos desde fuentes externas o locales.
      - `Api`: Clases que manejan las llamadas a la API.
    - `Model`:
      - `DTO`: Clases de transferencia de datos que mapean las respuestas de la API.
      - `Domain`: Modelos de dominio que representan las entidades principales de la aplicación.
    - `UI`: Contiene las vistas y los componentes de la interfaz de usuario específicos para el módulo de la lista de películas.

## Descripción de Carpetas y Archivos

### Common

- **Components**: Aquí se almacenan los componentes reutilizables de la interfaz de usuario que se utilizan en varias partes de la aplicación.
  - `AsyncImageCustom.swift`: Componente personalizado para cargar imágenes asíncronamente.
  - `GenericTextField.swift`: Campo de texto genérico reutilizable.

- **Helpers**: Funciones de utilidad y extensiones que se utilizan en todo el proyecto.
  - `NetworkHelper.swift`: Funciones de red comunes.
  - `StringExtensions.swift`: Extensiones para manipulación de cadenas de texto.

- **Resources**: Archivos de recursos, como colores, imágenes y cadenas localizadas.
  - `Colors.swift`: Definiciones de colores utilizados en la aplicación.
  - `Localizable.strings`: Archivos de cadenas de texto localizadas.

### System

- Archivos principales de la aplicación.
  - `App.swift`: Punto de entrada principal de la aplicación.
  - `AppDelegate.swift`: Configuración de la aplicación.

### Features

#### MovieList

- **ViewModel**: Clases que contienen la lógica de negocio y manejan el estado de la interfaz de usuario.
  - `MovieViewModel.swift`: ViewModel para manejar la lógica de la lista de películas.

- **UIState**: Clases para gestionar el estado de la interfaz de usuario.
  - `MovieListUIState.swift`: Estado de la interfaz de usuario específico para la lista de películas.

- **Repositories**: Gestión de acceso a los datos.
  - **Api**: Clases que manejan las llamadas a la API.
    - `MovieApiService.swift`: Servicio para manejar las llamadas a la API relacionadas con las películas.

- **Model**:
  - **DTO**: Clases de transferencia de datos que mapean las respuestas de la API.
    - `MovieDTO.swift`: DTO para las respuestas de la API de películas.
  - **Domain**: Modelos de dominio que representan las entidades principales.
    - `Movie.swift`: Modelo de dominio para una película.

- **UI**: Vistas y componentes de la interfaz de usuario.
  - `MovieListView.swift`: Vista principal de la lista de películas.
  - `MovieDetailView.swift`: Vista de detalles de una película.


