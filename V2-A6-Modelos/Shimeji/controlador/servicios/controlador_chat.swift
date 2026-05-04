// https://github.com/firebase/firebase-ios-sdk
//  controlador_chat.swift
//  Shimeji
//
//  Created by alumno on 5/4/26.
//

import FirebaseFirestore
import Combine

/*
 class ServicioChat: ObservableObject{}
 */

@Observable
class ServicioChat{
    var mensaje: [Mensaje] = []
    
    private var base_de_datos = Firestore.firestore()
    
    func obtener_mensajes(){
        base_de_datos.collection("mensajes").order(by: "timestamp")
            .addSnapshotListener { snapshot, error in
            guard let documento = snapshot?.document else { return }
            self.mensaje = document.compactMap{
                elemento in try? elemento.data(as: mensaje.self)
            }
        }
    }
    
    func enviar_mensajes(texto: String){
        let mensaje = Mensaje(
            id: UUID().uuidString,
            texto: texto,
            remitente: "Yo",
            timestamp: Date()
        )
        
        do {
            _ = try base_de_datos.collection("comandos").addDocument(from: mensaje)
        }
        catch {
            print("HEY, LISTEN. Tienes un error: \(error)")
        }
    }
}
