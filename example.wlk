/*Ejercicio tipo parcial Dr.Casa 2019 */

class Persona
   {	
	var enfermedades=[]
	var temp=36
	var  property celulasDelCuerpo
	var enfermedad
	
	method contraerEnfermedad(enfer) = enfermedades.add(enfer)
	
	method cantEnfermedad() = return enfermedades.size()<5
	
	method estaEncoma() = return temp > 45
	
	method incrementarTemp(cambioDeTemp) {temp=+ cambioDeTemp}
	
	method temperatura() = return temp

	method vivirUnDia() = enfermedades.forEach({enf => enf.causarEfecto(self)})
	
	method celulasEnElCuerpo() {celulasDelCuerpo = celulasDelCuerpo - enfermedad.celulasQueAmenazo()}
	
	
   }

class EnfermedadInfecciosa  //malaria, otitis
   { 
	var  property celulasQueAmenazo
	
	method causarEfecto(persona) = persona.incrementarTemp(celulasQueAmenazo/1000)	
	
	method reproduccionDeCelulas(celulasAmenazantes) {celulasQueAmenazo=2*celulasAmenazantes}
	
	method agresiva(persona) = return celulasQueAmenazo > (0.1)*persona.celulasEnElCuerpo()		
	
	method  celulasQueAmenazo() = return celulasQueAmenazo
   }


class EnfermedadAutoinmune  //lupus
    { 	
	//var celulasQueAmenazo
	
	//method causarEfecto(persona){
		//persona.incrementarTemp(2000)
	//}
	
	 method causarEfecto(persona) = persona.celulasEnElCuerpo(0)
	 
	 method agresiva(persona) = return 30*(persona.vivirUnDia())		     
    }














