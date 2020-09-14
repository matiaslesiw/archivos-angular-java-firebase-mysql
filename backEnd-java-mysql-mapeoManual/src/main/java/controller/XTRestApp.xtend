package controller

import org.uqbar.xtrest.api.XTRest

class XTRestApp {
	def static void main(String [] Args) {
		
		XTRest.startInstance(9000, new InfoMultimediaController)
		
	}
}