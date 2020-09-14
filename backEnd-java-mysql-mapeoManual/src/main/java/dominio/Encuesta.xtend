package dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Encuesta {
	String titulo;
	String ext;
	String fecha;
	String mediaPuntaje
	String cantEncuestas
	
	new(String _titulo,String _ext,String _fecha,String _mediaPuntaje,String _cantEncuestas){
		titulo=_titulo
	 ext=_ext
	fecha=_fecha
	mediaPuntaje=_mediaPuntaje
	 cantEncuestas=_cantEncuestas
		
		
	}
}