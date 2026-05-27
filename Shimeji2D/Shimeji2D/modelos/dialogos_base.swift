//
//  dialogos_base.swift
//  Shimeji2D
//
//  Created by alumno on 5/27/26.
//

import Foundation

let dialogosBase: [Dialogo] = [
    Dialogo(
        personajeId: "megaman",
        pregunta: "¿Qué deberíamos hacer ahora?",
        opciones: [
            OpcionDialogo(texto: "¡Vamos a luchar!", emocion: "ataque"),
            OpcionDialogo(texto: "Necesitamos descansar.", emocion: "reposo"),
            OpcionDialogo(texto: "¡Salta hacia adelante!", emocion: "salto")
        ]
    ),
    Dialogo(
        personajeId: "protoman",
        pregunta: "El enemigo parece fuerte...",
        opciones: [
            OpcionDialogo(texto: "Analicemos su estrategia.", emocion: "pensativo"),
            OpcionDialogo(texto: "Ataquemos de inmediato.", emocion: "ataque")
        ]
    ),
    Dialogo(
        personajeId: "roll",
        pregunta: "¡Qué emocionante aventura!",
        opciones: [
            OpcionDialogo(texto: "Sí, exploremos más.", emocion: "feliz"),
            OpcionDialogo(texto: "Me siento cansado.", emocion: "reposo")
        ]
    )
]
