//
//  servicio_agente.swift
//  Shimeji2D
//
//  Created by alumno on 5/25/26.
//

import Foundation
import FirebaseFirestore

class ServicioAgente {
    var peticion: Peticion? = nil
    private var base_de_datos = Firestore.firestore()

    func crear_peticion(contexto: Contexto, mensaje_del_usuario: String) {
        let peticion = Peticion(
            id: UUID().uuidString,
            estado: .creacion,
            contexto: contexto,
            mensaje: mensaje_del_usuario,
            comando_a_ejecutar: nil,
            respuesta: nil
        )

        do {
            let ref = try base_de_datos.collection("peticiones").addDocument(from: peticion)
            ref.addSnapshotListener { snapshot, error in
                guard let snapshot = try? snapshot?.data(as: Peticion.self) else { return }
                self.peticion = snapshot

                // 🔹 Si el agente genera un comando, lo enviamos al juego
                if let comando = snapshot.comando_a_ejecutar {
                    NotificationCenter.default.post(
                        name: Notification.Name("Agente.Comando"),
                        object: nil,
                        userInfo: ["comando": comando]
                    )
                }
            }
        } catch {
            print("Error al enviar petición: \(error)")
        }
    }
}


func crear_peticion(contexto: Contexto, mensaje_del_usario: String) {
    let peticion = Peticion(
        id: UUID().uuidString,
        estado: .creacion,
        contexto: contexto,
        mensaje: mensaje_del_usario,
        comando_a_ejecutar: nil,
        respuesta: nil
    )

    do {
        let ref = try base_de_datos.collection("peticiones").addDocument(from: peticion)
        ref.addSnapshotListener { snapshot, error in
            guard let snapshot = try? snapshot?.data(as: Peticion.self) else { return }
            self.peticion = snapshot
            // Aquí puedes activar animaciones según la respuesta
        }
    } catch {
        print("Error al enviar petición: \(error)")
    }
}
