//
//  prueba_local_agente.swift
//  Shimeji2D
//
//  Created by alumno on 5/27/26.
//

import Foundation

class PruebaLocalAgente {
    func enviarComandoDePrueba(_ tipo: String) {
        let comando = Comando(tipo: .activar_animacion, carga_util: tipo)
        ControlAplicacion.instancia.ejecutarComando(comando)
    }
}
