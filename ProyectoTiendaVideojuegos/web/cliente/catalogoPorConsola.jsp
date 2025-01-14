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
        <title>Catálogo por Consola</title>
        <link rel="stylesheet" href="catalogoPorConsola.css"/>
    </head>
        <body>
        <div class="table-container">
            <h2>Selecciona una Consola</h2>
            <form method="get" action="catalogoPorConsola.jsp">
                <select name="consola" required>
                    <option value="" disabled selected>Seleccione una consola</option>
                    <%
                        try {
                            // Conexión a la base de datos
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection connection = DriverManager.getConnection(
                                "jdbc:mysql://localhost:3306/tiendavideojuegoscarlospertierra",
                                "carlos",
                                "carlos"
                            );

                            // Consulta para obtener todas las consolas únicas del campo plataforma
                            String queryPlataformas = "SELECT DISTINCT nombre_consola FROM consolas";
                            PreparedStatement psPlataformas = connection.prepareStatement(queryPlataformas);
                            ResultSet rsPlataformas = psPlataformas.executeQuery();

                            // Mostrar cada consola como opción
                            while (rsPlataformas.next()) {
                    %>
                    <option value="<%= rsPlataformas.getString("nombre_consola") %>"><%= rsPlataformas.getString("nombre_consola") %></option>
                    <%
                            }

                            rsPlataformas.close();
                            psPlataformas.close();
                            connection.close();
                        } catch (Exception e) {
                            out.println("<option value=''>Error al cargar consolas</option>");
                        }
                    %>
                </select>
                <button type="submit">Mostrar Juegos</button>
            </form>

            <%
                String consolaSeleccionada = request.getParameter("consola");
                if (consolaSeleccionada != null && !consolaSeleccionada.isEmpty()) {
            %>
            <h2>Catálogo de Juegos para <%= consolaSeleccionada %></h2>
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

                            // Consulta para obtener los juegos de la consola seleccionada
                            String queryJuegos = "SELECT * FROM juegos WHERE plataforma = ?";
                            PreparedStatement psJuegos = connection.prepareStatement(queryJuegos);
                            psJuegos.setString(1, consolaSeleccionada);
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
                                out.println("<tr><td colspan='8' style='text-align: center;'>No hay juegos disponibles para esta consola.</td></tr>");
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
            <%
                }
            %>
            <!-- Botón para regresar al menú de cliente -->
            <a href="cliente.jsp" class="back-button">Volver al Menú</a>
        </div>
    </body>
</html>