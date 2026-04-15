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
        Button{
        }
        label: {
            Text("Alejar Planetas")
                .foregroundStyle(Color.red)
        }
    }
}

#Preview {
    ContentView()
        .environment(ControladorAplicacion())
}
