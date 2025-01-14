<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Catálogo de Juegos</title>
        <link rel="stylesheet" href="catalogoJuegos.css"/>
    </head>
    <body>
        <div class="table-container">
            <h2>Catálogo Completo de Juegos</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Plataforma</th>
                        <th>Compañía</th>
                        <th>Género</th>
                        <th>Puntuación</th>
                        <th>Precio (€)</th>
                        <th>Stock</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            // Conexión a la base de datos
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection connection = DriverManager.getConnection(
                                "jdbc:mysql://localhost:3306/tiendavideojuegoscarlospertierra",
                                "carlos",
                                "carlos"
                            );

                            // Consulta para obtener todos los juegos
                            String queryJuegos = "SELECT * FROM juegos";
                            PreparedStatement psJuegos = connection.prepareStatement(queryJuegos);
                            ResultSet rsJuegos = psJuegos.executeQuery();

                            boolean juegosEncontrados = false;
                            while (rsJuegos.next()) {
                                juegosEncontrados = true;
                    %>
                    <tr>
                        <td><%= rsJuegos.getInt("id_juego") %></td>
                        <td><%= rsJuegos.getString("nombre_juego") %></td>
                        <td><%= rsJuegos.getString("plataforma") %></td>
                        <td><%= rsJuegos.getString("compania_desarrolladora") %></td>
                        <td><%= rsJuegos.getString("genero") %></td>
                        <td><%= rsJuegos.getInt("puntuacion_metacritic") %></td>
                        <td><%= rsJuegos.getDouble("precio") %></td>
                        <td><%= rsJuegos.getInt("unidades_disponibles") %></td>
                    </tr>
                    <%
                            }

                            if (!juegosEncontrados) {
                                out.println("<tr><td colspan='8' style='text-align: center;'>No hay juegos disponibles.</td></tr>");
                            }

                            rsJuegos.close();
                            psJuegos.close();
                            connection.close();
                        } catch (Exception e) {
                            out.println("<tr><td colspan='8' style='color: red;'>Error al cargar los juegos: " + e.getMessage() + "</td></tr>");
                        }
                    %>
                </tbody>
            </table>
            <a href="cliente.jsp" class="back-button">Volver al Menú</a>
        </div>
    </body>
</html>
