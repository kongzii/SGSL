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

    func testSampleVariance() throws {
        let data = [17.2, 18.1, 16.9, 18.3, 12.0]
        XCTAssertEqual(data.sampleVariance(), Double(NUMPY.var(data, ddof: 1)))
    }

    func testStandardDeviation() throws {
        let data = [17.2, 18.1, 16.5, 18.3, 12.6]
        XCTAssertEqual(data.sampleStandardDeviation(), Double(NUMPY.std(data, ddof: 1)))
    }

    static var allTests = [
        ("testSum", testSum),
        ("testMean", testMean),
        ("testMedian", testMedian),
        ("testSampleVariance", testSampleVariance),
        ("testStandardDeviation", testStandardDeviation),
    ]
}
