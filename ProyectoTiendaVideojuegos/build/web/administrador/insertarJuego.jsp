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
        <title>Insertar Juego</title>
        <link rel="stylesheet" href="insertarProducto.css">
    </head>
    <body>
        <div class="form-container">
            <h2>Insertar Juego</h2>
            <form method="post" action="insertarJuego.jsp">
                <input type="text" name="nombre" placeholder="Nombre del Juego" required>
                <input type="text" name="plataforma" placeholder="Plataforma (Consola)" required>
                <input type="text" name="compania" placeholder="Compañía Desarrolladora" required>
                <input type="text" name="genero" placeholder="Género" required>
                <input type="number" name="puntuacion" placeholder="Puntuación en Metacritic" required>
                <input type="number" name="precio" placeholder="Precio" required step="0.01">
                <input type="number" name="stock" placeholder="Stock Inicial" required>
                <button type="submit">Insertar Juego</button>
            </form>

            <%
                String nombre = request.getParameter("nombre");
                String plataforma = request.getParameter("plataforma");
                String compania = request.getParameter("compania");
                String genero = request.getParameter("genero");
                String puntuacion = request.getParameter("puntuacion");
                String precio = request.getParameter("precio");
                String stock = request.getParameter("stock");

                if (nombre != null && plataforma != null && compania != null && genero != null && puntuacion != null && precio != null && stock != null) {
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection connection = DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/tiendavideojuegoscarlospertierra",
                            "carlos",
                            "carlos"
                        );

                        String insertQuery = "INSERT INTO juegos (nombre, plataforma, compania, genero, puntuacion, precio, stock) VALUES (?, ?, ?, ?, ?, ?, ?)";
                        PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);

                        preparedStatement.setString(1, nombre);
                        preparedStatement.setString(2, plataforma);
                        preparedStatement.setString(3, compania);
                        preparedStatement.setString(4, genero);
                        preparedStatement.setInt(5, Integer.parseInt(puntuacion));
                        preparedStatement.setDouble(6, Double.parseDouble(precio));
                        preparedStatement.setInt(7, Integer.parseInt(stock));

                        int rowsAffected = preparedStatement.executeUpdate();

                        if (rowsAffected > 0) {
                            response.sendRedirect("administrador.jsp");
                        } else {
                            out.println("<p class='error'>Error al insertar el juego.</p>");
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