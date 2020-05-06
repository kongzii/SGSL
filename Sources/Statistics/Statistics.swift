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

    /// This is equivalent to `numpy.divide(numpy.sum(numpy.abs(numpy.subtract(data, numpy.mean(data))))), len(data))`.
    /// Module `Statistics`.
    ///
    /// `$$ad  = {1 \over N} \sum |x_i - {\hat\mu}|$$`
    ///
    /// - Parameter withStride: Stride to apply.
    /// - Returns: The absolute deviation from the mean of data.
    func absoluteDeviation(
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_absdev(self, stride, count)
    }

    /// This is equivalent to `numpy.divide(numpy.sum(numpy.abs(numpy.subtract(data, withMean))), len(data))`.
    /// Module `Statistics`.
    ///
    /// `$$ad  = {1 \over N} \sum |x_i - withMean|$$`
    ///
    /// - Parameter withMean: The mean value to compute with.
    /// - Parameter withStride: Stride to apply.
    /// - Returns: The absolute deviation from the mean of data.
    func absoluteDeviation(
        withMean mean: Double,
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_absdev_m(self, stride, count, mean)
    }

    /// `$$skew = {1 \over N} \sum {\left( x_i - {\hat\mu} \over {\hat\sigma} \right)}^3$$`
    ///
    /// - Parameter withStride: Stride to apply.
    /// - Returns: The skewness of data.
    func skew(
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_skew(self, stride, count)
    }

    /// `$$skew = {1 \over N} \sum {\left( x_i - withMean \over withSampleStandardDeviation \right)}^3$$`
    ///
    /// - Parameter withMean: The mean value to compute with.
    /// - Parameter withSampleStandardDeviation: The std value to compute with.
    /// - Parameter withStride: Stride to apply.
    /// - Returns: The skewness of data.
    func skew(
        withMean mean: Double,
        withSampleStandardDeviation sstd: Double,
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_skew_m_sd(self, stride, count, mean, sstd)
    }

    /// `$$kurtosis = \left( {1 \over N} \sum {\left(x_i - {\hat\mu} \over {\hat\sigma} \right)}^4 \right) - 3$$`
    ///
    /// - Parameter withStride: Stride to apply.
    /// - Returns: The kurtosis of data
    func kurtosis(
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_kurtosis(self, stride, count)
    }

    /// `$$kurtosis = {1 \over N}
    ///    \left( \sum {\left(x_i - withMean \over withSampleStandardDeviation \right)}^4 \right) - 3$$`
    ///
    /// - Parameter withMean: The mean value to compute with.
    /// - Parameter withSampleStandardDeviation: The std value to compute with.
    /// - Parameter withStride: Stride to apply.
    /// - Returns: The kurtosis of data
    func kurtosis(
        withMean mean: Double,
        withSampleStandardDeviation sstd: Double,
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_kurtosis_m_sd(self, stride, count, mean, sstd)
    }

    /// `$$ a_1 = {\sum_{i = 2}^{n} (x_{i} - \hat\mu) (x_{i-1} - \hat\mu)
    ///     \over
    ///     \sum_{i = 1}^{n} (x_{i} - \hat\mu) (x_{i} - \hat\mu)} $$`
    ///
    /// - Parameter withStride: Stride to apply.
    /// - Returns: The lag-1 autocorrelation of the dataset.
    func lag1AutoCorrelation(
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_lag1_autocorrelation(self, stride, count)
    }

    /// `$$ a_1 = {\sum_{i = 2}^{n} (x_{i} - withMean) (x_{i-1} - withMean)
    ///     \over
    ///     \sum_{i = 1}^{n} (x_{i} - withMean) (x_{i} - withMean)} $$`
    ///
    /// - Parameter withStride: Stride to apply.
    /// - Returns: The lag-1 autocorrelation of the dataset.
    func lag1AutoCorrelation(
        withMean mean: Double,
        withStride stride: Int = 1
    ) -> Double {
        gsl_stats_lag1_autocorrelation_m(self, stride, count, mean)
    }

    /// `$$ covar = {1 \over (n - 1)} \sum_{i = 1}^{n} (x_{i} - \hat x) (y_{i} - \hat y) $$`
    ///
    /// - Parameter with: Second dataset to compute covariance against.
    /// - Parameter withStride: Stride to apply to self.
    /// - Parameter withStride2: Stride to apply to with.
    /// - Returns: The covariance of the datasets self and with.
    func covariance(
        with data: [Double],
        withStride stride: Int = 1,
        withStride2 stride2: Int = 1
    ) -> Double {
        precondition(count == data.count, "Dataset 1 and 2 needs to be of the same size.")
        return gsl_stats_covariance(self, stride, data, stride2, count)
    }

    /// This is equivalent to `numpy.cov(self, with)[0][1]`.
    /// `$$ covar = {1 \over (n - 1)} \sum_{i = 1}^{n} (x_{i} - \hat x) (y_{i} - \hat y) $$`
    ///
    /// - Parameter with: Second dataset to compute covariance against.
    /// - Parameter withMean: The mean value of self to compute with.
    /// - Parameter withMean: The mean value of with to compute with.
    /// - Parameter withStride: Stride to apply to self.
    /// - Parameter withStride2: Stride to apply to with.
    /// - Returns: The covariance of the datasets self and with.
    func covariance(
        with data: [Double],
        withMean mean: Double,
        withMean2 mean2: Double,
        withStride stride: Int = 1,
        withStride2 stride2: Int = 1
    ) -> Double {
        precondition(count == data.count, "Dataset 1 and 2 needs to be of the same size.")
        return gsl_stats_covariance_m(self, stride, data, stride2, count, mean, mean2)
    }

    /// This is equivalent to `numpy.corrcoef(self, with)[0][1]`.
    /// `$$ r = {cov(x, y) \over \hat\sigma_x \hat\sigma_y} =
    ///     {{1 \over n-1} \sum (x_i - \hat x) (y_i - \hat y)
    ///     \over
    ///     \sqrt{{1 \over n-1} \sum (x_i - {\hat x})^2}
    ///     \sqrt{{1 \over n-1} \sum (y_i - {\hat y})^2}
    ///     } $$`
    ///
    /// - Parameter with: Second dataset to compute correlation against.
    /// - Parameter withStride: Stride to apply to self.
    /// - Parameter withStride2: Stride to apply to with.
    /// - Returns: The correlation of the datasets self and with.
    func correlation(
        with data: [Double],
        withStride stride: Int = 1,
        withStride2 stride2: Int = 1
    ) -> Double {
        precondition(count == data.count, "Dataset 1 and 2 needs to be of the same size.")
        return gsl_stats_correlation(self, stride, data, stride2, count)
    }

    /// This is equivalent to `scipy.stats.spearmanr(self, with).correlation`.
    ///
    /// - Parameter with: Second dataset to compute correlation agaisnst.
    /// - Parameter withStride: Stride to apply to self.
    /// - Parameter withStride2: Stride to apply to with.
    /// - Returns: The Spearman rank correlation coefficient between the datasets self and with.
    func spearman(
        with data: [Double],
        withStride stride: Int = 1,
        withStride2 stride2: Int = 1
    ) -> Double {
        precondition(count == data.count, "Dataset 1 and 2 needs to be of the same size.")
        var workspace = [Double](repeating: 0, count: 2 * count)
        return gsl_stats_spearman(self, stride, data, stride2, count, &workspace)
    }

    /// `$$ {\hat\mu} = {{\sum w_i x_i} \over {\sum w_i}} $$`
    ///
    /// - Parameter weights: Weighted mean of the dataset.
    /// - Parameter withWeightsStride: Stride to apply to weights.
    /// - Parameter withDataStride: Stride to apply to data.
    func weightedMean(
        weights: [Double],
        withWeightsStride wStride: Int = 1,
        withDataStride dataStride: Int = 1
    ) -> Double {
        gsl_stats_wmean(weights, wStride, self, dataStride, count)
    }
}
