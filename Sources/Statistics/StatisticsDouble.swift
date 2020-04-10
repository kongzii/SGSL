import CGSL

extension Array where Element == Double {
    public func mean(
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_mean(self, stride, count)
    }

    public func median(
        isSorted: Bool = false,
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_median_from_sorted_data(isSorted ? self : sorted(), stride, count)
    }

    public func sampleVariance(
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_variance(self, stride, count)
    }

    public func sampleVariance(
        withMean mean: Double,
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_variance_m(self, stride, count, mean)
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
