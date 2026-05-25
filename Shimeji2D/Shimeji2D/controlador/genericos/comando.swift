//
//  comando.swift
//  Shimeji2D
//
//  Created by alumno on 5/25/26.
//

import Foundation

enum Comandos: String, Codable {
    case activar_animacion
    case activar_pantalla
    case mostrar_pista
}

struct Comando: Identifiable, Codable {
    var id = UUID()
    let tipo: Comandos
    let carga_util: String
}
