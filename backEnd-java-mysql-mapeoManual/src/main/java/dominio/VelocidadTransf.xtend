package dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class VelocidadTransf {
	String titulo= ""
	String extensionArchivo= ""
	String idDesacarga=""
	String velocidadTransf=""
	
	new(String _titulo, String _extensionArchivo, String _idDesacarga, String _velocidadTransf ) {
	 titulo= _titulo
	 extensionArchivo= _extensionArchivo
	 idDesacarga= _idDesacarga
	 velocidadTransf= _velocidadTransf
	}
	
}