package repos

import dominio.Categoria
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import com.fasterxml.jackson.annotation.JsonIgnore
import conector.QueryPerteneceCategoria
import dominio.Contenido

@Accessors
class RepoCategorias {
	List<Categoria> listaCategorias = newArrayList
	static RepoCategorias categorias
	@JsonIgnore int i

	def static RepoCategorias getInstance() {
		if (categorias === null)
			categorias = new RepoCategorias
		categorias
	}

	def create(Categoria categoria) {

		listaCategorias.add(categoria)

	}
	
	def vaciar() {
		listaCategorias = newArrayList
	}
	
	
	
	def insertarCategorias(Contenido contenido) {
		  var pertenece = new QueryPerteneceCategoria
          pertenece.llenar(contenido.idContenido)
		 for (i=0;i<contenido.listaCategorias.length;i++){
                pertenece.agregarRelacion(contenido.idContenido,contenido.listaCategorias.get(i))
            }
	}
	
	def vaciarCategorias(Contenido contenido,int tamaño) {
		  var pertenece = new QueryPerteneceCategoria
          pertenece.llenar(contenido.idContenido)
		 for (i=201;i<tamaño+201;i++){
                pertenece.borrarRelacion(contenido.idContenido,Integer.toString(i))
            }
	}
	
}