import XCTest

#if !os(macOS)
    public func statisticsAllTests() -> [XCTestCaseEntry] {
        [
            testCase(StatisticsTests.allTests),
        ]
    }
#endif
