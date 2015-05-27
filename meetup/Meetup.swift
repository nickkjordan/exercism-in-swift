import Foundation

struct Meetup {
    
    let year: Int
    let month: Int
    
    private let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
    
    func day(day: Int, which: String) -> NSDate {
        
        if which == "teenth" {
            let thirteenthDayOfMonth = getDateFrom(13, month: month, year: year)
            let weekdayOfThirteenth = calendar?.components(.CalendarUnitWeekday, fromDate: thirteenthDayOfMonth).weekday
            
            let date = dateOfWeekday(day, fromWeekdayOnThirteenth: weekdayOfThirteenth!)
            return getDateFrom(date, month: month, year: year)
        } else {
            let weekdayOrdinal: Int
            let firstCharString = which.substringToIndex(which.startIndex.successor())
            weekdayOrdinal = firstCharString.toInt() ?? 5
            
            return getDateFrom(day, month: month, year: year, weekdayOrdinal: weekdayOrdinal)
        }
    }
    
    private func getDateFrom(day: Int, month: Int, year: Int, weekdayOrdinal: Int? = nil) -> NSDate {
        let dateComps = (weekdayOrdinal != nil) ?
            NSDateComponents(weekday: day, month: month, year: year, weekdayOrdinal: weekdayOrdinal!) :
            NSDateComponents(day: day, month: month, year: year)
        
        let date = calendar?.dateFromComponents(dateComps)
        return date!
    }
    
    private func dateOfWeekday(weekday: Int, fromWeekdayOnThirteenth teenth: Int) -> Int{
        let offset = teenth - weekday + ((teenth < weekday) ? 6 : 0)
        return 13 + offset
    }
}

extension NSDateComponents {
    convenience init(weekday: Int, month: Int, year: Int, weekdayOrdinal: Int) {
        self.init()
        self.weekday = weekday
        self.year = year
        self.month = month
        self.weekdayOrdinal = weekdayOrdinal
    }
    
    convenience init(day: Int, month: Int, year: Int) {
        self.init()
        self.day = day
        self.month = month
        self.year = year
    }
}