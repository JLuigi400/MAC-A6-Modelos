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
    @State private var mensajeUsuario = ""

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
                Button("Iniciar diálogo") {
                    if let dialogo = dialogosBase.first(where: { $0.personajeId == personajeSeleccionado }) {
                        escena.mostrarDialogo(dialogo)
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
            
            HStack{
                TextField("Escribe tu mensaje...", text: $mensajeUsuario)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Enviar mensaje") {
                    escena.procesarMensajeUsuario(mensajeUsuario)
                    mensajeUsuario = ""
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
        }
        .onAppear {
            escena.scaleMode = .resizeFill
        }
    }
}

#Preview {
    ContentView()
}
