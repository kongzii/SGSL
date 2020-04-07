import XCTest

@testable import MathematicalFunctions

final class MathematicalFunctionsTests: XCTestCase {
    func testLog1p() throws {
        // The expected value was computed using the following Python code:
        // ```
        // import numpy as np
        // print(np.log1p(5.0))
        // ```
        let x = 5.0
        XCTAssertEqual(x.log1p(), 1.791759469228055)
    }
}
