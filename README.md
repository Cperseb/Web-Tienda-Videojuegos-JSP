# 🎮 Web Tienda de Videojuegos (JSP & MySQL)

Aplicación web de comercio electrónico y gestión de catálogo para una tienda de videojuegos y consolas, desarrollada en **Java (JSP / Servlets)** utilizando **Apache NetBeans** y **MySQL**.

---

## 📋 Descripción

Este proyecto implementa una tienda online funcional con control de acceso basado en roles (**Administrador** y **Cliente**), catálogo relacional de consolas y videojuegos, e integración directa con base de datos mediante JDBC (`mysql-connector-j-9.1.0`).

### Funcionalidades Principales
* **Sistema de Autenticación y Roles:** Inicio de sesión diferenciado para cuentas de tipo `administrador` y `cliente`.
* **Catálogo de Consolas:** Listado y gestión de plataformas (PlayStation, Xbox, Nintendo) con especificaciones técnicas (`potencia_cpu`, `potencia_gpu`), compañía fabricante, precio y control de stock.
* **Catálogo de Videojuegos:** Clasificación por plataforma vinculada (`id_consola`), estudio desarrollador, género, puntuación en Metacritic, precio y unidades disponibles.
* **Gestión de Inventario (CRUD):** Administración de productos y control de existencias conectado a MySQL.

---

## 🚀 Cómo instalar y usar 

### 1. Instala lo necesario en tu equipo
1. **Java (JDK 8 o superior):** Descárgalo e instálalo (por ejemplo, desde Eclipse Temurin o Oracle JDK).
2. **MySQL Server y MySQL Workbench:** Instala el servidor de base de datos MySQL y su herramienta visual **MySQL Workbench** (o usa XAMPP / Laragon si prefieres un paquete todo-en-uno). Anota bien el usuario (`root`) y la contraseña que pongas al instalarlo.
3. **Apache NetBeans:** Descarga e instala Apache NetBeans (preferiblemente una versión que incluya soporte para Java Web y servidores como Apache Tomcat o GlassFish).

### 2. Crea y rellena la base de datos
1. Abre **MySQL Workbench** y conéctate a tu servidor local (`localhost`).
2. Descarga o clona este repositorio en tu ordenador:
   ```bash
   git clone [https://github.com/Cperseb/Web-Tienda-Videojuegos-JSP.git](https://github.com/Cperseb/Web-Tienda-Videojuegos-JSP.git)

---

## 🛠️ Stack Tecnológico

* **Backend:** Java EE / Jakarta EE (JSP, Servlets, JDBC)
* **Frontend:** HTML5, CSS3, JSP
* **Base de Datos:** MySQL (`mysql-connector-j-9.1.0.jar`)
* **IDE y Build:** Apache NetBeans / Apache Ant (`build.xml`)
* **Servidor de Aplicaciones:** Apache Tomcat / GlassFish

---

## 🗄️ Estructura de la Base de Datos

La base de datos `TiendaVideojuegosCarlosPertierra` consta de tres tablas principales:

| Tabla | Descripción | Campos Clave |
| :--- | :--- | :--- |
| **`usuarios`** | Credenciales y permisos de acceso | `id_usuario`, `nombre_usuario`, `contrasena`, `tipo_cuenta` (`administrador` / `cliente`) |
| **`consolas`** | Hardware disponible en tienda | `id_consola`, `nombre_consola`, `potencia_cpu`, `potencia_gpu`, `compania`, `precio`, `unidades_disponibles` |
| **`juegos`** | Catálogo de títulos por consola | `id_juego`, `nombre_juego`, `plataforma`, `compania_desarrolladora`, `genero`, `puntuacion_metacritic`, `precio`, `unidades_disponibles`, `id_consola` |

---

## 📂 Estructura del Repositorio

```text
Web-Tienda-Videojuegos-JSP/
├── ProyectoTiendaVideojuegos/       # Proyecto principal de NetBeans
│   ├── nbproject/                   # Configuración del proyecto Ant/NetBeans
│   ├── src/                         # Clases Java, modelos, DAOs y Servlets
│   ├── web/                         # Vistas JSP, hojas de estilo CSS y recursos estáticos
│   ├── build.xml                    # Script de compilación Apache Ant
│   └── mysql-connector-j-9.1.0.jar  # Driver JDBC para conexión con MySQL
├── BBDD TIENDAVIDEJUEGOS.sql        # Script DDL de creación de la base de datos y tablas
└── BBDD INSERTAR VIDEOJEUGOS.sql    # Script DML con datos iniciales de consolas, juegos y usuarios
