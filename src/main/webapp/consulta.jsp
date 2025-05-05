<%-- 
    Document   : consulta
    Created on : 5/05/2025, 8:09:37 a. m.
    Author     : Personal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <h1>Consulta de Usuarios</h1>
            <!-- Formulario de busqueda que usa metodo GET -->
            <form action="ConsultaServlet" method="GET">
                    <div class="form-group">
                        <label for="email">Buscar usuario por email:</label>
                        <input type="email" id="email" name="email" required>
                        <button type="submit" class="btn">Buscar</button>
                    </div>
                </form>
                <!-- Resultados de la busqueda -->
                <% if (request.getAttribute("busquedaRealizada") != null) { %>
                <div class="results">
                    <h2>Resultado de la busqueda</h2>
                    <% if (request.getAttribute("usuariosBuscados") != null) { %>
                    <% Usuario usuario = (Usuario) request.getAttribute("usuarioBuscado"); %>
                    <table>
                        <tr>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Email</th>
                        </tr>
                        <tr>
                            <td><%= usuario.getNombre() %></td>
                            <td><%= usuario.getApellido() %></td>
                            <td><%= usuario.getEmail() %></td>
                        </tr>
                    </table>
                        <% } else { %>
                        <div class="not-found">
                            No se encontro ningun usuario con el email especificado.
                        </div>
                        <% } %>
                </div>
                <% } %>
                <!-- Lista de todos los usuarios -->
                <h2>Lista de Usuarios Registrados</h2>
                <%
                    List<Usuario> listaUsuarios = (List<Usuario>) session.getAttribute("listaUsuarios");
                    if (listaUsuarios != null && !listaUsuarios.isEmpty()) {
                            %>
                            <table>
                                <tr>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Email</th>
                                </tr>
                                <% for (Usuario usuario : listaUsuarios) { %>
                                <tr>
                                    <td><%= usuario.getNombre() %></td>
                                    <td><%= usuario.getApellido() %></td>
                                    <td><%= usuario.getEmail() %></td>
                                </tr>
                                <% } %>
                            </table>
                            <% } else { %>
                            <p>No hay usuarios registrados en el sistema.</p>
                            <% } %>
                            <div class="menu">
                                <a href="index.jsp">Volver a Inicio</a>
                                <a href="registro.jsp">Registrar Usuario</a>
                            </div>
        </div>
    </body>
</html>
