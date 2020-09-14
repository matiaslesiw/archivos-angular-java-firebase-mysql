package conector

import java.sql.*
import dominio.Contenido
import repos.RepoContenidos
import org.eclipse.xtend.lib.annotations.Accessors
import repos.RepoCategorias

@Accessors
class QueryContenido {
	RepoContenidos contenidos=	RepoContenidos.getInstance
	RepoCategorias categorias=	RepoCategorias.getInstance
	def llenar(){	 
		contenidos.vaciar
		
		try {
			// Creamos conexion
			var Connection unaConexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "150696")
			// Creamos objeto statement
			var Statement unStatement = unaConexion.createStatement()
			// Ejecutar instrucciones SQL
			var ResultSet unResultSet = unStatement.executeQuery("CALL MOSTRAR_CONTENIDO()")
			// Recorrer el ResultSet
			while (unResultSet.next()) {
				// mientras exista un proximo registro
				categorias.vaciar
				var pertenece = new QueryPerteneceCategoria
				var String idContenido = unResultSet.getString("idContenido")
				var String titulo = unResultSet.getString("titulo")
				var String fechaPublicacion = unResultSet.getString("fechaPublicacion")
				var String extensionArchivo = unResultSet.getString("extensionArchivo")
				var String url = unResultSet.getString("url")
				pertenece.llenar(idContenido)
				var contenido= new Contenido (idContenido,titulo,fechaPublicacion,extensionArchivo,url)
				contenido.asignarCategorias(categorias.listaCategorias)
				contenidos.create(contenido)
				
			}
			unaConexion.close()
		} catch (Exception e) {
			System.out.println("No hubo conexion!!")
			e.printStackTrace()
		}

	}
}
                                                                                                               