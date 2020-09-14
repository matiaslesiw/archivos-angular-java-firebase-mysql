package javaClases;

import java.sql.*;	
import javax.swing.JOptionPane;

public class QueryUpdateJava {
	
	public static void main(String[] args) {
		try {

			Connection miConexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "mydogpupy170312");			
			
			PreparedStatement sentenciaSQL = miConexion.prepareStatement("CALL ACTUALIZAR_CONTENIDO(?, ?, ?, ?, ?)");

			sentenciaSQL.setInt(1, Integer.parseInt(JOptionPane.showInputDialog("Id contenido: ")));
			sentenciaSQL.setInt(2, Integer.parseInt(JOptionPane.showInputDialog("Id categoria: ")));
			sentenciaSQL.setString(3, JOptionPane.showInputDialog("Titulo: "));
			sentenciaSQL.setString(4, JOptionPane.showInputDialog("Fecha: "));
			sentenciaSQL.setString(5, JOptionPane.showInputDialog("Extension: "));
			
			sentenciaSQL.executeQuery();
			
			System.out.println("\nContenido modificado con exito ;)");

		} catch (Exception e) {

			System.out.println("\nNO HUBO CONEXION!");

			e.printStackTrace();
		}
	}

}
