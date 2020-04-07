import XCTest

@testable import Statistics

final class StatisticsTests: XCTestCase {
    func testSumDoubles() throws {
        let x = [1, 2, 3]
        XCTAssertEqual(x.sum(), 6)
    }

    func testMeanDoubles() throws {
        // The expected value of the mean was computed using the following Python code:
        // ```
        // import numpy as np
        // x = np.array([17.2, 18.1, 16.5, 18.3, 12.6])
        // print(x.mean())
        // ```
        let x = [17.2, 18.1, 16.5, 18.3, 12.6]
        XCTAssertEqual(x.mean(), 16.54)
    }

    func testMedianDoubles() throws {
        // The expected value of the median was computed using the following Python code:
        // ```
        // import numpy as np
        // x = np.array([17.2, 18.1, 16.5, 18.3, 12.6])
        // print(np.median(x))
        // ```
        let x = [17.2, 18.1, 16.5, 18.3, 12.6]
        XCTAssertEqual(x.median(), 17.2)
    }

    func testSampleVarianceDoubles() throws {
        // The expected value of the variance was computed using the following Python code:
        // ```
        // import numpy as np
        // x = np.array([17.2, 18.1, 16.5, 18.3, 12.6])
        // print(np.var(x, ddof=1))
        // ```
        let x = [17.2, 18.1, 16.9, 18.3, 12.0]
        XCTAssertEqual(x.sampleVariance(), 6.675000000000001)
    }

    func testStandardDeviationDoubles() throws {
        // The expected value of the variance was computed using the following Python code:
        // ```
        // import numpy as np
        // x = np.array([17.2, 18.1, 16.5, 18.3, 12.6])
        // print(np.std(x, ddof=1))
        // ```
        let x = [17.2, 18.1, 16.5, 18.3, 12.6]
        XCTAssertEqual(x.sampleStandardDeviation(), 2.3179732526498236)
    }
}
