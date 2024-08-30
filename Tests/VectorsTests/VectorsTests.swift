import Foundation
import Testing
@testable import Vectors

@Suite("Vector Operations Tests") struct VectorOperationsTests {
  @Test func testSum() {
    let a = CGPoint(x: 1, y: 2)
    let b = CGPoint(x: 3, y: 4)
    #expect(a + b == CGPoint(x: 4, y: 6))
  }

  @Test func testSubtraction() {
    let a = CGPoint(x: 1, y: 2)
    let b = CGPoint(x: 3, y: 4)

    #expect(b - a == CGPoint(x: 2, y: 2))
  }

  @Test func testDirectionOfSubtraction() {
    let a = CGPoint(x: 1, y: 2)
    let b = CGPoint(x: 3, y: 4)

    #expect((b - a).heading == .degrees(45))
    #expect((a - b).heading == .degrees(-135))
  }

  @Test func testScalarMultiplication() {
    let a = CGPoint(x: 1, y: 2)

    #expect(a * 2 == CGPoint(x: 2, y: 4))
  }

  @Test func testScalarDivision() {
    let a = CGPoint(x: 4, y: 6)

    #expect(a / 2 == CGPoint(x: 2, y: 3))
  }

  @Test func testMagnitude() {
    let a = CGPoint(x: 3, y: 4)
    let b = CGPoint(x: 0, y: 0)

    #expect(a.magnitude == 5)
    #expect(b.magnitude == 0)
  }

  @Test func testHeading() {
    let a = CGPoint(x: 4, y: -4)

    #expect(a.heading.degrees == -45)
  }

  @Test func testNormalization() {
    let a = CGPoint(x: 3, y: 4)
    let b = CGPoint(x: 0.5, y: 0.5)
    let c = CGPoint(x: 0, y: 0)

    #expect(a.normalized.magnitude.isApproximatelyEqual(to: 1, relativeTolerance: 0.001))
    #expect(b.normalized.magnitude.isApproximatelyEqual(to: 1, relativeTolerance: 0.001))

    #expect(c.normalized == CGPoint(x: 0, y: 0))
  }

  @Test func testLimit() {
    let a = CGPoint(x: 6, y: 8)
    let b = CGPoint(x: 3, y: 4)

    #expect(a.limit(5) == CGPoint(x: 3, y: 4))
    #expect(b.limit(6) == CGPoint(x: 3, y: 4))
  }
}
