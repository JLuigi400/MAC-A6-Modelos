//
//  ContentView.swift
//  Shimeji
//
//  Created by Jadzia Galletas on 13/04/26.
//

import SwiftUI
import RealityKit
import mundo_virtual

struct Inicio: View{
    @State var lejitud: Float = 0
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        ZStack{
            Rectangle()
            VStack{
                switch controlador.estado{
                    case .iniciando:
                        Text("Iniciando aplicación, por favor, espere.")
                            .foregroundStyle(Color.red)
                        
                    case .todo_cargado:
                        RealityView{ raiz_escena in
                            raiz_escena.camera = .spatialTracking
                            
                            //controlador.escenario = raiz_de_escena
                            
                            raiz_escena.add(controlador.raiz_escena)
                            
                            for ancla in controlador.entidades_ancla{
                                raiz_escena.add(ancla)
                            }
                            
                        }
                        
                        .gesture(
                            SpatialTapGesture().targetedToAnyEntity().onEnded(
                                { entidad in
                                    print("[Inicio:gesture] \(entidad.entity.name)")
                                    controlador.actualizar_estados(.entidad, .so_on_so_on)
                                }
                            )
                        )
                        
                        .task {
                            await controlador.servicio_ar()
                        }
                        .onReceive(NotificationCenter.default.publisher(for: Notification.Name("RealityKit.NotificationTrigger"))){ notificacion in
                            guard let notificacion = notificacion.userInfo?["RealityKit.NotificationTrigger.Identifier"] as? String else { return }
                            
                            // controlador.escuchar_comportamiento(notificacion)
                            controlador.actualizar_estados(.notificacion, .so_on_so_on)
                        }
                }
                
            }
        }
        
        Slider(value: $lejitud, in: 0...5)
            .onChange(of: lejitud) {
                controlador.alejar_planetas(lejitud: lejitud)
            }
        
        HStack{
            
            Button{
                controlador.actualizar_estados(.boton, .realizar_accion)

            }
            label: {
                Text("Realizar accion")
                    .foregroundStyle(Color.red)
            }
            
            Button {
                controlador.actualizar_estados(.boton, .cerrar_aplicacion)
            }
            label: {
                Text("Cerrar app")
            }
        }
        
        HStack{
            ForEach(controlador.historial_comandos){ comando in
                Text("Comando ejectudado \(comando.carga_util) ")
            }
        }
    }
}

#Preview {
    Inicio()
        .environment(ControladorAplicacion())
}
