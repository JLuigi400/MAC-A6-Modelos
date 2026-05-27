//
//  dialogo.swift
//  Shimeji2D
//
//  Created by alumno on 5/27/26.
//

import Foundation

struct OpcionDialogo: Identifiable, Codable {
    var id = UUID()
    let texto: String
    let emocion: String
}

struct Dialogo: Identifiable, Codable {
    var id = UUID()
    let personajeId: String
    let pregunta: String
    let opciones: [OpcionDialogo]
}
