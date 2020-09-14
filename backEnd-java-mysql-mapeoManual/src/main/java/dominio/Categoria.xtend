package dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Categoria {
	
	String idCategoria
	
	String descCategoria
	
	new(String _id) {
		idCategoria=_id
		
	}
	
	new(String _id, String _desc) {
		idCategoria=_id
		descCategoria=_desc
	}
	
}