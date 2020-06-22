package com.ipartek.formacion.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ipartek.formacion.modelo.ProductoDAOImpl;

/**
 * Servlet implementation class InicioController
 */
@WebServlet("/inicio")
public class InicioController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private static final ProductoDAOImpl productoDAO = ProductoDAOImpl.getInstance();
       
   
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String paramIdCategoria = request.getParameter("idCategoria");
		
		if ( paramIdCategoria != null ) {
			
			int idCategoria = Integer.parseInt(paramIdCategoria);
			request.setAttribute("productos", productoDAO.getAllByCategoria( idCategoria, 10) );
			
		}else {
			
			request.setAttribute("productos", productoDAO.getLast(10) );
		}
		
		
		
		//request.setAttribute("productos", productoDAO.getAll() );
		
		//request.setAttribute("productos", productoDAO.getLast(2) );
		//request.setAttribute("productos", productoDAO.getAllByCategoria( 1, 10) );
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
		
	}
	

}
