import CGSL


extension Array where Element == Double {
    public func standardDeviation(stride: Int = 1) -> Double {
        return gsl_stats_sd(self, stride, self.count)
    }
}
