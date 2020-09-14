package javaClases;

import java.sql.*;

import javax.swing.JOptionPane;

public class QueryDeleteJava {
	public static void main(String[] args) {
		try {

			Connection miConexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "mydogpupy170312");

			PreparedStatement sentenciaSQL = miConexion.prepareStatement("CALL ELIMINAR_CONTENIDO(?)");

			sentenciaSQL.setInt(1, Integer.parseInt(JOptionPane.showInputDialog("Id contenido: ")));
			
			sentenciaSQL.executeQuery();
			
			System.out.println("\nContenido eliminado con exito ;)");

		} catch (Exception e) {

			System.out.println("\nNO HUBO CONEXION!");

			e.printStackTrace();
		}
	}

}


