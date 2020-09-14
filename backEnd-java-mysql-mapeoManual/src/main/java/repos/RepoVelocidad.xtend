package repos

import dominio.VelocidadTransf
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RepoVelocidad {
	
	List<VelocidadTransf> listaVelocidad = newArrayList
	static RepoVelocidad velocidades

	def static RepoVelocidad getInstance() {
		if (velocidades === null)
			velocidades = new RepoVelocidad
		velocidades
	}

	def create(VelocidadTransf velocidad) {

		listaVelocidad.add(velocidad)

	}
	
	def vaciar() {
		listaVelocidad = newArrayList
	}
	
	
}