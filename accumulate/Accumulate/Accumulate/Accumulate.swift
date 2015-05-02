extension Array {
    
    func accumulate<U>(operation: (T) -> U) -> [U] {
        var outputArray = [U]()
        for value in self {
            outputArray.append(operation(value))
        }
        return outputArray
    }
    
}