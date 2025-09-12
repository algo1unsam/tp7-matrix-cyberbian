import mensajeros.*

object mensajeria {
    const property mensajeros = []

    method contratarMensajero(persona){
        mensajeros.add(persona)
        return mensajeros
    }

    method despedirMensajero(persona){
        mensajeros.remove(persona)
        return mensajeros
    }

    method despedirATodos(){
        mensajeros.clear()
        return mensajeros
    }

    method esGrande(){
        return mensajeros.size() > 2
    }

    method paqueteEntregadoPrimerEmpleado(){
        //que este pago y q pese menos de mil
    
        return
    }

    method pesoUltimoMensajero(){
        return mensajeros.last().peso()
    }
}
