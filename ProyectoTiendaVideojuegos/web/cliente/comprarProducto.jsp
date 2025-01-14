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
        <title>Comprar Producto</title>
        <style>
            body {
                margin: 0;
                font-family: Arial, sans-serif;
                background-color: #121212; /* Fondo oscuro */
                color: #ffffff; /* Texto claro */
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                min-height: 100vh;
            }

            .table-container, .form-container {
                background-color: #1c1c1c; /* Fondo más oscuro */
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
                text-align: center;
                width: 90%;
                max-width: 800px;
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

            .form-container select, .form-container input, .form-container button {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                border: none;
                border-radius: 5px;
                font-size: 16px;
            }

            .form-container select, .form-container input {
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

            .success {
                color: #00ff00;
                font-weight: bold;
                margin-top: 20px;
            }

            .error {
                color: red;
                font-weight: bold;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <!-- Selección de tipo de producto -->
        <div class="form-container">
            <h2>Selecciona el Tipo de Producto</h2>
            <form method="get" action="comprarProducto.jsp">
                <select name="tipoProducto" required>
                    <option value="" disabled selected>Selecciona un tipo de producto</option>
                    <option value="consolas">Consolas</option>
                    <option value="juegos">Juegos</option>
                </select>
                <button type="submit">Mostrar Productos</button>
            </form>
        </div>

        <!-- Mostrar tabla según selección -->
        <%
            String tipoProducto = request.getParameter("tipoProducto");

            if (tipoProducto != null && !tipoProducto.isEmpty()) {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/tiendavideojuegoscarlospertierra",
                        "carlos",
                        "carlos"
                    );

                    // Consulta para obtener productos según el tipo
                    String query = tipoProducto.equals("consolas")
                            ? "SELECT * FROM consolas"
                            : "SELECT * FROM juegos";

                    PreparedStatement statement = connection.prepareStatement(query);
                    ResultSet resultSet = statement.executeQuery();
        %>
        <div class="table-container">
            <h2>Catálogo de <%= tipoProducto.equals("consolas") ? "Consolas" : "Juegos" %></h2>
            <table>
                <thead>
                    <tr>
                        <%
                            if (tipoProducto.equals("consolas")) {
                        %>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>CPU (GHz)</th>
                        <th>GPU (TFLOPS)</th>
                        <th>Compañía</th>
                        <th>Precio (€)</th>
                        <th>Stock</th>
                        <%
                            } else {
                        %>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Plataforma</th>
                        <th>Compañía</th>
                        <th>Género</th>
                        <th>Puntuación</th>
                        <th>Precio (€)</th>
                        <th>Stock</th>
                        <%
                            }
                        %>
                    </tr>
                </thead>
                <tbody>
                    <%
                        while (resultSet.next()) {
                            if (tipoProducto.equals("consolas")) {
                    %>
                    <tr>
                        <td><%= resultSet.getInt("id_consola") %></td>
                        <td><%= resultSet.getString("nombre_consola") %></td>
                        <td><%= resultSet.getDouble("potencia_cpu") %></td>
                        <td><%= resultSet.getDouble("potencia_gpu") %></td>
                        <td><%= resultSet.getString("compania") %></td>
                        <td><%= resultSet.getDouble("precio") %></td>
                        <td><%= resultSet.getInt("unidades_disponibles") %></td>
                    </tr>
                    <%
                            } else {
                    %>
                    <tr>
                        <td><%= resultSet.getInt("id_juego") %></td>
                        <td><%= resultSet.getString("nombre_juego") %></td>
                        <td><%= resultSet.getString("plataforma") %></td>
                        <td><%= resultSet.getString("compania_desarrolladora") %></td>
                        <td><%= resultSet.getString("genero") %></td>
                        <td><%= resultSet.getInt("puntuacion_metacritic") %></td>
                        <td><%= resultSet.getDouble("precio") %></td>
                        <td><%= resultSet.getInt("unidades_disponibles") %></td>
                    </tr>
                    <%
                            }
                        }

                        resultSet.close();
                        statement.close();
                        connection.close();
                    } catch (Exception e) {
                        out.println("<p class='error'>Error al cargar los productos: " + e.getMessage() + "</p>");
                    }
                }
                    %>
                </tbody>
            </table>
        </div>

        <!-- Formulario para comprar producto -->
        <div class="form-container">
            <h2>Comprar Producto</h2>
            <form method="post" action="comprarProducto.jsp">
                <input type="hidden" name="tipoProducto" value="<%= tipoProducto %>">
                <input type="number" name="idProducto" placeholder="ID del Producto" required>
                <button type="submit">Comprar</button>
            </form>
                <a href="cliente.jsp" class="back-button">Volver al Menú</a>
        </div>

        <!-- Procesar la compra -->
        <%
            String idProducto = request.getParameter("idProducto");

            if (idProducto != null && tipoProducto != null) {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/tiendavideojuegoscarlospertierra",
                        "carlos",
                        "carlos"
                    );

                    // Tabla correspondiente
                    String tabla = tipoProducto.equals("consolas") ? "consolas" : "juegos";
                    String idColumna = tipoProducto.equals("consolas") ? "id_consola" : "id_juego";

                    // Obtener stock actual
                    String selectQuery = "SELECT unidades_disponibles FROM " + tabla + " WHERE " + idColumna + " = ?";
                    PreparedStatement selectStmt = connection.prepareStatement(selectQuery);
                    selectStmt.setInt(1, Integer.parseInt(idProducto));
                    ResultSet rs = selectStmt.executeQuery();

                    if (rs.next()) {
                        int stockActual = rs.getInt("unidades_disponibles");

                        if (stockActual > 0) {
                            int nuevoStock = stockActual - 1;

                            if (nuevoStock > 0) {
                                // Actualizar stock
                                String updateQuery = "UPDATE " + tabla + " SET unidades_disponibles = ? WHERE " + idColumna + " = ?";
                                PreparedStatement updateStmt = connection.prepareStatement(updateQuery);
                                updateStmt.setInt(1, nuevoStock);
                                updateStmt.setInt(2, Integer.parseInt(idProducto));
                                updateStmt.executeUpdate();
                                updateStmt.close();
                                out.println("<p class='success'>Compra realizada con éxito. Nuevo stock: " + nuevoStock + "</p>");
                            } else {
                                // Eliminar producto si el stock llega a 0
                                String deleteQuery = "DELETE FROM " + tabla + " WHERE " + idColumna + " = ?";
                                PreparedStatement deleteStmt = connection.prepareStatement(deleteQuery);
                                deleteStmt.setInt(1, Integer.parseInt(idProducto));
                                deleteStmt.executeUpdate();
                                deleteStmt.close();
                                out.println("<p class='success'>Compra realizada. Producto eliminado por falta de stock.</p>");
                            }
                        } else {
                            out.println("<p class='error'>Error: Producto sin stock.</p>");
                        }
                    } else {
                        out.println("<p class='error'>Error: Producto no encontrado.</p>");
                    }

                    rs.close();
                    selectStmt.close();
                    connection.close();
                } catch (Exception e) {
                    out.println("<p class='error'>Error al procesar la compra: " + e.getMessage() + "</p>");
                }
            }
        %>
    </body>
</html>
