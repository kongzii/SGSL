import XCTest

@testable import RandomNumberGeneration

final class RandomNumberGenerationTests: XCTestCase {
    func testRandomDoubleArray() throws {
        let data = Array.random(count: 5)
        XCTAssertEqual(data.count, 5)
    }

    static var allTests = [
        ("testRandomDoubleArray", testRandomDoubleArray),
    ]
}
