//
//  control_aplicacion.swift
//  Shimeji2D
//
//  Created by alumno on 5/25/26.
//

import Foundation
import SpriteKit

class ControlAplicacion {
    static let instancia = ControlAplicacion()
    var comandosEjecutados: [Comando] = []

    func ejecutarComando(_ comando: Comando) {
        comandosEjecutados.append(comando)
        NotificationCenter.default.post(
            name: Notification.Name("Agente.Comando"),
            object: nil,
            userInfo: ["comando": comando]
        )
    }
}
