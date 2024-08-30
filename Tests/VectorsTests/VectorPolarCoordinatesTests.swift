import Foundation
import Numerics
import Testing
@testable import Vectors

@Suite("Vector Polar Coordinates Test") struct VectorPolarCoordinatesTests {
  @Test func testUnitVectorInPolarPlane() {
    let vector = CGPoint(angle: .degrees(90), radius: 1)

    #expect(vector.x.isApproximatelyEqual(to: 0, absoluteTolerance: 0.0001))
    #expect(vector.y.isApproximatelyEqual(to: 1, absoluteTolerance: 0.0001))
  }

  @Test func testVectorInPolarPlane() {
    let vector = CGPoint(angle: .degrees(180), radius: 20)

    #expect(vector.x.isApproximatelyEqual(to: -20, absoluteTolerance: 0.0001))
    #expect(vector.y.isApproximatelyEqual(to: 0, absoluteTolerance: 0.0001))
  }

  @Test func testVectorInRectangle() {
    let rect = CGRect(x: 0, y: 0, width: 400, height: 400)
    let vector = CGPoint(
      angle: .degrees(90),
      radius: rect.width / 2,
      center: CGPoint(x: rect.midX, y: rect.midY)
    )

    #expect(vector.x.isApproximatelyEqual(to: 200, absoluteTolerance: 0.0001))
    #expect(vector.y.isApproximatelyEqual(to: 400, absoluteTolerance: 0.0001))
  }

  @Test func testVectorInOffsetRectangle() {
    let rect = CGRect(x: 100, y: 100, width: 200, height: 200)
    let vector = CGPoint(
      angle: .degrees(90),
      radius: rect.width / 2,
      center: CGPoint(x: rect.midX, y: rect.midY)
    )

    #expect(vector.x.isApproximatelyEqual(to: 200, absoluteTolerance: 0.0001))
    #expect(vector.y.isApproximatelyEqual(to: 300, absoluteTolerance: 0.0001))
  }
}
