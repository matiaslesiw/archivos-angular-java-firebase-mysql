package repos

import dominio.Encuesta
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RepoEncuestas {
	List<Encuesta> listaEncuestas = newArrayList
	static RepoEncuestas encuestas

	def static RepoEncuestas getInstance() {
		if (encuestas === null)
			encuestas = new RepoEncuestas
		encuestas
	}

	def create(Encuesta encuesta) {

		listaEncuestas.add(encuesta)

	}
	
	def vaciar() {
		listaEncuestas = newArrayList
	}
	
}