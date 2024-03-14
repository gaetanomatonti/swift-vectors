import XCTest
@testable import Vectors

final class swift_vectorsTests: XCTestCase {
  func testSum() {
    let a = Vector(x: 1, y: 2)
    let b = Vector(x: 3, y: 4)
    XCTAssertEqual(a + b, Vector(x: 4, y: 6))
  }

  func testSubtraction() {
    let a = Vector(x: 1, y: 2)
    let b = Vector(x: 3, y: 4)
    XCTAssertEqual(a - b, Vector(x: -2, y: -2))
  }

  func testScalarMultiplication() {
    let a = Vector(x: 1, y: 2)

    XCTAssertEqual(a * 2, Vector(x: 2, y: 4))
  }

  func testScalarDivision() {
    let a = Vector(x: 4, y: 6)

    XCTAssertEqual(a / 2, Vector(x: 2, y: 3))
  }

  func testMagnitude() {
    let a = Vector(x: 3, y: 4)
    let b = Vector(x: 0, y: 0)

    XCTAssertEqual(a.magnitude, 5)
    XCTAssertEqual(b.magnitude, 0)
  }

  func testNormalization() {
    let a = Vector(x: 3, y: 4)
    let b = Vector(x: 0.5, y: 0.5)
    let c = Vector(x: 0, y: 0)

    XCTAssertEqual(a.normalized.magnitude, 1, accuracy: 0.001)
    XCTAssertEqual(b.normalized.magnitude, 1, accuracy: 0.001)

    XCTAssertEqual(c.normalized, Vector(x: 0, y: 0))
  }

  func testLimit() {
    let a = Vector(x: 6, y: 8)
    let b = Vector(x: 3, y: 4)

    XCTAssertEqual(a.limit(5), Vector(x: 3, y: 4))
    XCTAssertEqual(b.limit(6), Vector(x: 3, y: 4))
  }
}
