typealias Complement = [String: String]

struct Nucleotide {
    private var nucleotide: String
    
    init(_ input: String) {
        nucleotide = input
    }
    
    var complementOfDNA: String {
        return complement(nucleotide, type: StrandType.DNA)
    }
    
    var complementOfRNA: String {
        return complement(nucleotide, type: StrandType.RNA)
    }
    
    private func complement(input: String, type: StrandType) -> String {
        return reduce(input, "") { $0 + type.complement($1) }
    }
}

private enum StrandType {
    case DNA
    case RNA
    
    func complement(input: Character) -> String {
        let str = String(input)
        let dict: Complement
        switch self {
        case .DNA:
            dict = ["C": "G", "G": "C", "T": "A", "A": "U"]
        case .RNA :
            dict = ["C": "G", "G": "C", "A": "T", "U": "A"]
        }
        if let result = dict[str] {
            return result
        } else { return "" }
    }
}