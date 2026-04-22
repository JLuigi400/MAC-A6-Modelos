//
//  estados_planetas_desaparecidos.swift
//  A6-Modelos
//
//  Created by alumno on 4/20/26.
//

class PlanetasDesaparecidos: Estado{
    var contexto: (any MaquinaEstadosGenerica)?
    static let nombre = "Planetas desaparecidos"
    
    func inicializar() {
        
    }
    
    func actualizar(_ evento: String) {
        print("Notificacion - planetas desaparecidos")
    }
    
    func finalizar() {
        
    }
    
    func reaccion(estimulo: String) {
        
    }
    
}

