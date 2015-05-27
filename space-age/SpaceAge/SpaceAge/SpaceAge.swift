import Foundation

private enum OrbitalPeriods: Double {
    case Earth = 1
    case Mercury = 0.2408467
    case Venus = 0.61519726
    case Mars = 1.8808158
    case Jupiter = 11.862615
    case Saturn = 29.447498
    case Uranus = 84.016846
    case Neptune = 164.79132
}

class SpaceAge {
    let seconds : Double
    
    init(_ seconds: Double) {
        self.seconds = seconds
    }
    
    private func conversion(planet: OrbitalPeriods) -> Double {
        let value = self.seconds / 31557600.0 / planet.rawValue
        return round(value * 100) / 100
    }
    
    var onEarth: Double { return conversion(.Earth) }
    var onMercury: Double { return conversion(.Mercury) }
    var onVenus: Double { return conversion(.Venus) }
    var onMars: Double { return conversion(.Mars) }
    var onJupiter: Double { return conversion(.Jupiter) }
    var onSaturn: Double { return conversion(.Saturn) }
    var onUranus: Double { return conversion(.Uranus) }
    var onNeptune: Double { return conversion(.Neptune) }
}