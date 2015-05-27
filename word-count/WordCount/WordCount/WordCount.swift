import Foundation

struct WordCount {
    var words = ""
    
    func count() -> Dictionary<String, Int> {
        let filteredArray = filterWords()
        return filteredArray.reduce([String: Int]()) {
            (var dict, key) in
            var value = dict[key.lowercaseString] ?? 0
            dict.updateValue(++value, forKey: key.lowercaseString)
            return dict
        }
    }
    
    private func filterWords() -> Array<String> {
        let set1 = NSCharacterSet.alphanumericCharacterSet().invertedSet
        let arr = words.componentsSeparatedByCharactersInSet(set1)
        
        return arr.filter { !$0.isEmpty }
    }
}