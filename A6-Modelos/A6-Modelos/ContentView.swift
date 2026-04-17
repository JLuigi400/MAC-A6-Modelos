//
//  ContentView.swift
//  A6-Modelos
//
//  Created by alumno on 4/13/26.
//

import SwiftUI
import RealityKit
import mundo_virtual

struct ContentView: View {
    @State var distancia: Float = 0
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        ZStack{
            Rectangle()
                .background(Color.green)
            VStack{
                switch controlador.estado{
                    case .iniciando
                    : Text("Iniciando...")
                        .foregroundStyle(Color.white)
                    case .cargado
                    : RealityView{ raiz_de_escena in
                        raiz_de_escena.add(controlador.raiz_escena)
                    
                    }
                    .onReceive(NotificationCenter.default.publisher(for: Notification.Name("RealityKit.NotificationTrigger"))){
                        notificacion in
                        guard let notificacion = notificacion.userInfo?["RealityKit.NotificationTrigger.Identifier"] as? String else { return }
                        
                        controlador.escuchar_comportamiento(notificacion)
                    }
                }
            
                /*
                 if let modelo_cubo = try? await Entity(named: escenario_modelo, in: MundoVirtual) {
                 modelo_cubo.position.z = Float(distancia)
                 modelo_cubo.position.y = -0.5
                 raiz_de_escena.add(modelo_cubo)
                 */
            }
        }
        Slider(value: $distancia, in: 0...5)
        HStack{
            Button{
                controlador.alejar_modelos(distancia: distancia)
            }
            label: {
                Text("Alejar Planetas")
                    .foregroundStyle(Color.red)
            }
            Button{
                controlador.realizar_comando(tipo: .activar_animaacion, carga_util: "da_un_salto")
            }
            label: {
                Text("Saltar Modelo")
                    .foregroundStyle(Color.red)
            }
        }
        
        HStack{
            ForEach(controlador.historial_comandos){ comando in
                Text("Comando Ejecutando \(comando.carga_util) ")
                
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(ControladorAplicacion())
}
