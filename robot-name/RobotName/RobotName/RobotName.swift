import Foundation

class Robot {
    private(set) var name = ""
    
    init() {
        setName()
    }
    
    func resetName() {
        setName()
    }
    
    private func setName() {
        name = Robot.randomTwoLetters() + "\(Robot.randomThreeDigit())"
    }
    
    private class func randomThreeDigit() -> UInt32 {
        return arc4random_uniform(1000)
    }
    
    private class func randomTwoLetters() -> String {
        return String(format: "%c%c", uppercaseLetter(), uppercaseLetter())
    }
    
    private class func uppercaseLetter() -> CChar {
        return 65 + CChar(arc4random_uniform(26))
    }
}