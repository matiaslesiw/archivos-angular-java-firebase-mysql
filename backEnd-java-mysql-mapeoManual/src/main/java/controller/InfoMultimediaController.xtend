package controller

import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Controller
import repos.RepoVelocidad
import repos.RepoContenidos
import repos.RepoEncuestas
import repos.RepoCategorias
import repos.RepoTitulos
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.annotation.Get
//import org.omg.CORBA.UserException
import conector.QueryContenido
import conector.QueryCategoria
import conector.QueryVelocidad
import conector.QueryTitulos
import conector.QueryEncuesta
import java.text.SimpleDateFormat
//import java.util.Date
import org.uqbar.xtrest.api.annotation.Put
import org.uqbar.xtrest.api.annotation.Body
//import org.uqbar.xtrest.http.ContentType
import dominio.Contenido
import conector.QueryDelete
import conector.QueryInsert
import conector.QueryUpdate
import org.uqbar.xtrest.api.annotation.Post
import conector.QueryPerteneceCategoria
//import dominio.Test
//import org.omg.CORBA.UserException

class UserException extends Exception {}

@Controller
class InfoMultimediaController {
	extension JSONUtils = new JSONUtils
	RepoVelocidad velocidades = RepoVelocidad.getInstance
	RepoContenidos contenidos = RepoContenidos.getInstance
	RepoEncuestas encuestas = RepoEncuestas.getInstance
	RepoCategorias categorias = RepoCategorias.getInstance
	RepoTitulos titulos = RepoTitulos.getInstance
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	

	@Get('/contenidos')
	def Result contenido() {

		var contenido = new QueryContenido
		contenido.llenar

		try {

			ok((contenidos.listaContenidos).toJson)
		} catch (UserException e) {
		}
	}
	
	@Get('/categorias/:id')//no
	def Result categoriasContenido() {

		var pertenece = new QueryPerteneceCategoria
		pertenece.llenar(id)
		
		System.out.println(pertenece)

		try {

			ok((pertenece).toJson)
		} catch (UserException e) {
		}
	}
	
	@Get('/contenidos/:id')
	def Result contenido() {

		var contenido = new QueryContenido
		contenido.llenar

		try {

			ok((contenidos.buscar(id)).toJson)
		} catch (UserException e) {
		}
	}

	@Get('/categoria')
	def Result categoria() {

		var categoria = new QueryCategoria
		categoria.llenar

		try {

			ok((categorias.listaCategorias).toJson)
		} catch (UserException e) {
		}
	}

    
	
	@Put("/contenidos/borrar/:id") // polemico , ver mejor 
	def borrar() {
		var delete = new QueryDelete

		try {
			delete.borrar(id)
			ok('{ "status" : "OK" }');
		} catch (Exception e) {
			badRequest(e.message)
		}

	}
	
	@Post("/contenidos/agregar/:titulo/:ext/:url") // polemico , ver mejor 
	/*Falta Probarlo */ def agregar(@Body String body) {
		
		var agregar = new QueryInsert
		val Contenido contenido = fromJson(body, Contenido)

		System.out.println(contenido.listaCategorias)
		
		try {
			agregar.insert(contenido)
			ok('{ "status" : "OK" }');
		} catch(Exception e) {
			return badRequest(e.message)
		}

	}
	
	@Post("/contenidos/agregar2")
	def agregar2(@Body String body) {
		
		var agregar = new QueryInsert
		val Contenido contenido = fromJson(body, Contenido)

		System.out.println(contenido.listaCategorias)
		
		try {
			agregar.insert(contenido)
			ok('{ "status" : "OK" }');
		} catch(Exception e) {
			return badRequest(e.message)
		}

	}

	@Put("/contenidos/modificar/:titulo/:ext/:id/:url") 
	/*Falta Probarlo */def modificar() {
		
		var update = new QueryUpdate

		try {
			val actualizado = new Contenido (id ,titulo,"2020-02-19",ext,url)
			update.modificar(actualizado)
			ok('{ "status" : "OK" }');

		} catch (Exception e) {
			badRequest(e.message)
		}

	}
	
	@Put("/contenidos/modificar2") 
	/*Falta Probarlo */def modificar2(@Body String body) {
		
		var update = new QueryUpdate
		val Contenido contenido = fromJson(body, Contenido)

		System.out.println(contenido.listaCategorias)
		
		try {
			update.modificar(contenido)
			ok('{ "status" : "OK" }');
		} catch(Exception e) {
			return badRequest(e.message)
		}

	}
	

	@Get('/velTransfAsc/:registros')
	def Result velTransfAsc() {

		var velocidad = new QueryVelocidad
		velocidad.llenar("CALL MOSTRAR_VELOC_TRANSF_ASC(?)", Integer.parseInt(registros))

		try {

			ok((velocidades.listaVelocidad).toJson)
		} catch (UserException e) {
		}
	}

	@Get('/velTransfDesc/:registros')
	def Result velTransfDesc() {

		var velocidad = new QueryVelocidad
		velocidad.llenar("CALL MOSTRAR_VELOC_TRANSF_DESC(?)", Integer.parseInt(registros))

		try {

			ok((velocidades.listaVelocidad).toJson)
		} catch (UserException e) {
		}
	}

	@Get('/velTransfMediaAsc/:registros')
	def Result velTransfMediaAsc() {

		var titulo = new QueryTitulos
		
		titulo.llenar("CALL EDAD_TRANSF_MEDIA_ASC_POR_TRANSF(?)", Integer.parseInt(registros))
		
		
		try {

			ok((titulos.listaTitulo).toJson)
		} catch (UserException e) {
		}
	}

	@Get('/velTransfMediaDesc/:registros')
	def Result velTransfMediaDesc() {

		var titulo = new QueryTitulos
		titulo.llenar("CALL EDAD_TRANSF_MEDIA_DESC_POR_TRANSF(?)", Integer.parseInt(registros))

		try {

			ok((titulos.listaTitulo).toJson)
		} catch (UserException e) {
		}
	}

	@Get('/velEdadMediaAsc/:registros')
	def Result velEdadMediaAsc() {

		var titulo = new QueryTitulos
		titulo.llenar("CALL EDAD_TRANSF_MEDIA_ASC_POR_EDAD(?)", Integer.parseInt(registros))

		try {

			ok((titulos.listaTitulo).toJson)
		} catch (UserException e) {
		}
	}

	@Get('/velEdadMediaDesc/:registros')
	def Result velEdadMediaDesc() {

		var titulo = new QueryTitulos
		titulo.llenar("CALL EDAD_TRANSF_MEDIA_DESC_POR_EDAD(?)", Integer.parseInt(registros))

		try {

			ok((titulos.listaTitulo).toJson)
		} catch (UserException e) {
		}
	}

	@Get('/mediaPuntajeAsc/:registros/:desde/:hasta')
	def Result mediaPuntajeAsc() {
	    val startDate = parsear(desde);
	
		val sdf1 = new SimpleDateFormat("yyyy-mm-dd");
		val date1 = sdf1.parse(startDate);
		val fechaDesdeParser = new java.sql.Date(date1.getTime());
	
		val finishDate = parsear(hasta);
	
		val date2 = sdf1.parse(finishDate);
		val fechaHastaParser = new java.sql.Date(date2.getTime());

		var encuesta = new QueryEncuesta

		encuesta.llenar("CALL MEDIA_PUNTAJE_ASC(?, ?, ?)", Integer.parseInt(registros), fechaDesdeParser,
			fechaHastaParser)

		try {

			ok((encuestas.listaEncuestas).toJson)
		} catch (UserException e) {
		}
	}

	@Get('/mediaPuntajeDesc/:registros/:desde/:hasta')
	def Result mediaPuntajeDesc() {
	    val startDate = parsear(desde);
	
		val sdf1 = new SimpleDateFormat("yyyy-mm-dd");
		val date1 = sdf1.parse(startDate);
		val fechaDesdeParser = new java.sql.Date(date1.getTime());
	
		val finishDate = parsear(hasta);
	
		val date2 = sdf1.parse(finishDate);
		val fechaHastaParser = new java.sql.Date(date2.getTime());

		var encuesta = new QueryEncuesta

		encuesta.llenar("CALL MEDIA_PUNTAJE_DESC(?, ?, ?)", Integer.parseInt(registros), fechaDesdeParser,
			fechaHastaParser)

		try {

			ok((encuestas.listaEncuestas).toJson)
		} catch (UserException e) {
		}
	}
	
	def parsear(String string) {
//		val ano= string.substring(0,3)
//		val mes= string.substring(4,5)
//		val dia= string.substring(6,7)
		System.out.println(string.substring(0,4) +'-'+ string.substring(4,6) +'-'+ string.substring(6,8))
		System.out.println(string.substring(4,6))
		return string.substring(0,4) +'-'+ string.substring(4,6) +'-'+ string.substring(6,8)
		
	}

	@Get('/mediaEncuestaDesc/:registros/:desde/:hasta')
	def Result mediaEncuestaDesc() {

		val startDate = parsear(desde);

	val sdf1 = new SimpleDateFormat("yyyy-mm-dd");
	val date1 = sdf1.parse(startDate);
	val fechaDesdeParser = new java.sql.Date(date1.getTime());

	val finishDate = parsear(hasta);

	val date2 = sdf1.parse(finishDate);
	val fechaHastaParser = new java.sql.Date(date2.getTime());

		var encuesta = new QueryEncuesta

		encuesta.llenar("CALL MEDIA_ENCUESTAS_DESC(?, ?, ?)", Integer.parseInt(registros), fechaDesdeParser,
			fechaHastaParser)

		try {

			ok((encuestas.listaEncuestas).toJson)
		} catch (UserException e) {
		}
	}
	@Get('/mediaEncuestaAsc/:registros/:desde/:hasta')
	def Result mediaEncuestaAsc() {

		val startDate = parsear(desde);

	val sdf1 = new SimpleDateFormat("yyyy-mm-dd");
	val date1 = sdf1.parse(startDate);
	val fechaDesdeParser = new java.sql.Date(date1.getTime());

	val finishDate = parsear(hasta);

	val date2 = sdf1.parse(finishDate);
	val fechaHastaParser = new java.sql.Date(date2.getTime());

		var encuesta = new QueryEncuesta

		encuesta.llenar("CALL MEDIA_ENCUESTAS_ASC(?, ?, ?)", Integer.parseInt(registros), fechaDesdeParser,
			fechaHastaParser)

		try {

			ok((encuestas.listaEncuestas).toJson)
		} catch (UserException e) {
		}
	}

	

}

