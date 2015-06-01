extension Array {
    func keep(inOrOut: Bool = true, filter f: T -> Bool) -> [T] {
        var copy = [T]()
        for item in self {
            if inOrOut == f(item) {
                copy.append(item)
            }
        }
        return copy
    }
    
    func discard(f: T -> Bool) -> [T] {
        return keep(inOrOut: false, filter: f)
    }
}