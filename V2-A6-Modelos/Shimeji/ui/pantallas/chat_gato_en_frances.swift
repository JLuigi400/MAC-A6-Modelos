//
//  chat_gato_en_frances.swift
//  Shimeji
//
//  Created by alumno on 5/4/26.
//

import SwiftUI


struct ChatView: View {
    @State var sesion_chat = ServicioChat()
    @State var mensaje_a_enviar: String = ""
    
    var body: some View {
        VStack{
            ForEach(sesion_chat.mensajes){mensaje in
                Text("El mensajes es: \(mensaje.texto) de parte de: \(mensaje.remitente)")
                
            }
            
            TextField("Cuentame que enviar", text: $mensaje_a_enviar)
            
            Button{
                sesion_chat.enviar_mensaje(texto: mensaje_a_enviar)
                mensaje_a_enviar = ""
            } label: {
                Text("Pulsame para enviar cosas")
            }
            
        }
        .onAppear {
            sesion_chat.obtener_mensajes()
        }
    }
}

#Preview {
    ChatView()
}



