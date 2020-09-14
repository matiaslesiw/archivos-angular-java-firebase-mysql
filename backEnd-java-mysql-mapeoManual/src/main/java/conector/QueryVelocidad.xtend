package conector

import java.sql.Connection
import java.sql.DriverManager
import java.sql.PreparedStatement
import java.sql.ResultSet
import java.sql.Statement
import javax.swing.JOptionPane
import dominio.VelocidadTransf
import repos.RepoVelocidad
import org.eclipse.xtend.lib.annotations.Accessors

/*"CALL MOSTRAR_VELOC_TRANSF_ASC(?)"*/
/*"CALL MOSTRAR_VELOC_TRANSF_DESC(?)"*/
@Accessors
class QueryVelocidad {
	
	RepoVelocidad velocidades=	RepoVelocidad.getInstance
    
	
	def llenar(String query, int registros) {
		velocidades.vaciar
		try {
			var Connection unaConexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "150696")
			var PreparedStatement unStatement = unaConexion.prepareStatement(query)
			 unStatement.setInt(1, registros)
			var ResultSet unResultSet = unStatement.executeQuery()
			while (unResultSet.next()) {
				
				var String titulo = unResultSet.getString("titulo")
				var String extensionArchivo = unResultSet.getString("extensionarchivo")
				var String idDescarga = unResultSet.getString("iddescarga")
				var String velocidadTransf = unResultSet.getString("velocidadtransf")
				var velocidad = new VelocidadTransf (titulo,extensionArchivo,idDescarga,velocidadTransf)
				velocidades.create(velocidad)
				
			}
			unResultSet.close()
		} catch (Exception e) {
			System.out.println("No hubo conexion!!")
			e.printStackTrace()
		}

	}
}
