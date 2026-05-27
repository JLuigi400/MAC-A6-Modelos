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

    func crearPeticion(contexto: Contexto, mensajeDelUsuario: String) {
        let peticion = Peticion(
            id: UUID().uuidString,
            estado: .creacion,
            contexto: contexto,
            mensaje: mensajeDelUsuario,
            comando_a_ejecutar: nil,
            respuesta: nil
        )

        do {
            let ref = try base_de_datos.collection("peticiones").addDocument(from: peticion)
            ref.addSnapshotListener { snapshot, error in
                guard let snapshot = try? snapshot?.data(as: Peticion.self) else { return }
                self.peticion = snapshot

                if let comando = snapshot.comando_a_ejecutar {
                    ControlAplicacion.instancia.ejecutarComando(comando)
                }
            }
        } catch {
            print("Error al enviar petición: \(error)")
        }
    }
}
