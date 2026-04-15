//
//  control_aplicacion.swift
//  A6-Modelos
//
//  Created by alumno on 4/15/26.
//

import SwiftUI
import RealityKit
import mundo_virtual

@Observable
@MainActor

public class ControladorAplicacion{
    public var escenario: Entity? = nil
    
    public var raiz_escena: Entity = Entity()
    
    public var estado: EstadosAplicacion = .iniciando
    
    private var modelos_cargados: [Entity] = []
    
    init(){
        Task.detached(priority: .high){
            await self.cargar_modelos()
        }
    }
    
    func cargar_modelos() async {
        
        defer{
            estado = .cargado
        }
        
        var contador_bucle_for = 0
        
        for modelo in modelos{
            guard let cloud = try? await Entity(named: escenario_modelo, in: MundoVirtual) else{
                fatalError("NO SE HA PODIDO CARGAR EL MODELO EN \(#function)")
            }
            
            cloud.position.x = Float(contador_bucle_for / 2) * 1
            cloud.position.y = Float(contador_bucle_for % 2) * 2.0
            
            
            raiz_escena.addChild(cloud)
            modelos_cargados.append(cloud)
            
            contador_bucle_for += 1
        }
    }
    
    func alejar_modelos(distancia: Float){
        for modelos_cargado in modelos_cargados {
            modelos_cargado.position.z = 5
        }
    }
}

