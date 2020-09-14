package conector
import java.sql.*
import dominio.Contenido
import repos.RepoContenidos
import repos.RepoCategorias
import dominio.Categoria
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class QueryCategoria {
	//def static void main(String[] args) {
		// TODO Auto-generated method stub
	RepoCategorias categorias=	RepoCategorias.getInstance
	def llenar(){	 
		categorias.vaciar
		try {
			// Creamos conexion
			var Connection unaConexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "150696")
			// Creamos objeto statement
			var Statement unStatement = unaConexion.createStatement()
			// Ejecutar instrucciones SQL
			var ResultSet unResultSet = unStatement.executeQuery("SELECT * FROM CATEGORIA")
			// Recorrer el ResultSet
			while (unResultSet.next()) {
				// mientras exista un proximo registro
				var String idCategoria = unResultSet.getString("idCategoria")
				var String descCategoria = unResultSet.getString("categoriaDesc")
				
				var categoria= new Categoria (idCategoria,descCategoria)
				categorias.create(categoria)
				
			}
			unaConexion.close()
		} catch (Exception e) {
			System.out.println("No hubo conexion!!")
			e.printStackTrace()
		}

	}
}

