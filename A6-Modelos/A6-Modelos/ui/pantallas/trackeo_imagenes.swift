//
//  trackeo_imagenes.swift
//  A6-Modelos
//
//  Created by alumno on 4/24/26.
//

import SwiftUI
import RealityKit
import mundo_virtual

struct SeguimientoImagenes: View {
    var body: some View {
        RealityView{ contenido in
            contenido.camera = .spatialTracking
            
            let ancla = AnchorEntity(.image(group: "imagenes", name: "megaprofile2") )
            
            let modelo_a_colocar = ModelEntity(mesh: .generateBox(size: 0.75), materials: [SimpleMaterial(color: .green, isMetallic: true)])
                ancla.addChild(modelo_a_colocar)
            /*
            if let modelo_a_colocar = try? await Entity(named: "cloud", in: MundoVirtual){
                ancla.addChild(modelo_a_colocar)
            }else{
                fatalError("No funciona, hay que arreglarlo")
            }*/
            
            contenido.add(ancla)
        }
        .gesture(SpatialTapGesture().targetedToAnyEntity().onEnded({
            accion_realizada in
                print("Acción realizada es: \(accion_realizada)")
        }))
        .gesture(SpatialTapGesture().targetedToAnyEntity().onEnded({
            entidad_apachurrada in
            print("Se ha pulsado \(entidad_apachurrada)")
        }))
        
        
        .background(Color.green)
    }
}

#Preview {
    SeguimientoImagenes()
}
