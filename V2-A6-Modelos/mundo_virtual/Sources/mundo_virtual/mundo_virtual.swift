import Foundation
import RealityKit

// Bundle principal del proyecto mundo_virtual
public let bundleMundoVirtual = Bundle.module

// Enum que gestiona las entidades del mundo virtual
public enum MundoVirtualAssets {
    static func cargarCaballero() async throws -> Entity {
        return try await Entity.loadAsync(named: "Caballero", in: bundleMundoVirtual)
    }

    static func cargarArquera() async throws -> Entity {
        return try await Entity.loadAsync(named: "Arquera", in: bundleMundoVirtual)
    }

    static func cargarBerserker() async throws -> Entity {
        return try await Entity.loadAsync(named: "Berserker", in: bundleMundoVirtual)
    }
}

// Ejemplo de notificaciones de animación
enum Notificaciones {
    case da_un_salto
}

let Notificacion: [Notificaciones: String] = [
    .da_un_salto: "da_un_salto"
]
