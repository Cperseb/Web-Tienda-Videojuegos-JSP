<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Modificar Producto</title>
        <link rel="stylesheet" href="modificarProducto.css"/>
    </head>
    <body>
        <div class="form-container">
            <h2>Modificar Producto</h2>
            <form method="post" action="modificarProducto.jsp">
                <select name="tipoProducto" required>
                    <option value="" disabled selected>Seleccione el tipo de producto</option>
                    <option value="consola">Consola</option>
                    <option value="juego">Juego</option>
                </select>
                <input type="number" name="idProducto" placeholder="ID del Producto" required>
                <input type="text" name="nombre" placeholder="Nuevo Nombre del Producto" required>
                <input type="number" name="precio" placeholder="Nuevo Precio" required step="0.01">
                <input type="number" name="stock" placeholder="Nuevo Stock" required>
                <button type="submit">Modificar Producto</button>
            </form>

            <%
                String tipoProducto = request.getParameter("tipoProducto");
                String idProducto = request.getParameter("idProducto");
                String nombre = request.getParameter("nombre");
                String precio = request.getParameter("precio");
                String stock = request.getParameter("stock");

                if (tipoProducto != null && idProducto != null && nombre != null && precio != null && stock != null) {
                    try {
                        // Conexión a la base de datos
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection connection = DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/tiendavideojuegoscarlospertierra",
                            "carlos",
                            "carlos"
                        );

                        String updateQuery = "";
                        if ("consola".equalsIgnoreCase(tipoProducto)) {
                            updateQuery = "UPDATE consolas SET nombre = ?, precio = ?, stock = ? WHERE id_consola = ?";
                        } else if ("juego".equalsIgnoreCase(tipoProducto)) {
                            updateQuery = "UPDATE juegos SET nombre = ?, precio = ?, stock = ? WHERE id_juego = ?";
                        }

                        PreparedStatement preparedStatement = connection.prepareStatement(updateQuery);
                        preparedStatement.setString(1, nombre);
                        preparedStatement.setDouble(2, Double.parseDouble(precio));
                        preparedStatement.setInt(3, Integer.parseInt(stock));
                        preparedStatement.setInt(4, Integer.parseInt(idProducto));

                        int rowsAffected = preparedStatement.executeUpdate();

                        if (rowsAffected > 0) {
                            // Redirección al menú principal
                            response.sendRedirect("administrador.jsp");
                        } else {
                            out.println("<p class='error'>No se encontró el producto con el ID proporcionado.</p>");
                        }

                        preparedStatement.close();
                        connection.close();

                    } catch (Exception e) {
                        out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
                    }
                }
            %>
        </div>
    </body>
</html>
