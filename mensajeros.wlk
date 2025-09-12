object morfeo {
    var property peso = 90
    var property transporte = monopatin
    
    method peso(){
         return peso + transporte.peso()
    }

    method tieneCredito(){
        return false
    }
}
object trinity{
    const property peso = 900

    method tieneCredito(){
        return true
    }
}

object neo{
    var property peso = 0
    var property saldo = 0

    method tieneCredito(){
        return self.saldo() > 0
    }

    method cargarCredito(plata){
        saldo += plata
        return saldo
    }

    method hacerLlamada(){
        saldo -= 10
        return saldo
    }
}

object camion {
    var property cantAcoplados = 0

    method peso(){
        return cantAcoplados * 500
    }
}

object monopatin {
    const property peso = 1
}

object puente {
    method dejarPasar(mensajero){
        return (mensajero.peso() <= 1000)
    }
}

object matrix {
    method dejarPasar(mensajero){
        return mensajero.tieneCredito()
    }
}

object paquete {
    var property precio = 500
    var destino = matrix
    var pago = false

    method pagar(){
        pago = true
        return pago
    }

    method estaPago(){
        return pago
    }

    method destino(lugar){
        destino = lugar
        return destino
    }

    method puedeSerEntregadoPor(mensajero){
        return self.estaPago() and destino.dejarPasar(mensajero)
    }
}
object paquetito {
    var property precio = 100
    var pago = true

    method estaPago(){
        return pago
    }

    method puedeSerEntregadoPor(mensajero){
        return self.estaPago()
    }
}

object paquetonViajero {
    const destino = [matrix, puente]
    const precioDestino = 100
    var pago = 0
    var property precio = 1000

    method pagar(dinero){
        pago += dinero 
        return pago
    }

    method estaPago(){
        return pago == destino.size()*precioDestino
    }

    method aniadirDestino(lugar){
        destino.add(lugar)
        return destino
    }

    method puedeSerEntregadoPor(mensajero){
        return self.estaPago() and destino.all({lugar => lugar.dejarPasar(mensajero)})
    }
}