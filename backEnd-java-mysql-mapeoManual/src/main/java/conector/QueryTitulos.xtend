package conector

import java.sql.Connection
import java.sql.Date
import java.sql.DriverManager
import java.sql.PreparedStatement
import java.sql.ResultSet
import java.sql.Statement
import javax.swing.JOptionPane
import repos.RepoTitulos
import dominio.Titulo
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class QueryTitulos {
	RepoTitulos titulos=	RepoTitulos.getInstance
	// String queryMediaTransfAsc = "CALL EDAD_TRANSF_MEDIA_ASC_POR_TRANSF(?)";
	// String queryMediaTransfDesc = "CALL EDAD_TRANSF_MEDIA_DESC_POR_TRANSF(?)";
	// String queryMediaEdadeAsc = "CALL EDAD_TRANSF_MEDIA_ASC_POR_EDAD(?)";
	// String queryMediaEdadDesc = "CALL EDAD_TRANSF_MEDIA_DESC_POR_EDAD(?)";
	
	def llenar(String query, int registros) {
		
		titulos.vaciar
		try {
			var Connection unaConexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "150696")
			var PreparedStatement unStatement = unaConexion.prepareStatement(query)
			unStatement.setInt(1,registros)
			var ResultSet unResultSet = unStatement.executeQuery()
			while (unResultSet.next()) {
				
				var String idContenido = unResultSet.getString("IDCONTENIDO")
				var String tituloContenido = unResultSet.getString("TITULO")
				var String edad = unResultSet.getString("EDAD_MEDIA")
				var String transf = unResultSet.getString("TRANSF_MEDIA")
				//var titulo= new Titulo (idContenido,tituloContenido,edad,transf)
				var titulo= new Titulo (idContenido,tituloContenido,edad,transf)
				titulos.create(titulo)
								
			}
			unResultSet.close()
		} catch (Exception e) {
			System.out.println("No hubo conexion!!")
			e.printStackTrace()
		}

	}
}