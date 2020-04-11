import XCTest

#if !os(macOS)
    public func mathematicalFunctionsAlltests() -> [XCTestCaseEntry] {
        [
            testCase(MathematicalFunctionsTests.allTests),
        ]
    }
#endif
