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
        <title>Eliminar Consola</title>
        <style>
            body {
                margin: 0;
                font-family: Arial, sans-serif;
                background-color: #121212; /* Fondo oscuro */
                color: #ffffff; /* Texto claro */
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
            }

            .form-container {
                background-color: #1c1c1c; /* Fondo oscuro */
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
                text-align: center;
                width: 100%;
                max-width: 800px;
            }

            .form-container h2 {
                color: #ff3333; /* Tono rojo */
                margin-bottom: 20px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                background-color: #292929;
                margin-bottom: 20px;
            }

            th, td {
                border: 1px solid #444444;
                padding: 10px;
                text-align: center;
                font-size: 14px;
                color: #ffffff;
            }

            th {
                background-color: #ff3333; /* Encabezado rojo */
                color: #ffffff;
            }

            .form-container input, .form-container button {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                border: none;
                border-radius: 5px;
                font-size: 16px;
            }

            .form-container input {
                background-color: #292929;
                color: #ffffff;
            }

            .form-container button {
                background-color: #ff3333;
                color: #ffffff;
                cursor: pointer;
            }

            .form-container button:hover {
                background-color: #cc0000;
            }

            .error {
                color: red;
                font-weight: bold;
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
        <!-- Contenedor del formulario y tabla -->
        <div class="form-container">
            <h2>Eliminar Consola</h2>

            <!-- Tabla de consolas disponibles -->
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

            <!-- Formulario para eliminar consola -->
            <form method="post" action="eliminarConsola.jsp">
                <input type="number" name="idConsola" placeholder="ID de la Consola" required>
                <button type="submit">Eliminar Consola</button>
            </form>

            <%
                String idConsola = request.getParameter("idConsola");

                if (idConsola != null) {
                    try {
                        // Cargar el driver JDBC y conectar con la base de datos
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection connection = DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/tiendavideojuegoscarlospertierra",
                            "carlos",
                            "carlos"
                        );

                        // Consulta para eliminar la consola por ID
                        String deleteQuery = "DELETE FROM consolas WHERE id_consola = ?";
                        PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery);
                        preparedStatement.setInt(1, Integer.parseInt(idConsola));

                        int rowsAffected = preparedStatement.executeUpdate();

                        if (rowsAffected > 0) {
                            // Redirigir al menú administrador si la eliminación fue exitosa
                            response.sendRedirect("administrador.jsp");
                        } else {
                            out.println("<p class='error'>No se encontró la consola con el ID proporcionado.</p>");
                        }

                        // Cerrar conexiones
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
