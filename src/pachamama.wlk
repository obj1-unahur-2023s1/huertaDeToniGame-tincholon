import wollok.game.*

object pachamama {
	var property position = game.at(13 , 0)
	var property image = "pachamama-agradecida.png"
	var nivelDeAgradecimiento = 10
	
	method llover() {
		nivelDeAgradecimiento += 5
	}
	method tirarBasura() {
		nivelDeAgradecimiento = 0.max(nivelDeAgradecimiento - 10)
	}
	method fumigar() {
		nivelDeAgradecimiento = 0
	}
	method abonar() {
		nivelDeAgradecimiento *= 2
	}
	method estaAgradecida() = nivelDeAgradecimiento >= 10
	
	method image() {
		return "pachamama-agradecida.png"
	}
}
