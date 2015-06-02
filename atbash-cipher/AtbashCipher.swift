import Foundation

struct Atbash {
    
    static func encode(var ciph: String) -> String {
        if ciph.isEmpty { return "" }
        else {
            return Array(ciph).map { self.encodeChar($0) }
                .filter { !$0.isEmpty }
                .reduce("") { $0 + self.addWhitespace(toString: $0) + $1 }
        }
    }
    
    static func encodeChar(char: Character) -> String {
        let stringChar = String(char)
        
        if stringChar.isInSet(.letterCharacterSet()) {
            return stringChar.cipher()
        } else if stringChar.toInt() != nil {
            return  stringChar
        }
        return ""
    }
    
    static func addWhitespace(toString str: String) -> String {
        let count = str.countExcludingWhitespace
        let addWhitespace = count % 5 == 0 && count > 0 && !str.hasSuffix(" ")
        return addWhitespace ? " " : ""
    }
}

private extension String {
    var countExcludingWhitespace: Int {
        let minusWhitespace = self.componentsSeparatedByCharactersInSet(.whitespaceCharacterSet())
            .reduce("", combine: +)
        return count(minusWhitespace)
    }
    
    func isInSet(set: NSCharacterSet) -> Bool {
        return self.rangeOfCharacterFromSet(set) != nil
    }
    
    func cipher() -> String {
        let string = self.lowercaseString
        var unicodeScalar = string.unicodeScalars
        let value = unicodeScalar.removeAtIndex(unicodeScalar.startIndex).value
        switch value {
        case let x where x > 96 && x < 110:
            return stringFromUInt((110 + (109 - x)))
        case let x where x > 109 && x < 123:
            return stringFromUInt((109 - (value - 110)))
        default:
            return ""
        }
    }
    
    func stringFromUInt(input: UInt32) -> String {
        return String((UnicodeScalar(input)))
    }
}