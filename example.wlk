/*Ejercicio tipo parcial Dr.Casa 2019 
  Parte 1: Clases y Colecciones
*/
class Persona
   {	
	var enfermedades=[]
	var  property temp
	var  property celulas
	
	//cualquier persona puede contraer enfermedad,no puede contraer mas de 5
	method contraerEnfermedad(enfer) 
	 {
	 if (enfermedades.size()<5 ){enfermedades.add(enfer)}
	 else throw new Exception ("No se puede agregar la enfermedad,superaste 
                               la cantidad de enfermedades")
	 }
	//maximo de temperatura que puede tener,y lo deja en coma
	method estaEnComa() {return (temp >= 45 || celulas<1000000)}
	
	//la enfermedad Infecciosa aumenta la temperatura
	method incrementarTemp(cambioDeTemp) {temp+=cambioDeTemp}
	
    //cada día que vive una persona con su enfermedad se producen sus efectos.
	method viviUnDia() { enfermedades.forEach({enfer=> enfer.causaEfecto(self)}) }
	
	/*es utilizada por la enfermedad infecciosa */
	method destruirCelulas(c) {celulas = celulas - c}
	
	/*4a.enfermedad que más células afecte */
	method enfermedadQueMasAfecta() {return enfermedades.max({enfermedad => enfermedad.celulasQueAmenazo()}) }
	
	
	
	method recibirMedicamento(m)= enfermedades.forEach({medico => medico.atenderPaciente(self)})
	
	
	
	method curado(mienfermedad){return enfermedades.sum( {enfermedad => enfermedad.celulasQueAmenazo(0) })}  
   }

class EnfermedadInfecciosa  //malaria y otitis son infecciosas
   { 
	var  property celulasQueAmenazo
	
	/*efecto que provoca en la persona.Debe permitir recibir cualquier persona 
	como parámetro para que exista polimorifismo con cualquier enfermedad que causa 
	efecto.Deben tener mismo nombre y si retornan un valor deben respetarlo en la
	 estructura*/
	method causaEfecto(persona) {
		persona.incrementarTemp(celulasQueAmenazo/1000)	
		}
	
	/*se reproducen a si mismas*/
	method reproducirCelulas() {celulasQueAmenazo = 2*celulasQueAmenazo}
	
	/*es agresiva cuando la cantidad de células afectadas supera el 10% de las células totales del cuerpo*/
	method agresiva(persona) { return celulasQueAmenazo > (0.1)*persona.celulas() }	
	
	method antenuada(){}
	
	method  celulasQueAfecto(celulas) {celulasQueAmenazo=celulas}
   }
   
class EnfermedadAutoinmune  //lupus es autoInmune
   { 	
	var  property celulasQueAmenazo
	var property dia = 0
	
	//method causaEfecto(persona){
		//persona.incrementarTemp(2000)
	//}
	
	 /*efecto que provoca en la persona,destruye la cantidade de celulas amenazadas 
	 Debe permitir recibir cualquier persona como parámetro para que exista
	 polimorifismo con cualquier enfermedad que causa efecto.Deben tener mismo 
	 nombre y si retornan un valor deben respetarlo en la estructura*/
	 method causaEfecto(persona){
	 	
        // persona.celulasDelCuerpo()- celulasQueAmenazo
		persona.destruirCelulas(celulasQueAmenazo)
		dia += 1
	 } 
	 
	 method agresiva(persona) { return 30*persona.viviUnDia() }
	 
	 method antenuada(){}
	 
	 method celulasQueAfecto(celulas) {celulasQueAmenazo=celulas}	
	  
	    
    }
    
      
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
	
	method atendePaciente(persona) {return  persona.recibirMedicamento(15*medicamento)}
		
	method contagiar(enfermedad){enfermedad.causarEfecto(self)}
	
}

class JefeDepartamento inherits Medicos{
	
	var property persona
	
	method teOrdeno(subordinado){return subordinado.atendePaciente(persona)}
	
}

class LaMuerte
   {
	method causaEfecto(persona){ return persona.temp(0)}
   }
