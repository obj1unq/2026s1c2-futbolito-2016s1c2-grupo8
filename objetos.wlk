/** First Wollok example */
import wollok.game.*
object biglia {
  var property position = game.at(4,5)
	
	method image() {
		return "lionel-suplente.png"
	}
	method esPateada() {
	  return "Auch!"
	}
}
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

	method patear() {
		self.validarEsPelota()
	  game.uniqueCollider(self).esPateada()
	}

	method validarEsPelota() {
	  if(not self.esPelota()){
		self.error("Falta!")
	  }
	}

	method esPelota() {
	  //return game.uniqueCollider(self) == pelota
	  return game.colliders(self).contains(pelota)
	}
	
	method hacerTaquito() {
	  self.hayPelotaAlPie()
      pelota.taquito()
	}

	method hayPelotaAlPie() {
	  if (not self.esPelota()){
		self.error("No tengo la pelota a mi alcance.")
	  }
	}
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(6,5)

	method esPateada() {
		const xFinal = game.width() -1
		const distancia = position.x() +3
	  position = game.at(distancia.min(xFinal),position.y())
	}

	method taquito() {
	  position = game.at((position.x() - 2).max(0), position.y())  // Tip: usar el método max de los números entre el x actual de la pelota - 2 y 0. 
	}
}

