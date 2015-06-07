struct Luhn {
    private var value: Int
    
    init(_ input: Int) {
        value = input
    }
    
    var addends: [Int] { return addends(value) }
    var checksum: Int { return addends.reduce(0, combine: +) }
    var isValid: Bool { return checksum % 10 == 0 }
    
    private var checkDigit: Int {
        let checkDigit = 10 - (checksum % 10)
        return checkDigit == 10 ? 0 : checkDigit
    }
    
    private func addends(input: Int, place: Int = 0) -> [Int] {
        if input == 0 { return [] }
        
        var digit = input % 10
        if place % 2 != 0 {
            let k = digit * 2
            digit = (k < 10) ? k : (k - 9)
        }
        
        return addends(input/10, place: place+1) + [digit]
    }
    
    static func create(input: Int) -> Int {
        let test = input * 10
        let luhn = self(test)
        
        return test + luhn.checkDigit
    }
}