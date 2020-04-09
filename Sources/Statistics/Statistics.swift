extension Array where Element: Numeric {
    public func sum() -> Element {
        reduce(0, +)
    }
}
