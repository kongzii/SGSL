import PythonKit
import XCTest

@testable import Statistics

let NUMPY = Python.import("numpy")

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

    static var allTests = [
        ("testSum", testSum),
        ("testMean", testMean),
        ("testMedian", testMedian),
        ("testVariance", testVariance),
        ("testSampleVariance", testSampleVariance),
        ("testStandardDeviation", testStandardDeviation),
        ("testSampleStandardDeviation", testSampleStandardDeviation),
        ("testTotalSumOfSquares", testTotalSumOfSquares),
    ]
}
