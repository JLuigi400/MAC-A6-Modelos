//
//  ShimejiApp.swift
//  Shimeji
//
//  Created by Jadzia Galletas on 13/04/26.
//

import SwiftUI

@main
struct ShimejiApp: App {
    @State var controlador_general = ControladorAplicacion()
    
    var body: some Scene {
        WindowGroup {
            SeguimientoImagenes()
                .environment(controlador_general)
        }
    }
}
