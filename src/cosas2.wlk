object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method enCamion(){
		
	}
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method enCamion(){
		transformadoEnAuto = false
	}
}
object paqueteDeLadrillos {
	var peso = 0
	method peso(){return peso}
	method cantLadrillos(numDeLadrillos){
		peso += numDeLadrillos * 2
	}
	method nivelPeligrosidad() { return 2 }
	method enCamion(){
		self.cantLadrillos(12)
	}
}
object arenaDeGranel {
	var property peso = 0
	method nivelPeligrosidad() { return 1 }
	method enCamion(){
		self.peso(20)
	}
}
 object bateriaAntiaerea {
 	var misiles = true
 	method estaConMisiles(){
 		return misiles
 	}
 	method configurarMisiles(estado) {misiles = estado}
 	method peso(){
 		return if (misiles) {300} else {200}
 	}
 	method nivelPeligrosidad() {
 		return if (misiles) { 100 } else { 0 }
 	}
 	method enCamion(){
		self.configurarMisiles(true)
	}
}
object contenedorPortuario{
	var cosas = []
	method peso(){
		return 100 + cosas.sum({cosa => cosa.peso()})
	}
	method cosas(){
		return cosas
	}
	method nivelPeligrosidad(){
		return if (cosas.size() > 0){
			 		cosas.max({nivelMayor => nivelMayor.nivelPeligrosidad()}).nivelPeligrosidad()
			 	}
				else {
		 			0
		 		}
	}
	method agregarAlContenedor(cosa){
		cosas.addAll(cosa)
	}
	method enCamion(){
		cosas.forEach({cada => cada.enCamion()})
	}
}
object residuosRadioactivos {
	var property peso
	method nivelPeligrosidad() = return 200
	method enCamion(){
		self.peso(15)
	}
}
object embalajeDeSeguridad {
	var cosas = []
	method embalarCosa(cosa){
		cosas.add(cosa)
	}
	method peso(){
		return cosas.sum {pesos => pesos.peso()}
	}
	method nivelPeligrosidad(){
		return cosas.max({pesos => pesos.nivelPeligrosidad()}).nivelPeligrosidad()/2
	}
	method enCamion(){
		
	}
}