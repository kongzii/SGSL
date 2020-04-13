import CGSL

public extension Array where Element: Numeric {
    /// This is equivalent to `numpy.sum(x)`.
    /// Module `Statistics`.
    ///
    /// - Parameter countFrom: Starting value for the sum.
    /// - Returns: The sum of data.
    func sum(
        countFrom start: Element = 0
    ) -> Element {
        reduce(start, +)
    }
}

public extension Array where Element == Double {
    /// This is equivalent to `numpy.mean(x)`.
    /// Module `Statistics`.
    ///
    /// `$$\hat\mu = {1 \over N} \sum x_i$$`
    ///
    /// - Parameter withStride: Stride to apply.
    /// - Returns: The arithmetic mean of data.
    func mean(
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_mean(self, stride, count)
    }

    /// This is equivalent to `numpy.median(x)`.
    /// Module `Statistics`.
    ///
    /// - Parameter isSorted: Whenewer data are already sorted.
    /// - Parameter withStride: Stride to apply.
    /// - Returns: The median of data.
    func median(
        isSorted: Bool = false,
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_median_from_sorted_data(isSorted ? self : sorted(), stride, count)
    }

    /// This is equivalent to `numpy.var(x)` if `withMean = nil`.
    /// Module `Statistics`.
    ///
    /// `$${\hat\sigma}^2 = {1 \over N} \sum (x_i - {\hat\mu})^2$$`
    ///
    /// - Parameter withMean: The mean value to compute with.
    /// - Parameter withStride: Stride to apply.
    /// - Returns: The variance of data.
    func variance(
        withMean customMean: Double? = nil,
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_variance_with_fixed_mean(self, stride, count, customMean ?? mean(withStride: stride))
    }

    /// This is equivalent to `numpy.var(x, ddof=1)`.
    /// Module `Statistics`.
    ///
    /// `$${\hat\sigma}^2 = {1 \over (N-1)} \sum (x_i - {\hat\mu})^2$$`
    ///
    /// - Parameter withStride: Stride to apply.
    /// - Returns: The sample variance of data.
    func sampleVariance(
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_variance(self, stride, count)
    }

    /// Module `Statistics`.
    ///
    /// `$${\hat\sigma}^2 = {1 \over (N-1)} \sum (x_i - withMean)^2$$`
    ///
    /// - Parameter withMean: The mean value to compute with.
    /// - Parameter withStride: Stride to apply.
    /// - Returns: The sample variance of data.
    func sampleVariance(
        withMean mean: Double,
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_variance_m(self, stride, count, mean)
    }

    /// This is equivalent to `numpy.std(x)` if `withMean = nil`.
    /// Module `Statistics`.
    ///
    /// - Parameter withMean: The mean value to compute with.
    /// - Parameter withStride: Stride to apply.
    /// - Returns: The standard deviation of data.
    func standardDeviation(
        withMean customMean: Double? = nil,
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_sd_with_fixed_mean(self, stride, count, customMean ?? mean(withStride: stride))
    }

    /// This is equivalent to `numpy.std(x, ddof=1)`.
    /// Module `Statistics`.
    ///
    /// - Parameter withStride: Stride to apply.
    /// - Returns: The sample standard deviation of data.
    func sampleStandardDeviation(
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_sd(self, stride, count)
    }

    /// Module `Statistics`.
    ///
    /// - Parameter withMean: The mean value to compute with.
    /// - Parameter withStride: Stride to apply.
    /// - Returns: The sample standard deviation of data.
    func sampleStandardDeviation(
        withMean mean: Double,
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_sd_m(self, stride, count, mean)
    }

    /// This is equivalent to `numpy.sum(numpy.square(numpy.subtract(data, numpy.mean(data))))`.
    /// Module `Statistics`.
    ///
    /// `$${\rm TSS} = \sum (x_i - {\hat\mu})^2$$`
    ///
    /// - Parameter withStride: Stride to apply.
    /// - Returns: The total sum of squares of data.
    func totalSumOfSquares(
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_tss(self, stride, count)
    }

    /// This is equivalent to `numpy.sum(numpy.square(numpy.subtract(data, withMean)))`.
    /// Module `Statistics`.
    ///
    /// `$${\rm TSS} = \sum (x_i - withMean)^2$$`
    ///
    /// - Parameter withMean: The mean value to compute with.
    /// - Parameter withStride: Stride to apply.
    /// - Returns: The total sum of squares of data.
    func totalSumOfSquares(
        withMean mean: Double,
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_tss_m(self, stride, count, mean)
    }
}
