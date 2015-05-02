class SumOfMultiples {

    class func toLimit(limit: Int, inMultiples input: [Int] = [3, 5]) -> Int {
        let multiples = input.filter { $0 != 0 && $0 < limit }
            .flatMap {
                return SumOfMultiples.multiplesToLimit(limit, ofNumber: $0)
            } // flat map input -> multiples under the limit
            .sorted(<) // sort them
            .reduce([Int]()) {
                return ($0.last == $1) ? $0 : ($0 + [$1])
            } // then remove the duplicates
        
        return multiples.reduce(0, combine: +) // sum of multiples
    }
    
    private class func multiplesToLimit(limit: Int, ofNumber num: Int) -> [Int] {
        // offset to disregard the limit as a multiple
        let offset = (limit % num == 0) ? 1 : 0
        let amtOfNaturalNums = (limit / num) - offset
        
        return Array(1...amtOfNaturalNums).map {$0*num}
    }
}