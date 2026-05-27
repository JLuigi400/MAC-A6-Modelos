//
//  motor_dialogos.swift
//  Shimeji2D
//
//  Created by alumno on 5/25/26.
//

import Foundation
import FirebaseFirestore

class MotorDialogo {
    
    let db = Firestore.firestore()
    var respuestas: [String: [String: [String]]] = [:]
    
    init() {
        cargarRespuestas()
    }

    func cargarRespuestas() {
        if let url = Bundle.main.url(forResource: "respuestas", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let json = try JSONDecoder().decode([String: [String: [String]]].self, from: data)
                respuestas = json
                print("✅ Respuestas cargadas correctamente desde JSON.")
            } catch {
                print("❌ Error al cargar respuestas.json: \(error)")
            }
        } else {
            print("⚠️ No se encontró respuestas.json en el bundle.")
        }

    }

    func generarRespuesta(personaje: Personaje, mensajeUsuario: String) -> String {
        let texto = mensajeUsuario.lowercased()
        var categoria = "default"

        if texto.contains("hola") || texto.contains("buenos dias") {
            categoria = "saludo"
        } else if texto.contains("quien") || texto.contains("que") || texto.contains("como") {
            categoria = "pregunta"
        } else if texto.contains("feliz") || texto.contains("genial") {
            categoria = "feliz"
        } else if texto.contains("triste") || texto.contains("cansado") {
            categoria = "triste"
        }

        if let respuestasPersonaje = respuestas[personaje.id],
           let lista = respuestasPersonaje[categoria] {
            let respuesta = "\(personaje.nombre): \(lista.randomElement()!)"
            registrarInteraccionEnFirestore(personaje: personaje, mensajeUsuario: mensajeUsuario, respuesta: respuesta, emocion: categoria)
            return respuesta
        } else {
            let respuesta = "\(personaje.nombre): Hmm... interesante lo que dices."
            registrarInteraccionEnFirestore(personaje: personaje, mensajeUsuario: mensajeUsuario, respuesta: respuesta, emocion: categoria)
            return respuesta
        }
    }
    
    func registrarInteraccionEnFirestore(personaje: Personaje, mensajeUsuario: String, respuesta: String, emocion: String) {
        let datos: [String: Any] = [
            "personajeId": personaje.id,
            "mensajeUsuario": mensajeUsuario,
            "respuestaPersonaje": respuesta,
            "emocionDetectada": emocion,
            "timestamp": Timestamp(date: Date())
        ]

        db.collection("interacciones").addDocument(data: datos) { error in
            if let error = error {
                print("❌ Error al guardar interacción: \(error.localizedDescription)")
            } else {
                print("✅ Interacción registrada correctamente en Firestore.")
            }
        }
    }

}
