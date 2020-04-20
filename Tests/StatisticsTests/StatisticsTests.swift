import PythonKit
import XCTest

@testable import Statistics

let NUMPY = Python.import("numpy")
let SCIPYSTATS = Python.import("scipy.stats")
let PANDAS = Python.import("pandas")

final class StatisticsTests: XCTestCase {
    func testSum() throws {
        let data = [1, 2, 3]
        XCTAssertEqual(data.sum(), Int(NUMPY.sum(data)))
    }

    func testMean() throws {
        let data = [17.2, 18.1, 16.5, 18.3, 12.6]
        XCTAssertEqual(data.mean(), Double(NUMPY.mean(data)))
    }

    func testMedian() throws {
        let data = [17.2, 18.1, 16.5, 18.3, 12.6]
        XCTAssertEqual(data.median(), Double(NUMPY.median(data)))
    }

    func testVariance() throws {
        let data = [17.2, 18.1, 16.9, 18.3, 12.0]
        XCTAssertEqual(data.variance(), Double(NUMPY.var(data)))
    }

    func testSampleVariance() throws {
        let data = [17.2, 18.1, 16.9, 18.3, 12.0]
        XCTAssertEqual(data.sampleVariance(), Double(NUMPY.var(data, ddof: 1)))
    }

    func testStandardDeviation() throws {
        let data = [17.2, 18.1, 16.5, 18.3, 12.6]
        XCTAssertEqual(data.standardDeviation(), Double(NUMPY.std(data)))
    }

    func testSampleStandardDeviation() throws {
        let data = [17.2, 18.1, 16.5, 18.3, 12.6]
        XCTAssertEqual(data.sampleStandardDeviation(), Double(NUMPY.std(data, ddof: 1)))
    }

    func testTotalSumOfSquares() throws {
        let data = [17.2, 18.0, 16.5, 18.3, 12.5]
        XCTAssertEqual(
            data.totalSumOfSquares(),
            Double(NUMPY.sum(NUMPY.square(NUMPY.subtract(data, NUMPY.mean(data)))))
        )
    }

    func testAbsoluteDeviation() throws {
        let data = [17.2, 18.0, 16.5, 18.3, 12.5]
        XCTAssertEqual(
            data.absoluteDeviation(),
            Double(NUMPY.divide(NUMPY.sum(NUMPY.abs(NUMPY.subtract(data, NUMPY.mean(data)))), data.count))
        )
    }

    func testCovariance() throws {
        let data = [-2.1, -1, 4.3]
        let data2 = [3, 1.1, 0.12]
        // Round because of small difference in last digit
        XCTAssertEqual(
            data.covariance(with: data2),
            Double(NUMPY.around(NUMPY.cov(data, data2)[0][1], 5))
        )
    }

    func testCorrelation() throws {
        let data = [-2.1, -1, 4.3]
        let data2 = [3, 1.1, 0.12]
        XCTAssertEqual(
            data.correlation(with: data2),
            Double(NUMPY.corrcoef(data, data2)[0][1])
        )
    }

    func testSpearman() throws {
        let data = [1.0, 2.0, 3.0, 4.0, 8.0]
        let data2 = [1.0, 5.0, 9.0, 4.0, 6.0]
        // Round because there was always small difference in 17th digit
        XCTAssertEqual(
            Double(NUMPY.around(data.spearman(with: data2), 10)),
            Double(NUMPY.around(SCIPYSTATS.spearmanr(data, data2).correlation, 10))
        )
    }

    static var allTests = [
        ("testSum", testSum),
        ("testMean", testMean),
        ("testMedian", testMedian),
        ("testVariance", testVariance),
        ("testSampleVariance", testSampleVariance),
        ("testStandardDeviation", testStandardDeviation),
        ("testSampleStandardDeviation", testSampleStandardDeviation),
        ("testTotalSumOfSquares", testTotalSumOfSquares),
        ("testAbsoluteDeviation", testAbsoluteDeviation),
        ("testCovariance", testCovariance),
        ("testCorrelation", testCorrelation),
        ("testSpearman", testSpearman),
    ]
}
