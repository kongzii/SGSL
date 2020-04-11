import PythonKit
import XCTest

@testable import MathematicalFunctions

let NUMPY = Python.import("numpy")

final class MathematicalFunctionsTests: XCTestCase {
    func testLog1p() throws {
        let data = 5.0
        XCTAssertEqual(data.log1p(), Double(NUMPY.log1p(data)))
    }

    static var allTests = [
        ("testLog1p", testLog1p),
    ]
}
