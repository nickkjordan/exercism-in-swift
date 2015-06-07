struct Octal {
    private var octal: String
    private var powersOfEight = EightPowerGenerator()
    
    var toDecimal: Int {
        if let value = octal.toInt() {
            return octalToDecimal(value).1
        }
        return 0
    }
    
    init(_ input: String) {
        self.octal = input
    }
    
    private func octalToDecimal(octal: Int, place: Int = 0) -> (Bool, Int) {
        if octal == 0 { return (true, 0) }
        
        let digit = (octal % 10)
        if digit > 7 { return (false, 0) }
        
        let power = place == 0 ? 1 : powersOfEight.next()!
        
        let (success, recursion) = octalToDecimal(octal/10, place: place+1)
        return success ? (true, digit * power + recursion) : (false, 0)
    }
}

private class EightPowerGenerator: GeneratorType {
    typealias Element = Int
    
    var power = 1
    let eight = 8
    
    func next() -> Element? {
        power *= eight
        return power
    }
}