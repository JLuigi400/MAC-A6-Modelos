//
//  estado_generico.swift
//  Shimeji
//
//  Created by Jadzia Galletas on 20/04/26.


protocol Estado{
    var contexto: MaquinaEstadosGenerica? { get set }
    var descripcion: String { get set }
    var posibles_estados: [String] { get set}
    
    static var nombre: String { set get }
    
    func inicializar() -> Void
    
    func actualizar(_ tipo_interaccion: TiposDeInteraccion, _ interaccion: BotonesDisponibles) -> Void
    
    func finalizar() -> Void
    
    func reaccion(estimulo: String) -> Void
}

