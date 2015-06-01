import Foundation

let letterSet = NSCharacterSet.letterCharacterSet()

struct Atbash {
    
    static func encode(var ciph: String) -> String {
        if ciph.isEmpty { return "" }
        else {
            var response = ""
            var count = 0
            for letter in ciph {
                let strLetter = String(letter)
                if strLetter.isInSet(letterSet) {
                    countUpdate(&count, response: &response)
                    response += strLetter.cipher();
                } else if strLetter.toInt() != nil {
                    countUpdate(&count, response: &response)
                    response += strLetter
                }
            }
            return response
        }
    }
    
    static func countUpdate(inout count: Int, inout response: String) {
        if count % 5 == 0 && count > 0 { response += " " }
        count++
    }
}

extension String {
    func isInSet(set: NSCharacterSet) -> Bool {
        return self.rangeOfCharacterFromSet(set) != nil
    }
    
    func cipher() -> String {
        let string = self.lowercaseString
        var unicodeScalar = string.unicodeScalars
        let value = unicodeScalar.removeAtIndex(unicodeScalar.startIndex).value
        switch value {
        case let x where x > 96 && x < 110:
            return stringFrom((110 + (109 - x)))
        case let x where x > 109 && x < 123:
            return stringFrom((109 - (value - 110)))
        default:
            return ""
        }
    }
    
    func stringFrom(input: UInt32) -> String {
        return String((UnicodeScalar(input)))
    }
}