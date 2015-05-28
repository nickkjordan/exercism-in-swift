struct Raindrops {
    static let drops = [3: "Pling", 5: "Plang", 7: "Plong"]
    static let raindropFactors = Set(drops.keys.array)
    
    static func convert(input: Int) -> String {
        let raindrops = PrimeFactors.For(input)
            .filter { self.raindropFactors.contains($0) }
            .reduce([Int]()) { $0 += $1 }
            .reduce("") { $0 + self.drops[$1]! }
        
        if raindrops == "" { return String(input) }
        else { return raindrops }
    }
}

private func += (left: [Int], right: Int) -> [Int] {
    return left.last == right ? left : left + [right]
}