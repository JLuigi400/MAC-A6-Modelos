//
//  pantalla_chat}.swift
//  Shimeji2D
//
//  Created by alumno on 5/25/26.
//

import SwiftUI

struct PantallaChat: View {
    @State var mensaje = ""
    @State var respuesta = ""
    let agente = ServicioAgente()

    var body: some View {
        VStack {
            Text("Agente: \(respuesta)")
                .padding()
                .background(Color.blue.opacity(0.2))
                .cornerRadius(10)

            TextField("Escribe tu mensaje", text: $mensaje)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Enviar") {
                agente.crear_peticion(contexto: Contexto(historia: "Megaman", personalidad: "Heroico", estados_disponibles: [], estado_actual: "Idle", descripcion: ""), mensaje_del_usario: mensaje)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
