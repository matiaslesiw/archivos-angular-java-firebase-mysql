package repos

import java.util.List
import dominio.Contenido
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RepoContenidos {

	List<Contenido> listaContenidos = newArrayList
	static RepoContenidos contenidos

	def static RepoContenidos getInstance() {
		if (contenidos === null)
			contenidos = new RepoContenidos
		contenidos
	}

	def create(Contenido contenido) {

		listaContenidos.add(contenido)

	}
	
	def vaciar() {
		listaContenidos = newArrayList
	}
	
	def buscar(String id) {
		
		listaContenidos.findFirst[elemento|elemento.idContenido == id]
	
	}
	
}
