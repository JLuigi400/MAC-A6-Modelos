//
//  motor_dialogos.swift
//  Shimeji2D
//
//  Created by alumno on 5/25/26.
//

import Foundation

class MotorDialogo {
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
            } catch {
                print("Error al cargar respuestas.json: \(error)")
            }
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
            return "\(personaje.nombre): \(lista.randomElement()!)"
        } else {
            return "\(personaje.nombre): Hmm... interesante lo que dices."
        }
    }
}
