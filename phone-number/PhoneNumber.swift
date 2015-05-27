import Foundation

struct PhoneNumber {
    var startingNumber : String = ""
    
    func number() -> String {
        let checkedLengthTuple = checkDigits()
        if checkedLengthTuple.1 {
            let array = checkedLengthTuple.0.componentsSeparatedByCharactersInSet(NSCharacterSet.numericCharacterSet().invertedSet)
            return array.reduce("") { $0 + $1 }
        } else {
            return checkedLengthTuple.0 // Invalid number
        }
    }
    
    func areaCode() -> String {
        let str = startingNumber
        let areaCodeRange = Range<String.Index>(start: str.startIndex, end: advance(str.startIndex, 3))
        return str.substringWithRange(areaCodeRange)
    }
    
    func description() -> String {
        var prettyPrintNumber = checkDigits().0
        let start = prettyPrintNumber.startIndex
        let changes = [("-",start, 6), (") ", start, 3), ("(", start, 0)]
        return changes.reduce(prettyPrintNumber) { stringByInserting($1.0, intoString: $0, atIndex: advance($1.1, $1.2)) }
    }
    
    private func stringByInserting(string: String, var intoString: String, atIndex: String.Index) -> String {
        intoString.splice(string, atIndex: atIndex)//advance(tuple.1, tuple.2)
        return intoString
    }
    
    private func checkDigits() -> (String, Bool) {
        if count(startingNumber) == 11 {
            var newNumber = startingNumber
            let firstDigit = newNumber.removeAtIndex(newNumber.startIndex)
            return firstDigit == "1" ? (newNumber, true) : ("0000000000", false)
        } else if count(startingNumber) < 10 {
            return ("0000000000", false)
        } else {
            return (startingNumber, true)
        }
    }
}

extension NSCharacterSet {
    class func numericCharacterSet() -> NSCharacterSet {
        return NSCharacterSet(charactersInString: "0123456789")
    }
}