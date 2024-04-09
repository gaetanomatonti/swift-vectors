import Foundation
import SwiftUI

public extension Vector {
  /// Creates an instance of a ``Vector`` from coordinates in the polar plane, where the origin is at its center.
  ///
  /// - Parameters:
  ///   - angle: The angular coordinate of the vector.
  ///   - radius: The radial coordinate of the vector.
  init(angle: Angle, radius: CGFloat) {
    self.init(angle: angle, radius: radius, offset: .zero)
  }

  /// Creates an instance of a ``Vector`` in the coordinate system of the specified ``CGRect``.
  ///
  /// - Parameters:
  ///   - angle: The angular coordinate of the vector.
  ///   - percentage: A value in the range `[0, 1]` used to scale the radius of the ``rect``.
  ///                 Values below `0.0` are interpreted as `0.0` and values above `1.0` are interpreted as `1.0`.
  ///   - rect: The rectangle defining the coordinate system of the vector, used to compute the maximum value of the radius.
  init(angle: Angle, percentage: CGFloat = 1, in rect: CGRect) {
    let percentage = max(0, min(percentage, 1))
    let smallestSide = min(rect.width, rect.height)
    let radius = smallestSide / 2
    let scaledRadius = percentage * radius
    let offset = min(rect.midX, rect.midY)
    let offsetCoordinates = CGPoint(x: offset, y: offset)

    self.init(angle: angle, radius: scaledRadius, offset: offsetCoordinates)
  }
}

fileprivate extension Vector {
  /// Creates an instance of a ``Vector`` from coordinates in the polar plane, where the origin is at its center.
  ///
  /// - Parameters:
  ///   - angle: The angular coordinate of the vector.
  ///   - radius: The radial coordinate of the vector.
  ///   - offset: The coordinates of the plane offset. Set to a non-zero value for planes where the origin is not at the center.
  init(angle: Angle, radius: CGFloat, offset: CGPoint) {
    self.init(
      x: cos(angle.radians) * radius + offset.x,
      y: sin(angle.radians) * radius + offset.y
    )
  }
}
