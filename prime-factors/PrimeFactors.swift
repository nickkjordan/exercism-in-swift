struct PrimeFactors {
    
    static func For(input: Int) -> [Int] {
        return primeFactor(input)
    }
    
    static func primeFactor (input: Int, var _ divisor: Int = 2) -> [Int] {
        if input == 1 { return [] }
        else {
            while input % divisor != 0 { divisor++ }
            return [divisor] + primeFactor(input/divisor, divisor)
        }
    }
}