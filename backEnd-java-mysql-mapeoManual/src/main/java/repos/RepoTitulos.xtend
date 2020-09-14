package repos

import dominio.Titulo
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RepoTitulos {
	List<Titulo> listaTitulo = newArrayList
	static RepoTitulos titulos

	def static RepoTitulos getInstance() {
		if (titulos === null)
			titulos = new RepoTitulos
		titulos
	}

	def create(Titulo titulo) {

		listaTitulo.add(titulo)

	}
	
	def vaciar() {
		listaTitulo = newArrayList
	}
	
}