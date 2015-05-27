import Foundation

enum NumberClassification {
    case Perfect, Deficient, Abundant
}

struct NumberClassifier {
    private(set) var number : Int
    private var n : Int {
        return number
    }
    private var possibleFactors : Array<Int> {
        return Array(1...number/2)
    }
    
    var classification : NumberClassification {
        let sumOfFactors = possibleFactors.filter { self.n % $0 == 0 }
                            .reduce(0, combine: +)
        if sumOfFactors == n {
            return .Perfect
        } else if sumOfFactors < n {
            return .Deficient
        } else {
            return .Abundant
        }
    }
}