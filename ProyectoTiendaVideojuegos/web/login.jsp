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
        <title>Iniciar Sesión</title>
        <link rel="stylesheet" href="login.css"/>
    </head>
    <body>
        <div class="login-container">
            <img src="td.jpg" alt="Logo">
            <h2>Iniciar Sesión</h2>
            <form action="login.jsp" method="post">
                <input type="text" name="usuario" placeholder="Usuario" required>
                <input type="password" name="password" placeholder="Contraseña" required>
                <button type="submit">Entrar</button>
            </form>

            <%
                // Obtener datos enviados por el formulario
                String usuarioLogueado = request.getParameter("usuario");
                String contraseñaLogueada = request.getParameter("password");

                if (usuarioLogueado != null && contraseñaLogueada != null) {
                    try {
                        // Registrar el controlador JDBC
                        Class.forName("com.mysql.cj.jdbc.Driver");

                        // Conexión a la base de datos
                        Connection miConexion = DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/tiendavideojuegoscarlospertierra",
                            "carlos",
                            "carlos"
                        );

                        // Consulta SQL
                        PreparedStatement consultaPreparada = miConexion.prepareStatement(
                            "SELECT tipo_cuenta FROM usuarios WHERE nombre_usuario = ? AND contrasena = ?"
                        );
                        consultaPreparada.setString(1, usuarioLogueado);
                        consultaPreparada.setString(2, contraseñaLogueada);

                        ResultSet miResult = consultaPreparada.executeQuery();

                        if (miResult.next()) {
                            // Redirigir según el tipo de cuenta
                            String tipoCuenta = miResult.getString("tipo_cuenta");
                            if ("administrador".equalsIgnoreCase(tipoCuenta)) {
                                response.sendRedirect("administrador/administrador.jsp");
                            } else if ("cliente".equalsIgnoreCase(tipoCuenta)) {
                                response.sendRedirect("cliente/cliente.jsp");
                            } else {
                                out.println("<p class='error'>Tipo de cuenta no reconocido.</p>");
                            }
                        } else {
                            // Usuario o contraseña incorrectos
                            out.println("<p class='error'>Usuario o contraseña incorrectos. Intente nuevamente.</p>");
                        }

                        // Cerrar recursos
                        miResult.close();
                        consultaPreparada.close();
                        miConexion.close();

                    } catch (Exception e) {
                        out.println("<p class='error'>Error al conectar con la base de datos: " + e.getMessage() + "</p>");
                    }
                }
            %>
        </div>
    </body>
</html>
