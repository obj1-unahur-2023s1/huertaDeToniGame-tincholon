import wollok.game.*

object toni {
	const property image = "toni.png"
	var property position = game.center()//game.at(3, 3)
	
	const plantasSembradas = []
	const plantasCosechadas = []
	var monedas = 0

	
	method monedas() = monedas
	
	method sembrar(unaPlanta) {
		plantasSembradas.add(unaPlanta)
	}
	
	method regar(unaPlanta) {
		unaPlanta.regate()
	}
	method regarLasPlantas() {
		plantasSembradas.forEach({planta => planta.regate()})
	}
	
	method cosechar(unaPlanta) { //Acá no validamos que está lista porque no queremos recorrer procesando todo el tiempo. El encargado que va a validar si puede cosechar o no va a ser la propia acción de la tecla.
		plantasSembradas.remove(unaPlanta)
		plantasCosechadas.add(unaPlanta)
	}
	
	method plantasListasParaCosechar() = plantasSembradas.filter({planta => planta.estaLista()})
	
	method cosecharTodo() {
		self.plantasListasParaCosechar().forEach({planta => 
			plantasCosechadas.add(planta)
			plantasSembradas.remove(planta)
		})
	}
	
	method venderCosecha() {
		monedas += plantasCosechadas.sum({planta => planta.valor()})
		plantasCosechadas.clear()
	}
	
	method cuantoHayParaCeliacos() = self.plantasListasParaCosechar().count({planta => not(planta.tieneGluten())})
	
	method convieneRegar() = plantasSembradas.any({planta => not(planta.estaLista())})
	// Pegar acá todo lo que tenían de Toni en la etapa 1
}