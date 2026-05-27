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
    let motorDialogo = MotorDialogo()
    var opcionesActuales: [(nodo: SKLabelNode, opcion: OpcionDialogo)] = []

    
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
        case "ataque": return .red
        case "salto": return .blue
        case "feliz": return .yellow
        case "reposo": return .gray
        case "pensativo": return .purple
        default: return .gray
        }
    }
    
    func mostrarDialogo(_ dialogo: Dialogo) {
        textoEmocion.text = dialogo.pregunta
        limpiarOpciones()

        let espacioVertical: CGFloat = 50
        var posicionY = frame.midY - 50

        for opcion in dialogo.opciones {
            let nodoOpcion = SKLabelNode(text: opcion.texto)
            nodoOpcion.fontName = "Arial"
            nodoOpcion.fontSize = 22
            nodoOpcion.fontColor = .white
            nodoOpcion.position = CGPoint(x: frame.midX, y: posicionY)
            addChild(nodoOpcion)

            opcionesActuales.append((nodo: nodoOpcion, opcion: opcion))
            posicionY -= espacioVertical
        }
    }

    
    func limpiarOpciones() {
        for par in opcionesActuales {
            par.nodo.removeFromParent()
        }
        opcionesActuales.removeAll()
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let nodosTocados = nodes(at: location)

        for nodo in nodosTocados {
            if let par = opcionesActuales.first(where: { $0.nodo == nodo }) {
                seleccionarOpcion(par.opcion)
            }
        }
    }

    func seleccionarOpcion(_ opcion: OpcionDialogo) {
        fondo.color = colorDesdeString(opcion.emocion)
        textoEmocion.text = personajeActivo.frases.randomElement() ?? "Sin respuesta"
        limpiarOpciones()
    }
    
    func procesarMensajeUsuario(_ mensaje: String) {
        let respuesta = motorDialogo.generarRespuesta(personaje: personajeActivo, mensajeUsuario: mensaje)
        textoEmocion.text = respuesta
    }
}
