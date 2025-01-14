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
        <title>Insertar Consola</title>
        <link rel="stylesheet" href="insertarProducto.css"/>
    </head>
    <body>
        <div class="form-container">
            <h2>Insertar Consola</h2>
            <form method="post" action="insertarConsola.jsp">
                <input type="text" name="nombre" placeholder="Nombre de la Consola" required>
                <input type="number" name="cpuPotencia" placeholder="Potencia CPU (GHz)" required step="0.01">
                <input type="number" name="gpuPotencia" placeholder="Potencia GPU (TFLOPS)" required step="0.01">
                <input type="text" name="compania" placeholder="Compañía" required>
                <input type="number" name="precio" placeholder="Precio" required step="0.01">
                <input type="number" name="stock" placeholder="Stock Inicial" required>
                <button type="submit">Insertar Consola</button>
            </form>

            <%
                String nombre = request.getParameter("nombre");
                String cpuPotencia = request.getParameter("cpuPotencia");
                String gpuPotencia = request.getParameter("gpuPotencia");
                String compania = request.getParameter("compania");
                String precio = request.getParameter("precio");
                String stock = request.getParameter("stock");

                if (nombre != null && cpuPotencia != null && gpuPotencia != null && compania != null && precio != null && stock != null) {
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection connection = DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/tiendavideojuegoscarlospertierra",
                            "carlos",
                            "carlos"
                        );

                        String insertQuery = "INSERT INTO consolas (nombre_consola, potencia_cpu, potencia_gpu, compania, precio, unidades_disponibles) VALUES (?, ?, ?, ?, ?, ?)";
                        PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);

                        preparedStatement.setString(1, nombre);
                        preparedStatement.setDouble(2, Double.parseDouble(cpuPotencia));
                        preparedStatement.setDouble(3, Double.parseDouble(gpuPotencia));
                        preparedStatement.setString(4, compania);
                        preparedStatement.setDouble(5, Double.parseDouble(precio));
                        preparedStatement.setInt(6, Integer.parseInt(stock));

                        int rowsAffected = preparedStatement.executeUpdate();

                        if (rowsAffected > 0) {
                            response.sendRedirect("administrador.jsp");
                        } else {
                            out.println("<p class='error'>Error al insertar la consola.</p>");
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
