//
//  A6_ModelosApp.swift
//  A6-Modelos
//
//  Created by alumno on 4/13/26.
//

import SwiftUI

@main
struct A6_ModelosApp: App {
    var body: some Scene {
        WindowGroup {
            SeguimientoImagenes()
                .environment(ControladorAplicacion())
        }
    }
}
