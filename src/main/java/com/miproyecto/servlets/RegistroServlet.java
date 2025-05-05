/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.miproyecto.servlets;

import com.miproyecto.modelo.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Personal
 */
@WebServlet(name = "RegistroServlet", urlPatterns = "/registro")
public class RegistroServlet extends HttpServlet {
    
    // Método para manejar solicitudes POST (registrar usuario)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Obtenemos los datos del formulario
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        // Creamos un objeto Usuario con los datos del formulario
        Usuario nuevoUsuario = new Usuario(nombre, apellido, email, password);
        
        // Obtenemos la sesion HTTP
        HttpSession session = request.getSession();
        
        // Recuperamos la lista de usuarios de la sesion (o creamos una nueva)
        List<Usuario> listaUsuarios = (List<Usuario>) session.getAttribute("listaUsuarios");
        if (listaUsuarios == null) {
            listaUsuarios = new ArrayList<>();
            session.setAttribute("listaUsuarios", listaUsuarios);
        }
        
        // Agregamos el nuevo usuario a la lista
        listaUsuarios.add(nuevoUsuario);
        // Agregamos un mensaje de exito
        request.setAttribute("mensaje", "¡Usuario registrado con éxito!");
        
        // Redirigimos a la página de registro
        request.getRequestDispatcher("/registro.jsp").forward(request, response);
    }
    
    // Método para manejar solicitudes GET (mostrar formulario)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Simplemente reenviamos a la página de registro
        request.getRequestDispatcher("/registro.jsp").forward(request, response);
    }
}
