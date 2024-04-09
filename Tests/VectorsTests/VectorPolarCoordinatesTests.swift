import XCTest
@testable import Vectors

final class VectorPolarCoordinatesTests: XCTestCase {
  func testUnitVectorInPolarPlane() {
    let vector = Vector(angle: .degrees(90), radius: 1)

    XCTAssertEqual(vector.x, 0, accuracy: 0.0001)
    XCTAssertEqual(vector.y, 1, accuracy: 0.0001)
  }

  func testVectorInPolarPlane() {
    let vector = Vector(angle: .degrees(180), radius: 20)

    XCTAssertEqual(vector.x, -20, accuracy: 0.0001)
    XCTAssertEqual(vector.y, 0, accuracy: 0.0001)
  }

  func testVectorInRectangle() {
    let rect = CGRect(x: 0, y: 0, width: 400, height: 400)
    let vector = Vector(angle: .degrees(90), in: rect)

    XCTAssertEqual(vector.x, 200, accuracy: 0.0001)
    XCTAssertEqual(vector.y, 400, accuracy: 0.0001)
  }

  func testVectorInOffsetRectangle() {
    let rect = CGRect(x: 100, y: 100, width: 200, height: 200)
    let vector = Vector(angle: .degrees(90), in: rect)

    XCTAssertEqual(vector.x, 200, accuracy: 0.0001)
    XCTAssertEqual(vector.y, 300, accuracy: 0.0001)
  }
}
