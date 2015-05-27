struct Binary {
    
    private var binary: String
    
    init(_ input: String) {
        binary = input
    }
    
    var toDecimal: Int {
        if let intVal = binary.toInt() {
            return binaryToDecimal(intVal)
        } else { return 0 }
    }
    
    private func binaryToDecimal(val: Int, atPlace place: Int = 0) -> Int {
        if val > 0 {
            let bitshifted = bitshiftLowestDigit(val, atPlace: place)
            return bitshifted + binaryToDecimal(val/10, atPlace: place + 1)
        } else { return 0 }
    }
    
    private func bitshiftLowestDigit(val: Int, atPlace place: Int) -> Int {
        let digit = val % 10
        return (digit == 0) ? 0 : digit << place
    }
}