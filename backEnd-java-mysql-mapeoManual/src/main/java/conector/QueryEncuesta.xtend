package conector

import java.sql.Connection

import java.sql.DriverManager
import java.sql.PreparedStatement
import java.sql.ResultSet
import java.sql.Statement
import javax.swing.JOptionPane
import repos.RepoEncuestas
import dominio.Encuesta
import org.eclipse.xtend.lib.annotations.Accessors
import java.sql.Date
import java.text.SimpleDateFormat

@Accessors
class QueryEncuesta {
	RepoEncuestas encuestas = RepoEncuestas.getInstance
	
	String startDate = "01-02-1000";

	SimpleDateFormat sdf1 = new SimpleDateFormat("dd-mm-yyyy");
	java.util.Date date1 = sdf1.parse(startDate);
	java.sql.Date sqlStartDate = new java.sql.Date(date1.getTime());

	String finishDate = "01-02-9999";

	java.util.Date date2 = sdf1.parse(finishDate);
	java.sql.Date sqlFinishDate = new java.sql.Date(date2.getTime());
	
	

	def void llenar(String query, int registros, Date fechaDesde, Date fechaHasta) {
		encuestas.vaciar
		
		try {

			var Connection unaConexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root",
				"150696")
			var PreparedStatement unStatement = unaConexion.prepareStatement(query)
			unStatement.setInt(1, registros)
			unStatement.setDate(2, fechaDesde)
			unStatement.setDate(3, fechaHasta)
			var ResultSet unResultSet = unStatement.executeQuery()
			while (unResultSet.next()) {
				var String titulo = unResultSet.getString("titulo")
				var String ext = unResultSet.getString("extension")
				var String fecha = unResultSet.getString("fecha")
				var String mediaPuntaje = unResultSet.getString("media_puntaje")
				var String cantEncuesta = unResultSet.getString("cantidad_encuestas")
				var encuesta = new Encuesta(titulo, ext, fecha, mediaPuntaje, cantEncuesta)
				encuestas.create(encuesta)

			}
			unResultSet.close()
		} catch (Exception e) {
			System.out.println("No hubo conexion!!")
			e.printStackTrace()
		}

	}
}
