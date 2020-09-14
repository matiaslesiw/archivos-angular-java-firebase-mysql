package javaClases;

import java.sql.*;

import javax.swing.JOptionPane;

public class QueryInsertJava {

	public static void main(String[] args) {
		try {
			
			Connection miConexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "mydogpupy170312");
			
			PreparedStatement sentenciaSQL = miConexion.prepareStatement("CALL AGREGAR_CONTENIDO(?, ?, ?, ?, ?)");

			sentenciaSQL.setInt(1, Integer.parseInt(JOptionPane.showInputDialog("Id contenido: ")));
			sentenciaSQL.setString(2, JOptionPane.showInputDialog("Titulo: "));
			sentenciaSQL.setString(3, JOptionPane.showInputDialog("Fecha: "));
			sentenciaSQL.setString(4, JOptionPane.showInputDialog("Extension: "));
			sentenciaSQL.setString(5, JOptionPane.showInputDialog("Tipo: "));
			
			sentenciaSQL.executeQuery();
			
			System.out.println("\nContenido agregado con exito ;)");
			
		} catch (Exception e) {
			
			System.out.println("\nNO HUBO CONEXION!");
			
			e.printStackTrace();
		}
	}

}
