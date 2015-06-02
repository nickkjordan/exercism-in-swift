import Foundation

struct Trinary {
    private var trinaryNum: String

    init(_ input: String) {
        trinaryNum = input
    }
    
    var toDecimal: Int {
        if let value = trinaryNum.toInt() {
            return decimalFromTrinary(value)
        } else {
            return 0
        }
    }
    
    private func decimalFromTrinary(tri: Int, place: Int = 0) -> Int {
        if tri == 0 { return 0 }
        else {
            let remainder = tri % 10
            let nextDigit = decimalFromTrinary(tri/10, place: place+1)
            return remainder <<< place + nextDigit
        }
    }
}

infix operator <<< { associativity left precedence 160 }
private func <<< (left: Int, right: Int) -> Int {
    return left * Int(pow(Double(3), Double(right)))
}