//
//  gestor_maquinas_estado.swift
//  Shimeji
//
//  Created by Jadzia Galletas on 20/04/26.
//

protocol MaquinaEstadosGenerica{
    var controlador_general: ProcesarComandos? { get set }
    
    func realizar_cambio_de_estado(a nombre_del_estado_nuevo: String) -> Void
    
    func actualizar(_ tipo_interaccion: TiposDeInteraccion, _ interaccion: BotonesDisponibles) -> Void
    
    func enviar_peticion(_ comando: Comando) -> Bool
}
