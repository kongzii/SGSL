extension Array where Element: Numeric {
    public func sum() -> Element {
        return reduce(0, +)
    }
}
