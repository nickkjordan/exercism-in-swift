//
//  Leap.swift
//  Leap
//
//  Created by Nick Jordan on 4/12/15.
//  Copyright (c) 2015 exercism. All rights reserved.
//

import Foundation

class Year {
    
    var year: Float
    var isLeapYear : Bool {
        if self.year % 4 == 0 &&
            (self.year % 100 != 0 || self.year % 400 == 0) {
            return true
        } else {
            return false
        }
    }
    
    init(calendarYear: Float) {
        self.year = calendarYear
    }
    
}