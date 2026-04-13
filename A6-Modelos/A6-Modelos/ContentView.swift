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
    @State var distancia: Float = 1
    
    var body: some View {
        ZStack{
            Rectangle()
                .background(Color.green)
            RealityView{ raiz_de_escena in
                if let modelo_cubo = try? await Entity(named: "escena", in: mundo_virtualBundle) {
                    modelo_cubo.position.z = Float(distancia)
                    modelo_cubo.position.y = -0.5
                    raiz_de_escena.add(modelo_cubo)
                }
            }
        }
        
        Slider(value: $distancia)
    }
}

#Preview {
    ContentView()
}
