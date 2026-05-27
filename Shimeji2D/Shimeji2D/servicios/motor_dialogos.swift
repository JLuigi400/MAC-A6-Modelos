//
//  motor_dialogos.swift
//  Shimeji2D
//
//  Created by alumno on 5/25/26.
//

import Foundation

class MotorDialogo {
    
    // Función principal para generar respuesta
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

        // Buscar respuestas del personaje activo
        if let respuestasPersonaje = respuestas[personaje.id],
           let lista = respuestasPersonaje[categoria] {
            return "\(personaje.nombre): \(lista.randomElement()!)"
        } else {
            return "\(personaje.nombre): Hmm... interesante lo que dices."
        }
    }
}
