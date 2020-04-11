import XCTest

#if !os(macOS)
    public func randomNumberGenerationTestsAllTests() -> [XCTestCaseEntry] {
        [
            testCase(RandomNumberGenerationTests.allTests),
        ]
    }
#endif
