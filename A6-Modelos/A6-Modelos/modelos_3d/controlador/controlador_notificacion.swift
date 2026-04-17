//
//  controlador_notificacion.swift
//  A6-Modelos
//
//  Created by alumno on 4/17/26.
//

import SwiftUI
import RealityKit

extension ControladorAplicacion{
    func activar_comportamiento(_ nombre: String){
        raiz_escena.scene?.enviar_notificacion(nombre)
    }
    
    func escuchar_comportamiento (_ nombre: String){
        print("Nombre de finalizacion comportamiento: \(nombre)")
    }
}
