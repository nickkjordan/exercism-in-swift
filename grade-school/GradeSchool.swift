class GradeSchool {
    private(set) var db = [Int: [String]]()
    
    func addStudent(name: String, grade: Int) {
        let updatedGrade = studentsInGrade(grade) + [name]
        db.updateValue(updatedGrade, forKey: grade)
    }
    
    func studentsInGrade(grade: Int) -> [String] {
        return db[grade] ?? []
    }
    
    func sortedRoster() -> [Int: [String]] {
        return db.map { $0.sorted(<) }
    }
}

extension Dictionary {
    func map(f: Value -> Value) -> [Key: Value] {
        var result = [Key: Value]()
        for (key, arr) in self {
            result.updateValue(f(arr), forKey: key)
        }
        return result
    }
}