package dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import com.fasterxml.jackson.annotation.JsonIgnore

@Accessors
class Contenido {
	String idContenido 
	String titulo 
	String fechaPublicacion 
	String extensionArchivo 
    String url
    @JsonIgnore List<String> categorias = newArrayList
     List<String> listaCategorias = newArrayList
    @JsonIgnore int i
    

	// Necesario para fromJSON
	new() {

	}
	
	// para metodos anteriores que no mandan lista de categorias
	new(String contenido, String _titulo, String fecha, String ext, String _url){
		idContenido =contenido
		titulo = _titulo
		fechaPublicacion =fecha
		extensionArchivo =ext		
	    url = _url		
	}

	new(String contenido,String _titulo,String fecha, String ext,String _url, List<String> _listaCategorias) {
		idContenido =contenido
		titulo = _titulo
		fechaPublicacion =fecha
		extensionArchivo =ext		
	    url = _url		
	    categorias = _listaCategorias
	}
	
	def asignarCategorias(java.util.List<Categoria> _categorias) {
		
		for(i=0;i<_categorias.length;i++){
			listaCategorias.add(_categorias.get(i).idCategoria)
		}
		
		categorias=listaCategorias

	}
	


}