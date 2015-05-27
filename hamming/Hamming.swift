import Foundation

class Hamming {
    class func compute(strand: String, against: String) -> Int? {
        if count(strand) != count(against) {
            return nil
        }
        
        let zippedArray = Array(zip(strand, against))
        func compareChars(first: Character, second: Character) -> Int {
            return (first != second) ? 1 : 0
        }
        
        return zippedArray.reduce(0, combine: {
            $0! + compareChars($1.0, $1.1) })
    }
}