import mensajeros.*

object mensajeria {
    const property mensajeros = #{}
    var property entrega = paquete
    const property paquetesPendientes = []
    var property totalGanado = 0

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
        return paquete.puedeSerEntregadoPor(mensajeros.first())
    }

    method pesoUltimoMensajero(){
        return mensajeros.last().peso()
    }

    method puedeSerEntregadoPorEmpresa(){
        return mensajeros.any({mensajero => entrega.puedeSerEntregadoPor(mensajero)}) //recorre lista de mensajeros para ver si alguno cumple con las condiciones del paquete a entregar, devuelve BOOOLEANO
    }

    method mensajerosQuePuedenLaburar(){
        const mensajerosCapacitados = mensajeros.filter({mensajero => entrega.puedeSerEntregadoPor(mensajero)})
        return mensajerosCapacitados
    }

    method tieneSobrepeso(){
        return mensajeros.average({mensajero => mensajero.peso()}) > 500
    }

    method enviarPaquete(_paquete){
        self.mensajerosQuePuedenLaburar().findOrElse({mensajero => mensajero.mensajerosQuePuedenLaburar()},{paquetesPendientes.add(_paquete)})
        totalGanado = totalGanado + paquete.precio()
    }

    method calcularGanancias(){
        return totalGanado
    }

    method enviarPaquetesPendientes(){
        totalGanado += paquetesPendientes.sum({paq => paq.precio()})
        paquetesPendientes.clear()
    }

    method enviarPaqueteMasCaro(){

    }
}