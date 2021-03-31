<%-- 
    Document   : Listado
    Created on : 30-mar-2021, 19:54:44
    Author     : Usuario
--%>

<%@page import="com.Vlxdy.modelo.Libro"%>
<%@page import="com.Vlxdy.modelo.LibroDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="author" content="VLADIMIR HUANCA">
        <meta name="viewport" content="with=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="Logo.png">
        <title> LISTADO </title>
    </head>
    <style>
        body {
  		background-image: linear-gradient(
     		rgba(0, 0, 0, 0.6),
     		rgba(0, 0, 0, 0.6)
   			), url("Fondo.png");
  			background-repeat: no-repeat;
 			background-attachment: fixed;
  			background-size: 100% 100%;
  			padding: 20px;
  			background-color:#dbffcc;
            }
        #heading { color: #fff; }
	a,h1,h2,h4,li{
		color: white;
                }
        b{
	   color: yellow;
        }
        table {
        font-family: arial, sans-serif;
        border-collapse: collapse;
        }
        th {
          border: 1px solid white;
          background-color:black;
          color: white;
          text-align: left;
          padding: 8px;
        }

        td {
          border: 1px solid black;
          text-align: left;
          padding: 8px;
        }

        tr:nth-child(odd) {
          background-color: #dddddd;
        }
        tr:nth-child(even) {
          background-color: white;
          color:black;
        }
    </style>
    <body>
        <%
            LibroDAO lista = (LibroDAO) session.getAttribute("gestor");
        %>
        <h1 align="center"> LISTADO </h1>
        <p><a href="../ControladorPrincipal?op=nuevo">Nuevo</a></p>
        <%
            if(lista.getLibros().size() > 0){
        %>
        <table>
            <tr>
                <th>ID</th>
                <th>TITULO</th>
                <th>AUTOR</th>
                <th>ESTADO</th>
                <th></th>
                <th></th>
            </tr>
            <%
            for(Libro item : lista.getLibros()){    
            %>
            <tr>
                        <td><%= item.getId() %></td>
                        <td><%= item.getTitulo() %></td>
                        <td><%= item.getAutor() %></td>
                        <td><%= item.getEstado() %></td>
                        <td><a style="color:blue;" href="../ControladorPrincipal?op=editar&Id=<%= item.getId() %>">Editar</a></td>
                        <td><a style="color:red;" href="../ControladorPrincipal?op=eliminar&Id=<%= item.getId() %>">Eliminar</a></td>
            </tr>
            <%
                }
            %>  
        </table>
            <%
            }
                else{
                out.println("<p style='color:yellow;'> No Existen Registros </p>");
                }
            %>
            <br><br>
    <footer>
        <p><br><br>
            <h3 id="heading" align="center">DEVELOPED &#x1F497; by <a style="color:yellow;" ><strong>VLADIMIR HUANCA</strong></a></h3>
        </p>
    </footer>
    </body>
</html>