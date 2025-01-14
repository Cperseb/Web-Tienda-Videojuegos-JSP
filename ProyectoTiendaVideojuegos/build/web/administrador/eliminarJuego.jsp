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
        <title>Eliminar Juego</title>
        <link rel="stylesheet" href="eliminarProducto.css"/>
    </head>
    <body>
        <div class="form-container">
            <h2>Eliminar Juego</h2>
            <form method="post" action="eliminarJuego.jsp">
                <input type="number" name="idJuego" placeholder="ID del Juego" required>
                <button type="submit">Eliminar Juego</button>
            </form>

            <%
                String idJuego = request.getParameter("idJuego");

                if (idJuego != null) {
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection connection = DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/tiendavideojuegoscarlospertierra",
                            "carlos",
                            "carlos"
                        );

                        String deleteQuery = "DELETE FROM juegos WHERE id_juego = ?";
                        PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery);
                        preparedStatement.setInt(1, Integer.parseInt(idJuego));

                        int rowsAffected = preparedStatement.executeUpdate();

                        if (rowsAffected > 0) {
                            response.sendRedirect("administrador.jsp");
                        } else {
                            out.println("<p class='error'>No se encontró el juego con el ID proporcionado.</p>");
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
