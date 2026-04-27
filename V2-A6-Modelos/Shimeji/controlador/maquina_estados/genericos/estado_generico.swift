//
//  estado_generico.swift
//  Shimeji
//
//  Created by Jadzia Galletas on 20/04/26.


protocol Estado{
    var contexto: MaquinaEstadosGenerica? { get set }
    
    func inicializar() -> Void
    
    func actualizar(_ tipo_interaccion: TiposDeInteraccion, _ interaccion: BotonesDisponibles) -> Void
    
    func finalizar() -> Void
    
    func reaccion(estimulo: String) -> Void
}

