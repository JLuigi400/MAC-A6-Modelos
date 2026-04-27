//
//  estado_generico.swift
//  Shimeji
//
//  Created by Jadzia Galletas on 20/04/26.


protocol Estado{
    var contexto: MaquinaEstadosGenerica? { get set }
    
    func inicializar() -> Void
    
    func actualizar(_ evento: String) -> Void
    
    func finalizar() -> Void
    
    func reaccion(estimulo: String) -> Void
}

