package conector

import java.sql.*
import javax.swing.JOptionPane
import dominio.Contenido
import java.util.Date;
import repos.RepoCategorias

class QueryInsert {
	RepoCategorias repoCategorias=	RepoCategorias.getInstance
	
	
	def insert(Contenido contenido) {
	
	repoCategorias.vaciar
	
	
	var categoria = new QueryCategoria

	
	
		try {
			categoria.llenar
			var Connection miConexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "150696")
			var PreparedStatement sentenciaSQL = miConexion.prepareStatement("CALL AGREGAR_CONTENIDO(?, ?, ?, ?, ?,?)")
			contenido.idContenido = Integer.toString((Math.floor(Math.random()*999+300) as int))
			sentenciaSQL.setInt(1,Integer.parseInt(contenido.idContenido))
			sentenciaSQL.setString(2,contenido.titulo)
			sentenciaSQL.setString(3,contenido.fechaPublicacion)
			sentenciaSQL.setString(4,contenido.extensionArchivo)
			sentenciaSQL.setString(5, "Descargable")
			sentenciaSQL.setString(6, contenido.url)
			sentenciaSQL.executeQuery()
            repoCategorias.insertarCategorias(contenido)
           
			
			System.out.println("\nContenido agregado con exito ;)")
			miConexion.close()
			
		} catch (Exception e) {
			System.out.println("\nNO HUBO CONEXION!")
			e.printStackTrace()
		}

	}
	
	
}
