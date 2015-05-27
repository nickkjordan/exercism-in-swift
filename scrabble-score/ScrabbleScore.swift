import Foundation

struct Scrabble {
    
    private var input: String?
    var score: Int {
        return Scrabble.score(input)
    }
    
    init(_ input: String?) {
        self.input = input
    }
    
    static func score(input: String?) -> Int {
        if let value = input {
            return Array(value).reduce(0) { $0 + $1.getValue() }
        }
        return 0
    }
    
    private static let valueDict = [
        Scrabble.characterSet("AEIOULNRST"): 1,
        Scrabble.characterSet("DG"): 2,
        Scrabble.characterSet("BCMP"): 3,
        Scrabble.characterSet("FHVWY"): 4,
        Scrabble.characterSet("K"): 5,
        Scrabble.characterSet("JX"): 8,
        Scrabble.characterSet("QZ"): 10
    ]
    private static let characterSets = valueDict.keys.array
    
    private static func characterSet(input: String) -> Set<Character> {
        return Set<Character>(input)
    }
}

private extension Character {
    func uppercaseCharacter() -> Character {
        return Character(String(self).uppercaseString)
    }
    
    func getValue() -> Int {
        let testChar = self.uppercaseCharacter()

        var set: Set<Character>?
        for testSet in Scrabble.characterSets {
            if testSet.contains(testChar) {
                return Scrabble.valueDict[testSet]!
            }
        }
    
        return 0
    }
}
