import Foundation

class Bob {
    
    class func hey(input: String) -> String {
        if input.removeWhiteSpace() == "" {
            return "Fine, be that way."
        } else if input.isAllUppercase() && input.hasLetters(){
            return "Woah, chill out!"
        } else if input.hasSuffix("?") {
            return "Sure."
        }
        return "Whatever."
    }
}

private extension String {
    func isAllUppercase() -> Bool {
        return self.uppercaseString == self
    }
    
    func removeWhiteSpace() -> String {
        return self.stringByReplacingOccurrencesOfString("\\s",
            withString: "",
            options: NSStringCompareOptions.RegularExpressionSearch,
            range: Range<String.Index>?())
    }
    
    func hasLetters() -> Bool {
        let string = self.stringByReplacingOccurrencesOfString("[[a-z][A-Z]]",
            withString:" ",
            options: NSStringCompareOptions.RegularExpressionSearch,
            range:Range<String.Index>?())
        return string != self
    }
}