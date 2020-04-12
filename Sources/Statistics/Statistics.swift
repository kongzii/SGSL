import CGSL

public extension Array where Element: Numeric {
    /// - Parameter countFrom: Will start sum from this value.
    /// - Returns: The sum of data.
    func sum(
        countFrom start: Element = 0
    ) -> Element {
        reduce(start, +)
    }
}

public extension Array where Element == Double {
    /// - Parameter withStride: Stride to apply.
    /// - Returns: The arithmetic mean of data.
    func mean(
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_mean(self, stride, count)
    }

    /// - Parameter isSorted: Whenewer data are already sorted.
    /// - Parameter withStride: Stride to apply.
    /// - Returns: The median of data.
    func median(
        isSorted: Bool = false,
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_median_from_sorted_data(isSorted ? self : sorted(), stride, count)
    }

    func variance(
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_variance_with_fixed_mean(self, stride, count, mean(withStride: stride))
    }

    func variance(
        withMean mean: Double,
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_variance_with_fixed_mean(self, stride, count, mean)
    }

    func sampleVariance(
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_variance(self, stride, count)
    }

    func sampleVariance(
        withMean mean: Double,
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_variance_m(self, stride, count, mean)
    }

    func standardDeviation(
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_sd_with_fixed_mean(self, stride, count, mean(withStride: stride))
    }

    func standardDeviation(
        withMean mean: Double,
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_sd_with_fixed_mean(self, stride, count, mean)
    }

    func sampleStandardDeviation(
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_sd(self, stride, count)
    }

    func sampleStandardDeviation(
        withMean mean: Double,
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_sd_m(self, stride, count, mean)
    }

    func totalSumOfSquares(
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_tss(self, stride, count)
    }

    func totalSumOfSquares(
        withMean mean: Double,
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_tss_m(self, stride, count, mean)
    }
}
