import mensajeros.*

object mensajeria {
    const property mensajeros = []
    var property paquetesPendientes = []
    var property totalGanado = 0

    method contratarMensajero(persona){
        if (mensajeros.contains(persona)){
            self.error("Ya es un empleado de la mensajeria")
        }
        else {
            mensajeros.add(persona)
        }
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

    method paqueteEntregadoPrimerEmpleado(_paquete){
        return _paquete.puedeSerEntregadoPor(mensajeros.head())
    }

    method pesoUltimoMensajero(){
        return mensajeros.last().peso()
    }

    method puedeSerEntregadoPorEmpresa(_paquete){
        return mensajeros.any({mensajero => _paquete.puedeSerEntregadoPor(mensajero)})
    }

    method mensajerosQuePuedenLaburar(_paquete){
        return mensajeros.filter({mensajero => _paquete.puedeSerEntregadoPor(mensajero)})
    }

    method tieneSobrepeso(){
        return mensajeros.average({mensajero => mensajero.peso()}) > 500
    }
//de aca para abajo no funciona
    method enviarPaquete(_paquete){
        if (self.mensajerosQuePuedenLaburar(_paquete).isEmpty()){
            paquetesPendientes.add(_paquete)
        }
        else{
            self.mensajerosQuePuedenLaburar(_paquete).first()
            totalGanado = totalGanado + _paquete.precio()
        }
    }

    method calcularGanancias(){
        return totalGanado
    }

    method enviarTodosLosPaquetesPendientes(){
        totalGanado += paquetesPendientes.sum({paq => paq.precio()})
        paquetesPendientes.clear()
    }

    method enviarPaqueteMasCaro(){
        self.mensajerosQuePuedenLaburar(self.encontrarPaquetePendienteMasCaro()).first()
        totalGanado = totalGanado + self.encontrarPaquetePendienteMasCaro().precio()
    }

    method encontrarPaquetePendienteMasCaro(){
        return paquetesPendientes.find({paq => paquetesPendientes.max()})
    }
}