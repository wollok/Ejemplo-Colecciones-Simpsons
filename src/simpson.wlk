object plantaNuclear {
	var empleados=[homero,mrsBurns,carl]
	method comedonas(){
		return empleados.max({e=>e.cuantasDonas()})
	}	
	method contratarEmpleado(nuevoEmpleado){
		empleados.add(nuevoEmpleado)
	}
	method enPeligro(){
		return (deposito.muchasBarras() && self.todosDistraidos()) || mrsBurns.esPobre()
	}
	method todosDistraidos(){
		return empleados.all({empleado=>empleado.estaDistraido()})
	}
	method pagarSueldos(){
		empleados.forEach({emp=>emp.cobrarSueldo()})
		mrsBurns.cobrarSueldo()
	}
	method despedirEmpleado(empleadoaDespedir){
		empleados.remove(empleadoaDespedir)
	}
	method empresaVacia(){
		return empleados.isEmpty()
	}
	method conflictoIntereses(){
		return empleados.contains(mrsBurns)
	}
	method funcionaBien(){
		return self.totalDonas() > deposito.cantidadBarras()
	}
	method totalDonas() {
		return empleados.sum({emp=>emp.cuantasDonas()}) 
	}
}
object deposito {
	var barras = 10000 
	method variarBarras(cantidad){
		barras += cantidad
	}
	method muchasBarras(){
		return barras > 4000
	}
	method cantidadBarras(){
		return barras
	}
}
object patoBalancin{
	method estaDistraido(){
		return false
	}
	method cobrarSueldo(){
	}
	method cuantasDonas(){ return 0}
}
object homero{
	var donas = 0
	var donasAcumuladas = 0
	const precioDona = 3
	const sueldo = 1000
	
	method cobrarSueldo(){
		self.comprarDonas(sueldo.div(precioDona))
	}
	method comprarDonas(cantidad){
		donas+=cantidad		
	}
	method comerDonas(){
		donas-=1
		donasAcumuladas+=1
	}
	method cuantasDonas(){
		return donasAcumuladas
	}
	method estaDistraido(){
		return  donas < 2
	}
}
object barney{
	var estadoEtilico = sobrio
	var temaFavorito = "jijiji"
	
	method tomar(){
		estadoEtilico = ebrio
	}
	method rescatarse(){
		estadoEtilico = sobrio 
	}
	method estaDistraido(){
		return estadoEtilico.estaDistraido(self)
	}
	method estaAlegre(){
		return radio.tema() == temaFavorito
	}
	method cuantasDonas() {return 1}
	method cobrarSueldo() {}
}
object radio{
	method tema() {
		return "mi perro dinamita"
	}
}
object sobrio {
	method estaDistraido(alguien) {
		return alguien.estaAlegre()
	}
}
object ebrio {
	method estaDistraido(alguien) {
		return true
	}
}
object mrsBurns{
	var rico = false

	method esPobre(){
		return not rico
	}
	method cobrarSueldo(){
		rico = true
	}
	method estaDistraido() {
		return false
	}
	method cuantasDonas() {return 0}
}
object carl{
	var donasXdia=[]
	const maxDonas=50
	
	method cuantasDonas(){
		return donasXdia.sum()
	}
	
	method estaDistraido(){
		return ( self.cuantasDonas() > maxDonas) && (donasXdia.max() != donasXdia.last())
	}
	method registrarDonasDelDia(donasComidasHoy){
		donasXdia.add(donasComidasHoy)
	}
	method cobrarSueldo(){
		self.registrarDonasDelDia(maxDonas)
	}
}