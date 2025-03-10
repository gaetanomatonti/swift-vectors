import Foundation
import SwiftUI

// A structure that contains components for a two-dimensional vector.
public protocol Vector {
  /// The x component of the vector.
  var x: CGFloat { get set }

  /// The y component of the vector.
  var y: CGFloat { get set }

  /// Creates a vector with the specified components.
  /// - Parameters:
  ///   - x: The x component of the vector.
  ///   - y: The y component of the vector.
  init(x: CGFloat, y: CGFloat)
}

// MARK: - Operators

public extension Vector {
  /// Adds a vector to this vector.
  /// - Returns: The vector resulting from the sum of the vectors.
  func adding(_ vector: some Vector) -> Self {
    var resultingVector = self
    resultingVector.x += vector.x
    resultingVector.y += vector.y
    return resultingVector
  }

  /// Subtracts a vector to this vector.
  ///
  /// Vector subtraction can be used to find the path between two points.
  /// The direction of the resulting vector depends on the order of the operands;
  /// the head of the resulting vector coincides with the head of the left-hand operator,
  /// meaning that the resulting vector heads towards the left-hand operator.
  ///
  /// ```swift
  /// /// Vector pointing from a to b
  /// let c = b - a
  ///
  /// // Vector pointing from b to a
  /// let c = a - b
  /// ```
  ///
  /// - Returns: The vector resulting from the subtraction of the vectors.
  func subtracting(_ vector: some Vector) -> Self {
    var resultingVector = self
    resultingVector.x -= vector.x
    resultingVector.y -= vector.y
    return resultingVector
  }

  /// Multiplies (or scales) the vector by a scalar.
  /// - Returns: The scaled vector.
  func multiplied(by scalar: CGFloat) -> Self {
    var resultingVector = self
    resultingVector.x *= scalar
    resultingVector.y *= scalar
    return resultingVector
  }

  /// Divides (or scales) the vector by a scalar.
  /// - Returns: The scaled vector.
  func divided(by scalar: CGFloat) -> Self {
    var resultingVector = self
    resultingVector.x /= scalar
    resultingVector.y /= scalar
    return resultingVector
  }

  /// Adds a vector to this vector.
  /// - Returns: The vector resulting from the sum of the vectors.
  static func +(lhs: Self, rhs: some Vector) -> Self {
    lhs.adding(rhs)
  }

  /// Subtracts a vector to this vector.
  /// - Returns: The vector resulting from the subtraction of the vectors.
  static func -(lhs: Self, rhs: some Vector) -> Self {
    lhs.subtracting(rhs)
  }

  /// Multiplies (or scales) the vector by a scalar.
  /// - Returns: The scaled vector.
  static func *(vector: Self, scalar: CGFloat) -> Self {
    vector.multiplied(by: scalar)
  }

  /// Divides (or scales) the vector by a scalar.
  /// - Returns: The scaled vector.
  static func /(vector: Self, scalar: CGFloat) -> Self {
    vector.divided(by: scalar)
  }
  
  static func +=(lhs: inout Self, rhs: some Vector) {
    lhs = lhs + rhs
  }
  
  static func -=(lhs: inout Self, rhs: some Vector) {
    lhs = lhs - rhs
  }
  
  static func *=(lhs: inout Self, rhs: CGFloat) {
    lhs = lhs * rhs
  }
  
  static func /=(lhs: inout Self, rhs: CGFloat) {
    lhs = lhs / rhs
  }
}

// MARK: - Helpers

public extension Vector {
  /// Returns a vector normalized to a unit length of `1`.
  var normalized: Self {
    var vector = self
    vector.normalize()
    return vector
  }

  /// Returns the magnitude (or length) of the vector.
  var magnitude: CGFloat {
    sqrt(x * x + y * y)
  }
  
  /// Returns the length (or magnitude) of the vector.
  var length: CGFloat {
    magnitude
  }

  /// The heading (i.e.: direction) of the vector expressed as an angle.
  /// - Returns: An `Angle` in the range `[-π, π]`.
  var heading: Angle {
    let angle = atan2(y, x)
    return Angle(radians: angle)
  }

  /// Returns the vector scaled to avoid exceeding the specified length.
  /// - Parameter length: The maximum length of the vector.
  /// - Returns: The scaled vector, if it exceeds the specified length.
  func limited(to length: CGFloat) -> Self {
    var vector = self
    vector.limit(to: length)
    return vector
  }

  /// Scales the vector to avoid exceeding the specified length.
  /// - Parameter length: The maximum length of the vector.
  /// - Returns: The scaled vector, if it exceeds the specified length.
  mutating func limit(to length: CGFloat) {
    guard magnitude > length else {
      return
    }

    normalize()
    self *= length
  }

  /// Normalizes the vector to a length of `1`.
  mutating func normalize() {
    let magnitude = self.magnitude

    guard magnitude > .zero else {
      return
    }

    self /= magnitude
  }
}
