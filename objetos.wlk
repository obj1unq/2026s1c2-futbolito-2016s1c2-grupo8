// objetos.wlk
// objetos.wlk
// objetos.wlk
/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	
	method image() {
		return "lionel-titular.png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}
	
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)

	method levantarla(){
		self.validarColisionLionel()
		self.subirYBajar()
	}

	method validarColisionLionel(){
		if (not self.estoyConLionel()){
			self.error('no estoy con lionel!')
		}
	}

	method estoyConLionel(){
		return self.position() == lionel.position()
	}

	method subirYBajar(){
		self.subir()
		game.schedule(2000, {self.bajar()})
	}

	method subir(){
		position = game.at(self.xActual(),self.elevacion())
	}

	method xActual(){
		return self.position().x()
	}

	method elevacion(){
		return self.position().y()+1
	}

	method bajar(){
		position = game.at(self.xActual(),self.caida())
	}

	method caida(){
		return self.position().y()+1
	}

}
