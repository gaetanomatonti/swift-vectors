import Foundation
import SwiftUI

public extension Vector {
  /// Creates an instance of a ``Vector`` from coordinates in the polar plane.
  ///
  /// Polar planes typically position their origin at the center, while screens mostly in the upper-left corner. 
  /// To accommodate this difference, this initializer allows specifying the center coordinates of the plane.
  ///
  /// - Parameters:
  ///   - angle: The angular coordinate of the vector.
  ///   - radius: The radial coordinate of the vector.
  ///   - center: The coordinates of the plane's center. Defaults to `.zero`.
  init(angle: Angle, radius: CGFloat, center: CGPoint = .zero) {
    self.init(
      x: cos(angle.radians) * radius + center.x,
      y: sin(angle.radians) * radius + center.y
    )
  }

  /// Creates an instance of a ``Vector`` in the coordinate system of the specified ``CGRect``.
  ///
  /// - Parameters:
  ///   - angle: The angular coordinate of the vector.
  ///   - percentage: A value in the range `[0, 1]` used to scale the radius of the `rect`.
  ///                 Values below `0.0` are interpreted as `0.0` and values above `1.0` are interpreted as `1.0`.
  ///   - rect: The rectangle defining the coordinate system of the vector, used to compute the maximum value of the radius.
  init(angle: Angle, percentage: CGFloat = 1, in rect: CGRect) {
    let percentage = max(0, min(percentage, 1))
    let smallestSide = min(rect.width, rect.height)
    let radius = smallestSide / 2
    let scaledRadius = percentage * radius
    let offset = min(rect.midX, rect.midY)
    let center = CGPoint(x: offset, y: offset)

    self.init(angle: angle, radius: scaledRadius, center: center)
  }
}
