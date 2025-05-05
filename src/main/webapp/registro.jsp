<%-- 
    Document   : registro
    Created on : 5/05/2025, 8:14:33 a. m.
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
            <h1>Registro de Usuario</h1>
            <% if (request.getAttribute("mensaje") != null) { %>
            <div class="message">
                <%= request.getAttribute("mensaje") %>
            </div>
            <% } %>
            <form action="RegistroServlet" method="POST">
                <div class="form-group">
                    <label for="nombre">Nombre:</label>
                    <input type="text" id="nombre" name="nombre" required>
                </div>
                <div class="form-group">
                    <label for="apellido">Apellido:</label>
                    <input type="text" id="apellido" name="apellido" required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>  
                </div>
                <div class="form-group">
                    <label for="password">Contraseña:</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn">Registrar</button>
                </div>
            </form>
            <div class="menu">
                <a href="index.jsp">Volver a Inicio</a>
                <a href="consulta.jsp">Consultar Usuario</a>
            </div>
        </div>
    </body>
</html>
