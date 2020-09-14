package dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Titulo {
	String idContenido=""
	String titulo=""
	String edadMedia=""
	String trasnfMedia=""
	
	new(String _id,String _titulo,String _edad,String _transf){
		
	idContenido=_id
	titulo=_titulo
	edadMedia=_edad
	trasnfMedia=_transf
		
	}
}