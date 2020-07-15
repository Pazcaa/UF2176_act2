package com.ipartek.formacion.modelo.pojo;

public class Empleados {
	
	private int codigo;
	private String nif;
	private String nombre;
	private String apellido1;
	private String apellido2;
	private Departamento departamento;
	
	
	public Empleados() {
		super();
		this.codigo = 0;
		this.nif = "";
		this.nombre = "";
		this.apellido1 = "";
		this.apellido2 = "" ;
		this.departamento = new Departamento();
	}


	public int getCodigo() {
		return codigo;
	}


	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}


	public String getNif() {
		return nif;
	}


	public void setNif(String nif) {
		this.nif = nif;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getApellido1() {
		return apellido1;
	}


	public void setApellido1(String apellido1) {
		this.apellido1 = apellido1;
	}


	public String getApellido2() {
		return apellido2;
	}


	public void setApellido2(String apellido2) {
		this.apellido2 = apellido2;
	}


	public Departamento getDepartamento() {
		return departamento;
	}


	public void setDepartamento(Departamento departamento) {
		this.departamento = departamento;
	}


	@Override
	public String toString() {
		return "Empleados [codigo=" + codigo + ", nif=" + nif + ", nombre=" + nombre + ", apellido1=" + apellido1
				+ ", apellido2=" + apellido2 + ", departamento=" + departamento + "]";
	}
	
	
	
	
	

}
