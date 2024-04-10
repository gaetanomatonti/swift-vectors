import XCTest
@testable import Vectors

final class VectorsTests: XCTestCase {
  func testSum() {
    let a = CGPoint(x: 1, y: 2)
    let b = CGPoint(x: 3, y: 4)
    XCTAssertEqual(a + b, CGPoint(x: 4, y: 6))
  }

  func testSubtraction() {
    let a = CGPoint(x: 1, y: 2)
    let b = CGPoint(x: 3, y: 4)

    XCTAssertEqual(b - a, CGPoint(x: 2, y: 2))
  }

  func testDirectionOfSubtraction() {
    let a = CGPoint(x: 1, y: 2)
    let b = CGPoint(x: 3, y: 4)

    XCTAssertEqual((b - a).heading, .degrees(45))
    XCTAssertEqual((a - b).heading, .degrees(-135))
  }

  func testScalarMultiplication() {
    let a = CGPoint(x: 1, y: 2)

    XCTAssertEqual(a * 2, CGPoint(x: 2, y: 4))
  }

  func testScalarDivision() {
    let a = CGPoint(x: 4, y: 6)

    XCTAssertEqual(a / 2, CGPoint(x: 2, y: 3))
  }

  func testMagnitude() {
    let a = CGPoint(x: 3, y: 4)
    let b = CGPoint(x: 0, y: 0)

    XCTAssertEqual(a.magnitude, 5)
    XCTAssertEqual(b.magnitude, 0)
  }

  func testHeading() {
    let a = CGPoint(x: 4, y: -4)

    XCTAssertEqual(a.heading.degrees, -45)
  }

  func testNormalization() {
    let a = CGPoint(x: 3, y: 4)
    let b = CGPoint(x: 0.5, y: 0.5)
    let c = CGPoint(x: 0, y: 0)

    XCTAssertEqual(a.normalized.magnitude, 1, accuracy: 0.001)
    XCTAssertEqual(b.normalized.magnitude, 1, accuracy: 0.001)

    XCTAssertEqual(c.normalized, CGPoint(x: 0, y: 0))
  }

  func testLimit() {
    let a = CGPoint(x: 6, y: 8)
    let b = CGPoint(x: 3, y: 4)

    XCTAssertEqual(a.limit(5), CGPoint(x: 3, y: 4))
    XCTAssertEqual(b.limit(6), CGPoint(x: 3, y: 4))
  }
}
