private typealias TranslationRule = String -> String
infix operator >>> { associativity left }

private func >>> (translation1: TranslationRule, translation2: TranslationRule) -> TranslationRule {
    return { word in translation2(translation1(word)) }
}

struct PigLatin {
    private static let vowels = Set(["a", "e", "i", "o", "u"])
    
    static func translate(var word: String, isPhrase: Bool = true) -> String {
        if isPhrase {
            let words = word.componentsSeparatedByString(" ")
            if words.count > 1 {
                return translateAllWords(words)
            }
        }
        
        if prefixIsConsonantSound(word) {
            let moveConsonantToEnd = consonantSoundToEnd() >>> checkQu()
            word =  moveConsonantToEnd(word)
        }
        return word + "ay"
    }
    
    private static func translateAllWords(words: [String]) -> String {
        return words.map { self.translate($0, isPhrase: false) }
            .reduce("") {
                if $0.isEmpty { return $0 + $1 }
                else { return $0 + " " + $1 }
        }
    }
    
    private static func prefixIsConsonantSound(word: String) -> Bool {
        let edgeCasePrefix = word.hasPrefix("y") || word.hasPrefix("x")
        let secondCharacter = word[word.startIndex.successor()]
        if edgeCasePrefix && !vowels.contains(String(secondCharacter)) {
            return false
        }
        return !vowels.contains(word.firstLetter)
    }
    
    private static func consonantSoundToEnd() -> TranslationRule {
        return { word in
            let firstVowelIndex = word.indexOfFirstVowel
            let first = word.substringToIndex(firstVowelIndex)
            let rest = word.substringFromIndex(firstVowelIndex)
            return rest + first
        }
    }
    
    private static func checkQu() -> TranslationRule {
        return { (var word: String) in
            if word.hasPrefix("u") && word.hasSuffix("q") {
                word = word.substringFromIndex(word.startIndex.successor()) + "u"
            }
            return word
        }
    }
}

extension String: Equatable {
    private var vowels: Set<String> { return PigLatin.vowels }
    
    private var firstLetter: String {
        return self.substringToIndex(self.startIndex.successor())
    }
    
    private var indexOfFirstVowel: String.Index {
        var index = self.startIndex
        while !vowels.contains(String(self[index])) {
            index = index.successor()
        }
        return index
    }
}