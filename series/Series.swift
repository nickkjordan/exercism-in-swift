struct Series {
    var series: String
    var seriesArray: [Int] {
        var array = [Int]()
        var testSeries = series
        while !testSeries.isEmpty {
            if let value = testSeries.removeFirstAsInt() {
                array.append(value)
            }
        }
        return array
    }
    
    init(_ input: String) {
        self.series = input
    }
    
    func slices(length: Int) -> [[Int]] {
        return slice(seriesArray, withLength: length)
    }
    
    func slice(var array: [Int], withLength length: Int) -> [[Int]] {
        if array.count < length { return [] }
        else {
            let subarray = array.sliceRange(0..<length)
            return [subarray] + slice(array, withLength: length)
        }
    }
}

private extension String {
    mutating func removeFirstAsInt() -> Int? {
        return String(self.removeAtIndex(self.startIndex)).toInt()
    }
}

private extension Array {
    mutating func sliceRange(range: Range<Int>) -> [T] {
        let subarray = self[range]
        self.removeAtIndex(range.startIndex)
        return Array(subarray)
    }
}