//
//  estado_salto.swift
//  A6-Modelos
//
//  Created by alumno on 4/20/26.
//

class SaltoAnimacion: Estado{
    var contexto: (any MaquinaEstadosGenerica)? = nil
    
    static let nombre = "Salto"

    
    func inicializar() {
        print("Iniciamos \(#file)")
    }
    
    func actualizar(_ evento: String) {
        switch evento{
            default:
                print("Dio un salto")
                contexto?.realizar_cambio_de_estado(a: PlanetasDesaparecidos.nombre)
        }
    }
    
    func finalizar() {}
    
    func reaccion(estimulo: String) {
    }
    
    
}
