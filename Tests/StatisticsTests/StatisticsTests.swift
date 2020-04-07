import XCTest

@testable import Statistics

final class StatisticsTests: XCTestCase {
    func testSum() throws {
        let x = [1, 2, 3]
        XCTAssertEqual(x.sum(), 6)
    }

    func testMean() throws {
        // The expected value of the mean was computed using the following Python code:
        // ```
        // import numpy as np
        // x = np.array([17.2, 18.1, 16.5, 18.3, 12.6])
        // print(x.mean())
        // ```
        let doubles = [17.2, 18.1, 16.5, 18.3, 12.6]
        let floats: [Float] = [17.2, 18.1, 16.5, 18.3, 12.6]
        XCTAssertEqual(doubles.mean(), 16.54)
        XCTAssertEqual(floats.mean(), 16.54000015258789)
    }

    func testMedian() throws {
        // The expected value of the median was computed using the following Python code:
        // ```
        // import numpy as np
        // x = np.array([17.2, 18.1, 16.5, 18.3, 12.6])
        // print(np.median(x))
        // ```
        let doubles = [17.2, 18.1, 16.5, 18.3, 12.6]
        let floats: [Float] = [17.2, 18.1, 16.5, 18.3, 12.6]
        XCTAssertEqual(doubles.median(), 17.2)
        XCTAssertEqual(floats.median(), 17.200000762939453)
    }

    func testSampleVariance() throws {
        // The expected value of the variance was computed using the following Python code:
        // ```
        // import numpy as np
        // x = np.array([17.2, 18.1, 16.5, 18.3, 12.6])
        // print(np.var(x, ddof=1))
        // ```
        let doubles = [17.2, 18.1, 16.9, 18.3, 12.0]
        let floats: [Float] = [17.2, 18.1, 16.9, 18.3, 12.0]
        XCTAssertEqual(doubles.sampleVariance(), 6.675000000000001)
        XCTAssertEqual(floats.sampleVariance(), 6.6749998092655005)
    }

    func testStandardDeviation() throws {
        // The expected value of the variance was computed using the following Python code:
        // ```
        // import numpy as np
        // x = np.array([17.2, 18.1, 16.5, 18.3, 12.6])
        // print(np.std(x, ddof=1))
        // ```
        let doubles = [17.2, 18.1, 16.5, 18.3, 12.6]
        let floats: [Float] = [17.2, 18.1, 16.5, 18.3, 12.6]
        XCTAssertEqual(doubles.sampleStandardDeviation(), 2.3179732526498236)
        XCTAssertEqual(floats.sampleStandardDeviation(), 2.3179730642168086)
    }
}
