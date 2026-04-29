//
//  estado_salto.swift
//  Shimeji
//
//  Created by Jadzia Galletas on 20/04/26.
//

class SaltoAnimacion: Estado{
  
    var contexto: (any MaquinaEstadosGenerica)? = nil
    
    static let nombre = "Salto"

    
    func inicializar() {
        print("Bienvenido: \(#file)")
    }
    
    func actualizar(_ tipo_interaccion: TiposDeInteraccion, _ interaccion: BotonesDisponibles) {
        switch tipo_interaccion{
            case .entidad_salto:
                contexto?.enviar_peticion(Comando(tipo: .activar_animacion, carga_util: "da_un_salto"))
            case .entidad_saltogiro:
                contexto?.enviar_peticion(Comando(tipo: .activar_animacion, carga_util: "da_un_saltogiro"))
            
            default:
                print("Error: No tenemos instrucciones para ese comando")
        }
    }
    
    func finalizar() {}
    
    func reaccion(estimulo: String) {
    }
    
    
}
