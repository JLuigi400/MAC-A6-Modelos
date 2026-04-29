//
//  controlador_comandos.swift
//  Shimeji
//
//  Created by Jadzia Galletas on 17/04/26.
//

extension ControladorAplicacion: ProcesarComandos {
    func realizar_comando(tipo: Comandos, carga_util: String) -> Bool {
        switch tipo{
            case .activar_animacion:
                activar_comportamiento(carga_util)
                historial_comandos.append(
                        Comando(tipo: tipo, carga_util: carga_util)
                )
                return true
                
            default:
                fatalError("[\(#file):\(#function)] NO has implentado esto: \(tipo), por favor, arreglalo")
                return false
        }
        
        return false
    }
    
    func realizar_comando(_ comanda: Comando) -> Bool {
        switch comanda.tipo{
            case .activar_animacion:
                activar_comportamiento(comanda.carga_util)
                historial_comandos.append(
                        comanda
                )
                return true
                
            default:
                fatalError("[\(#file):\(#function)] NO has implentado esto: \(comanda.tipo), por favor, arreglalo")
                return false
        }
        
        return false
    }
}
