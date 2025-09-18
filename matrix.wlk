object neo {
    var energia = 100
    method esElElegido() = true

    method saltar() {
        energia = energia / 2
    }

    method vitalidadActual() = energia / 10
}

object morfeo {
    var property vitalidadActual = 8
    method esElElegido() = false

    method saltar() {
        vitalidadActual = vitalidadActual - 1
    }

    method estaCansado() = vitalidadActual < 0

    method descansar(unaCantidad) {
        if (self.estaCansado()){
            self.vitalidadActual(unaCantidad)
        }
    }
}

object trinity {
    method esElElegido() = false

    method vitalidadActual() = 0

    method saltar(){

    }
}

object nave {
    const pasajeros = [neo, morfeo, trinity]

    //Metodos de la nave con las colecciones
    method cantPasajeros() = pasajeros.size()

    method pasajeroConMayorVitalidad() = pasajeros.max{pasajero => pasajero.vitalidadActual()}

    method estaEquilibradaLaNave() = pasajeros.all{pasajero => pasajero.vitalidadActual() <= pasajero.vitalidadActual() * 2 }

    method elElegidoEstaEnLaNave() = pasajeros.contains(neo)

    method chocar() {
        pasajeros.forEach{pasajero => pasajero.saltar()}
        pasajeros.clear()
    }

    method acelerar() {
        pasajeros.forEach{pasajero => if(pasajero.vitalidadActual() != self.pasajeroConMayorVitalidad()) {pasajero.saltar()}}
    }
}