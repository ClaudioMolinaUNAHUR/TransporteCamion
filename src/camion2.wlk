
import cosas2.*

object camion {
	const property cosas = []
	
	method cargar(unaCosa) {
		unaCosa.enCamion()
		cosas.add(unaCosa)
		}
	method totalBultos(){
		/* podria asignar a cada cosa, la representaciond e bulto pero como especificar q
		los 3 primeros item, tiene q juntarse para formar 1 bulto*/
		var bultos = 0
		if (#{knightRider, arenaDeGranel, residuosRadioactivos}.intersection(cosas.asSet()).size() == 3){
			bultos +=1
		}
		if (#{bumblebee, embalajeDeSeguridad}.intersection(cosas.asSet()).size() == 2){
			bultos +=2
		}
		if(#{paqueteDeLadrillos}.intersection(cosas.asSet()).size() == 1){
			bultos += 3.min((paqueteDeLadrillos.peso()/2) /100) 
		}
		if(#{bateriaAntiaerea}.intersection(cosas.asSet()).size() == 1 && bateriaAntiaerea.estaConMisiles()){
			bultos +=2
		}
		if(#{bateriaAntiaerea}.intersection(cosas.asSet()).size() == 1 && !bateriaAntiaerea.estaConMisiles()){
			bultos +=1
		}
		if(#{contenedorPortuario}.intersection(cosas.asSet()).size() == 1){
			bultos += contenedorPortuario.cosas().size()
		}
		return bultos
	}
	method totalBultosOpcion2(){
		return cosas.sum({cantBulto => cantBulto.bulto()})
	}
}
