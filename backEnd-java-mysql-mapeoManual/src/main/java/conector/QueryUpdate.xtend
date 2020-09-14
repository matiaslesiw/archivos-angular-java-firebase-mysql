package conector

import java.sql.*
import javax.swing.JOptionPane
import dominio.Contenido
import repos.RepoCategorias

class QueryUpdate {

	RepoCategorias repoCategorias = RepoCategorias.getInstance

	def modificar(Contenido contenido) {
		repoCategorias.vaciar
		var pertenece = new QueryPerteneceCategoria
		var categoria = new QueryCategoria
		try {
			categoria.llenar
			var tamaño = repoCategorias.listaCategorias.length
			var Connection miConexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root",
				"150696")
			var PreparedStatement sentenciaSQL = miConexion.prepareStatement("CALL ACTUALIZAR_CONTENIDO(?, ?, ?, ?,?)")
			sentenciaSQL.setInt(1, Integer.parseInt(contenido.idContenido))
			sentenciaSQL.setString(2, contenido.titulo)
			sentenciaSQL.setString(3, contenido.fechaPublicacion)
			sentenciaSQL.setString(4, contenido.extensionArchivo)
			sentenciaSQL.setString(5, contenido.url)

			sentenciaSQL.executeQuery()
			System.out.println("\nContenido modificado con exito ;)")
			repoCategorias.vaciarCategorias(contenido, tamaño)
			repoCategorias.insertarCategorias(contenido)

			miConexion.close()
		} catch (Exception e) {
			System.out.println("\nNO HUBO CONEXION!")
			e.printStackTrace()
		}

	}
}
