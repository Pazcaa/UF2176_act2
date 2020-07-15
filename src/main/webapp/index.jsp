<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ page errorPage="error.jsp" isErrorPage="false"%>   

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<!-- Datatables -->
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
	
		<!--Nuestro CSS-->
	<link rel="stylesheet" href="css/styles.css">
	
	
    <title>Gestor de Empleados</title>
  </head>
  <body class="bg-light">
   <header class="bg-dark">
	  <nav class="navbar navbar-expand-lg navbar-dark bg-dark container">
	  <a class="navbar-brand" >Gestor de Empleados</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <form class="form-inline my-2 my-lg-0">
	      <input class="form-control mr-sm-2" name="search" type="search" value="${ palabraBusqueda}" placeholder="Nombre, apellidos o NIF" autofocus aria-label="Search">
	      <button class="btn btn-outline-warning my-2 my-sm-0" type="submit">Buscar</button>
	    </form>
	  </div>
	</nav>
  </header>
  
  <main class="container">
  	<h1>Empleados asociados a sus departamentos</h1>
  	
 	<div class="row">
 		<c:if test="${not empty mensajeG}">
		 	<p class="alert alert-warning" > ${mensajeG}. <a href="inicio" class="alert-warning">Borrar busqueda</a></p>
		 	
		 	<!-- despues de usar la variable para el alert lo ponemos en blanco ""  -->
			<c:set scope="session" value="" var="mensajeG"/>
			
		 </c:if>
 	</div>
 
  	<div class="row" >
		 <div class="col-8" >	
			 
			 <jsp:include page="_tabla.jsp"></jsp:include>
			  
		 </div>
	 
	 
	 
		 <div class="col-4">
		 
		 	<jsp:include page="_formulario.jsp"></jsp:include>
		 	
		 </div>
  	</div>
  </main>

<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    
    <!-- Datatables -->
	<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
	
	<!-- mis funciones -->
	<script>
		$(document).ready(function() {
		    $('#example').DataTable();
		   
		$('[data-toggle="popover"]').popover()
		    	
		} );
	</script>
	
  </body>
</html>