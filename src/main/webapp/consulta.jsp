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
        <style>
    body {
        margin: 0;
        padding: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(-45deg, #1a1a2e, #16213e, #0f3460, #1a1a2e);
        background-size: 400% 400%;
        animation: moveBackground 15s ease infinite;
        color: #fff;
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    @keyframes moveBackground {
        0% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
        100% { background-position: 0% 50%; }
    }

    .container {
        background-color: rgba(34, 34, 50, 0.6);
        backdrop-filter: blur(12px);
        padding: 40px;
        border-radius: 15px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.4);
        max-width: 800px;
        width: 90%;
    }

    h1, h2 {
        text-align: center;
        color: #ffffff;
    }

    .menu {
        margin-top: 30px;
        text-align: center;
    }

    .menu a {
        color: #c084fc;
        text-decoration: none;
        margin: 0 15px;
        font-weight: bold;
        transition: color 0.3s;
    }

    .menu a:hover {
        color: #ffffff;
    }

    .form-group {
        margin-bottom: 20px;
    }

    label {
        display: block;
        margin-bottom: 8px;
        color: #ddd;
    }

    input {
        width: 100%;
        padding: 10px;
        border: none;
        border-radius: 8px;
        background-color: rgba(255, 255, 255, 0.1);
        color: #fff;
    }

    input::placeholder {
        color: #bbb;
    }

    .btn {
        padding: 12px 20px;
        border: none;
        border-radius: 8px;
        background-color: #9b5de5;
        color: #fff;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .btn:hover {
        background-color: #7b2cbf;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        background-color: rgba(255, 255, 255, 0.05);
        backdrop-filter: blur(5px);
        border-radius: 10px;
        overflow: hidden;
    }

    th, td {
        padding: 12px;
        text-align: left;
        color: #fff;
        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    }

    th {
        background-color: rgba(155, 93, 229, 0.3);
    }

    .message, .not-found {
        padding: 12px;
        margin-top: 20px;
        background-color: rgba(229, 93, 155, 0.2);
        border-radius: 8px;
        text-align: center;
        color: #fff;
    }

    ul {
        padding-left: 20px;
    }

    li {
        margin-bottom: 5px;
    }
</style>
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
