import XCTest

// Implement here your tests.

public class Tests: XCTestCase {
    func test() {
        XCTAssertEqual("This test", "will fail.")
    }
}

// Workaround to run unit tests in a playground :-)

class TestObserver: NSObject, XCTestObservation {
  func testCase(
    _ testCase: XCTestCase,
    inFile filePath: String?,
    atLine lineNumber: Int
  ) {
    assertionFailure(description, line: UInt(lineNumber))
  }
}

// Test!!!

XCTestObservationCenter.shared.addTestObserver(TestObserver())
Tests.defaultTestSuite.run()
