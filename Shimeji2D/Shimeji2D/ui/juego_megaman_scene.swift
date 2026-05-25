//
//  juego_megaman_scene.swift
//  Shimeji2D
//
//  Created by alumno on 5/25/26.
//

import SpriteKit
import FirebaseFirestore

class JuegoMegamanScene: SKScene {
    let megaman = SKSpriteNode(imageNamed: "megaman_idle")
    let fondo = SKSpriteNode(imageNamed: "fondo_ciudad")
    let agente = ServicioAgente()

    override func didMove(to view: SKView) {
        NotificationCenter.default.addObserver(
            forName: Notification.Name("Agente.Comando"),
            object: nil,
            queue: .main
        ) { notificacion in
            if let comando = notificacion.userInfo?["comando"] as? Comando {
                self.ejecutarComando(comando)
            }
        }
    }

    func ejecutarComando(_ comando: Comando) {
        switch comando.tipo {
        case .activar_animacion:
            realizarAccion(comando.carga_util)
        case .activar_pantalla:
            // Aquí podrías abrir una pantalla de inventario, mapa, etc.
            print("Abrir pantalla: \(comando.carga_util)")
        }
    }


    func realizarAccion(_ tipo: String) {
        switch tipo {
        case "salto":
            megaman.texture = SKTexture(imageNamed: "megaman_jump")
        case "ataque":
            megaman.texture = SKTexture(imageNamed: "megaman_attack")
        case "feliz":
            megaman.texture = SKTexture(imageNamed: "megaman_happy")
        default:
            megaman.texture = SKTexture(imageNamed: "megaman_idle")
        }
    }

}
