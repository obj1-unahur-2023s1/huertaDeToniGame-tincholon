import pachamama.*

class Planta {
	var property image
	
	method regate()
	method valor()
	method estaLista()
	
	method tieneGluten() = false
}

class Maiz inherits Planta {
	var esBebe = true
	
	
	method initialize() {
		image = "maiz_bebe.png"
	}
	override method regate() {
		esBebe = false
		image = "maiz_adulto.png"
	}
	override method estaLista() = not(esBebe)
	
	override method valor() = if(pachamama.estaAgradecida()) {180} else {150} 
}

class Trigo inherits Planta {
	var etapa = 0
	var vecesRegada = 0
	
	method initialize() {
		image = "trigo_0.png"
	}
	
	override method regate() {
		vecesRegada ++
		if(pachamama.estaAgradecida()) {
			vecesRegada ++
		}
		etapa = vecesRegada%4
		image = "trigo_" + etapa + ".png"		
	}
	
	override method estaLista() = etapa >= 2
	override method valor() = if(etapa == 2) {100} else {200}
	override method tieneGluten() = true
}

class Tomaco inherits Planta {
	
	method initialize() {
		image = "tomaco_ok.png"
	}
	override method regate() {}
	override method valor() = 80
	override method estaLista() = not(pachamama.estaAgradecida())
}


// Agregar las demás plantas y completar el Maiz.