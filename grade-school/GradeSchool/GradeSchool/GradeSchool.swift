import Foundation

class GradeSchool {
    private(set) var db = [Int: Array<String>]()
    
    func addStudent(name: String, grade: Int) {
        let updatedGrade = studentsInGrade(grade) + [name]
        db.updateValue(updatedGrade, forKey: grade)
    }
    
    func studentsInGrade(grade: Int) -> Array<String> {
        return db[grade] ?? []
    }
    
    func sortedRoster() -> Dictionary<Int, Array<String>> {
        var sortedRoster = db
        for key in db.keys.array {
            sortedRoster.updateValue(sortedRoster[key]!.sorted(<), forKey: key)
        }
        return sortedRoster
    }
}