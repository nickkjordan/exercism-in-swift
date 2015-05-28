import Foundation

struct WordCount {
    var words = ""
    private let nonAlphanumeric = NSCharacterSet.alphanumericCharacterSet().invertedSet
    private var separatedWords: [String] {
        return words.componentsSeparatedByCharactersInSet(nonAlphanumeric)
            .filter { !$0.isEmpty }
    }
    
    func count() -> [String: Int] {
        return separatedWords.reduce([String: Int]()) { $0 + $1 }
    }
}

private func + (var left: [String: Int], right: String) -> [String: Int] {
    let key = right.lowercaseString
    var value = left[key] ?? 0
    left.updateValue(++value, forKey: key)
    return left
}