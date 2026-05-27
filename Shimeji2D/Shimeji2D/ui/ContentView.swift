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
    @State private var personajeActivo = Personaje(id: "megaman", nombre: "Megaman", personalidad: "Heroico y decidido", colorEmocion: "blue", frases: [])
    @State private var respuestaActual = "Hmm... interesante lo que dices."

    var body: some View {
        VStack {
            // Nombre del personaje
            Text(personajeActivo.nombre)
                .font(.custom("PressStart2P", size: 14))
                .foregroundColor(.white)
                .padding(.top, 10)

            // Sprite del personaje
            Image(personajeActivo.id + "_flat")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .padding(.vertical, 20)

            // Marco de diálogo
            ZStack {
                Image("marco_dialogo")
                    .resizable()
                    .scaledToFit()
                Text(respuestaActual)
                    .font(.custom("VT323", size: 18))
                    .foregroundColor(.white)
                    .padding()
            }
            .frame(height: 150)

            // Botones y campo de texto
            VStack {
                HStack {
                    Button("Megaman") { personajeSeleccionado = "megaman" }
                    Button("Protoman") { personajeSeleccionado = "protoman" }
                    Button("Roll") { personajeSeleccionado = "roll" }
                }
                .buttonStyle(.borderedProminent)
                .padding(.top, 10)

                HStack {
                    TextField("Escribe tu mensaje...", text: $mensajeUsuario)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Enviar mensaje") {
                        escena.procesarMensajeUsuario(mensajeUsuario)
                        mensajeUsuario = ""
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding(.bottom, 10)
            }
        }
        .background(Color("fondo_nes"))
    }
}


#Preview {
    ContentView()
}
