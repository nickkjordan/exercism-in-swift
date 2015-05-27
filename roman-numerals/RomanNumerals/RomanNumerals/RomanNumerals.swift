extension Int {
    var toRoman: String {
        var test = self
        var outString = ""
        var place = 1
        while test > 0 {
            outString = numeralFromDigit(test % 10, place: place) + outString
            test /= 10; place++
        }
        return outString
    }
    
    func numeralFromDigit(digit: Int, place: Int) -> String {
        let offset = 2 * (place - 1)
        let one = numerals[0+offset]
        let five = numerals[1+offset]
        let ten = numerals[2+offset]
        
        switch digit {
        case 0: return ""
        case let x where x > 0 && x < 4: return one * x
        case 4: return one + five
        case 5: return five
        case let x where x > 5 && x < 9: return five + one*(x-5)
        case 9: return one + ten
        default: return ""
        }
    }
    
}

let numerals = ["I", "V", "X", "L", "C", "D", "M", "", ""]

infix operator * { associativity left precedence 150 }
func * (var left: String, right: Int) -> String {
    var out = ""
    for (var i = 0; i < right; i++){ out += left }
    return out
}