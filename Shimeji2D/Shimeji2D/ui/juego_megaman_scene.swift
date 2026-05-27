//
//  juego_megaman_scene.swift
//  Shimeji2D
//
//  Created by alumno on 5/25/26.
//

import SpriteKit

class JuegoMegamanScene: SKScene {
    var personajeActivo = personajesBase[0] // Megaman por defecto
    let fondo = SKSpriteNode(color: .black, size: CGSize(width: 400, height: 800))
    let textoEmocion = SKLabelNode(fontNamed: "Arial")

    override func didMove(to view: SKView) {
        fondo.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(fondo)

        textoEmocion.fontSize = 28
        textoEmocion.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(textoEmocion)

        NotificationCenter.default.addObserver(
            forName: Notification.Name("Agente.Comando"),
            object: nil,
            queue: .main
        ) { notificacion in
            if let comando = notificacion.userInfo?["comando"] as? Comando {
                self.mostrarEmocion(comando.carga_util)
            }
        }
    }

    func cambiarPersonaje(_ id: String) {
        if let nuevoPersonaje = personajesBase.first(where: { $0.id == id }) {
            personajeActivo = nuevoPersonaje
            fondo.color = colorDesdeString(nuevoPersonaje.colorEmocion)
            textoEmocion.text = "Ahora estás hablando con \(nuevoPersonaje.nombre)"
        } else {
            textoEmocion.text = "Personaje no encontrado"
            fondo.color = .gray
        }
    }


    func mostrarEmocion(_ tipo: String) {
        fondo.color = colorDesdeString(personajeActivo.colorEmocion)
        textoEmocion.text = personajeActivo.frases.randomElement() ?? "Sin respuesta"
    }

    func colorDesdeString(_ color: String) -> UIColor {
        switch color {
        case "blue": return .blue
        case "red": return .red
        case "yellow": return .yellow
        default: return .gray
        }
    }
}
