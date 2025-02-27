import Foundation
import Testing
@testable import Vectors

@Suite("Vector Operations Tests") struct VectorOperationsTests {
  @Test func sum() {
    let a = CGPoint(x: 1, y: 2)
    let b = CGPoint(x: 3, y: 4)
    #expect(a + b == CGPoint(x: 4, y: 6))
  }
  
  @Test func mutableSum() {
    var a = CGPoint(x: 1, y: 2)
    let b = CGPoint(x: 3, y: 4)
    
    a += b
    
    #expect(a == CGPoint(x: 4, y: 6))
  }

  @Test func subtraction() {
    let a = CGPoint(x: 1, y: 2)
    let b = CGPoint(x: 3, y: 4)

    #expect(b - a == CGPoint(x: 2, y: 2))
  }

  @Test func mutableSubtraction() {
    let a = CGPoint(x: 1, y: 2)
    var b = CGPoint(x: 3, y: 4)

    b -= a
    
    #expect(b == CGPoint(x: 2, y: 2))
  }
  
  @Test func subtractionHeading() {
    let a = CGPoint(x: 1, y: 2)
    let b = CGPoint(x: 3, y: 4)

    #expect((b - a).heading == .degrees(45))
    #expect((a - b).heading == .degrees(-135))
  }

  @Test func scalarMultiplication() {
    let a = CGPoint(x: 1, y: 2)

    #expect(a * 2 == CGPoint(x: 2, y: 4))
  }
  
  @Test func mutableScalarMultiplication() {
    var a = CGPoint(x: 1, y: 2)
    
    a *= 2

    #expect(a == CGPoint(x: 2, y: 4))
  }

  @Test func scalarDivision() {
    let a = CGPoint(x: 4, y: 6)

    #expect(a / 2 == CGPoint(x: 2, y: 3))
  }

  @Test func mutableScalarDivision() {
    var a = CGPoint(x: 4, y: 6)

    a /= 2
    
    #expect(a == CGPoint(x: 2, y: 3))
  }

  @Test func magnitude() {
    let a = CGPoint(x: 3, y: 4)
    let b = CGPoint(x: 0, y: 0)

    #expect(a.magnitude == 5)
    #expect(b.magnitude == 0)
  }

  @Test func heading() {
    let a = CGPoint(x: 4, y: -4)

    #expect(a.heading.degrees == -45)
  }

  @Test(
    arguments: [
      CGPoint(x: 3, y: 4),
      CGPoint(x: 0.5, y: 0.5)
    ]
  )
  func normalization(vector: Vector) {
    let a = CGPoint(x: 3, y: 4)
    let b = CGPoint(x: 0.5, y: 0.5)

    #expect(a.normalized.length.isApproximatelyEqual(to: 1, relativeTolerance: 0.001))
    #expect(b.normalized.length.isApproximatelyEqual(to: 1, relativeTolerance: 0.001))
  }
  
  @Test func zeroVectorNormalization() {
    let zero = CGPoint.zero
    #expect(zero.normalized.length == .zero, "The length of a zero vector should always be zero.")
  }
  
  @Test(
    arguments: [
      CGPoint(x: 3, y: 4),
      CGPoint(x: 0.5, y: 0.5)
    ]
  )
  func mutableNormalization(vector: Vector) {
    var vector = vector
    vector.normalize()

    #expect(vector.length.isApproximatelyEqual(to: 1, relativeTolerance: 0.001))
  }

  @Test func limit() {
    let a = CGPoint(x: 6, y: 8)
    let b = CGPoint(x: 3, y: 4)
    let c = CGPoint(x: 2, y: 1)

    #expect(a.limited(to: 5) == CGPoint(x: 3, y: 4), "The components of the vector should change if its length exceeds the specified limit.")
    #expect(b.limited(to: 6) == CGPoint(x: 3, y: 4), "The components of the vector should change only if its length exceeds the specified limit.")
    #expect(c.limited(to: 6) == CGPoint(x: 2, y: 1), "The components of the vector should change only if its length exceeds the specified limit.")
  }
  
  @Test func mutableLimit() {
    var a = CGPoint(x: 6, y: 8)
    a.limit(to: 5)
    
    var b = CGPoint(x: 3, y: 4)
    b.limit(to: 6)
    
    var c = CGPoint(x: 2, y: 1)
    c.limit(to: 6)

    #expect(a == CGPoint(x: 3, y: 4), "The components of the vector should change if its length exceeds the specified limit.")
    #expect(b == CGPoint(x: 3, y: 4), "The components of the vector should change only if its length exceeds the specified limit.")
    #expect(c == CGPoint(x: 2, y: 1), "The components of the vector should change only if its length exceeds the specified limit.")
  }
}
