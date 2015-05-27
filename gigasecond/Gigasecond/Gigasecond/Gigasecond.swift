import Foundation

struct Gigasecond {
    
    static let gigasecond = pow(10.0, 9.0)
    
    private static func newDateWithTime(input:String) -> NSDate {
        var dateFormatter = NSDateFormatter()
        dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return dateFormatter.dateFromString(input) ?? NSDate.distantFuture() as! NSDate
    }
    
    static func from(date: String) -> NSDate {
        return newDateWithTime(date).dateByAddingTimeInterval(gigasecond)
    }
}