package com.Vlxdy.controlador;

import com.Vlxdy.modelo.Libro;
import com.Vlxdy.modelo.LibroDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Vlxdy Hishikawa
 */
@WebServlet(name = "ControladorPrincipal", urlPatterns = {"/ControladorPrincipal"})
public class ControladorPrincipal extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();
        LibroDAO gestor = (LibroDAO) ses.getAttribute("gestor");
        
        if(gestor == null){
            LibroDAO auxi = new LibroDAO();
            ses.setAttribute("gestor", auxi);
        }
        
        String op = request.getParameter("op");
        if(op == null){
            op = "";
        }
        
        if(op.trim().equals("")){
            response.sendRedirect("Vista/Listado.jsp");
        }
        if(op.trim().equals("nuevo")){
            ses = request.getSession();
            Libro obj = new Libro();
            obj.setId(gestor.getCorrelativo()+1);
            request.setAttribute("item", obj);
            request.getRequestDispatcher("Vista/Nuevo.jsp").forward(request, response);
        }
        if(op.trim().equals("editar")){
            int pos = gestor.posicion(Integer.parseInt(request.getParameter("Id")));
            Libro obj = gestor.getLibros().get(pos);
            request.setAttribute("item", obj);
            request.getRequestDispatcher("Vista/Editar.jsp").forward(request, response);
        }
        if(op.trim().equals("eliminar")){
            int pos = gestor.posicion(Integer.parseInt(request.getParameter("Id")));
            gestor.getLibros().remove(pos);
            response.sendRedirect("Vista/Listado.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();
        LibroDAO gestor = (LibroDAO) ses.getAttribute("gestor");
        Libro obj = new Libro();
        gestor.setCorrelativo(gestor.getCorrelativo()+1);;
        obj.setId(gestor.getCorrelativo());
        obj.setAutor(request.getParameter("Autor"));
        obj.setTitulo(request.getParameter("Titulo"));
        obj.setEstado(Integer.parseInt(request.getParameter("Estado")));
        String Tipo = request.getParameter("Tipo");
        if(Tipo.equals("-1")){
            gestor.insertar(obj);
        }else{
           gestor.modificar(obj.getId(), obj);
        }
        response.sendRedirect("Vista/Listado.jsp");
    }
}

