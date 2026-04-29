//
//  estado_reposo.swift
//  Shimeji
//
//  Created by Jadzia Galletas on 20/04/26.
//

class ReposoAnimacion: Estado{
    func actualizar(_ tipo_interaccion: TiposDeInteraccion, _ interaccion: BotonesDisponibles) {
        
        // print("\(#function):\(ReposoAnimacion.nombre) recibiendo informacion del tipo evento con datos \(evento)")
        
        switch tipo_interaccion{
            case .entidad_salto:
                contexto?.enviar_peticion(Comando(tipo: .activar_animacion, carga_util: "vuelta_rapida"))
                
            case .boton:
                switch interaccion{
                    case .realizar_accion_salto:
                        contexto?.enviar_peticion(Comando(tipo: .activar_animacion, carga_util: "da_un_salto"))
                        contexto?.realizar_cambio_de_estado(a: SaltoAnimacion.nombre)
                    case .realizar_accion_saltogiro:
                        contexto?.enviar_peticion(Comando(tipo: .activar_animacion, carga_util: "da_un_saltogiro"))
                        contexto?.realizar_cambio_de_estado(a: SaltoAnimacion.nombre)
                    default:
                        print("Comando no especificado")
                }
                
            default:
            print("Comando no especificado")
        }
    }
    
    var contexto: (any MaquinaEstadosGenerica)? = nil
    
    static let nombre: String = "Reposo"

    
    func inicializar() { }
    
    func finalizar() { }
    
    func reaccion(estimulo: String) { }

}
