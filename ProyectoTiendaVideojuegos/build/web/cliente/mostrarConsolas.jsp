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
        <title>Consolas Disponibles</title>
        <link rel="stylesheet" href="mostrarConsola.css"/>
    </head>
    <body>
        <div class="table-container">
            <h2>Consolas Disponibles</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>CPU (GHz)</th>
                        <th>GPU (TFLOPS)</th>
                        <th>Compañía</th>
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

                            // Consulta para obtener las consolas
                            String queryConsolas = "SELECT * FROM consolas";
                            PreparedStatement psConsolas = connection.prepareStatement(queryConsolas);
                            ResultSet rsConsolas = psConsolas.executeQuery();

                            // Mostrar cada fila de la tabla
                            while (rsConsolas.next()) {
                    %>
                    <tr>
                        <td><%= rsConsolas.getInt("id_consola") %></td>
                        <td><%= rsConsolas.getString("nombre_consola") %></td>
                        <td><%= rsConsolas.getDouble("potencia_cpu") %></td>
                        <td><%= rsConsolas.getDouble("potencia_gpu") %></td>
                        <td><%= rsConsolas.getString("compania") %></td>
                        <td><%= rsConsolas.getDouble("precio") %></td>
                        <td><%= rsConsolas.getInt("unidades_disponibles") %></td>
                    </tr>
                    <%
                            }

                            rsConsolas.close();
                            psConsolas.close();
                            connection.close();
                        } catch (Exception e) {
                            out.println("<tr><td colspan='7' style='color: red;'>Error al cargar los datos: " + e.getMessage() + "</td></tr>");
                        }
                    %>
                </tbody>
            </table>
            <a href="cliente.jsp" class="back-button">Volver al Menú</a>
        </div>
    </body>
</html>
