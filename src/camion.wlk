import cosas.*

object camion {
	const property cosas = []
	const pesoTara = 1000
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	method descargar(unaCosa){
		cosas.remove(unaCosa)
	}
	method todoPesoPar(){
		return cosas.all({pesoPar => pesoPar.peso().even()})
	}
	method hayAlgunoQuePesa(peso){
		return cosas.any({igualPeso => igualPeso.peso() == peso})
	}
	method elDeNivel(nivel){
		return cosas.find({igualNivel => igualNivel.nivelPeligrosidad() == nivel})
	}
	method pesoTotal(){
		return pesoTara + cosas.sum({pesos => pesos.peso()})
	}
	method excedidoDePeso(){
		return self.pesoTotal() < 2500
	}
	method objetosQueSuperanPeligrosidad(nivel){
		return cosas.filter({mayorNivel => mayorNivel.nivelPeligrosidad() > nivel})
	}
	method objetosMasPeligrososQue(cosa){
		return self.objetosQueSuperanPeligrosidad(cosa.nivelPeligrosidad())
	}
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return self.excedidoDePeso() and cosas.all({maximoNivel => maximoNivel.nivelPeligrosidad() <= nivelMaximoPeligrosidad})
	}
	method tieneAlgoQuePesaEntre(min, max){
		return cosas.any({igualPeso => igualPeso.peso()>= min and igualPeso.peso()<= max})
	}
	method cosaMasPesada(){
		return cosas.max({masPesada => masPesada.peso()})
	}
	method pesos(){
		return cosas.map({cosa => cosa.peso()})
	}
	
}

object unObjeto {
	var cant = []
	var precio = cant.size() *100
	method cant(cosas){
		cant.add(cosas)
	}
	method precio(){
		return precio
	}
}

object unaCosa{
	
}