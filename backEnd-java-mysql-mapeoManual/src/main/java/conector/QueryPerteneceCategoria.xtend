package conector
import java.sql.*
import javax.swing.JOptionPane
import dominio.Contenido
import dominio.Categoria
import repos.RepoCategorias

class QueryPerteneceCategoria {
	RepoCategorias categorias = RepoCategorias.getInstance
	
	def llenar (String idContenido) {
		categorias.vaciar
		try {
			
			var Connection unaConexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "150696")
			
			var PreparedStatement unStatement = unaConexion.prepareStatement("CALL CONTENIDO_CATEGORIAS(?)")
			unStatement.setInt(1, Integer.parseInt(idContenido))
			
			var ResultSet unResultSet = unStatement.executeQuery()
			// Recorrer el ResultSet
			while (unResultSet.next()) {
				
				var String idCategoria = unResultSet.getString("CATEGORIA_IDCATEGORIA")
				
				var cat= new Categoria (idCategoria)
				categorias.create(cat)
				
			}
			unaConexion.close()
		} catch (Exception e) {
			System.out.println("No hubo conexion!!")
			e.printStackTrace()
		}

	}
				
	
	def borrarRelacion(String idContenido ,String idCategoria) {
		try {
			var Connection miConexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "150696")
				var PreparedStatement sentenciaSQL = miConexion.prepareStatement("CALL ELIMINAR_CONTENIDO_PERTENECE_CATEGORIA(?, ?)")
			    sentenciaSQL.setInt(1, Integer.parseInt(idContenido))
         	    sentenciaSQL.setInt(2, Integer.parseInt(idCategoria))
         	    sentenciaSQL.executeQuery()
				} catch (Exception e) {
			System.out.println("\nNO HUBO CONEXION!")
			e.printStackTrace()
		}
				}
				
  def agregarRelacion(String idContenido ,String idCategoria) {
		try {
			var Connection miConexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root",
				"150696")
				var PreparedStatement sentenciaSQL = miConexion.prepareStatement("CALL AGREGAR_CONTENIDO_PERTENECE_CATEGORIA(?, ?)")
			    sentenciaSQL.setInt(1, Integer.parseInt(idContenido))
         	    sentenciaSQL.setInt(2, Integer.parseInt(idCategoria))
				sentenciaSQL.executeQuery()
				} catch (Exception e) {
			System.out.println("\nNO HUBO CONEXION!")
			e.printStackTrace()
		}
				}
}