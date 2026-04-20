//
//  estados_planetas_desaparecidos.swift
//  A6-Modelos
//
//  Created by alumno on 4/20/26.
//

class PlanetasDesaparecidos: Estado{
    var contexto: (any MaquinaEstadosGenerica)?
    static let nombre = "Planetas de23parecidos"
    
    func inicializar() {
        
    }
    
    func actualizar(_ evento: String) {
        print("HOla desde planetas desaparecidos")
    }
    
    func finalizar() {
        
    }
    
    func reaccion(estimulo: String) {
        
    }
    
}

