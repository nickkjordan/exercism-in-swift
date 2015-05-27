import Foundation

class ETL {
    
    class func transform(inputDictionary: Dictionary<Int, Array<String>>) -> Dictionary<String, Int> {
        let oldKeys = inputDictionary.keys.array
        var newDict = [String: Int]()
        for intKey in oldKeys {
            let arrayOfLetters = inputDictionary[intKey]!
            for letter in arrayOfLetters {
                newDict.updateValue(intKey, forKey: letter.lowercaseString)
            }
        }
        return newDict
    }
}