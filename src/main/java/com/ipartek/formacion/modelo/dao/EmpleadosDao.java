package com.ipartek.formacion.modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import com.ipartek.formacion.modelo.ConnectionManager;
import com.ipartek.formacion.modelo.pojo.Departamento;
import com.ipartek.formacion.modelo.pojo.Empleados;

public class EmpleadosDao {

	private final static Logger LOG = Logger.getLogger(EmpleadosDao.class);
	private static EmpleadosDao INSTANCE = null;//patrón singleton
	
	//constructor del INSTANCE
		private EmpleadosDao() {
			super();
		}
	
		//metodo del INSTANCE
		public static synchronized EmpleadosDao getInstance() {
			if (INSTANCE == null) {
				INSTANCE = new EmpleadosDao();
			}
			
			return INSTANCE;
		}

		
	public ArrayList<Empleados> getAllEmpleados() {
		
		ArrayList<Empleados> empleados = new ArrayList<Empleados>();
		
		String sql = " SELECT e.codigo 'codigo', e.nombre 'nombre' , apellido1 , apellido2 , nif , d.codigo,  d.nombre 'departamento' , presupuesto , gastos FROM empleados e LEFT JOIN departamento d ON e.codigo_departamento = d.codigo " + 
					" ORDER BY e.codigo ASC LIMIT 500;";
		
		try (	Connection con = ConnectionManager.getConnection();
				PreparedStatement pst = con.prepareStatement(sql);
				ResultSet rs = pst.executeQuery();
		) {
			
			LOG.debug(pst);
			Empleados empleado;
			Departamento departamento;
			while (rs.next()) {
				
				empleado = new Empleados();
				empleado.setCodigo(rs.getInt("codigo"));
				empleado.setNombre(rs.getString("nombre"));
				empleado.setApellido1(rs.getString("apellido1"));
				empleado.setApellido2(rs.getString("apellido2"));
				empleado.setNif(rs.getString("nif"));
				
				departamento = new Departamento();
				departamento.setCodigo(rs.getInt("d.codigo"));
				departamento.setNombre(rs.getString("departamento"));
				departamento.setPresupuesto(rs.getFloat("presupuesto"));
				departamento.setGastos(rs.getFloat("gastos"));
				
				empleado.setDepartamento(departamento);
				
				empleados.add(empleado);
				
			}
			
		} catch (Exception e) {
			LOG.error(e);
		}
		
		return empleados;
	}	
	
	/**
	 * Metodo para bbuscar un empleados
	 * @param palabraBusqueda puede ser el nombre, apellidos o NIF. Si es null o "", regresa todos
	 * @return
	 */
	
	public ArrayList<Empleados> buscar(String palabraBusqueda) {
		
		ArrayList<Empleados> empleados = new ArrayList<Empleados>();
		
		if (palabraBusqueda == null) {
			palabraBusqueda = "";
		}
		
		String sql =" SELECT e.codigo 'codigo', e.nombre 'nombre' , apellido1 , apellido2 , nif , d.codigo,  d.nombre 'departamento' , presupuesto , gastos " + 
					" FROM empleados e LEFT JOIN departamento d ON e.codigo_departamento = d.codigo " + 
					" WHERE CONCAT(e.nombre, ' ', e.apellido1, ' ', e.apellido2, ' ', nif) LIKE '%" + palabraBusqueda + "%' ORDER BY e.codigo ASC LIMIT 500;";
		
		try (	Connection con = ConnectionManager.getConnection();
				PreparedStatement pst = con.prepareStatement(sql);
				ResultSet rs = pst.executeQuery();
		) {
			
			LOG.debug(pst);
			Empleados empleado;
			Departamento departamento;
			while (rs.next()) {
				
				empleado = new Empleados();
				empleado.setCodigo(rs.getInt("codigo"));
				empleado.setNombre(rs.getString("nombre"));
				empleado.setApellido1(rs.getString("apellido1"));
				empleado.setApellido2(rs.getString("apellido2"));
				empleado.setNif(rs.getString("nif"));
				
				departamento = new Departamento();
				departamento.setCodigo(rs.getInt("d.codigo"));
				departamento.setNombre(rs.getString("departamento"));
				departamento.setPresupuesto(rs.getFloat("presupuesto"));
				departamento.setGastos(rs.getFloat("gastos"));
				
				empleado.setDepartamento(departamento);
				
				empleados.add(empleado);
				
			}
			
		} catch (Exception e) {
			LOG.error(e);
		}
		
		return empleados;
	}
	
	public ArrayList<Departamento> getAllDepartamentos() {
		ArrayList<Departamento> departamentos = new ArrayList<Departamento>();
		
		String sql = "SELECT codigo, nombre, presupuesto, gastos FROM departamento ORDER BY codigo ASC LIMIT 500;";
	
	try (	Connection con = ConnectionManager.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
	) {
		
		LOG.debug(pst);
		Departamento departamento;
		while (rs.next()) {
			
			departamento = new Departamento();
			departamento.setCodigo(rs.getInt("codigo"));
			departamento.setNombre(rs.getString("nombre"));
			departamento.setPresupuesto(rs.getFloat("presupuesto"));
			departamento.setGastos(rs.getFloat("gastos"));
			
			departamentos.add(departamento);
			
		}
		
	} catch (Exception e) {
		LOG.error(e);
	}
		
		return departamentos;
	}
	
	public Empleados insert(Empleados pojo) throws Exception {
		
		String sql =" INSERT INTO empleados (nif, nombre, apellido1 , apellido2 , codigo_departamento )" + 
					" VALUES (?, ?, ?, ?, ? );";
		
		try (	Connection conexion = ConnectionManager.getConnection();
				PreparedStatement pst = conexion.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);) {

				pst.setString(1, pojo.getNif());
				pst.setString(2, pojo.getNombre());
				pst.setString(3, pojo.getApellido1());
				pst.setString(4, pojo.getApellido2());
				pst.setInt(5, pojo.getDepartamento().getCodigo());
				
				
				LOG.debug(pst);
				int affectedRows = pst.executeUpdate();
				if (affectedRows == 1) {
					// conseguir el ID que nos ha arrojado

				try (ResultSet rskeys = pst.getGeneratedKeys()) {
					if (rskeys.next()) {
						int codigo = rskeys.getInt(1);
						pojo.setCodigo(codigo);
					}
				}

			} else {
				throw new Exception("No se ha podido guardar el registro" + pojo);
			}

		} catch (Exception e) {
			throw new Exception("No se ha podido guardar el empleado " + pojo.getNombre());
		}
		
		return pojo;
	}
	
}
