//
//  personajes.swift
//  Shimeji2D
//
//  Created by alumno on 5/27/26.
//

import Foundation

struct Personaje {
    let id: String
    let nombre: String
    let personalidad: String
    let colorEmocion: String
    let frases: [String]
}

let personajesBase: [Personaje] = [
    Personaje(
        id: "megaman",
        nombre: "Megaman",
        personalidad: "Heroico y decidido",
        colorEmocion: "blue",
        frases: [
            "¡Vamos a salvar el mundo!",
            "No hay obstáculo que no pueda superar.",
            "¡Prepárate para el salto!"
        ]
    ),
    Personaje(
        id: "protoman",
        nombre: "Protoman",
        personalidad: "Serio y estratégico",
        colorEmocion: "red",
        frases: [
            "La calma es la clave de la victoria.",
            "No subestimes a tu enemigo.",
            "Mantén la distancia y observa."
        ]
    ),
    Personaje(
        id: "roll",
        nombre: "Roll",
        personalidad: "Optimista y curiosa",
        colorEmocion: "yellow",
        frases: [
            "¡Qué día tan bonito para explorar!",
            "Megaman, ¡ten cuidado!",
            "¡Vamos a descubrir algo nuevo!"
        ]
    )
]
