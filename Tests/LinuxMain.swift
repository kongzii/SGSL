import XCTest

@testable import MathematicalFunctionsTests
@testable import RandomNumberGenerationTests
@testable import StatisticsTests

var tests = [XCTestCaseEntry]()

tests += statisticsAllTests()
tests += randomNumberGenerationTestsAllTests()
tests += mathematicalFunctionsAlltests()

XCTMain(tests)
