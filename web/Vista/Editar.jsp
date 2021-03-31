<%-- 
    Document   : Editar
    Created on : 30-mar-2021, 19:54:59
    Author     : Usuario
--%>

<%@page import="com.Vlxdy.modelo.Libro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="author" content="VLADIMIR HUANCA">
        <meta name="viewport" content="with=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="Logo.png">
        <title> EDITAR </title>
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
        form{
		width: 480px;
		padding: 16px;
		border-radius: 0px;
		margin: auto;
		background-color: #ccf;
	}
	form input[type="number"]{
		width: 200px;
		padding: 3px 10px;
		border:1px solid #f6f6f6;
		border-radius: 3px;
		background-color:#9f9;
		margin:8px 0;
		display: inline-block;
	}
        form input[type="text"]{
		width: 200px;
		padding: 3px 10px;
		border:1px solid #f6f6f6;
		border-radius: 3px;
		background-color:#9f9;
		margin:8px 0;
		display: inline-block;
	}
	form input[type="submit"]{
		width: 100%;
		padding: 8px 16px;
		margin-top: 32px;
		border:1px solid #1e3300;
		border-radius: 5px;
		display: block;
		color: #fff;
		background-color:#1e3300;
	}
	form input[type="submit"]:hover{
            
		cursor:pointer;
	}
        SELECT{ 
                width: 200px;
		padding: 3px 10px;
		border:1px solid #f6f6f6;
		border-radius: 3px;
		background-color:  #f6f6f6;
		margin:8px 0;
		display: inline-block;
            }
    </style>
    <body>
        <%
            Libro item = (Libro) request.getAttribute("item");
        %>
        <h1 align="center"> EDITAR LIBRO</h1>
        <form action="ControladorPrincipal?op=guardar" method="post">
            Id: <input type="text" name="Id" value="<%= item.getId() %>" size="2" pattern="[1-9]{1}[0-9]*"/>
            <input type="hidden" name="Tipo" value="1" required/>
            <br>
            Titulo: <input type="text" name="Titulo" value="<%= item.getTitulo()%>" required />
            <br>
            Autor: <input type="text" name="Autor" value="<%= item.getAutor()%>" />
            <br>
            Estado: <input type="radio" name="Estado" value="1" <%= (item.getEstado() == 1) ? "checked":"" %> required/>Disponible
            <input type="radio" name="Estado" value="2" <%= (item.getEstado() == 2) ? "checked":"" %> requerid="" />Prestado
            <br>
            <input type="submit" value="Enviar" />
        </form>
    <footer>
        <p><br><br>
            <h3 id="heading" align="center">DEVELOPED &#x1F497; by <a style="color:yellow;" ><strong>VLADIMIR HUANCA</strong></a></h3>
        </p>
    </footer>
    </body>
</html>
