import CGSL

extension Array where Element == Double {
    public func mean(
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_mean(self, stride, count)
    }

    public func median() -> Double {
        let sorted = self.sorted()
        return gsl_stats_median_from_sorted_data(sorted, 1, count)
    }

    public func sampleVariance() -> Double {
        gsl_stats_variance(self, 1, count)
    }

    public func sampleVariance(
        withMean mean: Double
    ) -> Double {
        gsl_stats_variance_m(self, 1, count, mean)
    }

    public func sampleStandardDeviation(
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_sd(self, stride, count)
    }

    public func sampleStandardDeviation(
        withMean mean: Double,
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_sd_m(self, stride, count, mean)
    }
}
