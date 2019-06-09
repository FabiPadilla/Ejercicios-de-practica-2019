/*Ejercicio tipo parcial Dr.Casa 2019 */

class Persona
   {	
	var enfermedades=[]
	var temp=36
	var  property celulasDelCuerpo
	var  property enfermedad
	
	method contraerEnfermedad(enfer) = enfermedades.add(enfer)
	
	method cantEnfermedad() = return enfermedades.size()<5
	
	method estaEncoma() = return temp > 45
	
	method incrementarTemp(cambioDeTemp) {temp=+ cambioDeTemp}
	
	method temperatura() = return temp

	method viviUnDia() = enfermedades.forEach({enf => enf.causarEfecto(self)})
	
	method celulasEnElCuerpo() {celulasDelCuerpo = celulasDelCuerpo - enfermedad.celulasQueAmenazo()}
	
   }

class EnfermedadInfecciosa  //malaria y otitis son infecciosas
   { 
	var  property celulasQueAmenazo = 500
	
	method causarEfecto(persona) = persona.incrementarTemp(celulasQueAmenazo/1000)	
	
	method reproduccionDeCelulas(celulasAmenazantes) {celulasQueAmenazo=2*celulasAmenazantes}
	
	method agresiva(persona) = return celulasQueAmenazo > (0.1)*persona.celulasEnElCuerpo()		
	
	method  celulasQueAmenazo() = return celulasQueAmenazo
   }

class EnfermedadAutoinmune  //lupus es autoInmune
    { 	
	var  property celulasQueAmenazo = 10000
	
	//method causarEfecto(persona){
		//persona.incrementarTemp(2000)
	//}
	
	 method causarEfecto(persona) = persona.celulasEnElCuerpo(0)
	 
	 method agresiva(persona) = return 30*(persona.viviUnDia())
	 
	 method celulasQueAmenazo() = return celulasQueAmenazo		     
    }
    
    
/*Las clases enfermedades Infecciosas y AutoInmunes son polimórficas,
porque se llaman igual los métodos en común como así también
los retornos.Utilizo una variable del tipo enfermedad en la clase
Persona y no significa que exista polimorfismo en esta Clase ,solo 
la utilizo porque cada enfermedad puede devolverme las celulas que 
amenaza y así utlizarlar en el método celulasEnElCuerpo().
 */