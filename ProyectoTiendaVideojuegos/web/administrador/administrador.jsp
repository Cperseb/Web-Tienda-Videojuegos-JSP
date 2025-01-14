<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Panel de Administrador</title>
        <link rel="stylesheet" href="admin.css"/>
    </head>
    <body>
        <div class="menu-container">
            <h2>Panel de Administrador</h2>
            <button onclick="location.href='modificarProducto.jsp'">Modificar Producto</button>
            <button onclick="location.href='insertarConsola.jsp'">Insertar Nueva Consola</button>
            <button onclick="location.href='insertarJuego.jsp'">Insertar Nuevo Juego</button>
            <button onclick="location.href='eliminarConsola.jsp'">Eliminar Consola</button>
            <button onclick="location.href='eliminarJuego.jsp'">Eliminar Juego</button>
            <button onclick="location.href='../login.jsp'">Volver al Login</button>
        </div>
    </body>
</html>
