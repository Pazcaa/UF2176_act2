<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  


		
	 	
	 <table id="example" class="table table-bordered">
	 		<thead class="thead-dark">
				<tr>
					<th>Codigo</th>
					<th>Nombre Empleado</th>
					<th>NIF</th>
					<th>Departamento</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${empleados }" var="empleado">
					<tr>
						<td>${empleado.codigo}</td>
						<td>${empleado.nombre} ${empleado.apellido1} ${empleado.apellido2}</td>
						<td>${empleado.nif}</td>
						
						<td> 
							<!-- definimos variables para usar en el boton -->
							<c:set var="depto" value="${(empty empleado.departamento.nombre) ? 'sin DEPTO. conocido' : empleado.departamento.nombre } "/> 
							<c:set var="presupuesto" value="${empleado.departamento.presupuesto } "/>
							<c:set var="gastos" value="${empleado.departamento.gastos } "/>
						
							<button type="button" class="btn ${(empleado.departamento.nombre eq null) ? 'text-dark' : 'text-warning' }" 
							data-toggle="popover" 
							data-placement="right"	
							data-trigger="focus"
							data-html="true"
							title="${depto}" 
							data-content="presupuesto : ${presupuesto} <br> gasto: ${gastos}">${depto}</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
	 	</table>
    