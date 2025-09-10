object morfeo {
    var property peso = 90
    var property transporte = monopatin
    var property llamada = false
    
    method peso(){
         return peso + transporte.peso()
    }
}
object trinity{
    var property llamada = true
    var property peso = 900
}

object neo{
    var property llamada = true
    var property peso = 0

    method tieneCredito(valor){
        if (valor <= 0){
            llamada = false
        }
        else {
            llamada = true
        }
        return llamada
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
        return
    }
}

object paquete {
    var property destino = null
    var property pago = 0
}