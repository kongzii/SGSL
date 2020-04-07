import XCTest

@testable import RandomNumberGeneration

final class RandomNumberGenerationTests: XCTestCase {
    func testRandomDoubleArray() throws {
        let x = Array.random(count: 5)
        XCTAssertEqual(x.count, 5)
    }
}
