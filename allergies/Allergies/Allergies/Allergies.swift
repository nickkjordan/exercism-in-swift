import Foundation

enum Allergies : Int {
    case eggs = 0, peanuts, shellfish, strawberries, tomatoes, chocolate, pollen, cats
    
    var raw : Int
    
    init(_ allergies: Int) {
        raw = allergies
    }
    
    func hasAllergy(allergy: Allergies) -> Bool {
        return false
    }
}