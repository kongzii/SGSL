import CGSL


extension Double {
    public func log1p() -> Double {
        return gsl_log1p(self)
    }
}