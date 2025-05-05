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
