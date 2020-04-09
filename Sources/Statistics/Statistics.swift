extension Array where Element: Numeric {
    /// Sumation of all elements in array
    public func sum(countFrom start: Element = 0) -> Element {
        reduce(start, +)
    }
}
