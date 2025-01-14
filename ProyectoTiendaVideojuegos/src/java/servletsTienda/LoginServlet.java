package servletsTienda;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    // Configuración de la base de datos
    private static final String DB_URL = "jdbc:mysql://localhost:3306/tiendavideojuegoscarlospertierra";
    private static final String DB_USER = "carlos";
    private static final String DB_PASSWORD = "carlos";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener parámetros del formulario
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Conexión a la base de datos y validación
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            // Consulta para verificar usuario y contraseña
            String query = "SELECT tipo_cuenta FROM usuarios WHERE nombre_usuario = ? AND contrasena = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, username);
            statement.setString(2, password);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                // Si el usuario existe, obtener el tipo de cuenta
                String tipoCuenta = resultSet.getString("tipo_cuenta");

                // Redirigir según el tipo de cuenta
                if ("administrador".equalsIgnoreCase(tipoCuenta)) {
                    response.sendRedirect("administrador.jsp");
                } else if ("cliente".equalsIgnoreCase(tipoCuenta)) {
                    response.sendRedirect("cliente.jsp");
                } else {
                    // Tipo de cuenta desconocido
                    request.setAttribute("mensaje", "Tipo de cuenta no reconocido");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                    dispatcher.forward(request, response);
                }
            } else {
                // Usuario o contraseña incorrectos
                request.setAttribute("mensaje", "Usuario o contraseña incorrectos");
                RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            // Manejo de errores de la base de datos
            e.printStackTrace();
            request.setAttribute("mensaje", "Error al conectar con la base de datos");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet para manejo de login";
    }
}
