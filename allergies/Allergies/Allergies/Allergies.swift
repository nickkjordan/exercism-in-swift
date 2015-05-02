import Foundation

class Allergies {
    private var rawValue : Int
    static let eggs = 1, peanuts = 2, shellfish = 4, strawberries = 8, tomatoes = 16, chocolate = 32, pollen = 64, cats = 128
    private var allergies = [eggs, peanuts, shellfish, strawberries, tomatoes, chocolate, pollen, cats]
    
    init(_ raw: Int) {
        rawValue = raw
        if raw <= 0 { allergies = []; return }
        
        var testValue = raw
        allergies = allergies.reverse()
            .filter {
                if $0 > testValue { return false }
                else {
                    testValue -= $0
                    return true
                }
        }
    }
    
    convenience init(_ raw: UInt) {
        self.init(Int(raw))
    }
    
    func hasAllergy(allergy: Int) -> Bool {
        return contains(allergies, allergy) ? true : false
    }
    
}