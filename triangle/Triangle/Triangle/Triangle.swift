import Foundation

struct Triangle {
    
    private let side1: Float
    private let side2: Float
    private let side3: Float

    var kind: String {
        switch (side1, side2, side3){
        case let (x, y, z) where x<=0 || y<=0 || z<=0:
            return "ErrorKind"
        case let (x, y, z) where x+y <= z || x+z <= y || y+z <= x:
            return "ErrorKind"
        case let (x, y, z) where x == y && x == z:
            return "Equilateral"
        case let (x, y, z) where x == y || x == z || y == z:
            return "Isosceles"
        default:
            return "Scalene"
        }
    }
    
    init(_ side1: Float, _ side2: Float, _ side3: Float) {
        (self.side1, self.side2, self.side3) = (side1, side2, side3)
    }

}