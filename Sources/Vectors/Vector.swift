import Foundation
import SwiftUI

// A structure that contains coordinates for a Cartesian two-dimensional coordinate system.
public typealias Vector = CGPoint

// MARK: - Operators

public extension Vector {
  /// Adds a vector to this vector.
  /// - Returns: The vector resulting from the sum of the vectors.
  static func +(lhs: Vector, rhs: Vector) -> Vector {
    lhs.adding(rhs)
  }

  /// Subtracts a vector to this vector.
  /// - Returns: The vector resulting from the subtraction of the vectors.
  static func -(lhs: Vector, rhs: Vector) -> Vector {
    lhs.subtracting(rhs)
  }

  /// Multiplies (or scales) the vector by a scalar.
  /// - Returns: The scaled vector.
  static func *(vector: Vector, scalar: CGFloat) -> Vector {
    vector.multiplied(by: scalar)
  }

  /// Divides (or scales) the vector by a scalar.
  /// - Returns: The scaled vector.
  static func /(vector: Vector, scalar: CGFloat) -> Vector {
    vector.divided(by: scalar)
  }

  /// Adds a vector to this vector.
  /// - Returns: The vector resulting from the sum of the vectors.
  func adding(_ vector: Vector) -> Vector {
    Vector(x: x + vector.x, y: y + vector.y)
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
  func subtracting(_ vector: Vector) -> Vector {
    Vector(x: x - vector.x, y: y - vector.y)
  }

  /// Multiplies (or scales) the vector by a scalar.
  /// - Returns: The scaled vector.
  func multiplied(by scalar: CGFloat) -> Vector {
    Vector(x: x * scalar, y: y * scalar)
  }

  /// Divides (or scales) the vector by a scalar.
  /// - Returns: The scaled vector.
  func divided(by scalar: CGFloat) -> Vector {
    Vector(x: x / scalar, y: y / scalar)
  }
}

// MARK: - Helpers

public extension Vector {
  /// Returns a vector normalized to a unit length of 1.
  var normalized: Vector {
    let magnitude = self.magnitude

    guard magnitude > .zero else {
      return self
    }

    return self / magnitude
  }

  /// Returns the magnitude (or length) of the vector.
  var magnitude: CGFloat {
    sqrt(x * x + y * y)
  }

  /// The heading (direction) of the vector expressed as an angle.
  /// - Returns: An `Angle` between `-π` and `π`.
  var heading: Angle {
    let angle = atan2(y, x)
    return Angle(radians: angle)
  }

  /// Scales the vector to avoid exceeding the passed maximum magnitude.
  /// - Parameter maximum: The maximum magnitude of the vector.
  /// - Returns: The scaled vector, if it exceeds the passed magnitude.
  func limit(_ maximum: CGFloat) -> Vector {
    guard magnitude > maximum else {
      return self
    }

    return normalized * maximum
  }
}
