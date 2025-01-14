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
        <title>Ver Productos</title>
        <style>
            body {
                margin: 0;
                font-family: Arial, sans-serif;
                background-color: #121212; /* Fondo oscuro */
                color: #ffffff; /* Texto claro */
                padding: 20px;
            }

            h2 {
                text-align: center;
                color: #ff3333; /* Tono rojo */
                margin-bottom: 20px;
            }

            table {
                width: 100%;
                max-width: 800px;
                margin: 0 auto 40px; /* Centrar tablas */
                border-collapse: collapse;
                background-color: #1c1c1c; /* Fondo oscuro */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
            }

            th, td {
                border: 1px solid #292929;
                padding: 10px;
                text-align: center;
                font-size: 14px;
            }

            th {
                background-color: #292929; /* Encabezados más oscuros */
                color: #ffffff;
            }

            td {
                color: #bbbbbb; /* Texto más claro */
            }

            .error {
                color: red;
                text-align: center;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <h2>Consolas Disponibles</h2>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/tiendavideojuegoscarlospertierra",
                    "carlos",
                    "carlos"
                );

                String queryConsolas = "SELECT * FROM consolas";
                PreparedStatement psConsolas = connection.prepareStatement(queryConsolas);
                ResultSet rsConsolas = psConsolas.executeQuery();
        %>
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
                    while (rsConsolas.next()) {
                %>
                <tr>
                    <td><%= rsConsolas.getInt("id_consola") %></td>
                    <td><%= rsConsolas.getString("nombre") %></td>
                    <td><%= rsConsolas.getDouble("cpu_potencia") %></td>
                    <td><%= rsConsolas.getDouble("gpu_potencia") %></td>
                    <td><%= rsConsolas.getString("compania") %></td>
                    <td><%= rsConsolas.getDouble("precio") %></td>
                    <td><%= rsConsolas.getInt("stock") %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <%
                rsConsolas.close();
                psConsolas.close();
        %>

        <h2>Juegos Disponibles</h2>
        <%
                String queryJuegos = "SELECT * FROM juegos";
                PreparedStatement psJuegos = connection.prepareStatement(queryJuegos);
                ResultSet rsJuegos = psJuegos.executeQuery();
        %>
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
                    while (rsJuegos.next()) {
                %>
                <tr>
                    <td><%= rsJuegos.getInt("id_juego") %></td>
                    <td><%= rsJuegos.getString("nombre") %></td>
                    <td><%= rsJuegos.getString("plataforma") %></td>
                    <td><%= rsJuegos.getString("compania") %></td>
                    <td><%= rsJuegos.getString("genero") %></td>
                    <td><%= rsJuegos.getInt("puntuacion") %></td>
                    <td><%= rsJuegos.getDouble("precio") %></td>
                    <td><%= rsJuegos.getInt("stock") %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <%
                rsJuegos.close();
                psJuegos.close();
                connection.close();
            } catch (Exception e) {
                out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
            }
        %>
    </body>
</html>
