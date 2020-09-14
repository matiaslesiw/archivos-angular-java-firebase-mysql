package conector

import java.sql.*
import javax.swing.JOptionPane

class QueryDelete {
	
		
def borrar(String id ){
		try {
			var Connection miConexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "150696")
			var PreparedStatement sentenciaSQL = miConexion.prepareStatement("CALL ELIMINAR_CONTENIDO(?)")
			sentenciaSQL.setInt(1, Integer.parseInt(id))
			sentenciaSQL.executeQuery()
			System.out.println("\nContenido eliminado con exito ;)")
			miConexion.close()
		} catch (Exception e) {
			System.out.println("\nNO HUBO CONEXION!")
			e.printStackTrace()
		}

	}}

