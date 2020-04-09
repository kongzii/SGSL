import CGSL

extension Double {
    public func log1p() -> Double {
        gsl_log1p(self)
    }
}
