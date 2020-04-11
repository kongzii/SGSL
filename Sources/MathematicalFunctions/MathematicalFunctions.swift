import CGSL

public extension Double {
    func log1p() -> Double {
        gsl_log1p(self)
    }
}
