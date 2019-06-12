/*Ejercicio tipo parcial Dr.Casa 2019 
  Parte 1: Clases y Colecciones
*/

class Persona
   {	
	var enfermedades=[]
	var  property temp=36
	var  property celulasDelCuerpo=2000000
	
	
	method contraerEnfermedad(enfer) 
	 {
	 if (enfermedades.size()<5 ){enfermedades.add(enfer)}
	 else throw new Exception ("No se puede agregar la enfermedad,superaste la cantidad de enfermedades")
	 }
	
	method estaEnComa() = return (temp >= 45 || celulasDelCuerpo<1000000)
	
	method incrementarTemp(cambioDeTemp) {temp=temp + cambioDeTemp}
	
	method temperatura(mitemp) {temp=mitemp}

	method viviUnDia() = enfermedades.forEach({enfer=> enfer.causarEfecto(self)})
	
	method celulasEnElCuerpo() = return celulasDelCuerpo //sirve para saber cuando es agresiva una enfermedad infecciosa
	
	method enfermedadQueMasAfecta() = return enfermedades.max({enfermedad => enfermedad.celulasQueAmenazo()})
	
	method recibirMedicamento()= enfermedades.forEach({medico => medico.atenderPaciente(self)})
	
	// este metodo  esta mal .revisarlo como dijo Juan Bono
	//method estoyCurado() {enfermedades.sum( {miEnfermedad => miEnfermedad.celulasQueAmenazo()==0})}
	
	method curado(mienfermedad){return enfermedades.sum( {enfermedad => enfermedad.celulasQueAfecto() })==0}
   }

class EnfermedadInfecciosa  //malaria y otitis son infecciosas
   { 
	var  property celulasQueAmenazo = 0
	
	method causarEfecto(persona) = persona.incrementarTemp(celulasQueAmenazo/1000)	
	
	method reproduccionDeCelulas() {celulasQueAmenazo=2*celulasQueAmenazo}
	
	method agresiva(persona) = return celulasQueAmenazo > (0.1)*persona.celulasEnElCuerpo()		
	
	method  celulasQueAfecto() = return celulasQueAmenazo
   }

class EnfermedadAutoinmune  //lupus es autoInmune
   { 	
	var  property celulasQueAmenazo 
	
	//method causarEfecto(persona){
		//persona.incrementarTemp(2000)
	//}
	
	 method causarEfecto(persona) = persona.celulasEnElCuerpo()- celulasQueAmenazo//destruye la cantidad de celulas amenazadas
	 
	 method agresiva(persona) = return 30*persona.viviUnDia()
	 
	 method celulasQueAfecto() = return celulasQueAmenazo		     
    }
    
    const logan = new Persona()
    const frank = new Persona()
    const malaria = new EnfermedadInfecciosa()
    const otitis = new EnfermedadInfecciosa()
    const lupus = new EnfermedadAutoinmune()
    const malariaPolenta = new EnfermedadInfecciosa()
    
/*Las clases enfermedades Infecciosas y AutoInmunes son polimórficas,
porque se llaman igual los métodos en común y también tienen 
retornos o no aquellos métodos que se llaman igual.
Utilizo una variable del tipo enfermedad en la clase
Persona ,pero no significa que exista polimorfismo en esta Clase ,solo 
la utilizo porque cada enfermedad puede devolverme las células que 
amenaza y así utlizarla en el método celulasEnElCuerpo().
 */


/*Parte 2: Herencia - Redefinición - Super */

class Medicos inherits Persona{
	
	var property medicamento=150
	
	method antendePaciente(persona) = persona.recibirMedicamento(15*medicamento)
		
	method contagiar(enfermedad){enfermedad.causarEfecto(self)}
	
}

class JefeDepartamento inherits Medicos{
	
	var property persona
	
	method ordenoQue(subordinado){subordinado.atendePaciente(persona)}
	
}
//class Medicamentos{
	
//	var property miMedicamento=160
	
	//method medicamento() = return miMedicamento	
//}

class Muerte
   {
	method causarEfecto(persona){ return persona.temperatura(0)}
   }


const house = new Medicos()
const laMuerte = new Muerte()