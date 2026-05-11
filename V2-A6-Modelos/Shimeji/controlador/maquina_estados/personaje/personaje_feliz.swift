//
//  personaje_feliz.swift
//  Shimeji
//
//  Created by Jadzia Galletas on 11/05/26.
//

class PersonajeFeliz: Estado{
    var contexto: (any MaquinaEstadosGenerica)? = nil
    
    var descripcion: String = "Esta feliz como Caillou, comprotate como Caillou"
    
    var posibles_estados: [String] = [PersonajeNeutro.nombre]
    
    static var nombre: String = "PersonajeEnEstadoFeliz"
    
    func inicializar() { }
    
    func actualizar(_ tipo_interaccion: TiposDeInteraccion, _ interaccion: BotonesDisponibles) {
        
    }
    
    func finalizar() { }
    
    func reaccion(estimulo: String) { }
}
