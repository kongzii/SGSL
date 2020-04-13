import CGSL

public extension Double {
    /// This is equivalent to `numpy.log1p(x)`.
    /// Module `MathematicalFunctions`.
    ///
    /// - Returns: The value of `log(1 + x)`.
    func log1p() -> Double {
        gsl_log1p(self)
    }
}
