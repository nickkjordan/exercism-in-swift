import Foundation

class Anagram {
    struct BaseWord {
        var stringValue : String

        func isAnagramWith(string: String) -> Bool {
            if isIdenticalWord(string) { return false }
            var stringCopy = self.stringValue
            for letter in string {
                if !(stringCopy.removeChar(letter)) {return false}
            }
            return stringCopy == "" ? true : false
        }
        func isIdenticalWord(string: String) -> Bool {
            return (string.lowercaseString == self.stringValue.lowercaseString) ? true : false
        }
    }
    var base : BaseWord
    
    init(word: String){
        base = BaseWord(stringValue: word)
    }
    
    func match(array: Array<String>) -> Array<String> {
        return array.filter{ self.base.isAnagramWith($0) }
    }
}

extension String {
    mutating func removeChar(char: Character) -> Bool {
        let range = self.rangeOfString(String(char), options: NSStringCompareOptions.CaseInsensitiveSearch)
        if range == nil {return false}
        else {
            self.removeRange(range!)
            return true
        }
    }
}