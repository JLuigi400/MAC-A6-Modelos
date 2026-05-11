//
//  mensaje.swift
//  Shimeji
//
//  Created by Jadzia Galletas on 04/05/26.
//
import Foundation

struct Mensaje: Identifiable, Codable{
    var id: String
    var texto: String
    var remitente: String
    var timestamp: Date
}
