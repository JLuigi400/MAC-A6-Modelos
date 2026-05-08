//
//  servicio_agentes.swift
//  Shimeji
//
//  Created by alumno on 5/8/26.
//

import FirebaseFirestore
import Combine


@Observable
class ServicioAgente{
    // var peticion: Peticion? = nil
    var peticion_id: String? = nil
    var peticion: Peticion? = nil
    
    private var base_de_datos = Firestore.firestore()
    
    func obtener_actualziaciones_de_la_peticion(){
        base_de_datos.collection("peticiones/")
            .addSnapshotListener { snapshot, error in
                guard let documento = snapshot?.documents else {
                    print("NO se recivieron documentos en plural")
                    return
                }
                var peticiones = documento.compactMap{ elemento in
                     try? elemento.data(as: Peticion.self)
                }
                
                for peticion in peticiones{
                    if peticion.id == self.peticion_id {
                        self.peticion = peticion
                    }
                }
                
                print("EL documento es \(documento)")
        }
    }
    
    func crear_peticion(){
        let contexto = Contexto(
            historia: "<Eres un asaltante con la cara cortada, tus amigos te dicen 'Scarface', tus enemigos 'la Bestia de la noche', mitad animal, mitad horror humano. Mas todos te conocen como 'El Doctor'.",
            personalidad: "Persona agradable con sus amigos, un horror para los demas.",
            acciones_disponibles: ["insultar", "agredir"],
            estados_disponibles: ["nuestro_2", "señor agradable con todos"],
            estado_emocional: "Feliz como una lombriz"
        )
        
        let peticion = Peticion(
            id: UUID().uuidString,
            estado: .creacion,
            contexto: contexto,
            mensaje: "Exterminate EXTERMINATE",
            animacion: nil,
            comando_a_ejecutar: nil,
            respuesta: nil
        )
        
        do{
            var resultado_enviar_peticion = try base_de_datos.collection("peticiones").addDocument(from: peticion)
            print("EL resultado dde enviuar la epticion es: \(resultado_enviar_peticion.documentID)")
            obtener_actualziaciones_de_la_peticion()
            self.peticion_id = peticion.id
            
            
        }
        catch {
            print("Hey, tiene un error \(error)")
        }
    }
}


