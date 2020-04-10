import CGSL

public extension Array where Element == Float {
    func mean(
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_float_mean(self, stride, count)
    }

    func median() -> Double {
        let sorted = self.sorted()
        return gsl_stats_float_median_from_sorted_data(sorted, 1, count)
    }

    func sampleVariance() -> Double {
        gsl_stats_float_variance(self, 1, count)
    }

    func sampleVariance(
        withMean mean: Double
    ) -> Double {
        gsl_stats_float_variance_m(self, 1, count, mean)
    }

    func sampleStandardDeviation(
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_float_sd(self, stride, count)
    }

    func sampleStandardDeviation(
        withMean mean: Double,
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_float_sd_m(self, stride, count, mean)
    }
}
