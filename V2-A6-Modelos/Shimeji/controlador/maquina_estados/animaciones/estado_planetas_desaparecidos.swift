//
//  estado_planetas_desaparecidos.swift
//  Shimeji
//
//  Created by Jadzia Galletas on 20/04/26.
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

