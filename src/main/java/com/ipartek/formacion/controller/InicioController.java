package com.ipartek.formacion.controller;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.ipartek.formacion.modelo.ConnectionManager;
import com.ipartek.formacion.modelo.dao.EmpleadosDao;
import com.ipartek.formacion.modelo.pojo.Departamento;
import com.ipartek.formacion.modelo.pojo.Empleados;


/**
 * Servlet implementation class InicioController
 */
@WebServlet("/inicio")
public class InicioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger LOG = Logger.getLogger(InicioController.class);
	private final static EmpleadosDao dao = EmpleadosDao.getInstance();
   
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String palabraBusqueda = request.getParameter("search");
		String mensajeG = "";
		
		ArrayList<Empleados> empleados = new ArrayList<Empleados>();
		ArrayList<Departamento> departamentos = new ArrayList<Departamento>();
		
		try {
			LOG.trace("Entramos al controlador/inicio");
			
			empleados = dao.buscar(palabraBusqueda);
			
			//empleados = dao.getAllEmpleados();
			
			departamentos = dao.getAllDepartamentos();
			
			if (palabraBusqueda != null && palabraBusqueda != "") {
				mensajeG = "Se ha filtrado por <b>" + palabraBusqueda + "<b>";
			}
			
		} catch (Exception e) {
			LOG.error(e);
		}
		
		request.setAttribute("empleados", empleados);
		request.setAttribute("mensajeG", mensajeG);
		request.setAttribute("departamentos", departamentos);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nombre = request.getParameter("nombre");
		String apellido1 = request.getParameter("apellido1");
		String apellido2 = request.getParameter("apellido2");
		String nif = request.getParameter("nif");
		String depto = request.getParameter("departamento");
		int codDepto = Integer.parseInt(depto);
		
		String mensaje = "";
		
		boolean isRediret = true;
		
		
		try {
			LOG.trace("Entramos al controlador/inicio formulario");
			
			Empleados empleado = new Empleados();
			Departamento departamento = new Departamento();
			
			empleado.setNombre(nombre);
			empleado.setApellido1(apellido1);
			empleado.setApellido2(apellido2);
			empleado.setNif(nif);
			departamento.setCodigo(codDepto);
			empleado.setDepartamento(departamento);
			
			dao.insert(empleado);
			mensaje = "Se ha regsitrado con exito el nuevo empleado";
			
		} catch (Exception e) {
			LOG.error(e);
			mensaje = "Se ha producido un problema, porfavor vuelva a intentarlo";
			
			request.setAttribute("nombre", nombre);
			request.setAttribute("apellido1", apellido1);
			request.setAttribute("apellido2", apellido2);
			request.setAttribute("nif", nif);
			request.setAttribute("codDepto", codDepto);
			
			request.setAttribute("mensaje", mensaje);
			request.setAttribute("empleados", dao.getAllEmpleados());
			request.setAttribute("departamentos", dao.getAllDepartamentos());
	
			isRediret = false;
			//request.getRequestDispatcher("index.jsp").forward(request, response);
		
		}finally {
			
			
		
			request.setAttribute("mensaje", mensaje);
			
			if (isRediret) {
				response.sendRedirect("inicio?mensaje=" + mensaje);
			}else {
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
			
			//request.setAttribute("departamentos", dao.getAllDepartamentos());
			//request.setAttribute("empleados", dao.getAllEmpleados());
			
			
		}
		
	}

}
