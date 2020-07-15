<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

		<div class="accordion" id="accordionExample">
		  	
		  	<div class="card">
			   
			    <div class="card-header bg-dark" id="headingOne">
			      <h2 class="mb-0">
			        <button class="btn btn-dark btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
			          Formulario para agregar nuevo Empleado
			        </button>
			      </h2>
			    </div>
			    
		    	<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
		    	
		      		<div class="card-body">
					 	 	<p class="text-warning" >${mensaje}</p>
					 	
						 <form action="inicio" method="post">
						 	 <div class="form-group">
								 <label for="nombre">Nombre:</label>
								 <input name="nombre" id="nombre" value="${nombre }" placeholder="Nombre" >
							 </div>
							 <div class="form-group">
								 <label for="apellido1">1º Apellido:</label>
								 <input name="apellido1" id="apellido1" value=" ${apellido1 }" placeholder="1º Apellido">
							 </div>
							 <div class="form-group">
								 <label for="apellido2">2º Apellido:</label>
								 <input name="apellido2" id="apellido2" value="${apellido2 }" placeholder="2º Apellido" >
							 </div>
							 <div class="form-group">
								 <label for="nif">NIF:</label>
								 <input name="nif" id="nif" value="${nif }" placeholder="NIF" >
							 </div>
							 <div class="form-group">
							 <label for="departamento">Departamento al que pertenece:</label>
								 <select class="custom-select" id ="departamento" name="departamento">
									  <c:forEach items="${departamentos}" var="departamento">
									  	<option value="${(departamento.codigo == codDepto)? codDepto : departamento.codigo }" ${(departamento.codigo == codDepto)? 'selected' :' '}>${departamento.nombre }</option>
									  </c:forEach>  
								</select>
							</div>
							<div class="form-group">	
							<input class="submit" type="submit" value="Agregar">	
							</div>
						 </form>  
						 
				  	</div>
				  	
			    </div>
			    
		  	</div>
		</div>
    