//
//  contexto .swift
//  Shimeji
//
//  Created by Jadzia Galletas on 06/05/26.
//
import Foundation

struct Contexto: Codable{
    var historia: String
    var personalidad: String
    var estados_disponibles: [String]
    var estado_actual: String
    var descrpcion: String
}

