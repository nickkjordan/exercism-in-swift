import Foundation

class DNA {
    var nucleotideCounts = [ "A": 0, "T" : 0, "C" : 0, "G" : 0 ]
    var stringValue : String
    static let nucleotideCharacterSet = NSCharacterSet(charactersInString: "ATCG")
    
    init(string: String) {
        stringValue = string
        countNucleotides()
    }
    
    func countNucleotides() {
        if stringValue.isEmpty { return }
        for letter in stringValue {
            nucleotideCounts[String(letter)]! += 1
        }
    }
    
    func count(nuc: String) -> Int? {
        return nucleotideCounts[nuc]
    }
    
    class func withStrand(strand: String) -> DNA? {
        if strand.rangeOfCharacterFromSet(nucleotideCharacterSet.invertedSet) != nil { return nil } // not a nucleotide? GTHO
        return DNA(string: strand)
    }
}