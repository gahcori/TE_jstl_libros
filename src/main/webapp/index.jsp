<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.emergentes.modelo.Libro"%>
<%@page import="com.emergentes.modelo.GestorLibros"%>
<%
    if (session.getAttribute("agenda") == null) {
        GestorLibros objeto1 = new GestorLibros();

        objeto1.insertarLibro(new Libro(1, "Calculo III", "Max Chungara", "Libro de matematica con E.D.", "Fisico"));
        objeto1.insertarLibro(new Libro(2, "Programacion", "Guido Huanca", "Libro de programacion en java", "Magnetico"));
        objeto1.insertarLibro(new Libro(3, "Tecnologias Emergentes", "Mario Torrez", "Libro de tecnologias web", "Fisico"));

        session.setAttribute("agenda", objeto1);
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSTL BIBLIOTECA VIRTUAL</title>
    </head>
    <body>
        <h1>Lista de libros</h1>
        <a href="Controller?op=nuevo">Nuevo</a>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Titulo</th>
                <th>Autor</th>
                <th>Resumen</th>
                <th>Medio</th>
                <th></th>
                <th></th>
            </tr>
            <c:forEach var="item" items="${sessionScope.agenda.getLista()}">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.titulo}</td>
                    <td>${item.autor}</td>
                    <td>${item.resumen}</td>
                    <td>${item.medio}</td>
                    <td><a href="Controller?op=modificar&id=${item.id}">Modificar</a></td>
                    <td><a href="Controller?op=eliminar&id=${item.id}" onclick="return confirm('Esta seguro de eliminar el registro?');">Eliminar</a></td>
                </tr>
            </c:forEach>
            </
    </body>
</html>
