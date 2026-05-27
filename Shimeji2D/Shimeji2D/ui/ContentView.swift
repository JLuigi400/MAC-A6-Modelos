//
//  ContentView.swift
//  Shimeji2D
//
//  Created by alumno on 5/25/26.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    let agentePrueba = PruebaLocalAgente()
    @State private var personajeSeleccionado = "megaman"
    @State private var escena = JuegoMegamanScene()

    var body: some View {
        VStack {
            SpriteView(scene: escena)
                .ignoresSafeArea()

            HStack {
                Button("Megaman") {
                    personajeSeleccionado = "megaman"
                    escena.cambiarPersonaje(personajeSeleccionado)
                }
                Button("Protoman") {
                    personajeSeleccionado = "protoman"
                    escena.cambiarPersonaje(personajeSeleccionado)
                }
                Button("Roll") {
                    personajeSeleccionado = "roll"
                    escena.cambiarPersonaje(personajeSeleccionado)
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()

            HStack {
                Button("Salto") { agentePrueba.enviarComandoDePrueba("salto") }
                Button("Ataque") { agentePrueba.enviarComandoDePrueba("ataque") }
                Button("Feliz") { agentePrueba.enviarComandoDePrueba("feliz") }
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .onAppear {
            escena.scaleMode = .resizeFill
        }
    }
}

#Preview {
    ContentView()
}
