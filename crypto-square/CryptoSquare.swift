import Foundation

struct Crypto {
    var toEncrypt: String
    
    init(_ input: String) {
        toEncrypt = input
    }
    
    var normalizePlaintext: String {
        return normalizedString()
    }
    
    var size: Int {
        let s = count(normalizedString())
        var size = 0
        do { size++
        } while size*size < s
        
        return size
    }
    
    var plaintextSegments: [String] {
        let count = size
        var arr = [String]()
        var workingStr = ""
        
        for (index, char) in enumerate(normalizePlaintext) {
            if index > 0 && index % size == 0 {
                arr += [workingStr]
                workingStr = ""
            }
            workingStr.append(char)
        }
        if !workingStr.isEmpty { arr += [workingStr] }
        return arr
    }
    
    var ciphertext: String {
        let plaintext = plaintextSegments.map { Array($0) }
        let count = size
        var text = ""
        for var i = 0; i < size; i++ {
            text += plaintext.reduce("") {
                i < $1.count ? $0 + String($1[i]) : $0
            }
        }
        return text
    }
    
    var normalizeCiphertext: String {
        var response = ""
        for (index, char) in enumerate(ciphertext) {
            let newCount = count(response)
            if (newCount > 0) && ((newCount+1) % size == 0) {
                response += " "
            }
            response.append(char)
        }
        return response
    }
    
    private func normalizedString() -> String {
        return Array(toEncrypt.lowercaseString).map { String($0) }
            .filter { $0.isAlphaNumeric }
            .reduce("", combine: +)
    }
}

extension String {
    var isAlphaNumeric: Bool {
        return self.rangeOfCharacterFromSet(.alphanumericCharacterSet()) != nil
    }
}